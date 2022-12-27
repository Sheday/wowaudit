ITEMS = [
  'main_hand',
  'off_hand',
  'head',
  'neck',
  'shoulder',
  'back',
  'chest',
  'wrist',
  'hands',
  'waist',
  'legs',
  'feet',
  'finger_1',
  'finger_2',
  'trinket_1',
  'trinket_2'
]

QUALITIES = {
  POOR: 0,
  COMMON: 1,
  UNCOMMON: 2,
  RARE: 3,
  EPIC: 4,
  LEGENDARY: 5,
  ARTIFACT: 6,
  HEIRLOOM: 7,
}

ENCHANTS = {
  'back' => {
    6587 => [2, "Writ of Avoidance (1)"],
    6588 => [2, "Writ of Avoidance (2)"],
    6589 => [2, "Writ of Avoidance (3)"],
    6593 => [2, "Writ of Leech (1)"],
    6594 => [2, "Writ of Leech (2)"],
    6595 => [2, "Writ of Leech (3)"],
    6599 => [2, "Writ of Speed (1)"],
    6600 => [2, "Writ of Speed (2)"],
    6601 => [2, "Writ of Speed (3)"],
    6590 => [2, "Graceful Avoidance (1)"],
    6591 => [2, "Graceful Avoidance (2)"],
    6592 => [3, "Graceful Avoidance (3)"],
    6596 => [2, "Regenerative Leech (1)"],
    6597 => [2, "Regenerative Leech (2)"],
    6598 => [3, "Regenerative Leech (3)"],
    6602 => [2, "Homebound Speed (1)"],
    6603 => [2, "Homebound Speed (2)"],
    6604 => [3, "Homebound Speed (3)"],
  },
  'chest' => {
    6623 => [2, "Waking Stats (1)"],
    6624 => [2, "Waking Stats (2)"],
    6625 => [3, "Waking Stats (3)"],
    6614 => [2, "Accelerated Agility (1)"],
    6615 => [2, "Accelerated Agility (2)"],
    6616 => [3, "Accelerated Agility (3)"],
    6617 => [2, "Reserve of Intellect (1)"],
    6618 => [2, "Reserve of Intellect (2)"],
    6619 => [3, "Reserve of Intellect (3)"],
    6620 => [2, "Sustained Strength (1)"],
    6621 => [2, "Sustained Strength (2)"],
    6622 => [3, "Sustained Strength (3)"],
  },
  'wrist' => {
    6569 => [2, "Writ of Avoidance (1)"],
    6570 => [2, "Writ of Avoidance (2)"],
    6571 => [3, "Writ of Avoidance (3)"],
    6575 => [2, "Writ of Leech (1)"],
    6576 => [2, "Writ of Leech (2)"],
    6577 => [2, "Writ of Leech (3)"],
    6581 => [2, "Writ of Speed (1)"],
    6582 => [2, "Writ of Speed (2)"],
    6583 => [2, "Writ of Speed (3)"],
    6572 => [2, "Devotion of Avoidance (1)"],
    6573 => [2, "Devotion of Avoidance (1)"],
    6574 => [3, "Devotion of Avoidance (1)"],
    6578 => [2, "Devotion of Leech (1)"],
    6579 => [2, "Devotion of Leech (2)"],
    6580 => [3, "Devotion of Leech (3)"],
    6584 => [2, "Devotion of Speed (1)"],
    6585 => [2, "Devotion of Speed (1)"],
    6586 => [3, "Devotion of Speed (1)"],
  },
  'legs' => {
    6488 => [2, "Fierce Armor Kit (1)"],
    6489 => [2, "Fierce Armor Kit (2)"],
    6490 => [3, "Fierce Armor Kit (3)"],
    6491 => [2, "Reinforced Armor Kit (1)"],
    6492 => [2, "Reinforced Armor Kit (2)"],
    6493 => [2, "Reinforced Armor Kit (3)"],
    6494 => [2, "Frosted Armor Kit (1)"],
    6495 => [2, "Frosted Armor Kit (2)"],
    6496 => [3, "Frosted Armor Kit (3)"],
    6536 => [2, "Vibrant Spellthread (1)"],
    6537 => [2, "Vibrant Spellthread (2)"],
    6538 => [2, "Vibrant Spellthread (3)"],
    6539 => [2, "Frozen Spellthread (1)"],
    6540 => [2, "Frozen Spellthread (2)"],
    6541 => [3, "Frozen Spellthread (3)"],
    6542 => [2, "Temporal Spellthread (1)"],
    6543 => [2, "Temporal Spellthread (2)"],
    6544 => [3, "Temporal Spellthread (3)"],
  },
  'feet' => {
    6608 => [1, "Rider's Reassurance (1)"],
    6609 => [1, "Rider's Reassurance (2)"],
    6610 => [1, "Rider's Reassurance (3)"],
    6605 => [2, "Plainsrunner's Breeze (1)"],
    6606 => [2, "Plainsrunner's Breeze (2)"],
    6607 => [3, "Plainsrunner's Breeze (3)"],
    6611 => [2, "Watcher's Loam (1)"],
    6612 => [2, "Watcher's Loam (2)"],
    6613 => [3, "Watcher's Loam (3)"],
  },
  'finger_1' => {
    6545 => [2, "Writ of Critical Strike (1)"],
    6546 => [2, "Writ of Critical Strike (2)"],
    6547 => [2, "Writ of Critical Strike (3)"],
    6551 => [2, "Writ of Haste (1)"],
    6552 => [2, "Writ of Haste (2)"],
    6553 => [2, "Writ of Haste (3)"],
    6557 => [2, "Writ of Mastery (1)"],
    6558 => [2, "Writ of Mastery (2)"],
    6559 => [2, "Writ of Mastery (3)"],
    6563 => [2, "Writ of Versatility (1)"],
    6564 => [2, "Writ of Versatility (2)"],
    6565 => [2, "Writ of Versatility (3)"],
    6548 => [2, "Devotion of Critical Strike (1)"],
    6549 => [2, "Devotion of Critical Strike (2)"],
    6550 => [3, "Devotion of Critical Strike (3)"],
    6554 => [2, "Devotion of Haste (1)"],
    6555 => [2, "Devotion of Haste (2)"],
    6556 => [3, "Devotion of Haste (3)"],
    6560 => [2, "Devotion of Mastery (1)"],
    6561 => [2, "Devotion of Mastery (2)"],
    6562 => [3, "Devotion of Mastery (3)"],
    6566 => [2, "Devotion of Versatility (1)"],
    6567 => [2, "Devotion of Versatility (2)"],
    6568 => [3, "Devotion of Versatility (3)"],
  },
  'finger_2' => {
    6545 => [2, "Writ of Critical Strike (1)"],
    6546 => [2, "Writ of Critical Strike (2)"],
    6547 => [2, "Writ of Critical Strike (3)"],
    6551 => [2, "Writ of Haste (1)"],
    6552 => [2, "Writ of Haste (2)"],
    6553 => [2, "Writ of Haste (3)"],
    6557 => [2, "Writ of Mastery (1)"],
    6558 => [2, "Writ of Mastery (2)"],
    6559 => [2, "Writ of Mastery (3)"],
    6563 => [2, "Writ of Versatility (1)"],
    6564 => [2, "Writ of Versatility (2)"],
    6565 => [2, "Writ of Versatility (3)"],
    6548 => [2, "Devotion of Critical Strike (1)"],
    6549 => [2, "Devotion of Critical Strike (2)"],
    6550 => [3, "Devotion of Critical Strike (3)"],
    6554 => [2, "Devotion of Haste (1)"],
    6555 => [2, "Devotion of Haste (2)"],
    6556 => [3, "Devotion of Haste (3)"],
    6560 => [2, "Devotion of Mastery (1)"],
    6561 => [2, "Devotion of Mastery (2)"],
    6562 => [3, "Devotion of Mastery (3)"],
    6566 => [2, "Devotion of Versatility (1)"],
    6567 => [2, "Devotion of Versatility (2)"],
    6568 => [3, "Devotion of Versatility (3)"],
  },
  'main_hand' => {
    3370 => [3, "Rune of Razorice"],
    3847 => [3, "Rune of the Stoneskin Gargoyle"],
    3368 => [3, "Rune of the Fallen Crusader"],
    6241 => [3, "Rune of Sanguination"],
    6242 => [3, "Rune of Spellwarding"],
    6243 => [3, "Rune of Hysteria"],
    6244 => [3, "Rune of Unending Thirst"],
    6245 => [3, "Rune of the Apocalypse"],
    6626 =>  [2, "Burning Writ (1)"],
    6627 =>  [2, "Burning Writ (2)"],
    6628 =>  [2, "Burning Writ (3)"],
    6632 =>  [2, "Earthen Writ (1)"],
    6633 =>  [2, "Earthen Writ (2)"],
    6634 =>  [2, "Earthen Writ (3)"],
    6638 =>  [2, "Sophic Writ (1)"],
    6639 =>  [2, "Sophic Writ (2)"],
    6640 =>  [2, "Sophic Writ (3)"],
    6644 =>  [2, "Frozen Writ (1)"],
    6645 =>  [2, "Frozen Writ (2)"],
    6646 =>  [2, "Frozen Writ (3)"],
    6650 =>  [2, "Wafting Writ (1)"],
    6651 =>  [2, "Wafting Writ (2)"],
    6652 =>  [2, "Wafting Writ (3)"],
    6629 =>  [2, "Burning Devotion (1)"],
    6630 =>  [2, "Burning Devotion (2)"],
    6631 =>  [3, "Burning Devotion (3)"],
    6635 =>  [2, "Earthen Devotion (1)"],
    6636 =>  [2, "Earthen Devotion (2)"],
    6637 =>  [3, "Earthen Devotion (3)"],
    6641 =>  [2, "Sophic Devotion (1)"],
    6642 =>  [2, "Sophic Devotion (2)"],
    6643 =>  [3, "Sophic Devotion (3)"],
    6647 =>  [2, "Frozen Devotion (1)"],
    6648 =>  [2, "Frozen Devotion (2)"],
    6649 =>  [3, "Frozen Devotion (3)"],
    6653 =>  [2, "Wafting Devotion (1)"],
    6654 =>  [2, "Wafting Devotion (2)"],
    6655 =>  [3, "Wafting Devotion (3)"],
    6520 => [2, "Gyroscopic Kaleidoscope (1)"],
    6521 => [2, "Gyroscopic Kaleidoscope (2)"],
    6522 => [3, "Gyroscopic Kaleidoscope (3)"],
    6523 => [2, "Projectile Propulsion Pinion (1)"],
    6524 => [2, "Projectile Propulsion Pinion (2)"],
    6525 => [3, "Projectile Propulsion Pinion (3)"],
    6526 => [3, "High Intensity Thermal Scanner (1)"],
    6527 => [3, "High Intensity Thermal Scanner (2)"],
    6528 => [3, "High Intensity Thermal Scanner (3)"],
  },
  'off_hand' => {
    3370 => [3, "Rune of Razorice"],
    3847 => [3, "Rune of the Stoneskin Gargoyle"],
    3368 => [3, "Rune of the Fallen Crusader"],
    6241 => [3, "Rune of Sanguination"],
    6242 => [3, "Rune of Spellwarding"],
    6243 => [3, "Rune of Hysteria"],
    6244 => [3, "Rune of Unending Thirst"],
    6245 => [3, "Rune of the Apocalypse"],
    6626 =>  [2, "Burning Writ (1)"],
    6627 =>  [2, "Burning Writ (2)"],
    6628 =>  [2, "Burning Writ (3)"],
    6632 =>  [2, "Earthen Writ (1)"],
    6633 =>  [2, "Earthen Writ (2)"],
    6634 =>  [2, "Earthen Writ (3)"],
    6638 =>  [2, "Sophic Writ (1)"],
    6639 =>  [2, "Sophic Writ (2)"],
    6640 =>  [2, "Sophic Writ (3)"],
    6644 =>  [2, "Frozen Writ (1)"],
    6645 =>  [2, "Frozen Writ (2)"],
    6646 =>  [2, "Frozen Writ (3)"],
    6650 =>  [2, "Wafting Writ (1)"],
    6651 =>  [2, "Wafting Writ (2)"],
    6652 =>  [2, "Wafting Writ (3)"],
    6629 =>  [2, "Burning Devotion (1)"],
    6630 =>  [2, "Burning Devotion (2)"],
    6631 =>  [3, "Burning Devotion (3)"],
    6635 =>  [2, "Earthen Devotion (1)"],
    6636 =>  [2, "Earthen Devotion (2)"],
    6637 =>  [3, "Earthen Devotion (3)"],
    6641 =>  [2, "Sophic Devotion (1)"],
    6642 =>  [2, "Sophic Devotion (2)"],
    6643 =>  [3, "Sophic Devotion (3)"],
    6647 =>  [2, "Frozen Devotion (1)"],
    6648 =>  [2, "Frozen Devotion (2)"],
    6649 =>  [3, "Frozen Devotion (3)"],
    6653 =>  [2, "Wafting Devotion (1)"],
    6654 =>  [2, "Wafting Devotion (2)"],
    6655 =>  [3, "Wafting Devotion (3)"],
  }
}

