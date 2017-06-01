# -*- coding: utf-8 -*-
from team import team
from execute_query import execute_query
from constants import *
from dateutil import tz
from auth import WCL_KEY
from json import loads
from writer import log, error
import time, requests, datetime

class Scraper(object):

    def __init__(self,mode,ids=False,start_time=time.time(),client='tornado'):
        self.teams = []
        self.done = {}
        self.mode = mode
        self.client = client
        self.ids = ids
        self.start_time = start_time
        self.fetch_select(self.ids) if self.ids else self.allocate()

    def fetch_select(self,teams):
        data = execute_query('SELECT teams.id, guilds.name, guilds.region, guilds.realm, teams.key_code, teams.last_refreshed, guilds.patreon, characters.id, characters.name, characters.role, characters.weekly_snapshot ' + \
                             ', characters.legendaries, characters.realm, characters.per_spec, characters.tier_data, characters.status, characters.warcraftlogs, characters.last_refresh, characters.old_snapshots FROM teams, characters, guilds WHERE teams.id = characters.team_id AND characters.team_id IN ({0} AND teams.guild_id = guilds.id)'.format(','.join(teams)))
        self.store(data)

    def allocate(self):
        result = execute_query('SELECT id, last_refreshed{0} FROM teams WHERE patreon {1} {2} ORDER BY last_refreshed{0} ASC LIMIT {3}'.format('_wcl' if self.mode == 'warcraftlogs' else '','= 1' if self.mode == 'production_patreon' else 'IN (0,1)', 'AND last_refreshed > 0' if self.mode == 'debug' else '', MAX_ALLOCATED))

        team_data = [str(team[0]) for team in result]
        last_refreshed = [int(team[1]) for team in result]
        if self.mode in ['production','production_patreon','warcraftlogs']:
            execute_query('UPDATE teams SET last_refreshed{0} = {1} WHERE team_id IN ({2})'.format('_wcl' if self.mode == 'warcraftlogs' else '',(datetime.datetime.now()-datetime.datetime(2017,1,1)).total_seconds(),','.join(team_data)))

        log('info','Allocated and going to refresh {0} teams. Time since last refresh: Lowest {1} seconds, Highest {2} seconds, Average {3} seconds.'.format(
            MAX_ALLOCATED,
            round((datetime.datetime.now()-datetime.datetime(2017,1,1)).total_seconds()-max(last_refreshed),0),
            round((datetime.datetime.now()-datetime.datetime(2017,1,1)).total_seconds()-min(last_refreshed),0),
            round((datetime.datetime.now()-datetime.datetime(2017,1,1)).total_seconds()-(sum(last_refreshed) / float(len(last_refreshed))),0)),
            ', '.join(team_data))

        self.fetch_select(team_data)

    def store(self,data):
        count = 0
        for member in data:
            key_code = member[4]
            if key_code not in self.done:
                self.teams.append(team(member,self.mode,self.client))
                self.done[key_code] = count
                count += 1
            else: self.teams[self.done[key_code]].add_member(member)

    def run(self):
        return self.check_all()

    def check_all(self):
        if self.ids: return self.check_select()
        for team in self.teams:
            self.check_single(team)
        return True

    def check_select(self):
        for team in self.teams:
            if str(team.team_id) in self.ids:
                self.check_single(team)
        return True

    def check_single(self,team,retry=False):
        try:
            team.check()
            log('info','Finished refreshing.',team.team_id)
        except Exception as e:
            if not retry:
                team.client = 'concurrent' if team.client == 'tornado' else 'tornado'
                log('error','Encountered an error, trying with client {0} now. Error: {1}'.format(team.client,error(e)),team.team_id)
                self.check_single(team,True)
            else:
                log('error','Encountered an error, did not refresh. Error: {0}'.format(error(e)),team.team_id)

    def check_warcraftlogs(self):
        for team in self.teams:
            try:
                team.update_warcraftlogs()
                log('info','Finished refreshing this team.',team.team_id)
            except Exception as e:
                log('error','Encountered an error in refreshing the WCL data of this team. Error: {0}'.format(error(e)),team.team_id)
        return True
