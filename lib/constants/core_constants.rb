CURRENT_VERSION = "5"

TIME_ZONE = 'Europe/Amsterdam'
HOUR = (1.0 / 24)

SCHEDULER_PAUSE_AFTER_CYCLE = 1 #seconds

WCL_URL = "https://www.warcraftlogs.com=>443/v1/parses/character/{0}/{1}/{2}?zone={3}&metric={4}&api_key={5}"

WCL_ZONES_URL = "https://www.warcraftlogs.com=>443/v1/zones?api_key={0}"

RAIDER_IO_URL = "https://raider.io/api/v1/characters/profile?region={0}&realm={1}&name={2}&fields=mythic_plus_scores,mythic_plus_highest_level_runs,mythic_plus_weekly_highest_level_runs"

# UTC times
WEEKLY_RESET = {
  'EU' => {
    'hour' => 5,
    'day' => "Wednesday"
  },
  'US' => {
    'hour' => 11,
    'day' => "Tuesday"
  },
  'KR' => {
    'hour' => 2,
    'day' => "Thursday"
  },
  'TW' => {
    'hour' => 2,
    'day' => "Thursday"
  }
}

HEADER = [
  'name',
  'class',
  'realm_slug',
  'ilvl',
  'equipped_traits',
  'artifact_ilvl',
  'head_ilvl',
  'head_id',
  'head_name',
  'head_quality',
  'neck_ilvl',
  'neck_id',
  'neck_name',
  'neck_quality',
  'shoulder_ilvl',
  'shoulder_id',
  'shoulder_name',
  'shoulder_quality',
  'back_ilvl',
  'back_id',
  'back_name',
  'back_quality',
  'chest_ilvl',
  'chest_id',
  'chest_name',
  'chest_quality',
  'wrist_ilvl',
  'wrist_id',
  'wrist_name',
  'wrist_quality',
  'hands_ilvl',
  'hands_id',
  'hands_name',
  'hands_quality',
  'waist_ilvl',
  'waist_id',
  'waist_name',
  'waist_quality',
  'legs_ilvl',
  'legs_id',
  'legs_name',
  'legs_quality',
  'feet_ilvl',
  'feet_id',
  'feet_name',
  'feet_quality',
  'finger1_ilvl',
  'finger1_id',
  'finger1_name',
  'finger1_quality',
  'finger2_ilvl',
  'finger2_id',
  'finger2_name',
  'finger2_quality',
  'trinket1_ilvl',
  'trinket1_id',
  'trinket1_name',
  'trinket1_quality',
  'trinket2_ilvl',
  'trinket2_id',
  'trinket2_name',
  'trinket2_quality',
  'relic1_ilvl',
  'relic1_id',
  'relic1_name',
  'relic1_quality',
  'relic2_ilvl',
  'relic2_id',
  'relic2_name',
  'relic2_quality',
  'relic3_ilvl',
  'relic3_id',
  'relic3_name',
  'relic3_quality',
  'nightfallen_standing',
  'nightfallen_value',
  'valarjar_standing',
  'valarjar_value',
  'wardens_standing',
  'wardens_value',
  'dreamweavers_standing',
  'dreamweavers_value',
  'highmountain_tribe_standing',
  'highmountain_tribe_value',
  'court_of_farondis_standing',
  'court_of_farondis_value',
  'enchant_quality_neck',
  'enchant_quality_back',
  'enchant_quality_finger1',
  'enchant_quality_finger2',
  'empty_sockets',
  'reputation_ranking',
  'role',
  'dungeons_done_total',
  'Eye of Azshara',
  'Darkheart Thicket',
  'Neltharion\'s Lair',
  'Halls of Valor',
  'Violet Hold',
  'Vault of the Wardens',
  'Black Rook Hold',
  'Maw of Souls',
  'Arcway',
  'Court of Stars',
  'Karazhan',
  'dungeons_this_week',
  'wqs_done_total',
  'wqs_this_week',
  'legendary_amount',
  'achievement_points',
  'mounts',
  'exalted_amount',
  'unique_pets',
  'lvl_25_pets',
  'realm',
  'legendary_list',
  'neck_enchant',
  'back_enchant',
  'finger1_enchant',
  'finger2_enchant',
  'gem_list',
  'tier_head',
  'tier_shoulder',
  'tier_back',
  'tier_chest',
  'tier_hands',
  'tier_legs',
  'ap_obtained_total',
  'ap_this_week',
  'spec1_traits',
  'spec1_ilvl',
  'spec2_traits',
  'spec2_ilvl',
  'spec3_traits',
  'spec3_ilvl',
  'spec4_traits',
  'spec4_ilvl',
  'current_spec_name',
  'highest_ilvl_ever_equipped',
  'main_spec',
  'Cathedral of Eternal Night',
  'WCL_id',
  'WCL_Normal_best',
  'WCL_Normal_median',
  'WCL_Normal_average',
  'WCL_Heroic_best',
  'WCL_Heroic_median',
  'WCL_Heroic_average',
  'WCL_Mythic_best',
  'WCL_Mythic_median',
  'WCL_Mythic_average',
  'character_id',
  'historical_wqs_done',
  'historical_ap_gained',
  'historical_dungeons_done',
  'talons_vengeance_standing',
  'talons_vengeance_value',
  'legionfall_standing',
  'legionfall_value',
  'paragon_amount',
  'raids_normal',
  'raids_normal_weekly',
  'raids_heroic',
  'raids_heroic_weekly',
  'raids_mythic',
  'raids_mythic_weekly',
  'prestige',
  '2v2_rating',
  '2v2_season_played',
  '2v2_week_played',
  'honorable_kills',
  '3v3_rating',
  '3v3_season_played',
  '3v3_week_played',
  'RBG_rating',
  'RBG_season_played',
  'RBG_week_played',
  'max_2v2_rating',
  'max_3v3_rating',
  'm+_score',
  'weekly_highest_m+',
  'season_highest_m+',
  'Seat of the Triumvirate'
]