# 1 = Legacy gem
# 2 = Uncommon gem
# 3 = Rare gem
# 4 = Epic gem
GEMS = {
  130215 => 1, # Legion
  130216 => 1,
  130217 => 1,
  130218 => 1,
  130219 => 1,
  130220 => 1,
  130221 => 1,
  130222 => 1,
  130246 => 1,
  130247 => 1,
  130248 => 1,
  151580 => 1,
  151583 => 1,
  151584 => 1,
  151585 => 1,
  153710 => 1, # Battle for Azeroth
  153711 => 1,
  153712 => 1,
  153713 => 1,
  153714 => 1,
  153715 => 1,
  154126 => 1,
  154127 => 1,
  154128 => 1,
  154129 => 1,
  153707 => 1,
  153708 => 1,
  153709 => 1,
  168639 => 1,
  168640 => 1,
  168641 => 1,
  168642 => 1,
  168636 => 1, # Leviathan's Eye
  168637 => 1, # Leviathan's Eye
  168638 => 1, # Leviathan's Eye
  173121 => 1, # Shadowlands
  173122 => 1,
  173123 => 1,
  173124 => 1,
  173125 => 1,
  173126 => 1,
  173127 => 1,
  173128 => 1,
  173129 => 1,
  173130 => 1,
  192913 => 2, # Dragonflight, Uncommon (all)
  192900 => 2,
  192903 => 2,
  192906 => 2,
  192910 => 2,
  192901 => 2,
  192914 => 2,
  192904 => 2,
  192907 => 2,
  192911 => 2,
  192905 => 2,
  192902 => 2,
  192916 => 2,
  192908 => 2,
  192912 => 2,
  192923 => 2, # Rare (385)
  192971 => 2,
  192940 => 2,
  192917 => 2,
  192926 => 2,
  192933 => 2,
  192929 => 2,
  192977 => 2,
  192946 => 2,
  192953 => 2,
  192956 => 2,
  192974 => 2,
  192943 => 2,
  192962 => 2,
  192920 => 2,
  192936 => 2,
  192950 => 2,
  192959 => 2,
  192965 => 2,
  192968 => 2,
  192978 => 2,
  192947 => 2, # Rare (400)
  192924 => 2,
  192918 => 2,
  192944 => 2,
  192921 => 2,
  192927 => 2,
  192934 => 2,
  192951 => 2,
  192972 => 2,
  192931 => 2,
  192937 => 2,
  192941 => 2,
  192957 => 2,
  192960 => 2,
  192975 => 2,
  192954 => 2,
  192963 => 2,
  192966 => 2,
  192969 => 2,
  192945 => 3, # Rare (415)
  192958 => 3,
  192928 => 3,
  192919 => 3,
  192967 => 3,
  192922 => 3,
  192935 => 3,
  192961 => 3,
  192948 => 3,
  192955 => 3,
  192925 => 3,
  192952 => 3,
  192932 => 3,
  192973 => 3,
  192964 => 3,
  192938 => 3,
  192942 => 3,
  192970 => 3,
  192976 => 3,
  192979 => 3,
  192980 => 2, # Epic (385)
  192983 => 2,
  192989 => 2,
  192986 => 2,
  194112 => 2,
  192987 => 2, # Epic (400)
  192981 => 2,
  192990 => 2,
  192984 => 2,
  194113 => 2,
  192985 => 3, # Epic (415)
  192982 => 3,
  192988 => 3,
  192991 => 3,
  194114 => 3,
}

