from constants import *
import sys, time, datetime
from scraper import Scraper
from dateutil import tz
from execute_query import execute_query

try:
    region = str(sys.argv[1])
    if region not in ['EU','US']: raise Exception
    print '[INFO] [{0}] - Going to reset the snapshot of region {1}'.format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'),region)
except Exception:
    print 'Please specify a valid region.'
    sys.exit()

try:
    guild_ids = str(sys.argv[2]).split(',')
    print '[INFO] [{0}] - Not using all guild IDs, but only the following: {1}'.format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'),', '.join(guild_ids))
except Exception:
    guild_ids = False

if guild_ids:
    execute_query('UPDATE users SET weekly_snapshot = \'\' WHERE guild_id IN ({0})'.format(','.join(guild_ids)))
    print '[INFO] [{0}] - Snapshot resetted successfully for guilds {1}'.format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'),','.join(guild_ids)   )

else:
    if region == 'US' and datetime.datetime.weekday(datetime.datetime.now()) != 1:
        print "[INFO] [{0}] - It is not Tuesday, snapshots should not be reset for US. Aborting now.".format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'))
        sys.exit()
    elif region == 'EU' and datetime.datetime.weekday(datetime.datetime.now()) != 2:
        print "[INFO] [{0}] - It is not Wednesday, snapshots should not be reset for EU. Aborting now.".format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'))
        sys.exit()
    else:
        execute_query('UPDATE users SET weekly_snapshot = \'\' WHERE guild_id IN (SELECT guild_id from guilds WHERE region = \'{0}\')'.format(region))
        print '[INFO] [{0}] - Snapshot resetted successfully of region {1}'.format(datetime.datetime.utcnow().replace(tzinfo=tz.gettz('UTC')).astimezone(tz.gettz(TIME_ZONE)).strftime('%d-%m %H:%M:%S'),region)
