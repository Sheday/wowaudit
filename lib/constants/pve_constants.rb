MYTHIC_DUNGEONS = {
  40808 => 'Atal\'Dazar',
  40812 => 'Freehold',
  40959 => 'King\'s Rest',
  40955 => 'The MOTHERLODE!!',
  40941 => 'Shrine of the Storm',
  43355 => 'Siege of Boralus',
  40191 => 'Temple of Sethraliss',
  40944 => 'Tol Dagor',
  40184 => 'Underrot',
  40144 => 'Waycrest Manor'
}

# Not used at the moment
MYTHIC_PLUS_CRITERIA = (41506..41514)

RAID_DIFFICULTIES = {
  1 => 'raid_finder',
  3 => 'normal',
  4 => 'heroic',
  5 => 'mythic'
}

VALID_RAIDS = [{
  'name' => 'Uldir', 'days' => [0, 1, 2, 3, 4, 5, 6], 'id' => 19, 'partition' => 1,
  'encounters' => [{
    'id' => 2144, 'name' => 'Taloc', 'raid_ids' => {
      'raid_finder' => 12786, 'normal' => 12787, 'heroic' => 12788, 'mythic' => 12789
    }
  }, {
    'id' => 2141, 'name' => 'MOTHER', 'raid_ids' => {
      'raid_finder' => 12790, 'normal' => 12791, 'heroic' => 12792, 'mythic' => 12793
    }
  }, {
    'id' => 2128, 'name' => 'Fetid Devourer', 'raid_ids' => {
      'raid_finder' => 12794, 'normal' => 12795, 'heroic' => 12796, 'mythic' => 12797
    }
  }, {
    'id' => 2136, 'name' => 'Zek\'voz, Herald of N\'zoth', 'raid_ids' => {
      'raid_finder' => 12798, 'normal' => 12799, 'heroic' => 12800, 'mythic' => 12801
    }
  }, {
    'id' => 2134, 'name' => 'Vectis', 'raid_ids' => {
      'raid_finder' => 12802, 'normal' => 12803, 'heroic' => 12804, 'mythic' => 12805
    }
  }, {
    'id' => 2145, 'name' => 'Zul, Reborn', 'raid_ids' => {
      'raid_finder' => 12808, 'normal' => 12809, 'heroic' => 12810, 'mythic' => 12811
    }
  }, {
    'id' => 2135, 'name' => 'Mythrax the Unraveler', 'raid_ids' => {
      'raid_finder' => 12813, 'normal' => 12814, 'heroic' => 12815, 'mythic' => 12816
    }
  }, {
    'id' => 2122, 'name' => 'G\'huun', 'raid_ids' => {
      'raid_finder' => 12817, 'normal' => 12818, 'heroic' => 12819, 'mythic' => 12820
    }
  }]
}]

WCL_IDS = VALID_RAIDS.map{ |raid| raid["encounters"].map{ |encounter| encounter["id"].to_s } }.flatten