TIER_ITEMS_BY_SLOT = {
  'head'     => [200417, 200336, 200345, 200408, 200327, 200381, 200363, 200399, 200426, 200354, 200390, 200372, 200318],
  'shoulder' => [200374, 200338, 200392, 200419, 200383, 200410, 200428, 200365, 200356, 200329, 200347, 200401, 200320],
  'chest'    => [200333, 200369, 200423, 200342, 200351, 200378, 200360, 200405, 200387, 200396, 200315, 200324, 200414],
  'hands'    => [200335, 200326, 200371, 200353, 200416, 200362, 200389, 200344, 200407, 200425, 200380, 200398, 200317],
  'legs'     => [200337, 200373, 200328, 200409, 200346, 200400, 200391, 200382, 200427, 200355, 200364, 200418, 200319],
}

TIER_ITEMS = TIER_ITEMS_BY_SLOT.values.flatten

TIER_CUTOFFS = { 1 => 'R', 389 => 'N', 402 => 'H', 415 => 'M' }

SPARK_ITEM_IDS = [193001, 191492, 193494, 191623, 192999, 191491, 193526, 190522, 193000, 193455, 191985, 193460, 193456, 190526, 190523, 193461, 193524, 192081, 193005, 193496, 193513, 193399, 193452, 201759, 193006, 194872, 198478, 190501, 193003, 190503, 193511, 193462, 193451, 193400, 193425, 193463, 193466, 193407, 198327, 198324, 193398, 193521, 193002, 198333, 198326, 193422, 193520, 193464, 193004, 198332, 193454, 193408, 193530, 193421, 190519, 193536, 193465, 194879, 198325, 193423, 193419, 193406, 193525, 193457, 193508, 193510, 193424, 193458, 193459, 190495, 193509, 193512, 190499, 198323, 193537, 193453, 198477, 198481, 193523, 193527, 193426, 193516, 190498, 190500, 193428, 190502, 193418, 190496, 193532, 198322, 193519, 193427, 193504, 193518, 190497, 190507, 190505, 190506, 190518, 190508, 190509, 190511, 190513, 190512, 200642]
SPARK_ITEM_IDS_2H = [194898, 190514, 190515, 194894, 190516, 190510, 194897, 190517, 193449, 198335]

SPARK_RECIPE_NAME_TO_ITEM_ID = {
  "Elemental Lariat" =>	{ id: 193001, profession: 'Jewelcrafting' },
  "Alacritous Alchemist Stone" =>	{ id: 191492, profession: 'Alchemy' },
  "Flaring Cowl" =>	{ id: 193494, profession: 'Leatherworking' },
  "Bow of the Dragon Hunters" =>	{ id: 193449, profession: 'Leatherworking' },
  "Unstable Frostfire Belt" =>	{ id: 191623, profession: 'Blacksmithing' },
  "Primal Molten Longsword" =>	{ id: 190507, profession: 'Blacksmithing' },
  "Signet of Titanic Insight" =>	{ id: 192999, profession: 'Jewelcrafting' },
  "Obsidian Seared Slicer" =>	{ id: 190518, profession: 'Blacksmithing' },
  "Primal Molten Spellblade" =>	{ id: 190506, profession: 'Blacksmithing' },
  "Primal Molten Shortblade" =>	{ id: 190505, profession: 'Blacksmithing' },
  "Sustaining Alchemist Stone" =>	{ id: 191491, profession: 'Alchemy' },
  "Amice of the Blue" =>	{ id: 193526, profession: 'Tailoring' },
  "Illuminating Pillar of the Isles" =>	{ id: 194898, profession: 'Inscription' },
  "Ring-Bound Hourglass" =>	{ id: 193000, profession: 'Jewelcrafting' },
  "Infurious Helm of Vengeance" =>	{ id: 190522, profession: 'Blacksmithing' },
  "Primal Molten Warglaive" =>	{ id: 190508, profession: 'Blacksmithing' },
  "Infurious Footwraps of Indemnity" =>	{ id: 193455, profession: 'Leatherworking' },
  "Venom-Steeped Stompers" =>	{ id: 193460, profession: 'Leatherworking' },
  "Infurious Spirit's Hood" =>	{ id: 193456, profession: 'Leatherworking' },
  "Frostfire Legguards of Preparation" =>	{ id: 190523, profession: 'Blacksmithing' },
  "Obsidian Seared Facesmasher" =>	{ id: 190513, profession: 'Blacksmithing' },
  "Infurious Warboots of Impunity" =>	{ id: 191985, profession: 'Blacksmithing' },
  "Primal Molten Mace" =>	{ id: 190509, profession: 'Blacksmithing' },
  "Allied Wristguard of Companionship" =>	{ id: 190526, profession: 'Blacksmithing' },
  "Obsidian Seared Hexsword" =>	{ id: 190511, profession: 'Blacksmithing' },
  "Obsidian Seared Claymore" =>	{ id: 190514, profession: 'Blacksmithing' },
  "Obsidian Seared Halberd" =>	{ id: 190515, profession: 'Blacksmithing' },
  "Shield of the Hearth" =>	{ id: 192081, profession: 'Blacksmithing' },
  "Obsidian Seared Crusher" =>	{ id: 190516, profession: 'Blacksmithing' },
  "Infurious Boots of Reprieve" =>	{ id: 193461, profession: 'Leatherworking' },
  "Weathered Explorer's Stave" =>	{ id: 194894, profession: 'Inscription' },
  "Ol' Smoky" =>	{ id: 198335, profession: 'Engineering' },
  "Idol of the Dreamer" =>	{ id: 193005, profession: 'Jewelcrafting' },
  "Primal Molten Greataxe" =>	{ id: 190510, profession: 'Blacksmithing' },
  "Infurious Legwraps of Possibility" =>	{ id: 193524, profession: 'Tailoring' },
  "Witherrot Tome" =>	{ id: 193496, profession: 'Leatherworking' },
  "Life-Bound Chestpiece" =>	{ id: 193399, profession: 'Leatherworking' },
  "Idol of the Lifebinder" =>	{ id: 193003, profession: 'Jewelcrafting' },
  "Toxic Thorn Footwraps" =>	{ id: 193452, profession: 'Leatherworking' },
  "Darkmoon Deck Box: Inferno" =>	{ id: 194872, profession: 'Inscription' },
  "Primal Molten Defender" =>	{ id: 190503, profession: 'Blacksmithing' },
  "Idol of the Earth Warder" =>	{ id: 193006, profession: 'Jewelcrafting' },
  "Infurious Binding of Gesticulation" =>	{ id: 193513, profession: 'Tailoring' },
  "Life-Bound Boots" =>	{ id: 193398, profession: 'Leatherworking' },
  "Torc of Passed Time" =>	{ id: 201759, profession: 'Jewelcrafting' },
  "Slimy Expulsion Boots" =>	{ id: 193451, profession: 'Leatherworking' },
  "Life-Bound Belt" =>	{ id: 193407, profession: 'Leatherworking' },
  "Darkmoon Deck Box: Dance" =>	{ id: 198478, profession: 'Inscription' },
  "Needlessly Complex Wristguards" =>	{ id: 198327, profession: 'Engineering' },
  "Acidic Hailstone Treads" =>	{ id: 193466, profession: 'Leatherworking' },
  "Vibrant Wildercloth Shawl" =>	{ id: 193511, profession: 'Tailoring' },
  "Kinetic Pillar of the Isles" =>	{ id: 194897, profession: 'Inscription' },
  "Flame-Touched Chain" =>	{ id: 193425, profession: 'Leatherworking' },
  "Obsidian Seared Runeaxe" =>	{ id: 190512, profession: 'Blacksmithing' },
  "Life-Bound Cap" =>	{ id: 193400, profession: 'Leatherworking' },
  "Complicated Cuffs" =>	{ id: 198332, profession: 'Engineering' },
  "Battle-Ready Binoculars" =>	{ id: 198326, profession: 'Engineering' },
  "Primal Molten Greatbelt" =>	{ id: 190501, profession: 'Blacksmithing' },
  "Torch of Primal Awakening" =>	{ id: 200642, profession: 'Enchanting' },
  "Infurious Chainhelm Protector" =>	{ id: 193462, profession: 'Leatherworking' },
  "Wind Spirit's Lasso" =>	{ id: 193463, profession: 'Leatherworking' },
  "Peripheral Vision Projectors" =>	{ id: 198324, profession: 'Engineering' },
  "Choker of Shielding" =>	{ id: 193002, profession: 'Jewelcrafting' },
  "Hood of Surging Time" =>	{ id: 193521, profession: 'Tailoring' },
  "Idol of the Spell-Weaver" =>	{ id: 193004, profession: 'Jewelcrafting' },
  "Difficult Wrist Protectors" =>	{ id: 198333, profession: 'Engineering' },
  "Flame-Touched Chainmail" =>	{ id: 193422, profession: 'Leatherworking' },
  "Allied Legguards of Sansok Khan" =>	{ id: 193464, profession: 'Leatherworking' },
  "Azureweave Robe" =>	{ id: 193536, profession: 'Tailoring' },
  "Oscillating Wilderness Opticals" =>	{ id: 198325, profession: 'Engineering' },
  "Allied Wristguards of Time Dilation" =>	{ id: 193530, profession: 'Tailoring' },
  "Azureweave Mantle" =>	{ id: 193520, profession: 'Tailoring' },
  "Flame-Touched Spaulders" =>	{ id: 193424, profession: 'Leatherworking' },
  "Flame-Touched Treads" =>	{ id: 193421, profession: 'Leatherworking' },
  "Scale Rein Grips" =>	{ id: 193465, profession: 'Leatherworking' },
  "Flame-Touched Helmet" =>	{ id: 193423, profession: 'Leatherworking' },
  "String of Spiritual Knick-Knacks" =>	{ id: 193457, profession: 'Leatherworking' },
  "Azureweave Slippers" =>	{ id: 193525, profession: 'Tailoring' },
  "Crackling Codex of the Isles" =>	{ id: 194879, profession: 'Inscription' },
  "Ancestor's Dew Drippers" =>	{ id: 193459, profession: 'Leatherworking' },
  "Life-Bound Bindings" =>	{ id: 193419, profession: 'Leatherworking' },
  "Life-Bound Trousers" =>	{ id: 193408, profession: 'Leatherworking' },
  "Vibrant Wildercloth Shoulderspikes" =>	{ id: 193508, profession: 'Tailoring' },
  "Allied Chestplate of Generosity" =>	{ id: 190519, profession: 'Blacksmithing' },
  "Vibrant Wildercloth Headcover" =>	{ id: 193523, profession: 'Tailoring' },
  "Allied Heartwarming Fur Coat" =>	{ id: 193453, profession: 'Leatherworking' },
  "Vibrant Wildercloth Vestments" =>	{ id: 193509, profession: 'Tailoring' },
  "Primal Molten Breastplate" =>	{ id: 190495, profession: 'Blacksmithing' },
  "Snowball Makers" =>	{ id: 193458, profession: 'Leatherworking' },
  "Overengineered Sleeve Extenders" =>	{ id: 198322, profession: 'Engineering' },
  "Old Spirit's Wristwraps" =>	{ id: 193454, profession: 'Leatherworking' },
  "Vibrant Wildercloth Girdle" =>	{ id: 193516, profession: 'Tailoring' },
  "Life-Bound Shoulderpads" =>	{ id: 193406, profession: 'Leatherworking' },
  "Vibrant Wildercloth Wristwraps" =>	{ id: 193510, profession: 'Tailoring' },
  "Darkmoon Deck Box: Watcher" =>	{ id: 198481, profession: 'Inscription' },
  "Darkmoon Deck Box: Rime" =>	{ id: 198477, profession: 'Inscription' },
  "Lightweight Ocular Lenses" =>	{ id: 198323, profession: 'Engineering' },
  "Chronocloth Leggings" =>	{ id: 193537, profession: 'Tailoring' },
  "Primal Molten Legplates" =>	{ id: 190499, profession: 'Blacksmithing' },
  "Flame-Touched Cuffs" =>	{ id: 193428, profession: 'Leatherworking' },
  "Chronocloth Sash" =>	{ id: 193512, profession: 'Tailoring' },
  "Primal Molten Helm" =>	{ id: 190498, profession: 'Blacksmithing' },
  "Blue Dragon Soles" =>	{ id: 193532, profession: 'Tailoring' },
  "Chronocloth Gloves" =>	{ id: 193527, profession: 'Tailoring' },
  "Flame-Touched Legguards" =>	{ id: 193426, profession: 'Leatherworking' },
  "Vibrant Wildercloth Slippers" =>	{ id: 193519, profession: 'Tailoring' },
  "Obsidian Seared Invoker" =>	{ id: 190517, profession: 'Blacksmithing' },
  "Primal Molten Pauldrons" =>	{ id: 190500, profession: 'Blacksmithing' },
  "Life-Bound Gloves" =>	{ id: 193418, profession: 'Leatherworking' },
  "Primal Molten Vambraces" =>	{ id: 190502, profession: 'Blacksmithing' },
  "Primal Molten Sabatons" =>	{ id: 190496, profession: 'Blacksmithing' },
  "Flame-Touched Handguards" =>	{ id: 193427, profession: 'Leatherworking' },
  "Vibrant Wildercloth Slacks" =>	{ id: 193518, profession: 'Tailoring' },
  "Vibrant Wildercloth Handwraps" =>	{ id: 193504, profession: 'Tailoring' },
  "Primal Molten Gauntlets"	=> { id: 190497, profession: 'Blacksmithing' },
  "Fierce Illimited Diamond" => { id: 192983, profession: 'Jewelcrafting' },
  "Skillful Illimited Diamond" => { id: 192986, profession: 'Jewelcrafting' },
  "Inscribed Illimited Diamond" => { id: 192980, profession: 'Jewelcrafting' },
  "Resplendent Illimited Diamond" => { id: 192989, profession: 'Jewelcrafting' },
  "Black Dragon Touched Hammer" => { id: 191228, profession: 'Blacksmithing '},
  "Potion Cauldron of Ultimate Power" => { id: 191485, profession: 'Alchemy' },
  "Enchant Weapon - Burning Devotion" => { id: 199966, profession: 'Enchanting' },
  "Enchant Weapon - Earthen Devotion" => { id: 199968, profession: 'Enchanting' },
  "Enchant Weapon - Frozen Devotion" => { id: 199972, profession: 'Enchanting' },
  "Enchant Weapon - Sophic Devotion" => { id: 199970, profession: 'Enchanting' },
  "Enchant Weapon - Wafting Devotion" => { id: 199974, profession: 'Enchanting' },
  "Dragoncloth Tailoring Vestments" => { id: 193540, profession: 'Tailoring' },
  "Khaz'gorite Fisherfriend" => { id: 198226, profession: 'Engineering' },
}
