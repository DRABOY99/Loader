--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- 🧭 Draboy script v3
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

-- ==================== GLOBAL VARIABLES ====================
local GLOBAL_BACKUP_DATA = nil
local ItemQueue = {}
local RESTORE_DELAY_MS = 4000
local WELCOME_SHOWN = false
local MAX_BACKUP_Items = 10
local LAST_SEARCH_QUERY = ""



-- ==================== CONFIG MODULE ====================
local Config = {}
Config.SCRIPT_PATH  = gg.getFile()
Config.MAX_RESULTS  = 2000
Config.READ_LIMIT   = 80
Config.TARGET_STRING = "flask_empty"

-- ==================== SIMPLIFIED ITEM LIST DATA 7.90 ====================
local ITEM_LIST_DATA = {
    ["7.90 New item"] = {
        ["Battlepass22 Banner Infantryman"] = "battlepass22_banner_infantryman",
        ["Battlepass22 Banner Paladin"] = "battlepass22_banner_paladin",
        ["Battlepass22 Stamp Large"] = "battlepass22_stamp_large",
        ["Battlepass22 Stamp Middle"] = "battlepass22_stamp_middle",
        ["Battlepass22 Stamp Small"] = "battlepass22_stamp_small",
        ["Battlepass22 Stamp Tiny"] = "battlepass22_stamp_tiny",
        ["Beastmaster Boots"] = "beastmaster_boots",
        ["Beastmaster Gloves"] = "beastmaster_gloves",
        ["Beastmaster Hat"] = "beastmaster_hat",
        ["Beastmaster Pants"] = "beastmaster_pants",
        ["Beastmaster Shirt"] = "beastmaster_shirt",
        ["Book Talisman Durability 1"] = "book_talisman_durability_1",
        ["Book Talisman Durability 10"] = "book_talisman_durability_10",
        ["Book Talisman Durability 2"] = "book_talisman_durability_2",
        ["Book Talisman Durability 3"] = "book_talisman_durability_3",
        ["Book Talisman Durability 4"] = "book_talisman_durability_4",
        ["Book Talisman Durability 5"] = "book_talisman_durability_5",
        ["Book Talisman Durability 6"] = "book_talisman_durability_6",
        ["Book Talisman Durability 7"] = "book_talisman_durability_7",
        ["Book Talisman Durability 8"] = "book_talisman_durability_8",
        ["Book Talisman Durability 9"] = "book_talisman_durability_9",
        ["Fridge Bag"] = "fridge_bag",
        ["Inventory Gacha Book Pool Xmas"] = "inventory_gacha_book_pool_xmas",
        ["Research For Beastmaster Boots"] = "research_for_beastmaster_boots",
        ["Research For Beastmaster Gloves"] = "research_for_beastmaster_gloves",
        ["Research For Beastmaster Hat"] = "research_for_beastmaster_hat",
        ["Research For Beastmaster Pants"] = "research_for_beastmaster_pants",
        ["Research For Beastmaster Shirt"] = "research_for_beastmaster_shirt",
        ["Research Workbench Sew 1"] = "research_workbench_sew_1",
        ["Storage Junk"] = "storage_junk",
        ["Talisman Absorb Blight 1"] = "talisman_absorb_blight_1",
        ["Talisman Absorb Blight 2"] = "talisman_absorb_blight_2",
        ["Talisman Absorb Fire 1"] = "talisman_absorb_fire_1",
        ["Talisman Absorb Fire 2"] = "talisman_absorb_fire_2",
        ["Talisman Absorb Freeze 1"] = "talisman_absorb_freeze_1",
        ["Talisman Absorb Freeze 2"] = "talisman_absorb_freeze_2",
        ["Talisman Absorb Phys 1"] = "talisman_absorb_phys_1",
        ["Talisman Absorb Phys 2"] = "talisman_absorb_phys_2",
        ["Talisman Damage Blight 1"] = "talisman_damage_blight_1",
        ["Talisman Damage Fire 1"] = "talisman_damage_fire_1",
        ["Talisman Damage Freeze 1"] = "talisman_damage_freeze_1",
        ["Talisman Damage Phys 1"] = "talisman_damage_phys_1",
        ["Talisman Farm Berry 2"] = "talisman_farm_berry_2",
        ["Talisman Farm Fiber 2"] = "talisman_farm_fiber_2",
        ["Talisman Farm Ore 2"] = "talisman_farm_ore_2",
        ["Talisman Farm Wood 2"] = "talisman_farm_wood_2",
    },
    ["Bag Collection"] = {
        ["Armor Bag"] = "armor_bag",
        ["Bag 10"] = "backpack_10",
        ["Bag 15"] = "backpack_15",
        ["Bag 5"] = "backpack_5",
        ["Bag Black"] = "backpack_black",
        ["Bag Red"] = "backpack_red",
        ["Bag Violet"] = "backpack_violet",
        ["Backstab Bag"] = "backstab_bag",
        ["Bag Xmas"] = "bag_xmas",
        ["Bear Bag"] = "bear_bag",
        ["Bird Bag"] = "bird_bag",
        ["Book Bag"] = "book_bag",
        ["Cursed Lady Bag"] = "cursed_lady_bag",
        ["East Bag"] = "east_bag",
        ["Fear Bag"] = "fear_bag",
        ["Flaming Bag"] = "flaming_bag",
        ["Halt Bag"] = "halt_bag",
        ["High Reward Bag"] = "high_reward_bag",
        ["Ironmaiden Bag"] = "ironmaiden_bag",
        ["Low Reward Bag"] = "low_reward_bag",
        ["Lute Bag"] = "lute_bag",
        ["Master Hunter Bag"] = "master_hunter_bag",
        ["Merchant Bag"] = "merchant_bag",
        ["Mid Reward Bag"] = "mid_reward_bag",
        ["Piligrim Bag"] = "piligrim_bag",
        ["Plague Bag"] = "plague_bag",
        ["Rogvold Bag"] = "rogvold_bag",
        ["Snow Hunter Bag"] = "snow_hunter_bag",
        ["Spider Bag"] = "spider_bag",
        ["Traveller Bag"] = "traveller_bag",
        ["Twilight Bag"] = "twilight_bag",
        ["Winter Bag"] = "winter_bag",
    },
    ["Chest"] = {
        ["Chest 10"] = "chest_10",
        ["Chest 15"] = "chest_15",
        ["Chest 20"] = "chest_20",
        ["Chest Black Metal"] = "chest_black_metal",
        ["Chest Blood"] = "chest_blood",
        ["Chest Bone"] = "chest_bone",
        ["Chest Challenge"] = "chest_challenge",
        ["Chest Coffin"] = "chest_coffin",
        ["Chest Coffin Hw"] = "chest_coffin_hw",
        ["Chest Coffin Hw23"] = "chest_coffin_hw23",
        ["Chest Coffin Hw25"] = "chest_coffin_hw25",
        ["Chest Coffin Twilight"] = "chest_coffin_twilight",
        ["Chest Cultist"] = "chest_cultist",
        ["Chest Deadman"] = "chest_deadman",
        ["Chest Deer"] = "chest_deer",
        ["Chest Dungeon"] = "chest_dungeon",
        ["Chest Egypt"] = "chest_egypt",
        ["Chest Elegant"] = "chest_elegant",
        ["Chest Emerald"] = "chest_emerald",
        ["Chest Exquisite"] = "chest_exquisite",
        ["Chest Frost"] = "chest_frost",
        ["Chest Grim Soul"] = "chest_grim_soul",
        ["Chest Grim Soul2"] = "chest_grim_soul2",
        ["Chest Grim Soul3"] = "chest_grim_soul3",
        ["Chest Grim Soul5"] = "chest_grim_soul5",
        ["Chest Grim Soul6"] = "chest_grim_soul6",
        ["Chest Grim Soul7"] = "chest_grim_soul7",
        ["Chest Harid"] = "chest_harid",
        ["Chest Lord"] = "chest_lord",
        ["Chest Mutant"] = "chest_mutant",
        ["Chest Plague"] = "chest_plague",
        ["Chest Silver"] = "chest_silver",
        ["Chest Stone"] = "chest_stone",
        ["Chest Troubled"] = "chest_troubled",
        ["Chest Xmas 2024"] = "chest_xmas_2024",
    },
    ["Commons Building"] = {
        ["Campfire"] = "campfire",
        ["Candlestick"] = "candlestick",
        ["ChestShared"] = "chest_shared",
        ["Cropfield"] = "cropfield",
        ["Firepit"] = "firepit",
        ["Furnace"] = "furnace",
        ["GuildBanner"] = "guild_banner",
        ["Kennel"] = "kennel",
        ["KennelCat"] = "kennel_cat",
        ["RackLeather"] = "rack_leather",
        ["Ravencage"] = "ravencage",
        ["Rug"] = "rug",
        ["Sanctum"] = "sanctum",
        ["Spikes"] = "spikes",
        ["Stall"] = "stall",
        ["Strongbox"] = "strongbox",
        ["Strongwall"] = "strongwall",
        ["TraderWaggon"] = "trader_waggon",
        ["Waggon"] = "waggon",
        ["Well"] = "well",
        ["WorkbenchHerb"] = "workbench_herb",
        ["WorkbenchNail"] = "workbench_nail",
        ["WorkbenchSew"] = "workbench_sew",
        ["WorkbenchStone"] = "workbench_stone",
        ["WorkbenchWood"] = "workbench_wood",
    },
    ["Consumable"] = {
        ["Potions"] = {
            ["Mandrake Tincture"] = "mandrake_tincture",
            ["Monk Tincture"] = "monk_tincture",
            ["Potion Cloak"] = "potion_cloak",
            ["Potion Energy"] = "potion_energy",
            ["Potion Fear"] = "potion_fear",
            ["Potion Fearlessness"] = "potion_fearlessness",
            ["Potion Focus"] = "potion_focus",
            ["Potion Luck"] = "potion_luck",
            ["Potion Mushroom"] = "potion_mushroom",
            ["Potion Mushroom Sweet"] = "potion_mushroom_sweet",
            ["Potion Night Vision"] = "potion_night_vision",
            ["Potion Night Vision 2"] = "potion_night_vision_2",
            ["Potion Revive"] = "potion_revive",
            ["Potion Stone Form"] = "potion_stone_form",
            ["Potion Stunlessness"] = "potion_stunlessness",
            ["Protective Ointment"] = "protective_ointment",
            ["Protective Ointment 2"] = "protective_ointment_2",
            ["Tincture"] = "tincture",
        },
        ["Food"] = {
            ["Baked Pumpkin"] = "baked_pumpkin",
            ["Beer"] = "beer",
            ["Berry"] = "berry",
            ["Berry Poison"] = "berry_poison",
            ["Candy Apple"] = "candy_apple",
            ["Consomme With Leek"] = "consomme_with_leek",
            ["Donut"] = "donut",
            ["Fake Berry"] = "fake_berry",
            ["Leek"] = "leek",
            ["Leek Rings"] = "leek_rings",
            ["Leek Roasted"] = "leek_roasted",
            ["Leek Seeds"] = "leek_seeds",
            ["Mandrake"] = "mandrake",
            ["Mandrake Seeds"] = "mandrake_seeds",
            ["Meat Jerky"] = "meat_jerky",
            ["Meat Raw"] = "meat_raw",
            ["Meat Roast"] = "meat_roast",
            ["Meat Stew"] = "meat_stew",
            ["Mushroom"] = "mushroom",
            ["Mushroom Amanita"] = "mushroom_amanita",
            ["Mushroom Poison"] = "mushroom_poison",
            ["Oat Seeds"] = "oat_seeds",
            ["Porridge Poison"] = "porridge_poison",
            ["Pottage"] = "pottage",
            ["Pottage Mushroom"] = "pottage_mushroom",
            ["Pottage North"] = "pottage_north",
            ["Pumpkin"] = "pumpkin",
            ["Pumpkin Seeds"] = "pumpkin_seeds",
            ["Rack Meat"] = "rack_meat",
            ["Rice"] = "rice",
            ["Rice Cake"] = "rice_cake",
            ["Rice Seeds"] = "rice_seeds",
            ["Seeds Roast"] = "seeds_roast",
            ["Sweet Pie"] = "sweet_pie",
            ["Turkey"] = "turkey",
            ["Turkey Roast"] = "turkey_roast",
            ["Turkey With Leek"] = "turkey_with_leek",
            ["Yuck"] = "yuck",
        },
        ["Drink"] = {
            ["Barrel Honey"] = "barrel_honey",
            ["Beer"] = "beer",
            ["Berry Drink"] = "berry_drink",
            ["Berry Tea"] = "berry_tea",
            ["Flask Empty"] = "flask_empty",
            ["Flask Water"] = "flask_water",
            ["Soured Milk"] = "soured_milk",
            ["Wine"] = "wine",
        },
    },
    ["Gacha Box"] = {
        ["Inventory Gacha Blight Armor"] = "inventory_gacha_blight_armor",
        ["Inventory Gacha Book"] = "inventory_gacha_book",
        ["Inventory Gacha Book Pool 1"] = "inventory_gacha_book_pool_1",
        ["Inventory Gacha Fire Armor"] = "inventory_gacha_fire_armor",
        ["Inventory Gacha Freeze Armor"] = "inventory_gacha_freeze_armor",
        ["Inventory Gacha Piligrim Set"] = "inventory_gacha_piligrim_set",
        ["Inventory Gacha Research"] = "inventory_gacha_research",
        ["Inventory Gacha Talisman Common"] = "inventory_gacha_talisman_common",
        ["Inventory Gacha Talisman Legendary"] = "inventory_gacha_talisman_legendary",
        ["Inventory Gacha Talisman Rare"] = "inventory_gacha_talisman_rare",
        ["Inventory Gacha Talisman Unique"] = "inventory_gacha_talisman_unique",
        ["Inventory Gacha Weapon Common"] = "inventory_gacha_weapon_common",
        ["Inventory Gacha Weapon Legendary"] = "inventory_gacha_weapon_legendary",
        ["Inventory Gacha Weapon Rare"] = "inventory_gacha_weapon_rare",
        ["Inventory Gacha Weapon Unique"] = "inventory_gacha_weapon_unique",
        ["Tube Legendary"] = "tube_legendary",
        ["Tube Normal"] = "tube_normal",
        ["Tube Rare"] = "tube_rare",
        ["Tube Unique"] = "tube_unique",
        ["Xmas Gift Big"] = "xmas_gift_big",
        ["Xmas Gift Medium"] = "xmas_gift_medium",
        ["Xmas Gift Small"] = "xmas_gift_small",
    },
    ["Items"] = {
        ["Altar Items rare"] = {
            ["Altar Left"] = "altar_left",
            ["Altar Right"] = "altar_right",
            ["Altar core"] = "altar_mid",
            ["Bell"] = "bell",
            ["Betrayer Blood"] = "betrayer_blood",
            ["Nameless Writ"] = "nameless_writ",
            ["book of fate"] = "holy_writ",
        },
        ["Boat Items rare [not ready in game]"] = {
            ["Mast"] = "mast",
            ["Sail"] = "sail",
            ["Tiller"] = "tiller",
            ["Yard"] = "yard",
        },
        ["Cat house Items rare"] = {
            ["Cat Scratcher"] = "scratching_post",
            ["Cat pillow"] = "cushion",
        },

        ["Wolf Kennel Items Rare"] = {
            ["Pet Collar"] = "pet_collar",
            ["Training Mannequin"] = "training_mannequin",
        },
        ["Event Items"] = {
            ["Ghost King Coin"] = "ancient_sepulchre_coins",
            ["Bone Powder"] = "bone_powder",
            ["Cinnabar"] = "cinnabar",
            ["War Dog Insignia"] = "dog_of_war",
            ["Corruption sample"] = "filth",
            ["Moonflower"] = "moonflower",
            ["Raven Feather"] = "raven_feather",
            ["Order Relic"] = "relic_fragment",
            ["Soul Cake"] = "soul_cake",
            ["Sugar Skull"] = "sugar_skull",
            ["Scarlet Angel Insignia"] = "token_angel",
            ["Turkey Feather"] = "turkey_feather",
            ["Wooden Horse call Bos Aissa"] = "wooden_horse",
            ["Xmas Amulet"] = "xmas_amulet",
            ["Xmas Bijou"] = "xmas_bijou",
            ["Xmas Candy"] = "xmas_candy",
            ["Xmas Cookie"] = "xmas_cookie",
            ["Xmas Lantern"] = "xmas_lantern",
            ["Xmas Pudding"] = "xmas_pudding",
            ["Xmas Socks"] = "xmas_socks",
            ["Xmas Toy"] = "xmas_toy",
            ["Xmas Wreath"] = "xmas_wreath",
        },
        ["Grinstone workbence Items rare"] = {
            ["Grinding Wheel"] = "grinding_wheel",
            ["Handle"] = "handle",
        },
        ["Horse Items rare"] = {
            ["Horse Bridle"] = "horse_bridle",
            ["Horse Feeder"] = "horse_feeder",
            ["Saddle"] = "saddle",
        },
        ["Mix Items"] = {
            ["Aissa Drop"] = "aissa_drop",
            ["Ancient Plate"] = "ancient_plate",
            ["Awl"] = "awl",
            ["Beech Wood"] = "beech_wood",
            ["Birch Board"] = "birch_board",
            ["Birch Wood"] = "birch_wood",
            ["Bowstring"] = "bowstring",
            ["Bronze Ingot"] = "bronze_ingot",
            ["Chain"] = "chain",
            ["Chef Recipes Book"] = "chef_recipes_book",
            ["Chisel"] = "chisel",
            ["Cloth"] = "cloth",
            ["Coal"] = "coal",
            ["Copper Debris"] = "copper_debris",
            ["Copper Ingot"] = "copper_ingot",
            ["Copper Ore"] = "copper_ore",
            ["Empty Barrel"] = "barrel_empty",
            ["Empty Spirit"] = "spirit_empty",
            ["Fabric"] = "fabric",
            ["Fiber"] = "fiber",
            ["Gold Alch"] = "gold_alch",
            ["Grate"] = "lattice",
            ["Grind Oil"] = "grind_oil",
            ["Grind Oil 2"] = "grind_oil_2",
            ["Incense"] = "incense",
            ["Iron Ingot"] = "iron_ingot",
            ["Iron Magic"] = "iron_magic",
            ["Iron Ore"] = "iron_ore",
            ["Iron Plate"] = "iron_plate",
            ["Iron shard"] = "iron_debris",
            ["Junk Candle"] = "candle",
            ["Junk Chalice"] = "junk_goblet",
            ["Junk Comb"] = "junk_comb",
            ["Junk Fibula"] = "junk_fibula",
            ["Junk Fork"] = "junk_fork",
            ["Junk Hourglass"] = "junk_hourglass",
            ["Junk Lock"] = "junk_lock",
            ["Junk Mirror"] = "junk_mirror",
            ["Junk Ring"] = "junk_ring",
            ["Junk Skull"] = "junk_skull",
            ["Junk Spoon"] = "junk_spoon",
            ["Junk direwolf fang"] = "junk_tusk",
            ["Leather"] = "leather",
            ["Leather Magic"] = "leather_magic",
            ["Mechanism"] = "mech",
            ["Meteor Ore"] = "meteor_ore",
            ["Nails"] = "nails",
            ["Oak Board"] = "oak_board",
            ["Oak Wood"] = "oak_wood",
            ["Powder"] = "powder",
            ["Priestess Ashes"] = "priestess_ashes",
            ["Rope"] = "rope",
            ["Rupert Drop"] = "rupert_drop",
            ["Saltpetre"] = "saltpetre",
            ["Soulshard"] = "soulshard",
            ["Spirit"] = "spirit",
            ["Staples"] = "staple",
            ["Steel Ingot"] = "steel_ingot",
            ["Stone"] = "stone",
            ["Stone Block"] = "stone_block",
            ["Strong Bowstring"] = "strong_bowstring",
            ["Sulfur"] = "sulfur",
            ["Tempered Rivet"] = "tempered_rivet",
            ["Thick Cloth"] = "cloth_thick",
            ["Tin Ore"] = "tin_ore",
            ["True Silver"] = "true_silver",
            ["Waxed Thread"] = "waxed_thread",
            ["Weapon Holder"] = "weapon_holder",
            ["Wire"] = "wire",
            ["Wood"] = "wood",
            ["Wood Magic"] = "wood_magic",
            ["animal hide"] = "pelt",
            ["cords"] = "straps",
            ["pine plank"] = "board",
        },
        ["Torture chair Items rare"] = {
            ["Bracelet"] = "bracelet",
            ["Pilers"] = "pilers",
             ["Clamp"] = "clip",
        },
        ["Torture rack Items rare"] = {
            ["Heretics Fork"] = "heretics_fork",
            ["Iron grinder"] = "iron_shaft",
            ["Knee Spliiter"] = "knee_crusher",
            ["Mask Iron"] = "mask_iron",
            ["Tools kit"] = "tools_rack",
        },
        ["alchemy table Items rare"] = {
            ["Philosopher Stone"] = "ph_stone",
            ["Retort"] = "retort",
            ["Scales"] = "scales",
            ["mortal & Pestle"] = "pestle",
        },
        ["armor repair Items rare"] = {
            ["Acid solutions"] = "acid",
            ["Mallet"] = "mallet",
            ["Needle Set"] = "needle_set",
            ["Vise"] = "vise",
        },
        ["blast furnance Items rare"] = {
            ["Anvil"] = "anvil",
            ["Bellows"] = "bellows",
            ["Mold"] = "mold",
            ["Vat"] = "vat",
            ["casting cannel"] = "gutter",
            ["heat proof steel tongs"] = "ticks",
        },
        ["carpenter Items rare"] = {
            ["Handsaw"] = "handsaw",
            ["carpenter plane"] = "jointer",
        },
        ["cartographer table Items rare"] = {
            ["Clean Parchment"] = "parchment",
            ["Compass"] = "compass",
            ["Globe"] = "globe",
            ["Sextant"] = "sextant",
            ["Spyglass"] = "spyglass",
        },
        ["smelter Items rare"] = {
            ["Drip pan"] = "underbottom",
        },
        ["stone workbence Items rare"] = {
            ["Wedge"] = "wedge",
        },
        ["waggon Items rare"] = {
            ["Waggon Axle"] = "waggon_axle",
            ["Waggon Barrel"] = "waggon_barrel",
            ["Waggon Bow"] = "waggon_bow",
            ["Waggon Harness"] = "waggon_harness",
            ["Waggon Wheel"] = "waggon_wheel",
        },
    },
    ["Key"] = {
        ["Key Dungeon 01"] = "key_dungeon_01",
        ["Key Dungeon 02"] = "key_dungeon_02",
        ["Key Eisenhorn Chest"] = "key_eisenhorn_chest",
        ["Key Puzzle"] = "key_puzzle",
        ["Key Watchtower"] = "key_watchtower",
    },
    ["Maps"] = {
        ["Event Map Anniversary Ground"] = "event_map_anniversary_ground",
        ["Event Map Big Hermit Storage"] = "event_map_big_hermit_storage",
        ["Event Map Big Hermit Storage Piece"] = "event_map_big_hermit_storage_piece",
        ["Event Map Burned Village"] = "event_map_burned_village",
        ["Event Map Cemetery"] = "event_map_cemetery",
        ["Event Map Converter"] = "event_map_converter",
        ["Event Map Convoy"] = "event_map_convoy",
        ["Event Map Deadman"] = "event_map_deadman",
        ["Event Map Death Labyrinth"] = "event_map_death_labyrinth",
        ["Event Map Hermit Hut"] = "event_map_hermit_hut",
        ["Event Map Hunting Grounds"] = "event_map_hunting_grounds",
        ["Event Map Pasture"] = "event_map_pasture",
        ["Event Map Rare"] = "event_map_rare",
        ["Event Map Sacrificial Altar"] = "event_map_sacrificial_altar",
        ["Event Map Sacrificial Altar Piece"] = "event_map_sacrificial_altar_piece",
        ["Event Map Small Hermit Storage"] = "event_map_small_hermit_storage",
        ["Event Map Small Hermit Storage Piece"] = "event_map_small_hermit_storage_piece",
        ["Event Map Td.chest.location"] = "event_map_td.chest.location",
        ["Event Map Tiny Hermit Storage"] = "event_map_tiny_hermit_storage",
        ["Event Map Tiny Hermit Storage Piece"] = "event_map_tiny_hermit_storage_piece",
        ["Event Map Trader"] = "event_map_trader",
        ["Event Map Unique"] = "event_map_unique",
        ["Event Map Unknown"] = "event_map_unknown",
        ["Event Map Unknown Piece"] = "event_map_unknown_piece",
        ["Event Map Unknown Rare Piece"] = "event_map_unknown_rare_piece",
        ["Event Map Unknown Unique Piece"] = "event_map_unknown_unique_piece",
        ["Event Map Virbjorn Lair"] = "event_map_virbjorn_lair",
        ["Event Map Waggon"] = "event_map_waggon",
        ["Event Map Warlock Lair"] = "event_map_warlock_lair",
        ["Plan"] = "plan",
        ["Plan A"] = "plan_a",
        ["Plan Anniversary"] = "plan_anniversary",
        ["Plan B"] = "plan_b",
        ["Plan Boss 01"] = "plan_boss_01",
        ["Plan Hard"] = "plan_hard",
        ["Plan Normal"] = "plan_normal",
        ["Plan Temple"] = "plan_temple",
    },
    ["Pets"] = {
        ["Cats"] = {
            ["Babycat"] = "babycat",
            ["Babycat Black Halloween"] = "babycat_black_halloween",
            ["Babycat Blue Halloween"] = "babycat_blue_halloween",
            ["Babycat Cerulean Xmas"] = "babycat_cerulean_xmas",
            ["Babycat Green Halloween"] = "babycat_green_halloween",
            ["Babycat Lavender Xmas"] = "babycat_lavender_xmas",
            ["Babycat Rare"] = "babycat_rare",
            ["Babycat Rnd"] = "babycat_rnd",
            ["Babycat Rnd1"] = "babycat_rnd1",
            ["Babycat Turquoise Halloween"] = "babycat_turquoise_halloween",
            ["Babycat Turquoise Xmas"] = "babycat_turquoise_xmas",
            ["Babycat Unique"] = "babycat_unique",
            ["Babycat Unique1"] = "babycat_unique1",
            ["Babycat Unique2"] = "babycat_unique2",
            ["Babycat Violet Halloween"] = "babycat_violet_halloween",
            ["Babycat Yellow Halloween"] = "babycat_yellow_halloween",
            ["Petcat Adult"] = "petcat_adult",
            ["Petcat Adult1"] = "petcat_adult1",
        },
        ["Wolf"] = {
            ["Babywolf"] = "babywolf",
            ["Babywolf Black Halloween"] = "babywolf_black_halloween",
            ["Babywolf Black Unique"] = "babywolf_black_unique",
            ["Babywolf Blue Halloween"] = "babywolf_blue_halloween",
            ["Babywolf Converter"] = "babywolf_converter",
            ["Babywolf Female"] = "babywolf_female",
            ["Babywolf Green Halloween"] = "babywolf_green_halloween",
            ["Babywolf Male"] = "babywolf_male",
            ["Babywolf Rare Female"] = "babywolf_rare_female",
            ["Babywolf Rare Male"] = "babywolf_rare_male",
            ["Babywolf Rnd"] = "babywolf_rnd",
            ["Babywolf Rnd1"] = "babywolf_rnd1",
            ["Babywolf Turquoise Halloween"] = "babywolf_turquoise_halloween",
            ["Babywolf Unique"] = "babywolf_unique",
            ["Babywolf Violet Halloween"] = "babywolf_violet_halloween",
            ["Babywolf White Unique"] = "babywolf_white_unique",
            ["Babywolf Yellow Halloween"] = "babywolf_yellow_halloween",
            ["Petwolf Adult"] = "petwolf_adult",
            ["Petwolf Adult Epic"] = "petwolf_adult_epic",
            ["Petwolf Adult Epic Hw"] = "petwolf_adult_epic_hw",
            ["Petwolf Adult Epic Violet"] = "petwolf_adult_epic_violet",
            ["Petwolf Adult Epic Xmas"] = "petwolf_adult_epic_xmas",
            ["Petwolf Adult1"] = "petwolf_adult1",
            ["Petwolf Xmas Cerulean"] = "petwolf_xmas_cerulean",
            ["Petwolf Xmas Lavender"] = "petwolf_xmas_lavender",
            ["Petwolf Xmas Turquoise"] = "petwolf_xmas_turquoise",
        },
        ["Food"] = {
            ["Cat Food"] = "cat_food",
            ["Cat Food Milk"] = "cat_food_milk",
            ["horse Food Oat"] = "oat",
            ["Pet Food"] = "pet_food",
            ["Pet Food Alchemy"] = "pet_food_alchemy",
            ["Pet Food Heart"] = "pet_food_heart",
        },
    },
    ["Research Collections"] = {
        ["Research Altar"] = "research_altar",
        ["Research Altar 2"] = "research_altar_2",
        ["Research Altar 3"] = "research_altar_3",
        ["Research Chest Shared 1"] = "research_chest_shared_1",
        ["Research Chest Shared 2"] = "research_chest_shared_2",
        ["Research Chest Shared 3"] = "research_chest_shared_3",
        ["Research For Ailette Shirt"] = "research_for_ailette_shirt",
        ["Research For Aventail Boots"] = "research_for_aventail_boots",
        ["Research For Aventail Gloves"] = "research_for_aventail_gloves",
        ["Research For Aventail Hat"] = "research_for_aventail_hat",
        ["Research For Aventail Pants"] = "research_for_aventail_pants",
        ["Research For Aventail Shirt"] = "research_for_aventail_shirt",
        ["Research For Axe Berserk 2h"] = "research_for_axe_berserk_2h",
        ["Research For Barbute Hat"] = "research_for_barbute_hat",
        ["Research For Bard Boots"] = "research_for_bard_boots",
        ["Research For Bard Gloves"] = "research_for_bard_gloves",
        ["Research For Bard Hat"] = "research_for_bard_hat",
        ["Research For Bard Pants"] = "research_for_bard_pants",
        ["Research For Bard Shirt"] = "research_for_bard_shirt",
        ["Research For Bear Boots"] = "research_for_bear_boots",
        ["Research For Bear Gloves"] = "research_for_bear_gloves",
        ["Research For Bear Hat"] = "research_for_bear_hat",
        ["Research For Bear Pants"] = "research_for_bear_pants",
        ["Research For Bear Shirt"] = "research_for_bear_shirt",
        ["Research For Bechter Shirt"] = "research_for_bechter_shirt",
        ["Research For Black Warrior Boots"] = "research_for_black_warrior_boots",
        ["Research For Black Warrior Gloves"] = "research_for_black_warrior_gloves",
        ["Research For Black Warrior Hat"] = "research_for_black_warrior_hat",
        ["Research For Black Warrior Pants"] = "research_for_black_warrior_pants",
        ["Research For Black Warrior Shirt"] = "research_for_black_warrior_shirt",
        ["Research For Blast Furnace"] = "research_for_blast_furnace",
        ["Research For Bomb"] = "research_for_bomb",
        ["Research For Broom"] = "research_for_broom",
        ["Research For Chaperon Hat"] = "research_for_chaperon_hat",
        ["Research For Chest Shared"] = "research_for_chest_shared",
        ["Research For Citizen Boots"] = "research_for_citizen_boots",
        ["Research For Citizen Gloves"] = "research_for_citizen_gloves",
        ["Research For Citizen Hat"] = "research_for_citizen_hat",
        ["Research For Citizen Pants"] = "research_for_citizen_pants",
        ["Research For Citizen Shirt"] = "research_for_citizen_shirt",
        ["Research For Crossbow Heavy"] = "research_for_crossbow_heavy",
        ["Research For Cursed Lady Bag"] = "research_for_cursed_lady_bag",
        ["Research For Diplomat Boots"] = "research_for_diplomat_boots",
        ["Research For Diplomat Gloves"] = "research_for_diplomat_gloves",
        ["Research For Diplomat Hat"] = "research_for_diplomat_hat",
        ["Research For Diplomat Pants"] = "research_for_diplomat_pants",
        ["Research For Diplomat Shirt"] = "research_for_diplomat_shirt",
        ["Research For Doublet Shirt"] = "research_for_doublet_shirt",
        ["Research For Dragon Boots"] = "research_for_dragon_boots",
        ["Research For Dragon Gloves"] = "research_for_dragon_gloves",
        ["Research For Dragon Hat"] = "research_for_dragon_hat",
        ["Research For Dragon Pants"] = "research_for_dragon_pants",
        ["Research For Dragon Shirt"] = "research_for_dragon_shirt",
        ["Research For Duelist Boots"] = "research_for_duelist_boots",
        ["Research For Duelist Gloves"] = "research_for_duelist_gloves",
        ["Research For Duelist Hat"] = "research_for_duelist_hat",
        ["Research For Duelist Pants"] = "research_for_duelist_pants",
        ["Research For Duelist Shirt"] = "research_for_duelist_shirt",
        ["Research For East Champion Boots"] = "research_for_east_champion_boots",
        ["Research For East Champion Gloves"] = "research_for_east_champion_gloves",
        ["Research For East Champion Hat"] = "research_for_east_champion_hat",
        ["Research For East Champion Pants"] = "research_for_east_champion_pants",
        ["Research For East Champion Shirt"] = "research_for_east_champion_shirt",
        ["Research For Executioner Boots"] = "research_for_executioner_boots",
        ["Research For Executioner Gloves"] = "research_for_executioner_gloves",
        ["Research For Executioner Hat"] = "research_for_executioner_hat",
        ["Research For Executioner Pants"] = "research_for_executioner_pants",
        ["Research For Executioner Shirt"] = "research_for_executioner_shirt",
        ["Research For Falchion Killer"] = "research_for_falchion_killer",
        ["Research For Flaming Bag"] = "research_for_flaming_bag",
        ["Research For Halt Bag"] = "research_for_halt_bag",
        ["Research For Hatchet Artisan"] = "research_for_hatchet_artisan",
        ["Research For Horned Hat"] = "research_for_horned_hat",
        ["Research For Ironmaiden Bag"] = "research_for_ironmaiden_bag",
        ["Research For Jambia"] = "research_for_jambia",
        ["Research For Kamiz"] = "research_for_kamiz",
        ["Research For Katana"] = "research_for_katana",
        ["Research For Khopesh"] = "research_for_khopesh",
        ["Research For Kriegsmesser"] = "research_for_kriegsmesser",
        ["Research For Mace Aztec"] = "research_for_mace_aztec",
        ["Research For Morgenstern Novice"] = "research_for_morgenstern_novice",
        ["Research For Mourning Reaper Boots"] = "research_for_mourning_reaper_boots",
        ["Research For Mourning Reaper Gloves"] = "research_for_mourning_reaper_gloves",
        ["Research For Mourning Reaper Hat"] = "research_for_mourning_reaper_hat",
        ["Research For Mourning Reaper Pants"] = "research_for_mourning_reaper_pants",
        ["Research For Mourning Reaper Shirt"] = "research_for_mourning_reaper_shirt",
        ["Research For Night Stalker Boots"] = "research_for_night_stalker_boots",
        ["Research For Night Stalker Gloves"] = "research_for_night_stalker_gloves",
        ["Research For Night Stalker Hat"] = "research_for_night_stalker_hat",
        ["Research For Night Stalker Pants"] = "research_for_night_stalker_pants",
        ["Research For Night Stalker Shirt"] = "research_for_night_stalker_shirt",
        ["Research For Noker Boots"] = "research_for_noker_boots",
        ["Research For Noker Gloves"] = "research_for_noker_gloves",
        ["Research For Noker Hat"] = "research_for_noker_hat",
        ["Research For Noker Pants"] = "research_for_noker_pants",
        ["Research For Noker Shirt"] = "research_for_noker_shirt",
        ["Research For Pernach Novice"] = "research_for_pernach_novice",
        ["Research For Pickaxe Artisan"] = "research_for_pickaxe_artisan",
        ["Research For Piligrim Bag"] = "research_for_piligrim_bag",
        ["Research For Piligrim Boots"] = "research_for_piligrim_boots",
        ["Research For Piligrim Gloves"] = "research_for_piligrim_gloves",
        ["Research For Piligrim Hat"] = "research_for_piligrim_hat",
        ["Research For Piligrim Pants"] = "research_for_piligrim_pants",
        ["Research For Piligrim Shirt"] = "research_for_piligrim_shirt",
        ["Research For Plague Boots"] = "research_for_plague_boots",
        ["Research For Plague Gloves"] = "research_for_plague_gloves",
        ["Research For Plague Hat"] = "research_for_plague_hat",
        ["Research For Plague Pants"] = "research_for_plague_pants",
        ["Research For Plague Shirt"] = "research_for_plague_shirt",
        ["Research For Poleaxe"] = "research_for_poleaxe",
        ["Research For Pullen Boots"] = "research_for_pullen_boots",
        ["Research For Rack Armor"] = "research_for_rack_armor",
        ["Research For Rack Weapon"] = "research_for_rack_weapon",
        ["Research For Rapier"] = "research_for_rapier",
        ["Research For Ritterschwert"] = "research_for_ritterschwert",
        ["Research For Rogvold Bag"] = "research_for_rogvold_bag",
        ["Research For Shield Buckler"] = "research_for_shield_buckler",
        ["Research For Shield Heavy"] = "research_for_shield_heavy",
        ["Research For Shovel Monk"] = "research_for_shovel_monk",
        ["Research For Snow Hunter Boots"] = "research_for_snow_hunter_boots",
        ["Research For Snow Hunter Gloves"] = "research_for_snow_hunter_gloves",
        ["Research For Snow Hunter Hat"] = "research_for_snow_hunter_hat",
        ["Research For Snow Hunter Pants"] = "research_for_snow_hunter_pants",
        ["Research For Snow Hunter Shirt"] = "research_for_snow_hunter_shirt",
        ["Research For Soldier Boots"] = "research_for_soldier_boots",
        ["Research For Soldier Gloves"] = "research_for_soldier_gloves",
        ["Research For Soldier Hat"] = "research_for_soldier_hat",
        ["Research For Soldier Pants"] = "research_for_soldier_pants",
        ["Research For Soldier Shirt"] = "research_for_soldier_shirt",
        ["Research For Spear"] = "research_for_spear",
        ["Research For Spikes Boots"] = "research_for_spikes_boots",
        ["Research For Spikes Gloves"] = "research_for_spikes_gloves",
        ["Research For Spikes Hat"] = "research_for_spikes_hat",
        ["Research For Spikes Pants"] = "research_for_spikes_pants",
        ["Research For Spikes Shirt"] = "research_for_spikes_shirt",
        ["Research For Strappado"] = "research_for_strappado",
        ["Research For Straw Hat"] = "research_for_straw_hat",
        ["Research For Strong Cudgel"] = "research_for_strong_cudgel",
        ["Research For Strong Mace"] = "research_for_strong_mace",
        ["Research For Sword Crusher"] = "research_for_sword_crusher",
        ["Research For Thunderlord Boots"] = "research_for_thunderlord_boots",
        ["Research For Thunderlord Gloves"] = "research_for_thunderlord_gloves",
        ["Research For Thunderlord Hat"] = "research_for_thunderlord_hat",
        ["Research For Thunderlord Pants"] = "research_for_thunderlord_pants",
        ["Research For Thunderlord Shirt"] = "research_for_thunderlord_shirt",
        ["Research For Torture Chair"] = "research_for_torture_chair",
        ["Research For Warlock Boots"] = "research_for_warlock_boots",
        ["Research For Warlock Gloves"] = "research_for_warlock_gloves",
        ["Research For Warlock Hat"] = "research_for_warlock_hat",
        ["Research For Warlock Pants"] = "research_for_warlock_pants",
        ["Research For Warlock Shirt"] = "research_for_warlock_shirt",
        ["Research For Wooden Sword"] = "research_for_wooden_sword",
        ["Research For Workbench Alchemist"] = "research_for_workbench_alchemist",
        ["Research For Workbench Armor"] = "research_for_workbench_armor",
        ["Research For Workbench Grind"] = "research_for_workbench_grind",
        ["Research For Workbench Mapmaker"] = "research_for_workbench_mapmaker",
        ["Research For Workbench Weapon"] = "research_for_workbench_weapon",
        ["Research For Yataghan"] = "research_for_yataghan",
        ["Research Kennel 1"] = "research_kennel_1",
        ["Research Kennel 2"] = "research_kennel_2",
        ["Research Kennel 3"] = "research_kennel_3",
        ["Research Kennel Cat 1"] = "research_kennel_cat_1",
        ["Research Kennel Cat 2"] = "research_kennel_cat_2",
        ["Research Kennel Cat 3"] = "research_kennel_cat_3",
        ["Research Sanctum 1"] = "research_sanctum_1",
        ["Research Sanctum 2"] = "research_sanctum_2",
        ["Research Sanctum 3"] = "research_sanctum_3",
        ["Research Waggon 1"] = "research_waggon_1",
        ["Research Waggon 2"] = "research_waggon_2",
        ["Research Waggon 3"] = "research_waggon_3",
        ["Research Workbench Armor 1"] = "research_workbench_armor_1",
        ["Research Workbench Armor 2"] = "research_workbench_armor_2",
        ["Research Workbench Armor 3"] = "research_workbench_armor_3",
        ["Research Workbench Mapmaker 1"] = "research_workbench_mapmaker_1",
        ["Research Workbench Mapmaker 2"] = "research_workbench_mapmaker_2",
        ["Research Workbench Mapmaker 3"] = "research_workbench_mapmaker_3",
        ["Research Workbench Stone 1"] = "research_workbench_stone_1",
        ["Research Workbench Weapon 1"] = "research_workbench_weapon_1",
        ["Research Workbench Weapon 2"] = "research_workbench_weapon_2",
        ["Research Workbench Weapon 3"] = "research_workbench_weapon_3",
        ["Research Workbench Wood 1"] = "research_workbench_wood_1",
        ["Research smelter 1"] = "research_furnace_1",
    },
    ["Spell Magic Scrolls"] = {
        ["Spell Clan"] = "spell_clan",
        ["Spell Control"] = "spell_control",
        ["Spell Control2"] = "spell_control2",
        ["Spell Control3"] = "spell_control3",
        ["Spell Expel"] = "spell_expel",
        ["Spell Fear"] = "spell_fear",
        ["Spell Freeze"] = "spell_freeze",
        ["Spell Heal"] = "spell_heal",
        ["Spell Heal 2"] = "spell_heal_2",
        ["Spell Heal 3"] = "spell_heal_3",
        ["Spell Heal 4"] = "spell_heal_4",
        ["Spell Lightning"] = "spell_lightning",
        ["Spell Look Around 1"] = "spell_look_around_1",
        ["Spell Look Around 2"] = "spell_look_around_2",
        ["Spell Look Around 3"] = "spell_look_around_3",
        ["Spell Massacre"] = "spell_massacre",
        ["Spell Rain"] = "spell_rain",
        ["Spell Summon"] = "spell_summon",
        ["Spell Summon 2"] = "spell_summon_2",
        ["Spell Summon 3"] = "spell_summon_3",
        ["Spell Summon 4"] = "spell_summon_4",
        ["Spell Summon Turkey Boss Ghost"] = "spell_summon_turkey_boss_ghost",
    },
    ["Storage Collection"] = {
        ["Storage Alchemy"] = "storage_alchemy",
        ["Storage Armor"] = "storage_armor",
        ["Storage Book"] = "storage_book",
        ["Storage Food"] = "storage_food",
        ["Storage Fuel"] = "storage_fuel",
        ["Storage Mech"] = "storage_mech",
        ["Storage Ore"] = "storage_ore",
        ["Storage Tailor"] = "storage_tailor",
        ["Storage Weapon"] = "storage_weapon",
    },
    ["Talisman"] = {
        ["Talisman Absorb Blight 3"] = "talisman_absorb_blight_3",
        ["Talisman Absorb Fire 3"] = "talisman_absorb_fire_3",
        ["Talisman Absorb Freeze 3"] = "talisman_absorb_freeze_3",
        ["Talisman Absorb Phys 3"] = "talisman_absorb_phys_3",
        ["Talisman Absorb Phys 3 Black"] = "talisman_absorb_phys_3_black",
        ["Talisman Crit Chance 2"] = "talisman_crit_chance_2",
        ["Talisman Crit Chance 3 Black"] = "talisman_crit_chance_3_black",
        ["Talisman Damage Blight 2"] = "talisman_damage_blight_2",
        ["Talisman Damage Fire 2"] = "talisman_damage_fire_2",
        ["Talisman Damage Freeze 2"] = "talisman_damage_freeze_2",
        ["Talisman Damage Phys 2"] = "talisman_damage_phys_2",
        ["Talisman Damage Phys 3 Black"] = "talisman_damage_phys_3_black",
        ["Talisman Evasion 2"] = "talisman_evasion_2",
        ["Talisman Evasion 3 Black"] = "talisman_evasion_3_black",
        ["Talisman Farm Berry 1"] = "talisman_farm_berry_1",
        ["Talisman Farm Fiber 1"] = "talisman_farm_fiber_1",
        ["Talisman Farm Ore 1"] = "talisman_farm_ore_1",
        ["Talisman Farm Wood 1"] = "talisman_farm_wood_1",
        ["Talisman Revive 3"] = "talisman_revive_3",
        ["Talisman Revive 3 Black"] = "talisman_revive_3_black",
        ["Talisman Revive 3 Black 2"] = "talisman_revive_3_black_2",
        ["Talisman Shieldwall 3"] = "talisman_shieldwall_3",
    },
    ["Tattoo"]= {
        ["Tattoo 01"] = "tattoo_01",
        ["Tattoo 02"] = "tattoo_02",
        ["Tattoo 03"] = "tattoo_03",
        ["Tattoo 04"] = "tattoo_04",
        ["Tattoo 05"] = "tattoo_05",
        ["Tattoo 06"] = "tattoo_06",
        ["Tattoo 07"] = "tattoo_07",
        ["Tattoo 08"] = "tattoo_08",
        ["Tattoo 09"] = "tattoo_09",
        ["Tattoo 10"] = "tattoo_10",
        ["Tattoo 11"] = "tattoo_11",
        ["Tattoo 12"] = "tattoo_12",
    },
    ["Tome Bookskill"] = {
        ["Book Adrenalin 1"] = "book_adrenalin_1",
        ["Book Adrenalin 2"] = "book_adrenalin_2",
        ["Book Adrenalin 3"] = "book_adrenalin_3",
        ["Book Adrenalin 4"] = "book_adrenalin_4",
        ["Book Adrenalin 5"] = "book_adrenalin_5",
        ["Book Archer Evade 1"] = "book_archer_evade_1",
        ["Book Archer Evade 10"] = "book_archer_evade_10",
        ["Book Archer Evade 2"] = "book_archer_evade_2",
        ["Book Archer Evade 3"] = "book_archer_evade_3",
        ["Book Archer Evade 4"] = "book_archer_evade_4",
        ["Book Archer Evade 5"] = "book_archer_evade_5",
        ["Book Archer Evade 6"] = "book_archer_evade_6",
        ["Book Archer Evade 7"] = "book_archer_evade_7",
        ["Book Archer Evade 8"] = "book_archer_evade_8",
        ["Book Archer Evade 9"] = "book_archer_evade_9",
        ["Book Armor Boost 1"] = "book_armor_boost_1",
        ["Book Armor Boost 10"] = "book_armor_boost_10",
        ["Book Armor Boost 11"] = "book_armor_boost_11",
        ["Book Armor Boost 12"] = "book_armor_boost_12",
        ["Book Armor Boost 13"] = "book_armor_boost_13",
        ["Book Armor Boost 14"] = "book_armor_boost_14",
        ["Book Armor Boost 15"] = "book_armor_boost_15",
        ["Book Armor Boost 2"] = "book_armor_boost_2",
        ["Book Armor Boost 3"] = "book_armor_boost_3",
        ["Book Armor Boost 4"] = "book_armor_boost_4",
        ["Book Armor Boost 5"] = "book_armor_boost_5",
        ["Book Armor Boost 6"] = "book_armor_boost_6",
        ["Book Armor Boost 7"] = "book_armor_boost_7",
        ["Book Armor Boost 8"] = "book_armor_boost_8",
        ["Book Armor Boost 9"] = "book_armor_boost_9",
        ["Book Axe Berserk 2h Damage 1"] = "book_axe_berserk_2h_damage_1",
        ["Book Axe Berserk 2h Damage 10"] = "book_axe_berserk_2h_damage_10",
        ["Book Axe Berserk 2h Damage 11"] = "book_axe_berserk_2h_damage_11",
        ["Book Axe Berserk 2h Damage 12"] = "book_axe_berserk_2h_damage_12",
        ["Book Axe Berserk 2h Damage 13"] = "book_axe_berserk_2h_damage_13",
        ["Book Axe Berserk 2h Damage 14"] = "book_axe_berserk_2h_damage_14",
        ["Book Axe Berserk 2h Damage 15"] = "book_axe_berserk_2h_damage_15",
        ["Book Axe Berserk 2h Damage 2"] = "book_axe_berserk_2h_damage_2",
        ["Book Axe Berserk 2h Damage 3"] = "book_axe_berserk_2h_damage_3",
        ["Book Axe Berserk 2h Damage 4"] = "book_axe_berserk_2h_damage_4",
        ["Book Axe Berserk 2h Damage 5"] = "book_axe_berserk_2h_damage_5",
        ["Book Axe Berserk 2h Damage 6"] = "book_axe_berserk_2h_damage_6",
        ["Book Axe Berserk 2h Damage 7"] = "book_axe_berserk_2h_damage_7",
        ["Book Axe Berserk 2h Damage 8"] = "book_axe_berserk_2h_damage_8",
        ["Book Axe Berserk 2h Damage 9"] = "book_axe_berserk_2h_damage_9",
        ["Book Axe Thrower Dung Evade 1"] = "book_axe_thrower_dung_evade_1",
        ["Book Axe Thrower Dung Evade 10"] = "book_axe_thrower_dung_evade_10",
        ["Book Axe Thrower Dung Evade 2"] = "book_axe_thrower_dung_evade_2",
        ["Book Axe Thrower Dung Evade 3"] = "book_axe_thrower_dung_evade_3",
        ["Book Axe Thrower Dung Evade 4"] = "book_axe_thrower_dung_evade_4",
        ["Book Axe Thrower Dung Evade 5"] = "book_axe_thrower_dung_evade_5",
        ["Book Axe Thrower Dung Evade 6"] = "book_axe_thrower_dung_evade_6",
        ["Book Axe Thrower Dung Evade 7"] = "book_axe_thrower_dung_evade_7",
        ["Book Axe Thrower Dung Evade 8"] = "book_axe_thrower_dung_evade_8",
        ["Book Axe Thrower Dung Evade 9"] = "book_axe_thrower_dung_evade_9",
        ["Book Axe Thrower Headhunter Dung Evade 1"] = "book_axe_thrower_headhunter_dung_evade_1",
        ["Book Axe Thrower Headhunter Dung Evade 10"] = "book_axe_thrower_headhunter_dung_evade_10",
        ["Book Axe Thrower Headhunter Dung Evade 2"] = "book_axe_thrower_headhunter_dung_evade_2",
        ["Book Axe Thrower Headhunter Dung Evade 3"] = "book_axe_thrower_headhunter_dung_evade_3",
        ["Book Axe Thrower Headhunter Dung Evade 4"] = "book_axe_thrower_headhunter_dung_evade_4",
        ["Book Axe Thrower Headhunter Dung Evade 5"] = "book_axe_thrower_headhunter_dung_evade_5",
        ["Book Axe Thrower Headhunter Dung Evade 6"] = "book_axe_thrower_headhunter_dung_evade_6",
        ["Book Axe Thrower Headhunter Dung Evade 7"] = "book_axe_thrower_headhunter_dung_evade_7",
        ["Book Axe Thrower Headhunter Dung Evade 8"] = "book_axe_thrower_headhunter_dung_evade_8",
        ["Book Axe Thrower Headhunter Dung Evade 9"] = "book_axe_thrower_headhunter_dung_evade_9",
        ["Book Barrel Honey Heal 1"] = "book_barrel_honey_heal_1",
        ["Book Barrel Honey Heal 10"] = "book_barrel_honey_heal_10",
        ["Book Barrel Honey Heal 2"] = "book_barrel_honey_heal_2",
        ["Book Barrel Honey Heal 3"] = "book_barrel_honey_heal_3",
        ["Book Barrel Honey Heal 4"] = "book_barrel_honey_heal_4",
        ["Book Barrel Honey Heal 5"] = "book_barrel_honey_heal_5",
        ["Book Barrel Honey Heal 6"] = "book_barrel_honey_heal_6",
        ["Book Barrel Honey Heal 7"] = "book_barrel_honey_heal_7",
        ["Book Barrel Honey Heal 8"] = "book_barrel_honey_heal_8",
        ["Book Barrel Honey Heal 9"] = "book_barrel_honey_heal_9",
        ["Book Bastard Damage 1"] = "book_bastard_damage_1",
        ["Book Bastard Damage 10"] = "book_bastard_damage_10",
        ["Book Bastard Damage 11"] = "book_bastard_damage_11",
        ["Book Bastard Damage 12"] = "book_bastard_damage_12",
        ["Book Bastard Damage 13"] = "book_bastard_damage_13",
        ["Book Bastard Damage 14"] = "book_bastard_damage_14",
        ["Book Bastard Damage 15"] = "book_bastard_damage_15",
        ["Book Bastard Damage 2"] = "book_bastard_damage_2",
        ["Book Bastard Damage 3"] = "book_bastard_damage_3",
        ["Book Bastard Damage 4"] = "book_bastard_damage_4",
        ["Book Bastard Damage 5"] = "book_bastard_damage_5",
        ["Book Bastard Damage 6"] = "book_bastard_damage_6",
        ["Book Bastard Damage 7"] = "book_bastard_damage_7",
        ["Book Bastard Damage 8"] = "book_bastard_damage_8",
        ["Book Bastard Damage 9"] = "book_bastard_damage_9",
        ["Book Bat Evade 1"] = "book_bat_evade_1",
        ["Book Bat Evade 10"] = "book_bat_evade_10",
        ["Book Bat Evade 2"] = "book_bat_evade_2",
        ["Book Bat Evade 3"] = "book_bat_evade_3",
        ["Book Bat Evade 4"] = "book_bat_evade_4",
        ["Book Bat Evade 5"] = "book_bat_evade_5",
        ["Book Bat Evade 6"] = "book_bat_evade_6",
        ["Book Bat Evade 7"] = "book_bat_evade_7",
        ["Book Bat Evade 8"] = "book_bat_evade_8",
        ["Book Bat Evade 9"] = "book_bat_evade_9",
        ["Book Battle Rage 1"] = "book_battle_rage_1",
        ["Book Battle Rage 2"] = "book_battle_rage_2",
        ["Book Battle Rage 3"] = "book_battle_rage_3",
        ["Book Battle Rage 4"] = "book_battle_rage_4",
        ["Book Battle Rage 5"] = "book_battle_rage_5",
        ["Book Bear Evade 1"] = "book_bear_evade_1",
        ["Book Bear Evade 10"] = "book_bear_evade_10",
        ["Book Bear Evade 2"] = "book_bear_evade_2",
        ["Book Bear Evade 3"] = "book_bear_evade_3",
        ["Book Bear Evade 4"] = "book_bear_evade_4",
        ["Book Bear Evade 5"] = "book_bear_evade_5",
        ["Book Bear Evade 6"] = "book_bear_evade_6",
        ["Book Bear Evade 7"] = "book_bear_evade_7",
        ["Book Bear Evade 8"] = "book_bear_evade_8",
        ["Book Bear Evade 9"] = "book_bear_evade_9",
        ["Book Become Stone 1"] = "book_become_stone_1",
        ["Book Become Stone 10"] = "book_become_stone_10",
        ["Book Become Stone 11"] = "book_become_stone_11",
        ["Book Become Stone 12"] = "book_become_stone_12",
        ["Book Become Stone 13"] = "book_become_stone_13",
        ["Book Become Stone 14"] = "book_become_stone_14",
        ["Book Become Stone 15"] = "book_become_stone_15",
        ["Book Become Stone 2"] = "book_become_stone_2",
        ["Book Become Stone 3"] = "book_become_stone_3",
        ["Book Become Stone 4"] = "book_become_stone_4",
        ["Book Become Stone 5"] = "book_become_stone_5",
        ["Book Become Stone 6"] = "book_become_stone_6",
        ["Book Become Stone 7"] = "book_become_stone_7",
        ["Book Become Stone 8"] = "book_become_stone_8",
        ["Book Become Stone 9"] = "book_become_stone_9",
        ["Book Beer Heal 1"] = "book_beer_heal_1",
        ["Book Beer Heal 10"] = "book_beer_heal_10",
        ["Book Beer Heal 2"] = "book_beer_heal_2",
        ["Book Beer Heal 3"] = "book_beer_heal_3",
        ["Book Beer Heal 4"] = "book_beer_heal_4",
        ["Book Beer Heal 5"] = "book_beer_heal_5",
        ["Book Beer Heal 6"] = "book_beer_heal_6",
        ["Book Beer Heal 7"] = "book_beer_heal_7",
        ["Book Beer Heal 8"] = "book_beer_heal_8",
        ["Book Beer Heal 9"] = "book_beer_heal_9",
        ["Book Berry Drink Heal 1"] = "book_berry_drink_heal_1",
        ["Book Berry Drink Heal 10"] = "book_berry_drink_heal_10",
        ["Book Berry Drink Heal 2"] = "book_berry_drink_heal_2",
        ["Book Berry Drink Heal 3"] = "book_berry_drink_heal_3",
        ["Book Berry Drink Heal 4"] = "book_berry_drink_heal_4",
        ["Book Berry Drink Heal 5"] = "book_berry_drink_heal_5",
        ["Book Berry Drink Heal 6"] = "book_berry_drink_heal_6",
        ["Book Berry Drink Heal 7"] = "book_berry_drink_heal_7",
        ["Book Berry Drink Heal 8"] = "book_berry_drink_heal_8",
        ["Book Berry Drink Heal 9"] = "book_berry_drink_heal_9",
        ["Book Berry Gather 1"] = "book_berry_gather_1",
        ["Book Berry Gather 10"] = "book_berry_gather_10",
        ["Book Berry Gather 2"] = "book_berry_gather_2",
        ["Book Berry Gather 3"] = "book_berry_gather_3",
        ["Book Berry Gather 4"] = "book_berry_gather_4",
        ["Book Berry Gather 5"] = "book_berry_gather_5",
        ["Book Berry Gather 6"] = "book_berry_gather_6",
        ["Book Berry Gather 7"] = "book_berry_gather_7",
        ["Book Berry Gather 8"] = "book_berry_gather_8",
        ["Book Berry Gather 9"] = "book_berry_gather_9",
        ["Book Birch Wood Gather 1"] = "book_birch_wood_gather_1",
        ["Book Birch Wood Gather 10"] = "book_birch_wood_gather_10",
        ["Book Birch Wood Gather 2"] = "book_birch_wood_gather_2",
        ["Book Birch Wood Gather 3"] = "book_birch_wood_gather_3",
        ["Book Birch Wood Gather 4"] = "book_birch_wood_gather_4",
        ["Book Birch Wood Gather 5"] = "book_birch_wood_gather_5",
        ["Book Birch Wood Gather 6"] = "book_birch_wood_gather_6",
        ["Book Birch Wood Gather 7"] = "book_birch_wood_gather_7",
        ["Book Birch Wood Gather 8"] = "book_birch_wood_gather_8",
        ["Book Birch Wood Gather 9"] = "book_birch_wood_gather_9",
        ["Book Bleed Resist 1"] = "book_bleed_resist_1",
        ["Book Bleed Resist 10"] = "book_bleed_resist_10",
        ["Book Bleed Resist 11"] = "book_bleed_resist_11",
        ["Book Bleed Resist 12"] = "book_bleed_resist_12",
        ["Book Bleed Resist 13"] = "book_bleed_resist_13",
        ["Book Bleed Resist 14"] = "book_bleed_resist_14",
        ["Book Bleed Resist 15"] = "book_bleed_resist_15",
        ["Book Bleed Resist 2"] = "book_bleed_resist_2",
        ["Book Bleed Resist 3"] = "book_bleed_resist_3",
        ["Book Bleed Resist 4"] = "book_bleed_resist_4",
        ["Book Bleed Resist 5"] = "book_bleed_resist_5",
        ["Book Bleed Resist 6"] = "book_bleed_resist_6",
        ["Book Bleed Resist 7"] = "book_bleed_resist_7",
        ["Book Bleed Resist 8"] = "book_bleed_resist_8",
        ["Book Bleed Resist 9"] = "book_bleed_resist_9",
        ["Book Blight Resist 1"] = "book_blight_resist_1",
        ["Book Blight Resist 10"] = "book_blight_resist_10",
        ["Book Blight Resist 11"] = "book_blight_resist_11",
        ["Book Blight Resist 12"] = "book_blight_resist_12",
        ["Book Blight Resist 13"] = "book_blight_resist_13",
        ["Book Blight Resist 14"] = "book_blight_resist_14",
        ["Book Blight Resist 15"] = "book_blight_resist_15",
        ["Book Blight Resist 2"] = "book_blight_resist_2",
        ["Book Blight Resist 3"] = "book_blight_resist_3",
        ["Book Blight Resist 4"] = "book_blight_resist_4",
        ["Book Blight Resist 5"] = "book_blight_resist_5",
        ["Book Blight Resist 6"] = "book_blight_resist_6",
        ["Book Blight Resist 7"] = "book_blight_resist_7",
        ["Book Blight Resist 8"] = "book_blight_resist_8",
        ["Book Blight Resist 9"] = "book_blight_resist_9",
        ["Book Block Master 1"] = "book_block_master_1",
        ["Book Block Master 10"] = "book_block_master_10",
        ["Book Block Master 11"] = "book_block_master_11",
        ["Book Block Master 12"] = "book_block_master_12",
        ["Book Block Master 13"] = "book_block_master_13",
        ["Book Block Master 14"] = "book_block_master_14",
        ["Book Block Master 15"] = "book_block_master_15",
        ["Book Block Master 2"] = "book_block_master_2",
        ["Book Block Master 3"] = "book_block_master_3",
        ["Book Block Master 4"] = "book_block_master_4",
        ["Book Block Master 5"] = "book_block_master_5",
        ["Book Block Master 6"] = "book_block_master_6",
        ["Book Block Master 7"] = "book_block_master_7",
        ["Book Block Master 8"] = "book_block_master_8",
        ["Book Block Master 9"] = "book_block_master_9",
        ["Book Castle Ghost Evade 1"] = "book_castle_ghost_evade_1",
        ["Book Castle Ghost Evade 10"] = "book_castle_ghost_evade_10",
        ["Book Castle Ghost Evade 2"] = "book_castle_ghost_evade_2",
        ["Book Castle Ghost Evade 3"] = "book_castle_ghost_evade_3",
        ["Book Castle Ghost Evade 4"] = "book_castle_ghost_evade_4",
        ["Book Castle Ghost Evade 5"] = "book_castle_ghost_evade_5",
        ["Book Castle Ghost Evade 6"] = "book_castle_ghost_evade_6",
        ["Book Castle Ghost Evade 7"] = "book_castle_ghost_evade_7",
        ["Book Castle Ghost Evade 8"] = "book_castle_ghost_evade_8",
        ["Book Castle Ghost Evade 9"] = "book_castle_ghost_evade_9",
        ["Book Claymore Damage 1"] = "book_claymore_damage_1",
        ["Book Claymore Damage 10"] = "book_claymore_damage_10",
        ["Book Claymore Damage 11"] = "book_claymore_damage_11",
        ["Book Claymore Damage 12"] = "book_claymore_damage_12",
        ["Book Claymore Damage 13"] = "book_claymore_damage_13",
        ["Book Claymore Damage 14"] = "book_claymore_damage_14",
        ["Book Claymore Damage 15"] = "book_claymore_damage_15",
        ["Book Claymore Damage 2"] = "book_claymore_damage_2",
        ["Book Claymore Damage 3"] = "book_claymore_damage_3",
        ["Book Claymore Damage 4"] = "book_claymore_damage_4",
        ["Book Claymore Damage 5"] = "book_claymore_damage_5",
        ["Book Claymore Damage 6"] = "book_claymore_damage_6",
        ["Book Claymore Damage 7"] = "book_claymore_damage_7",
        ["Book Claymore Damage 8"] = "book_claymore_damage_8",
        ["Book Claymore Damage 9"] = "book_claymore_damage_9",
        ["Book Copper Ore Gather 1"] = "book_copper_ore_gather_1",
        ["Book Copper Ore Gather 10"] = "book_copper_ore_gather_10",
        ["Book Copper Ore Gather 2"] = "book_copper_ore_gather_2",
        ["Book Copper Ore Gather 3"] = "book_copper_ore_gather_3",
        ["Book Copper Ore Gather 4"] = "book_copper_ore_gather_4",
        ["Book Copper Ore Gather 5"] = "book_copper_ore_gather_5",
        ["Book Copper Ore Gather 6"] = "book_copper_ore_gather_6",
        ["Book Copper Ore Gather 7"] = "book_copper_ore_gather_7",
        ["Book Copper Ore Gather 8"] = "book_copper_ore_gather_8",
        ["Book Copper Ore Gather 9"] = "book_copper_ore_gather_9",
        ["Book Crossbow Reload Speed 1"] = "book_crossbow_reload_speed_1",
        ["Book Crossbow Reload Speed 10"] = "book_crossbow_reload_speed_10",
        ["Book Crossbow Reload Speed 2"] = "book_crossbow_reload_speed_2",
        ["Book Crossbow Reload Speed 3"] = "book_crossbow_reload_speed_3",
        ["Book Crossbow Reload Speed 4"] = "book_crossbow_reload_speed_4",
        ["Book Crossbow Reload Speed 5"] = "book_crossbow_reload_speed_5",
        ["Book Crossbow Reload Speed 6"] = "book_crossbow_reload_speed_6",
        ["Book Crossbow Reload Speed 7"] = "book_crossbow_reload_speed_7",
        ["Book Crossbow Reload Speed 8"] = "book_crossbow_reload_speed_8",
        ["Book Crossbow Reload Speed 9"] = "book_crossbow_reload_speed_9",
        ["Book Cruel Torturer Dung Evade 1"] = "book_cruel_torturer_dung_evade_1",
        ["Book Cruel Torturer Dung Evade 10"] = "book_cruel_torturer_dung_evade_10",
        ["Book Cruel Torturer Dung Evade 2"] = "book_cruel_torturer_dung_evade_2",
        ["Book Cruel Torturer Dung Evade 3"] = "book_cruel_torturer_dung_evade_3",
        ["Book Cruel Torturer Dung Evade 4"] = "book_cruel_torturer_dung_evade_4",
        ["Book Cruel Torturer Dung Evade 5"] = "book_cruel_torturer_dung_evade_5",
        ["Book Cruel Torturer Dung Evade 6"] = "book_cruel_torturer_dung_evade_6",
        ["Book Cruel Torturer Dung Evade 7"] = "book_cruel_torturer_dung_evade_7",
        ["Book Cruel Torturer Dung Evade 8"] = "book_cruel_torturer_dung_evade_8",
        ["Book Cruel Torturer Dung Evade 9"] = "book_cruel_torturer_dung_evade_9",
        ["Book Cudgel Damage 1"] = "book_cudgel_damage_1",
        ["Book Cudgel Damage 2"] = "book_cudgel_damage_2",
        ["Book Cudgel Damage 3"] = "book_cudgel_damage_3",
        ["Book Curse 1"] = "book_curse_1",
        ["Book Curse 10"] = "book_curse_10",
        ["Book Curse 11"] = "book_curse_11",
        ["Book Curse 12"] = "book_curse_12",
        ["Book Curse 13"] = "book_curse_13",
        ["Book Curse 14"] = "book_curse_14",
        ["Book Curse 15"] = "book_curse_15",
        ["Book Curse 2"] = "book_curse_2",
        ["Book Curse 3"] = "book_curse_3",
        ["Book Curse 4"] = "book_curse_4",
        ["Book Curse 5"] = "book_curse_5",
        ["Book Curse 6"] = "book_curse_6",
        ["Book Curse 7"] = "book_curse_7",
        ["Book Curse 8"] = "book_curse_8",
        ["Book Curse 9"] = "book_curse_9",
        ["Book Cursed Dung1 Evade 1"] = "book_cursed_dung1_evade_1",
        ["Book Cursed Dung1 Evade 10"] = "book_cursed_dung1_evade_10",
        ["Book Cursed Dung1 Evade 2"] = "book_cursed_dung1_evade_2",
        ["Book Cursed Dung1 Evade 3"] = "book_cursed_dung1_evade_3",
        ["Book Cursed Dung1 Evade 4"] = "book_cursed_dung1_evade_4",
        ["Book Cursed Dung1 Evade 5"] = "book_cursed_dung1_evade_5",
        ["Book Cursed Dung1 Evade 6"] = "book_cursed_dung1_evade_6",
        ["Book Cursed Dung1 Evade 7"] = "book_cursed_dung1_evade_7",
        ["Book Cursed Dung1 Evade 8"] = "book_cursed_dung1_evade_8",
        ["Book Cursed Dung1 Evade 9"] = "book_cursed_dung1_evade_9",
        ["Book Cursed Evade 1"] = "book_cursed_evade_1",
        ["Book Cursed Evade 10"] = "book_cursed_evade_10",
        ["Book Cursed Evade 2"] = "book_cursed_evade_2",
        ["Book Cursed Evade 3"] = "book_cursed_evade_3",
        ["Book Cursed Evade 4"] = "book_cursed_evade_4",
        ["Book Cursed Evade 5"] = "book_cursed_evade_5",
        ["Book Cursed Evade 6"] = "book_cursed_evade_6",
        ["Book Cursed Evade 7"] = "book_cursed_evade_7",
        ["Book Cursed Evade 8"] = "book_cursed_evade_8",
        ["Book Cursed Evade 9"] = "book_cursed_evade_9",
        ["Book Cursed Lady Shaman Evade 1"] = "book_cursed_lady_shaman_evade_1",
        ["Book Cursed Lady Shaman Evade 10"] = "book_cursed_lady_shaman_evade_10",
        ["Book Cursed Lady Shaman Evade 2"] = "book_cursed_lady_shaman_evade_2",
        ["Book Cursed Lady Shaman Evade 3"] = "book_cursed_lady_shaman_evade_3",
        ["Book Cursed Lady Shaman Evade 4"] = "book_cursed_lady_shaman_evade_4",
        ["Book Cursed Lady Shaman Evade 5"] = "book_cursed_lady_shaman_evade_5",
        ["Book Cursed Lady Shaman Evade 6"] = "book_cursed_lady_shaman_evade_6",
        ["Book Cursed Lady Shaman Evade 7"] = "book_cursed_lady_shaman_evade_7",
        ["Book Cursed Lady Shaman Evade 8"] = "book_cursed_lady_shaman_evade_8",
        ["Book Cursed Lady Shaman Evade 9"] = "book_cursed_lady_shaman_evade_9",
        ["Book Cursed Martyr Evade 1"] = "book_cursed_martyr_evade_1",
        ["Book Cursed Martyr Evade 10"] = "book_cursed_martyr_evade_10",
        ["Book Cursed Martyr Evade 2"] = "book_cursed_martyr_evade_2",
        ["Book Cursed Martyr Evade 3"] = "book_cursed_martyr_evade_3",
        ["Book Cursed Martyr Evade 4"] = "book_cursed_martyr_evade_4",
        ["Book Cursed Martyr Evade 5"] = "book_cursed_martyr_evade_5",
        ["Book Cursed Martyr Evade 6"] = "book_cursed_martyr_evade_6",
        ["Book Cursed Martyr Evade 7"] = "book_cursed_martyr_evade_7",
        ["Book Cursed Martyr Evade 8"] = "book_cursed_martyr_evade_8",
        ["Book Cursed Martyr Evade 9"] = "book_cursed_martyr_evade_9",
        ["Book Dagger Damage 1"] = "book_dagger_damage_1",
        ["Book Dagger Damage 2"] = "book_dagger_damage_2",
        ["Book Dagger Damage 3"] = "book_dagger_damage_3",
        ["Book Dagger Damage 4"] = "book_dagger_damage_4",
        ["Book Dagger Damage 5"] = "book_dagger_damage_5",
        ["Book Damage Around 1"] = "book_damage_around_1",
        ["Book Damage Around 10"] = "book_damage_around_10",
        ["Book Damage Around 11"] = "book_damage_around_11",
        ["Book Damage Around 12"] = "book_damage_around_12",
        ["Book Damage Around 13"] = "book_damage_around_13",
        ["Book Damage Around 14"] = "book_damage_around_14",
        ["Book Damage Around 15"] = "book_damage_around_15",
        ["Book Damage Around 2"] = "book_damage_around_2",
        ["Book Damage Around 3"] = "book_damage_around_3",
        ["Book Damage Around 4"] = "book_damage_around_4",
        ["Book Damage Around 5"] = "book_damage_around_5",
        ["Book Damage Around 6"] = "book_damage_around_6",
        ["Book Damage Around 7"] = "book_damage_around_7",
        ["Book Damage Around 8"] = "book_damage_around_8",
        ["Book Damage Around 9"] = "book_damage_around_9",
        ["Book Damage Reflection 1"] = "book_damage_reflection_1",
        ["Book Damage Reflection 10"] = "book_damage_reflection_10",
        ["Book Damage Reflection 11"] = "book_damage_reflection_11",
        ["Book Damage Reflection 12"] = "book_damage_reflection_12",
        ["Book Damage Reflection 13"] = "book_damage_reflection_13",
        ["Book Damage Reflection 14"] = "book_damage_reflection_14",
        ["Book Damage Reflection 15"] = "book_damage_reflection_15",
        ["Book Damage Reflection 2"] = "book_damage_reflection_2",
        ["Book Damage Reflection 3"] = "book_damage_reflection_3",
        ["Book Damage Reflection 4"] = "book_damage_reflection_4",
        ["Book Damage Reflection 5"] = "book_damage_reflection_5",
        ["Book Damage Reflection 6"] = "book_damage_reflection_6",
        ["Book Damage Reflection 7"] = "book_damage_reflection_7",
        ["Book Damage Reflection 8"] = "book_damage_reflection_8",
        ["Book Damage Reflection 9"] = "book_damage_reflection_9",
        ["Book Direwolf Evade 1"] = "book_direwolf_evade_1",
        ["Book Direwolf Evade 10"] = "book_direwolf_evade_10",
        ["Book Direwolf Evade 2"] = "book_direwolf_evade_2",
        ["Book Direwolf Evade 3"] = "book_direwolf_evade_3",
        ["Book Direwolf Evade 4"] = "book_direwolf_evade_4",
        ["Book Direwolf Evade 5"] = "book_direwolf_evade_5",
        ["Book Direwolf Evade 6"] = "book_direwolf_evade_6",
        ["Book Direwolf Evade 7"] = "book_direwolf_evade_7",
        ["Book Direwolf Evade 8"] = "book_direwolf_evade_8",
        ["Book Direwolf Evade 9"] = "book_direwolf_evade_9",
        ["Book Energy Boost 1"] = "book_energy_boost_1",
        ["Book Energy Boost 10"] = "book_energy_boost_10",
        ["Book Energy Boost 11"] = "book_energy_boost_11",
        ["Book Energy Boost 12"] = "book_energy_boost_12",
        ["Book Energy Boost 13"] = "book_energy_boost_13",
        ["Book Energy Boost 14"] = "book_energy_boost_14",
        ["Book Energy Boost 15"] = "book_energy_boost_15",
        ["Book Energy Boost 2"] = "book_energy_boost_2",
        ["Book Energy Boost 3"] = "book_energy_boost_3",
        ["Book Energy Boost 4"] = "book_energy_boost_4",
        ["Book Energy Boost 5"] = "book_energy_boost_5",
        ["Book Energy Boost 6"] = "book_energy_boost_6",
        ["Book Energy Boost 7"] = "book_energy_boost_7",
        ["Book Energy Boost 8"] = "book_energy_boost_8",
        ["Book Energy Boost 9"] = "book_energy_boost_9",
        ["Book Espadon Damage 1"] = "book_espadon_damage_1",
        ["Book Espadon Damage 10"] = "book_espadon_damage_10",
        ["Book Espadon Damage 11"] = "book_espadon_damage_11",
        ["Book Espadon Damage 12"] = "book_espadon_damage_12",
        ["Book Espadon Damage 13"] = "book_espadon_damage_13",
        ["Book Espadon Damage 14"] = "book_espadon_damage_14",
        ["Book Espadon Damage 15"] = "book_espadon_damage_15",
        ["Book Espadon Damage 2"] = "book_espadon_damage_2",
        ["Book Espadon Damage 3"] = "book_espadon_damage_3",
        ["Book Espadon Damage 4"] = "book_espadon_damage_4",
        ["Book Espadon Damage 5"] = "book_espadon_damage_5",
        ["Book Espadon Damage 6"] = "book_espadon_damage_6",
        ["Book Espadon Damage 7"] = "book_espadon_damage_7",
        ["Book Espadon Damage 8"] = "book_espadon_damage_8",
        ["Book Espadon Damage 9"] = "book_espadon_damage_9",
        ["Book Fabric Heal 1"] = "book_fabric_heal_1",
        ["Book Fabric Heal 10"] = "book_fabric_heal_10",
        ["Book Fabric Heal 2"] = "book_fabric_heal_2",
        ["Book Fabric Heal 3"] = "book_fabric_heal_3",
        ["Book Fabric Heal 4"] = "book_fabric_heal_4",
        ["Book Fabric Heal 5"] = "book_fabric_heal_5",
        ["Book Fabric Heal 6"] = "book_fabric_heal_6",
        ["Book Fabric Heal 7"] = "book_fabric_heal_7",
        ["Book Fabric Heal 8"] = "book_fabric_heal_8",
        ["Book Fabric Heal 9"] = "book_fabric_heal_9",
        ["Book Falchion Damage 1"] = "book_falchion_damage_1",
        ["Book Falchion Damage 2"] = "book_falchion_damage_2",
        ["Book Falchion Damage 3"] = "book_falchion_damage_3",
        ["Book Falchion Damage 4"] = "book_falchion_damage_4",
        ["Book Falchion Damage 5"] = "book_falchion_damage_5",
        ["Book Falchion Damage 6"] = "book_falchion_damage_6",
        ["Book Falchion Damage 7"] = "book_falchion_damage_7",
        ["Book Falchion Damage 8"] = "book_falchion_damage_8",
        ["Book Falchion Damage 9"] = "book_falchion_damage_9",
        ["Book Fearlessness 1"] = "book_fearlessness_1",
        ["Book Fearlessness 10"] = "book_fearlessness_10",
        ["Book Fearlessness 2"] = "book_fearlessness_2",
        ["Book Fearlessness 3"] = "book_fearlessness_3",
        ["Book Fearlessness 4"] = "book_fearlessness_4",
        ["Book Fearlessness 5"] = "book_fearlessness_5",
        ["Book Fearlessness 6"] = "book_fearlessness_6",
        ["Book Fearlessness 7"] = "book_fearlessness_7",
        ["Book Fearlessness 8"] = "book_fearlessness_8",
        ["Book Fearlessness 9"] = "book_fearlessness_9",
        ["Book Fiber Gather 1"] = "book_fiber_gather_1",
        ["Book Fiber Gather 10"] = "book_fiber_gather_10",
        ["Book Fiber Gather 2"] = "book_fiber_gather_2",
        ["Book Fiber Gather 3"] = "book_fiber_gather_3",
        ["Book Fiber Gather 4"] = "book_fiber_gather_4",
        ["Book Fiber Gather 5"] = "book_fiber_gather_5",
        ["Book Fiber Gather 6"] = "book_fiber_gather_6",
        ["Book Fiber Gather 7"] = "book_fiber_gather_7",
        ["Book Fiber Gather 8"] = "book_fiber_gather_8",
        ["Book Fiber Gather 9"] = "book_fiber_gather_9",
        ["Book Fire Resist 1"] = "book_fire_resist_1",
        ["Book Fire Resist 10"] = "book_fire_resist_10",
        ["Book Fire Resist 11"] = "book_fire_resist_11",
        ["Book Fire Resist 12"] = "book_fire_resist_12",
        ["Book Fire Resist 13"] = "book_fire_resist_13",
        ["Book Fire Resist 14"] = "book_fire_resist_14",
        ["Book Fire Resist 15"] = "book_fire_resist_15",
        ["Book Fire Resist 2"] = "book_fire_resist_2",
        ["Book Fire Resist 3"] = "book_fire_resist_3",
        ["Book Fire Resist 4"] = "book_fire_resist_4",
        ["Book Fire Resist 5"] = "book_fire_resist_5",
        ["Book Fire Resist 6"] = "book_fire_resist_6",
        ["Book Fire Resist 7"] = "book_fire_resist_7",
        ["Book Fire Resist 8"] = "book_fire_resist_8",
        ["Book Fire Resist 9"] = "book_fire_resist_9",
        ["Book Fire Spawn Dung Evade 1"] = "book_fire_spawn_dung_evade_1",
        ["Book Fire Spawn Dung Evade 10"] = "book_fire_spawn_dung_evade_10",
        ["Book Fire Spawn Dung Evade 2"] = "book_fire_spawn_dung_evade_2",
        ["Book Fire Spawn Dung Evade 3"] = "book_fire_spawn_dung_evade_3",
        ["Book Fire Spawn Dung Evade 4"] = "book_fire_spawn_dung_evade_4",
        ["Book Fire Spawn Dung Evade 5"] = "book_fire_spawn_dung_evade_5",
        ["Book Fire Spawn Dung Evade 6"] = "book_fire_spawn_dung_evade_6",
        ["Book Fire Spawn Dung Evade 7"] = "book_fire_spawn_dung_evade_7",
        ["Book Fire Spawn Dung Evade 8"] = "book_fire_spawn_dung_evade_8",
        ["Book Fire Spawn Dung Evade 9"] = "book_fire_spawn_dung_evade_9",
        ["Book Fists Damage 1"] = "book_fists_damage_1",
        ["Book Fists Damage 2"] = "book_fists_damage_2",
        ["Book Freeze Around 1"] = "book_freeze_around_1",
        ["Book Freeze Around 10"] = "book_freeze_around_10",
        ["Book Freeze Around 11"] = "book_freeze_around_11",
        ["Book Freeze Around 12"] = "book_freeze_around_12",
        ["Book Freeze Around 13"] = "book_freeze_around_13",
        ["Book Freeze Around 14"] = "book_freeze_around_14",
        ["Book Freeze Around 15"] = "book_freeze_around_15",
        ["Book Freeze Around 2"] = "book_freeze_around_2",
        ["Book Freeze Around 3"] = "book_freeze_around_3",
        ["Book Freeze Around 4"] = "book_freeze_around_4",
        ["Book Freeze Around 5"] = "book_freeze_around_5",
        ["Book Freeze Around 6"] = "book_freeze_around_6",
        ["Book Freeze Around 7"] = "book_freeze_around_7",
        ["Book Freeze Around 8"] = "book_freeze_around_8",
        ["Book Freeze Around 9"] = "book_freeze_around_9",
        ["Book Freeze Resist 1"] = "book_freeze_resist_1",
        ["Book Freeze Resist 10"] = "book_freeze_resist_10",
        ["Book Freeze Resist 11"] = "book_freeze_resist_11",
        ["Book Freeze Resist 12"] = "book_freeze_resist_12",
        ["Book Freeze Resist 13"] = "book_freeze_resist_13",
        ["Book Freeze Resist 14"] = "book_freeze_resist_14",
        ["Book Freeze Resist 15"] = "book_freeze_resist_15",
        ["Book Freeze Resist 2"] = "book_freeze_resist_2",
        ["Book Freeze Resist 3"] = "book_freeze_resist_3",
        ["Book Freeze Resist 4"] = "book_freeze_resist_4",
        ["Book Freeze Resist 5"] = "book_freeze_resist_5",
        ["Book Freeze Resist 6"] = "book_freeze_resist_6",
        ["Book Freeze Resist 7"] = "book_freeze_resist_7",
        ["Book Freeze Resist 8"] = "book_freeze_resist_8",
        ["Book Freeze Resist 9"] = "book_freeze_resist_9",
        ["Book Halberd Damage 1"] = "book_halberd_damage_1",
        ["Book Halberd Damage 10"] = "book_halberd_damage_10",
        ["Book Halberd Damage 11"] = "book_halberd_damage_11",
        ["Book Halberd Damage 12"] = "book_halberd_damage_12",
        ["Book Halberd Damage 13"] = "book_halberd_damage_13",
        ["Book Halberd Damage 14"] = "book_halberd_damage_14",
        ["Book Halberd Damage 15"] = "book_halberd_damage_15",
        ["Book Halberd Damage 2"] = "book_halberd_damage_2",
        ["Book Halberd Damage 3"] = "book_halberd_damage_3",
        ["Book Halberd Damage 4"] = "book_halberd_damage_4",
        ["Book Halberd Damage 5"] = "book_halberd_damage_5",
        ["Book Halberd Damage 6"] = "book_halberd_damage_6",
        ["Book Halberd Damage 7"] = "book_halberd_damage_7",
        ["Book Halberd Damage 8"] = "book_halberd_damage_8",
        ["Book Halberd Damage 9"] = "book_halberd_damage_9",
        ["Book Halt Shard Evade 1"] = "book_halt_shard_evade_1",
        ["Book Halt Shard Evade 10"] = "book_halt_shard_evade_10",
        ["Book Halt Shard Evade 2"] = "book_halt_shard_evade_2",
        ["Book Halt Shard Evade 3"] = "book_halt_shard_evade_3",
        ["Book Halt Shard Evade 4"] = "book_halt_shard_evade_4",
        ["Book Halt Shard Evade 5"] = "book_halt_shard_evade_5",
        ["Book Halt Shard Evade 6"] = "book_halt_shard_evade_6",
        ["Book Halt Shard Evade 7"] = "book_halt_shard_evade_7",
        ["Book Halt Shard Evade 8"] = "book_halt_shard_evade_8",
        ["Book Halt Shard Evade 9"] = "book_halt_shard_evade_9",
        ["Book Hammer Damage 1"] = "book_hammer_damage_1",
        ["Book Hammer Damage 2"] = "book_hammer_damage_2",
        ["Book Hammer Damage 3"] = "book_hammer_damage_3",
        ["Book Hammer Damage 4"] = "book_hammer_damage_4",
        ["Book Hammer Damage 5"] = "book_hammer_damage_5",
        ["Book Hangman Dung Evade 1"] = "book_hangman_dung_evade_1",
        ["Book Hangman Dung Evade 10"] = "book_hangman_dung_evade_10",
        ["Book Hangman Dung Evade 2"] = "book_hangman_dung_evade_2",
        ["Book Hangman Dung Evade 3"] = "book_hangman_dung_evade_3",
        ["Book Hangman Dung Evade 4"] = "book_hangman_dung_evade_4",
        ["Book Hangman Dung Evade 5"] = "book_hangman_dung_evade_5",
        ["Book Hangman Dung Evade 6"] = "book_hangman_dung_evade_6",
        ["Book Hangman Dung Evade 7"] = "book_hangman_dung_evade_7",
        ["Book Hangman Dung Evade 8"] = "book_hangman_dung_evade_8",
        ["Book Hangman Dung Evade 9"] = "book_hangman_dung_evade_9",
        ["Book Hangman Punisher Dung Evade 1"] = "book_hangman_punisher_dung_evade_1",
        ["Book Hangman Punisher Dung Evade 10"] = "book_hangman_punisher_dung_evade_10",
        ["Book Hangman Punisher Dung Evade 2"] = "book_hangman_punisher_dung_evade_2",
        ["Book Hangman Punisher Dung Evade 3"] = "book_hangman_punisher_dung_evade_3",
        ["Book Hangman Punisher Dung Evade 4"] = "book_hangman_punisher_dung_evade_4",
        ["Book Hangman Punisher Dung Evade 5"] = "book_hangman_punisher_dung_evade_5",
        ["Book Hangman Punisher Dung Evade 6"] = "book_hangman_punisher_dung_evade_6",
        ["Book Hangman Punisher Dung Evade 7"] = "book_hangman_punisher_dung_evade_7",
        ["Book Hangman Punisher Dung Evade 8"] = "book_hangman_punisher_dung_evade_8",
        ["Book Hangman Punisher Dung Evade 9"] = "book_hangman_punisher_dung_evade_9",
        ["Book Harid Priest Evade 1"] = "book_harid_priest_evade_1",
        ["Book Harid Priest Evade 10"] = "book_harid_priest_evade_10",
        ["Book Harid Priest Evade 2"] = "book_harid_priest_evade_2",
        ["Book Harid Priest Evade 3"] = "book_harid_priest_evade_3",
        ["Book Harid Priest Evade 4"] = "book_harid_priest_evade_4",
        ["Book Harid Priest Evade 5"] = "book_harid_priest_evade_5",
        ["Book Harid Priest Evade 6"] = "book_harid_priest_evade_6",
        ["Book Harid Priest Evade 7"] = "book_harid_priest_evade_7",
        ["Book Harid Priest Evade 8"] = "book_harid_priest_evade_8",
        ["Book Harid Priest Evade 9"] = "book_harid_priest_evade_9",
        ["Book Hoe Damage 1"] = "book_hoe_damage_1",
        ["Book Hoe Damage 2"] = "book_hoe_damage_2",
        ["Book Hoe Damage 3"] = "book_hoe_damage_3",
        ["Book Hp Restore 1"] = "book_hp_restore_1",
        ["Book Hp Restore 10"] = "book_hp_restore_10",
        ["Book Hp Restore 2"] = "book_hp_restore_2",
        ["Book Hp Restore 3"] = "book_hp_restore_3",
        ["Book Hp Restore 4"] = "book_hp_restore_4",
        ["Book Hp Restore 5"] = "book_hp_restore_5",
        ["Book Hp Restore 6"] = "book_hp_restore_6",
        ["Book Hp Restore 7"] = "book_hp_restore_7",
        ["Book Hp Restore 8"] = "book_hp_restore_8",
        ["Book Hp Restore 9"] = "book_hp_restore_9",
        ["Book Iron Ore Gather 1"] = "book_iron_ore_gather_1",
        ["Book Iron Ore Gather 10"] = "book_iron_ore_gather_10",
        ["Book Iron Ore Gather 2"] = "book_iron_ore_gather_2",
        ["Book Iron Ore Gather 3"] = "book_iron_ore_gather_3",
        ["Book Iron Ore Gather 4"] = "book_iron_ore_gather_4",
        ["Book Iron Ore Gather 5"] = "book_iron_ore_gather_5",
        ["Book Iron Ore Gather 6"] = "book_iron_ore_gather_6",
        ["Book Iron Ore Gather 7"] = "book_iron_ore_gather_7",
        ["Book Iron Ore Gather 8"] = "book_iron_ore_gather_8",
        ["Book Iron Ore Gather 9"] = "book_iron_ore_gather_9",
        ["Book Knight Dung1 Evade 1"] = "book_knight_dung1_evade_1",
        ["Book Knight Dung1 Evade 10"] = "book_knight_dung1_evade_10",
        ["Book Knight Dung1 Evade 2"] = "book_knight_dung1_evade_2",
        ["Book Knight Dung1 Evade 3"] = "book_knight_dung1_evade_3",
        ["Book Knight Dung1 Evade 4"] = "book_knight_dung1_evade_4",
        ["Book Knight Dung1 Evade 5"] = "book_knight_dung1_evade_5",
        ["Book Knight Dung1 Evade 6"] = "book_knight_dung1_evade_6",
        ["Book Knight Dung1 Evade 7"] = "book_knight_dung1_evade_7",
        ["Book Knight Dung1 Evade 8"] = "book_knight_dung1_evade_8",
        ["Book Knight Dung1 Evade 9"] = "book_knight_dung1_evade_9",
        ["Book Knight Evade 1"] = "book_knight_evade_1",
        ["Book Knight Evade 10"] = "book_knight_evade_10",
        ["Book Knight Evade 2"] = "book_knight_evade_2",
        ["Book Knight Evade 3"] = "book_knight_evade_3",
        ["Book Knight Evade 4"] = "book_knight_evade_4",
        ["Book Knight Evade 5"] = "book_knight_evade_5",
        ["Book Knight Evade 6"] = "book_knight_evade_6",
        ["Book Knight Evade 7"] = "book_knight_evade_7",
        ["Book Knight Evade 8"] = "book_knight_evade_8",
        ["Book Knight Evade 9"] = "book_knight_evade_9",
        ["Book Knight Warrior Evade 1"] = "book_knight_warrior_evade_1",
        ["Book Knight Warrior Evade 10"] = "book_knight_warrior_evade_10",
        ["Book Knight Warrior Evade 2"] = "book_knight_warrior_evade_2",
        ["Book Knight Warrior Evade 3"] = "book_knight_warrior_evade_3",
        ["Book Knight Warrior Evade 4"] = "book_knight_warrior_evade_4",
        ["Book Knight Warrior Evade 5"] = "book_knight_warrior_evade_5",
        ["Book Knight Warrior Evade 6"] = "book_knight_warrior_evade_6",
        ["Book Knight Warrior Evade 7"] = "book_knight_warrior_evade_7",
        ["Book Knight Warrior Evade 8"] = "book_knight_warrior_evade_8",
        ["Book Knight Warrior Evade 9"] = "book_knight_warrior_evade_9",
        ["Book Kriegsmesser Damage 1"] = "book_kriegsmesser_damage_1",
        ["Book Kriegsmesser Damage 10"] = "book_kriegsmesser_damage_10",
        ["Book Kriegsmesser Damage 11"] = "book_kriegsmesser_damage_11",
        ["Book Kriegsmesser Damage 12"] = "book_kriegsmesser_damage_12",
        ["Book Kriegsmesser Damage 13"] = "book_kriegsmesser_damage_13",
        ["Book Kriegsmesser Damage 14"] = "book_kriegsmesser_damage_14",
        ["Book Kriegsmesser Damage 15"] = "book_kriegsmesser_damage_15",
        ["Book Kriegsmesser Damage 2"] = "book_kriegsmesser_damage_2",
        ["Book Kriegsmesser Damage 3"] = "book_kriegsmesser_damage_3",
        ["Book Kriegsmesser Damage 4"] = "book_kriegsmesser_damage_4",
        ["Book Kriegsmesser Damage 5"] = "book_kriegsmesser_damage_5",
        ["Book Kriegsmesser Damage 6"] = "book_kriegsmesser_damage_6",
        ["Book Kriegsmesser Damage 7"] = "book_kriegsmesser_damage_7",
        ["Book Kriegsmesser Damage 8"] = "book_kriegsmesser_damage_8",
        ["Book Kriegsmesser Damage 9"] = "book_kriegsmesser_damage_9",
        ["Book Leek Roasted Heal 1"] = "book_leek_roasted_heal_1",
        ["Book Leek Roasted Heal 10"] = "book_leek_roasted_heal_10",
        ["Book Leek Roasted Heal 2"] = "book_leek_roasted_heal_2",
        ["Book Leek Roasted Heal 3"] = "book_leek_roasted_heal_3",
        ["Book Leek Roasted Heal 4"] = "book_leek_roasted_heal_4",
        ["Book Leek Roasted Heal 5"] = "book_leek_roasted_heal_5",
        ["Book Leek Roasted Heal 6"] = "book_leek_roasted_heal_6",
        ["Book Leek Roasted Heal 7"] = "book_leek_roasted_heal_7",
        ["Book Leek Roasted Heal 8"] = "book_leek_roasted_heal_8",
        ["Book Leek Roasted Heal 9"] = "book_leek_roasted_heal_9",
        ["Book ZOMBIE Evade 1"] = "book_leper_evade_1",
        ["Book ZOMBIE Evade 10"] = "book_leper_evade_10",
        ["Book ZOMBIE Evade 2"] = "book_leper_evade_2",
        ["Book ZOMBIE Evade 3"] = "book_leper_evade_3",
        ["Book ZOMBIE Evade 4"] = "book_leper_evade_4",
        ["Book ZOMBIE Evade 5"] = "book_leper_evade_5",
        ["Book ZOMBIE Evade 6"] = "book_leper_evade_6",
        ["Book ZOMBIE Evade 7"] = "book_leper_evade_7",
        ["Book ZOMBIE Evade 8"] = "book_leper_evade_8",
        ["Book ZOMBIE Evade 9"] = "book_leper_evade_9",
        ["Book ZOMBIE Poison Evade 1"] = "book_leper_poison_evade_1",
        ["Book ZOMBIE Poison Evade 10"] = "book_leper_poison_evade_10",
        ["Book ZOMBIE Poison Evade 2"] = "book_leper_poison_evade_2",
        ["Book ZOMBIE Poison Evade 3"] = "book_leper_poison_evade_3",
        ["Book ZOMBIE Poison Evade 4"] = "book_leper_poison_evade_4",
        ["Book ZOMBIE Poison Evade 5"] = "book_leper_poison_evade_5",
        ["Book ZOMBIE Poison Evade 6"] = "book_leper_poison_evade_6",
        ["Book ZOMBIE Poison Evade 7"] = "book_leper_poison_evade_7",
        ["Book ZOMBIE Poison Evade 8"] = "book_leper_poison_evade_8",
        ["Book ZOMBIE Poison Evade 9"] = "book_leper_poison_evade_9",
        ["Book ZOMBIE Soldier Evade 1"] = "book_leper_soldier_evade_1",
        ["Book ZOMBIE Soldier Evade 10"] = "book_leper_soldier_evade_10",
        ["Book ZOMBIE Soldier Evade 2"] = "book_leper_soldier_evade_2",
        ["Book ZOMBIE Soldier Evade 3"] = "book_leper_soldier_evade_3",
        ["Book ZOMBIE Soldier Evade 4"] = "book_leper_soldier_evade_4",
        ["Book ZOMBIE Soldier Evade 5"] = "book_leper_soldier_evade_5",
        ["Book ZOMBIE Soldier Evade 6"] = "book_leper_soldier_evade_6",
        ["Book ZOMBIE Soldier Evade 7"] = "book_leper_soldier_evade_7",
        ["Book ZOMBIE Soldier Evade 8"] = "book_leper_soldier_evade_8",
        ["Book ZOMBIE Soldier Evade 9"] = "book_leper_soldier_evade_9",
        ["Book Look Around 1"] = "book_look_around_1",
        ["Book Look Around 10"] = "book_look_around_10",
        ["Book Look Around 2"] = "book_look_around_2",
        ["Book Look Around 3"] = "book_look_around_3",
        ["Book Look Around 4"] = "book_look_around_4",
        ["Book Look Around 5"] = "book_look_around_5",
        ["Book Look Around 6"] = "book_look_around_6",
        ["Book Look Around 7"] = "book_look_around_7",
        ["Book Look Around 8"] = "book_look_around_8",
        ["Book Look Around 9"] = "book_look_around_9",
        ["Book Mace Damage 1"] = "book_mace_damage_1",
        ["Book Mace Damage 2"] = "book_mace_damage_2",
        ["Book Mace Damage 3"] = "book_mace_damage_3",
        ["Book Mace Damage 4"] = "book_mace_damage_4",
        ["Book Mace Damage 5"] = "book_mace_damage_5",
        ["Book Mace Damage 6"] = "book_mace_damage_6",
        ["Book Mace Damage 7"] = "book_mace_damage_7",
        ["Book Mandrake Tincture Heal 1"] = "book_mandrake_tincture_heal_1",
        ["Book Mandrake Tincture Heal 2"] = "book_mandrake_tincture_heal_2",
        ["Book Mandrake Tincture Heal 3"] = "book_mandrake_tincture_heal_3",
        ["Book Mandrake Tincture Heal 4"] = "book_mandrake_tincture_heal_4",
        ["Book Mandrake Tincture Heal 5"] = "book_mandrake_tincture_heal_5",
        ["Book Mandrake Tincture Heal 6"] = "book_mandrake_tincture_heal_6",
        ["Book Map Walk 1"] = "book_map_walk_1",
        ["Book Map Walk 10"] = "book_map_walk_10",
        ["Book Map Walk 2"] = "book_map_walk_2",
        ["Book Map Walk 3"] = "book_map_walk_3",
        ["Book Map Walk 4"] = "book_map_walk_4",
        ["Book Map Walk 5"] = "book_map_walk_5",
        ["Book Map Walk 6"] = "book_map_walk_6",
        ["Book Map Walk 7"] = "book_map_walk_7",
        ["Book Map Walk 8"] = "book_map_walk_8",
        ["Book Map Walk 9"] = "book_map_walk_9",
        ["Book Meat Jerky Heal 1"] = "book_meat_jerky_heal_1",
        ["Book Meat Jerky Heal 10"] = "book_meat_jerky_heal_10",
        ["Book Meat Jerky Heal 2"] = "book_meat_jerky_heal_2",
        ["Book Meat Jerky Heal 3"] = "book_meat_jerky_heal_3",
        ["Book Meat Jerky Heal 4"] = "book_meat_jerky_heal_4",
        ["Book Meat Jerky Heal 5"] = "book_meat_jerky_heal_5",
        ["Book Meat Jerky Heal 6"] = "book_meat_jerky_heal_6",
        ["Book Meat Jerky Heal 7"] = "book_meat_jerky_heal_7",
        ["Book Meat Jerky Heal 8"] = "book_meat_jerky_heal_8",
        ["Book Meat Jerky Heal 9"] = "book_meat_jerky_heal_9",
        ["Book Meat Roast Heal 1"] = "book_meat_roast_heal_1",
        ["Book Meat Roast Heal 10"] = "book_meat_roast_heal_10",
        ["Book Meat Roast Heal 2"] = "book_meat_roast_heal_2",
        ["Book Meat Roast Heal 3"] = "book_meat_roast_heal_3",
        ["Book Meat Roast Heal 4"] = "book_meat_roast_heal_4",
        ["Book Meat Roast Heal 5"] = "book_meat_roast_heal_5",
        ["Book Meat Roast Heal 6"] = "book_meat_roast_heal_6",
        ["Book Meat Roast Heal 7"] = "book_meat_roast_heal_7",
        ["Book Meat Roast Heal 8"] = "book_meat_roast_heal_8",
        ["Book Meat Roast Heal 9"] = "book_meat_roast_heal_9",
        ["Book Morgenstern Damage 1"] = "book_morgenstern_damage_1",
        ["Book Morgenstern Damage 2"] = "book_morgenstern_damage_2",
        ["Book Morgenstern Damage 3"] = "book_morgenstern_damage_3",
        ["Book Morgenstern Damage 4"] = "book_morgenstern_damage_4",
        ["Book Morgenstern Damage 5"] = "book_morgenstern_damage_5",
        ["Book Morgenstern Damage 6"] = "book_morgenstern_damage_6",
        ["Book Morgenstern Damage 7"] = "book_morgenstern_damage_7",
        ["Book Morgenstern Damage 8"] = "book_morgenstern_damage_8",
        ["Book Paddle Damage 1"] = "book_paddle_damage_1",
        ["Book Paddle Damage 2"] = "book_paddle_damage_2",
        ["Book Paddle Damage 3"] = "book_paddle_damage_3",
        ["Book Paddle Damage 4"] = "book_paddle_damage_4",
        ["Book Paddle Damage 5"] = "book_paddle_damage_5",
        ["Book Paddle Damage 6"] = "book_paddle_damage_6",
        ["Book Pernach Damage 1"] = "book_pernach_damage_1",
        ["Book Pernach Damage 2"] = "book_pernach_damage_2",
        ["Book Pernach Damage 3"] = "book_pernach_damage_3",
        ["Book Pernach Damage 4"] = "book_pernach_damage_4",
        ["Book Pernach Damage 5"] = "book_pernach_damage_5",
        ["Book Pernach Damage 6"] = "book_pernach_damage_6",
        ["Book Pernach Damage 7"] = "book_pernach_damage_7",
        ["Book Pernach Damage 8"] = "book_pernach_damage_8",
        ["Book Pitchfork Damage 1"] = "book_pitchfork_damage_1",
        ["Book Pitchfork Damage 2"] = "book_pitchfork_damage_2",
        ["Book Pitchfork Damage 3"] = "book_pitchfork_damage_3",
        ["Book Pitchfork Damage 4"] = "book_pitchfork_damage_4",
        ["Book Pitchfork Damage 5"] = "book_pitchfork_damage_5",
        ["Book Pitchfork Damage 6"] = "book_pitchfork_damage_6",
        ["Book Player Armor 1"] = "book_player_armor_1",
        ["Book Player Armor 10"] = "book_player_armor_10",
        ["Book Player Armor 2"] = "book_player_armor_2",
        ["Book Player Armor 3"] = "book_player_armor_3",
        ["Book Player Armor 4"] = "book_player_armor_4",
        ["Book Player Armor 5"] = "book_player_armor_5",
        ["Book Player Armor 6"] = "book_player_armor_6",
        ["Book Player Armor 7"] = "book_player_armor_7",
        ["Book Player Armor 8"] = "book_player_armor_8",
        ["Book Player Armor 9"] = "book_player_armor_9",
        ["Book Player Health 1"] = "book_player_health_1",
        ["Book Player Health 10"] = "book_player_health_10",
        ["Book Player Health 11"] = "book_player_health_11",
        ["Book Player Health 12"] = "book_player_health_12",
        ["Book Player Health 13"] = "book_player_health_13",
        ["Book Player Health 14"] = "book_player_health_14",
        ["Book Player Health 15"] = "book_player_health_15",
        ["Book Player Health 2"] = "book_player_health_2",
        ["Book Player Health 3"] = "book_player_health_3",
        ["Book Player Health 4"] = "book_player_health_4",
        ["Book Player Health 5"] = "book_player_health_5",
        ["Book Player Health 6"] = "book_player_health_6",
        ["Book Player Health 7"] = "book_player_health_7",
        ["Book Player Health 8"] = "book_player_health_8",
        ["Book Player Health 9"] = "book_player_health_9",
        ["Book Player Hunger 1"] = "book_player_hunger_1",
        ["Book Player Hunger 10"] = "book_player_hunger_10",
        ["Book Player Hunger 2"] = "book_player_hunger_2",
        ["Book Player Hunger 3"] = "book_player_hunger_3",
        ["Book Player Hunger 4"] = "book_player_hunger_4",
        ["Book Player Hunger 5"] = "book_player_hunger_5",
        ["Book Player Hunger 6"] = "book_player_hunger_6",
        ["Book Player Hunger 7"] = "book_player_hunger_7",
        ["Book Player Hunger 8"] = "book_player_hunger_8",
        ["Book Player Hunger 9"] = "book_player_hunger_9",
        ["Book Player Poison 1"] = "book_player_poison_1",
        ["Book Player Poison 10"] = "book_player_poison_10",
        ["Book Player Poison 2"] = "book_player_poison_2",
        ["Book Player Poison 3"] = "book_player_poison_3",
        ["Book Player Poison 4"] = "book_player_poison_4",
        ["Book Player Poison 5"] = "book_player_poison_5",
        ["Book Player Poison 6"] = "book_player_poison_6",
        ["Book Player Poison 7"] = "book_player_poison_7",
        ["Book Player Poison 8"] = "book_player_poison_8",
        ["Book Player Poison 9"] = "book_player_poison_9",
        ["Book Player Speed 1"] = "book_player_speed_1",
        ["Book Player Speed 10"] = "book_player_speed_10",
        ["Book Player Speed 2"] = "book_player_speed_2",
        ["Book Player Speed 3"] = "book_player_speed_3",
        ["Book Player Speed 4"] = "book_player_speed_4",
        ["Book Player Speed 5"] = "book_player_speed_5",
        ["Book Player Speed 6"] = "book_player_speed_6",
        ["Book Player Speed 7"] = "book_player_speed_7",
        ["Book Player Speed 8"] = "book_player_speed_8",
        ["Book Player Speed 9"] = "book_player_speed_9",
        ["Book Player Thirst 1"] = "book_player_thirst_1",
        ["Book Player Thirst 10"] = "book_player_thirst_10",
        ["Book Player Thirst 2"] = "book_player_thirst_2",
        ["Book Player Thirst 3"] = "book_player_thirst_3",
        ["Book Player Thirst 4"] = "book_player_thirst_4",
        ["Book Player Thirst 5"] = "book_player_thirst_5",
        ["Book Player Thirst 6"] = "book_player_thirst_6",
        ["Book Player Thirst 7"] = "book_player_thirst_7",
        ["Book Player Thirst 8"] = "book_player_thirst_8",
        ["Book Player Thirst 9"] = "book_player_thirst_9",
        ["Book Poison Resist 1"] = "book_poison_resist_1",
        ["Book Poison Resist 10"] = "book_poison_resist_10",
        ["Book Poison Resist 11"] = "book_poison_resist_11",
        ["Book Poison Resist 12"] = "book_poison_resist_12",
        ["Book Poison Resist 13"] = "book_poison_resist_13",
        ["Book Poison Resist 14"] = "book_poison_resist_14",
        ["Book Poison Resist 15"] = "book_poison_resist_15",
        ["Book Poison Resist 2"] = "book_poison_resist_2",
        ["Book Poison Resist 3"] = "book_poison_resist_3",
        ["Book Poison Resist 4"] = "book_poison_resist_4",
        ["Book Poison Resist 5"] = "book_poison_resist_5",
        ["Book Poison Resist 6"] = "book_poison_resist_6",
        ["Book Poison Resist 7"] = "book_poison_resist_7",
        ["Book Poison Resist 8"] = "book_poison_resist_8",
        ["Book Poison Resist 9"] = "book_poison_resist_9",
        ["Book Poleaxe Damage 1"] = "book_poleaxe_damage_1",
        ["Book Poleaxe Damage 2"] = "book_poleaxe_damage_2",
        ["Book Poleaxe Damage 3"] = "book_poleaxe_damage_3",
        ["Book Poleaxe Damage 4"] = "book_poleaxe_damage_4",
        ["Book Poleaxe Damage 5"] = "book_poleaxe_damage_5",
        ["Book Poleaxe Damage 6"] = "book_poleaxe_damage_6",
        ["Book Poleaxe Damage 7"] = "book_poleaxe_damage_7",
        ["Book Poleaxe Damage 8"] = "book_poleaxe_damage_8",
        ["Book Potion Mushroom Heal 1"] = "book_potion_mushroom_heal_1",
        ["Book Potion Mushroom Heal 2"] = "book_potion_mushroom_heal_2",
        ["Book Potion Mushroom Heal 3"] = "book_potion_mushroom_heal_3",
        ["Book Potion Mushroom Heal 4"] = "book_potion_mushroom_heal_4",
        ["Book Potion Mushroom Heal 5"] = "book_potion_mushroom_heal_5",
        ["Book Potion Mushroom Heal 6"] = "book_potion_mushroom_heal_6",
        ["Book Pottage Heal 1"] = "book_pottage_heal_1",
        ["Book Pottage Heal 10"] = "book_pottage_heal_10",
        ["Book Pottage Heal 2"] = "book_pottage_heal_2",
        ["Book Pottage Heal 3"] = "book_pottage_heal_3",
        ["Book Pottage Heal 4"] = "book_pottage_heal_4",
        ["Book Pottage Heal 5"] = "book_pottage_heal_5",
        ["Book Pottage Heal 6"] = "book_pottage_heal_6",
        ["Book Pottage Heal 7"] = "book_pottage_heal_7",
        ["Book Pottage Heal 8"] = "book_pottage_heal_8",
        ["Book Pottage Heal 9"] = "book_pottage_heal_9",
        ["Book Restraint 1"] = "book_restraint_1",
        ["Book Restraint 10"] = "book_restraint_10",
        ["Book Restraint 11"] = "book_restraint_11",
        ["Book Restraint 12"] = "book_restraint_12",
        ["Book Restraint 13"] = "book_restraint_13",
        ["Book Restraint 14"] = "book_restraint_14",
        ["Book Restraint 15"] = "book_restraint_15",
        ["Book Restraint 2"] = "book_restraint_2",
        ["Book Restraint 3"] = "book_restraint_3",
        ["Book Restraint 4"] = "book_restraint_4",
        ["Book Restraint 5"] = "book_restraint_5",
        ["Book Restraint 6"] = "book_restraint_6",
        ["Book Restraint 7"] = "book_restraint_7",
        ["Book Restraint 8"] = "book_restraint_8",
        ["Book Restraint 9"] = "book_restraint_9",
        ["Book Resurrection 1"] = "book_resurrection_1",
        ["Book Resurrection 10"] = "book_resurrection_10",
        ["Book Resurrection 2"] = "book_resurrection_2",
        ["Book Resurrection 3"] = "book_resurrection_3",
        ["Book Resurrection 4"] = "book_resurrection_4",
        ["Book Resurrection 5"] = "book_resurrection_5",
        ["Book Resurrection 6"] = "book_resurrection_6",
        ["Book Resurrection 7"] = "book_resurrection_7",
        ["Book Resurrection 8"] = "book_resurrection_8",
        ["Book Resurrection 9"] = "book_resurrection_9",
        ["Book Rogue Evade 1"] = "book_rogue_evade_1",
        ["Book Rogue Evade 10"] = "book_rogue_evade_10",
        ["Book Rogue Evade 2"] = "book_rogue_evade_2",
        ["Book Rogue Evade 3"] = "book_rogue_evade_3",
        ["Book Rogue Evade 4"] = "book_rogue_evade_4",
        ["Book Rogue Evade 5"] = "book_rogue_evade_5",
        ["Book Rogue Evade 6"] = "book_rogue_evade_6",
        ["Book Rogue Evade 7"] = "book_rogue_evade_7",
        ["Book Rogue Evade 8"] = "book_rogue_evade_8",
        ["Book Rogue Evade 9"] = "book_rogue_evade_9",
        ["Book Rogue Stun Evade 1"] = "book_rogue_stun_evade_1",
        ["Book Rogue Stun Evade 10"] = "book_rogue_stun_evade_10",
        ["Book Rogue Stun Evade 2"] = "book_rogue_stun_evade_2",
        ["Book Rogue Stun Evade 3"] = "book_rogue_stun_evade_3",
        ["Book Rogue Stun Evade 4"] = "book_rogue_stun_evade_4",
        ["Book Rogue Stun Evade 5"] = "book_rogue_stun_evade_5",
        ["Book Rogue Stun Evade 6"] = "book_rogue_stun_evade_6",
        ["Book Rogue Stun Evade 7"] = "book_rogue_stun_evade_7",
        ["Book Rogue Stun Evade 8"] = "book_rogue_stun_evade_8",
        ["Book Rogue Stun Evade 9"] = "book_rogue_stun_evade_9",
        ["Book Rune Speed 1"] = "book_rune_speed_1",
        ["Book Rune Speed 10"] = "book_rune_speed_10",
        ["Book Rune Speed 11"] = "book_rune_speed_11",
        ["Book Rune Speed 12"] = "book_rune_speed_12",
        ["Book Rune Speed 13"] = "book_rune_speed_13",
        ["Book Rune Speed 14"] = "book_rune_speed_14",
        ["Book Rune Speed 15"] = "book_rune_speed_15",
        ["Book Rune Speed 2"] = "book_rune_speed_2",
        ["Book Rune Speed 3"] = "book_rune_speed_3",
        ["Book Rune Speed 4"] = "book_rune_speed_4",
        ["Book Rune Speed 5"] = "book_rune_speed_5",
        ["Book Rune Speed 6"] = "book_rune_speed_6",
        ["Book Rune Speed 7"] = "book_rune_speed_7",
        ["Book Rune Speed 8"] = "book_rune_speed_8",
        ["Book Rune Speed 9"] = "book_rune_speed_9",
        ["Book Scare Ng 1"] = "book_scare_ng_1",
        ["Book Scare Ng 10"] = "book_scare_ng_10",
        ["Book Scare Ng 2"] = "book_scare_ng_2",
        ["Book Scare Ng 3"] = "book_scare_ng_3",
        ["Book Scare Ng 4"] = "book_scare_ng_4",
        ["Book Scare Ng 5"] = "book_scare_ng_5",
        ["Book Scare Ng 6"] = "book_scare_ng_6",
        ["Book Scare Ng 7"] = "book_scare_ng_7",
        ["Book Scare Ng 8"] = "book_scare_ng_8",
        ["Book Scare Ng 9"] = "book_scare_ng_9",
        ["Book Scholar Ghost Evade 1"] = "book_scholar_ghost_evade_1",
        ["Book Scholar Ghost Evade 10"] = "book_scholar_ghost_evade_10",
        ["Book Scholar Ghost Evade 2"] = "book_scholar_ghost_evade_2",
        ["Book Scholar Ghost Evade 3"] = "book_scholar_ghost_evade_3",
        ["Book Scholar Ghost Evade 4"] = "book_scholar_ghost_evade_4",
        ["Book Scholar Ghost Evade 5"] = "book_scholar_ghost_evade_5",
        ["Book Scholar Ghost Evade 6"] = "book_scholar_ghost_evade_6",
        ["Book Scholar Ghost Evade 7"] = "book_scholar_ghost_evade_7",
        ["Book Scholar Ghost Evade 8"] = "book_scholar_ghost_evade_8",
        ["Book Scholar Ghost Evade 9"] = "book_scholar_ghost_evade_9",
        ["Book Scimitar Damage 1"] = "book_scimitar_damage_1",
        ["Book Scimitar Damage 10"] = "book_scimitar_damage_10",
        ["Book Scimitar Damage 11"] = "book_scimitar_damage_11",
        ["Book Scimitar Damage 12"] = "book_scimitar_damage_12",
        ["Book Scimitar Damage 13"] = "book_scimitar_damage_13",
        ["Book Scimitar Damage 14"] = "book_scimitar_damage_14",
        ["Book Scimitar Damage 15"] = "book_scimitar_damage_15",
        ["Book Scimitar Damage 2"] = "book_scimitar_damage_2",
        ["Book Scimitar Damage 3"] = "book_scimitar_damage_3",
        ["Book Scimitar Damage 4"] = "book_scimitar_damage_4",
        ["Book Scimitar Damage 5"] = "book_scimitar_damage_5",
        ["Book Scimitar Damage 6"] = "book_scimitar_damage_6",
        ["Book Scimitar Damage 7"] = "book_scimitar_damage_7",
        ["Book Scimitar Damage 8"] = "book_scimitar_damage_8",
        ["Book Scimitar Damage 9"] = "book_scimitar_damage_9",
        ["Book Scribe Ghost Evade 1"] = "book_scribe_ghost_evade_1",
        ["Book Scribe Ghost Evade 10"] = "book_scribe_ghost_evade_10",
        ["Book Scribe Ghost Evade 2"] = "book_scribe_ghost_evade_2",
        ["Book Scribe Ghost Evade 3"] = "book_scribe_ghost_evade_3",
        ["Book Scribe Ghost Evade 4"] = "book_scribe_ghost_evade_4",
        ["Book Scribe Ghost Evade 5"] = "book_scribe_ghost_evade_5",
        ["Book Scribe Ghost Evade 6"] = "book_scribe_ghost_evade_6",
        ["Book Scribe Ghost Evade 7"] = "book_scribe_ghost_evade_7",
        ["Book Scribe Ghost Evade 8"] = "book_scribe_ghost_evade_8",
        ["Book Scribe Ghost Evade 9"] = "book_scribe_ghost_evade_9",
        ["Book Second Arrow Attack 1"] = "book_second_arrow_attack_1",
        ["Book Second Arrow Attack 10"] = "book_second_arrow_attack_10",
        ["Book Second Arrow Attack 11"] = "book_second_arrow_attack_11",
        ["Book Second Arrow Attack 12"] = "book_second_arrow_attack_12",
        ["Book Second Arrow Attack 13"] = "book_second_arrow_attack_13",
        ["Book Second Arrow Attack 14"] = "book_second_arrow_attack_14",
        ["Book Second Arrow Attack 15"] = "book_second_arrow_attack_15",
        ["Book Second Arrow Attack 2"] = "book_second_arrow_attack_2",
        ["Book Second Arrow Attack 3"] = "book_second_arrow_attack_3",
        ["Book Second Arrow Attack 4"] = "book_second_arrow_attack_4",
        ["Book Second Arrow Attack 5"] = "book_second_arrow_attack_5",
        ["Book Second Arrow Attack 6"] = "book_second_arrow_attack_6",
        ["Book Second Arrow Attack 7"] = "book_second_arrow_attack_7",
        ["Book Second Arrow Attack 8"] = "book_second_arrow_attack_8",
        ["Book Second Arrow Attack 9"] = "book_second_arrow_attack_9",
        ["Book Shaman Dung Evade 1"] = "book_shaman_dung_evade_1",
        ["Book Shaman Dung Evade 10"] = "book_shaman_dung_evade_10",
        ["Book Shaman Dung Evade 2"] = "book_shaman_dung_evade_2",
        ["Book Shaman Dung Evade 3"] = "book_shaman_dung_evade_3",
        ["Book Shaman Dung Evade 4"] = "book_shaman_dung_evade_4",
        ["Book Shaman Dung Evade 5"] = "book_shaman_dung_evade_5",
        ["Book Shaman Dung Evade 6"] = "book_shaman_dung_evade_6",
        ["Book Shaman Dung Evade 7"] = "book_shaman_dung_evade_7",
        ["Book Shaman Dung Evade 8"] = "book_shaman_dung_evade_8",
        ["Book Shaman Dung Evade 9"] = "book_shaman_dung_evade_9",
        ["Book Shields Durability 1"] = "book_shields_durability_1",
        ["Book Shields Durability 10"] = "book_shields_durability_10",
        ["Book Shields Durability 11"] = "book_shields_durability_11",
        ["Book Shields Durability 12"] = "book_shields_durability_12",
        ["Book Shields Durability 13"] = "book_shields_durability_13",
        ["Book Shields Durability 14"] = "book_shields_durability_14",
        ["Book Shields Durability 15"] = "book_shields_durability_15",
        ["Book Shields Durability 2"] = "book_shields_durability_2",
        ["Book Shields Durability 3"] = "book_shields_durability_3",
        ["Book Shields Durability 4"] = "book_shields_durability_4",
        ["Book Shields Durability 5"] = "book_shields_durability_5",
        ["Book Shields Durability 6"] = "book_shields_durability_6",
        ["Book Shields Durability 7"] = "book_shields_durability_7",
        ["Book Shields Durability 8"] = "book_shields_durability_8",
        ["Book Shields Durability 9"] = "book_shields_durability_9",
        ["Book Shovel Damage 1"] = "book_shovel_damage_1",
        ["Book Shovel Damage 2"] = "book_shovel_damage_2",
        ["Book Shovel Damage 3"] = "book_shovel_damage_3",
        ["Book Shovel Damage 4"] = "book_shovel_damage_4",
        ["Book Shovel Damage 5"] = "book_shovel_damage_5",
        ["Book Sickle Damage 1"] = "book_sickle_damage_1",
        ["Book Sickle Damage 2"] = "book_sickle_damage_2",
        ["Book Sickle Damage 3"] = "book_sickle_damage_3",
        ["Book Sickle Damage 4"] = "book_sickle_damage_4",
        ["Book Skeletons Evade 1"] = "book_skeletons_evade_1",
        ["Book Skeletons Evade 10"] = "book_skeletons_evade_10",
        ["Book Skeletons Evade 2"] = "book_skeletons_evade_2",
        ["Book Skeletons Evade 3"] = "book_skeletons_evade_3",
        ["Book Skeletons Evade 4"] = "book_skeletons_evade_4",
        ["Book Skeletons Evade 5"] = "book_skeletons_evade_5",
        ["Book Skeletons Evade 6"] = "book_skeletons_evade_6",
        ["Book Skeletons Evade 7"] = "book_skeletons_evade_7",
        ["Book Skeletons Evade 8"] = "book_skeletons_evade_8",
        ["Book Skeletons Evade 9"] = "book_skeletons_evade_9",
        ["Book Skilled Summoner 1"] = "book_skilled_summoner_1",
        ["Book Skilled Summoner 10"] = "book_skilled_summoner_10",
        ["Book Skilled Summoner 11"] = "book_skilled_summoner_11",
        ["Book Skilled Summoner 12"] = "book_skilled_summoner_12",
        ["Book Skilled Summoner 13"] = "book_skilled_summoner_13",
        ["Book Skilled Summoner 14"] = "book_skilled_summoner_14",
        ["Book Skilled Summoner 15"] = "book_skilled_summoner_15",
        ["Book Skilled Summoner 2"] = "book_skilled_summoner_2",
        ["Book Skilled Summoner 3"] = "book_skilled_summoner_3",
        ["Book Skilled Summoner 4"] = "book_skilled_summoner_4",
        ["Book Skilled Summoner 5"] = "book_skilled_summoner_5",
        ["Book Skilled Summoner 6"] = "book_skilled_summoner_6",
        ["Book Skilled Summoner 7"] = "book_skilled_summoner_7",
        ["Book Skilled Summoner 8"] = "book_skilled_summoner_8",
        ["Book Skilled Summoner 9"] = "book_skilled_summoner_9",
        ["Book Spear Damage 1"] = "book_spear_damage_1",
        ["Book Spear Damage 10"] = "book_spear_damage_10",
        ["Book Spear Damage 11"] = "book_spear_damage_11",
        ["Book Spear Damage 12"] = "book_spear_damage_12",
        ["Book Spear Damage 13"] = "book_spear_damage_13",
        ["Book Spear Damage 14"] = "book_spear_damage_14",
        ["Book Spear Damage 15"] = "book_spear_damage_15",
        ["Book Spear Damage 2"] = "book_spear_damage_2",
        ["Book Spear Damage 3"] = "book_spear_damage_3",
        ["Book Spear Damage 4"] = "book_spear_damage_4",
        ["Book Spear Damage 5"] = "book_spear_damage_5",
        ["Book Spear Damage 6"] = "book_spear_damage_6",
        ["Book Spear Damage 7"] = "book_spear_damage_7",
        ["Book Spear Damage 8"] = "book_spear_damage_8",
        ["Book Spear Damage 9"] = "book_spear_damage_9",
        ["Book Speed Boost 1"] = "book_speed_boost_1",
        ["Book Speed Boost 10"] = "book_speed_boost_10",
        ["Book Speed Boost 2"] = "book_speed_boost_2",
        ["Book Speed Boost 3"] = "book_speed_boost_3",
        ["Book Speed Boost 4"] = "book_speed_boost_4",
        ["Book Speed Boost 5"] = "book_speed_boost_5",
        ["Book Speed Boost 6"] = "book_speed_boost_6",
        ["Book Speed Boost 7"] = "book_speed_boost_7",
        ["Book Speed Boost 8"] = "book_speed_boost_8",
        ["Book Speed Boost 9"] = "book_speed_boost_9",
        ["Book Stone Gather 1"] = "book_stone_gather_1",
        ["Book Stone Gather 10"] = "book_stone_gather_10",
        ["Book Stone Gather 2"] = "book_stone_gather_2",
        ["Book Stone Gather 3"] = "book_stone_gather_3",
        ["Book Stone Gather 4"] = "book_stone_gather_4",
        ["Book Stone Gather 5"] = "book_stone_gather_5",
        ["Book Stone Gather 6"] = "book_stone_gather_6",
        ["Book Stone Gather 7"] = "book_stone_gather_7",
        ["Book Stone Gather 8"] = "book_stone_gather_8",
        ["Book Stone Gather 9"] = "book_stone_gather_9",
        ["Book Stun Resist 1"] = "book_stun_resist_1",
        ["Book Stun Resist 10"] = "book_stun_resist_10",
        ["Book Stun Resist 2"] = "book_stun_resist_2",
        ["Book Stun Resist 3"] = "book_stun_resist_3",
        ["Book Stun Resist 4"] = "book_stun_resist_4",
        ["Book Stun Resist 5"] = "book_stun_resist_5",
        ["Book Stun Resist 6"] = "book_stun_resist_6",
        ["Book Stun Resist 7"] = "book_stun_resist_7",
        ["Book Stun Resist 8"] = "book_stun_resist_8",
        ["Book Stun Resist 9"] = "book_stun_resist_9",
        ["Book Super Hit 1"] = "book_super_hit_1",
        ["Book Super Hit 10"] = "book_super_hit_10",
        ["Book Super Hit 11"] = "book_super_hit_11",
        ["Book Super Hit 12"] = "book_super_hit_12",
        ["Book Super Hit 13"] = "book_super_hit_13",
        ["Book Super Hit 14"] = "book_super_hit_14",
        ["Book Super Hit 15"] = "book_super_hit_15",
        ["Book Super Hit 2"] = "book_super_hit_2",
        ["Book Super Hit 3"] = "book_super_hit_3",
        ["Book Super Hit 4"] = "book_super_hit_4",
        ["Book Super Hit 5"] = "book_super_hit_5",
        ["Book Super Hit 6"] = "book_super_hit_6",
        ["Book Super Hit 7"] = "book_super_hit_7",
        ["Book Super Hit 8"] = "book_super_hit_8",
        ["Book Super Hit 9"] = "book_super_hit_9",
        ["Book Super Hit Stun 1"] = "book_super_hit_stun_1",
        ["Book Super Hit Stun 10"] = "book_super_hit_stun_10",
        ["Book Super Hit Stun 11"] = "book_super_hit_stun_11",
        ["Book Super Hit Stun 12"] = "book_super_hit_stun_12",
        ["Book Super Hit Stun 13"] = "book_super_hit_stun_13",
        ["Book Super Hit Stun 14"] = "book_super_hit_stun_14",
        ["Book Super Hit Stun 15"] = "book_super_hit_stun_15",
        ["Book Super Hit Stun 2"] = "book_super_hit_stun_2",
        ["Book Super Hit Stun 3"] = "book_super_hit_stun_3",
        ["Book Super Hit Stun 4"] = "book_super_hit_stun_4",
        ["Book Super Hit Stun 5"] = "book_super_hit_stun_5",
        ["Book Super Hit Stun 6"] = "book_super_hit_stun_6",
        ["Book Super Hit Stun 7"] = "book_super_hit_stun_7",
        ["Book Super Hit Stun 8"] = "book_super_hit_stun_8",
        ["Book Super Hit Stun 9"] = "book_super_hit_stun_9",
        ["Book Sword Damage 1"] = "book_sword_damage_1",
        ["Book Sword Damage 2"] = "book_sword_damage_2",
        ["Book Sword Damage 3"] = "book_sword_damage_3",
        ["Book Sword Damage 4"] = "book_sword_damage_4",
        ["Book Sword Damage 5"] = "book_sword_damage_5",
        ["Book Sword Damage 6"] = "book_sword_damage_6",
        ["Book Templar Dung1 Evade 1"] = "book_templar_dung1_evade_1",
        ["Book Templar Dung1 Evade 10"] = "book_templar_dung1_evade_10",
        ["Book Templar Dung1 Evade 2"] = "book_templar_dung1_evade_2",
        ["Book Templar Dung1 Evade 3"] = "book_templar_dung1_evade_3",
        ["Book Templar Dung1 Evade 4"] = "book_templar_dung1_evade_4",
        ["Book Templar Dung1 Evade 5"] = "book_templar_dung1_evade_5",
        ["Book Templar Dung1 Evade 6"] = "book_templar_dung1_evade_6",
        ["Book Templar Dung1 Evade 7"] = "book_templar_dung1_evade_7",
        ["Book Templar Dung1 Evade 8"] = "book_templar_dung1_evade_8",
        ["Book Templar Dung1 Evade 9"] = "book_templar_dung1_evade_9",
        ["Book Templar Evade 1"] = "book_templar_evade_1",
        ["Book Templar Evade 10"] = "book_templar_evade_10",
        ["Book Templar Evade 2"] = "book_templar_evade_2",
        ["Book Templar Evade 3"] = "book_templar_evade_3",
        ["Book Templar Evade 4"] = "book_templar_evade_4",
        ["Book Templar Evade 5"] = "book_templar_evade_5",
        ["Book Templar Evade 6"] = "book_templar_evade_6",
        ["Book Templar Evade 7"] = "book_templar_evade_7",
        ["Book Templar Evade 8"] = "book_templar_evade_8",
        ["Book Templar Evade 9"] = "book_templar_evade_9",
        ["Book Templar Zealot Evade 1"] = "book_templar_zealot_evade_1",
        ["Book Templar Zealot Evade 10"] = "book_templar_zealot_evade_10",
        ["Book Templar Zealot Evade 2"] = "book_templar_zealot_evade_2",
        ["Book Templar Zealot Evade 3"] = "book_templar_zealot_evade_3",
        ["Book Templar Zealot Evade 4"] = "book_templar_zealot_evade_4",
        ["Book Templar Zealot Evade 5"] = "book_templar_zealot_evade_5",
        ["Book Templar Zealot Evade 6"] = "book_templar_zealot_evade_6",
        ["Book Templar Zealot Evade 7"] = "book_templar_zealot_evade_7",
        ["Book Templar Zealot Evade 8"] = "book_templar_zealot_evade_8",
        ["Book Templar Zealot Evade 9"] = "book_templar_zealot_evade_9",
        ["Book Tincture Heal 1"] = "book_tincture_heal_1",
        ["Book Tincture Heal 2"] = "book_tincture_heal_2",
        ["Book Tincture Heal 3"] = "book_tincture_heal_3",
        ["Book Tincture Heal 4"] = "book_tincture_heal_4",
        ["Book Tincture Heal 5"] = "book_tincture_heal_5",
        ["Book Tincture Heal 6"] = "book_tincture_heal_6",
        ["Book Torch Damage 1"] = "book_torch_damage_1",
        ["Book Torch Damage 2"] = "book_torch_damage_2",
        ["Book Torch Damage 3"] = "book_torch_damage_3",
        ["Book Torch Durability 1"] = "book_torch_durability_1",
        ["Book Torch Durability 10"] = "book_torch_durability_10",
        ["Book Torch Durability 2"] = "book_torch_durability_2",
        ["Book Torch Durability 3"] = "book_torch_durability_3",
        ["Book Torch Durability 4"] = "book_torch_durability_4",
        ["Book Torch Durability 5"] = "book_torch_durability_5",
        ["Book Torch Durability 6"] = "book_torch_durability_6",
        ["Book Torch Durability 7"] = "book_torch_durability_7",
        ["Book Torch Durability 8"] = "book_torch_durability_8",
        ["Book Torch Durability 9"] = "book_torch_durability_9",
        ["Book Torturer Dung Evade 1"] = "book_torturer_dung_evade_1",
        ["Book Torturer Dung Evade 10"] = "book_torturer_dung_evade_10",
        ["Book Torturer Dung Evade 2"] = "book_torturer_dung_evade_2",
        ["Book Torturer Dung Evade 3"] = "book_torturer_dung_evade_3",
        ["Book Torturer Dung Evade 4"] = "book_torturer_dung_evade_4",
        ["Book Torturer Dung Evade 5"] = "book_torturer_dung_evade_5",
        ["Book Torturer Dung Evade 6"] = "book_torturer_dung_evade_6",
        ["Book Torturer Dung Evade 7"] = "book_torturer_dung_evade_7",
        ["Book Torturer Dung Evade 8"] = "book_torturer_dung_evade_8",
        ["Book Torturer Dung Evade 9"] = "book_torturer_dung_evade_9",
        ["Book Trained Cats 1"] = "book_trained_cats_1",
        ["Book Trained Cats 10"] = "book_trained_cats_10",
        ["Book Trained Cats 11"] = "book_trained_cats_11",
        ["Book Trained Cats 12"] = "book_trained_cats_12",
        ["Book Trained Cats 13"] = "book_trained_cats_13",
        ["Book Trained Cats 14"] = "book_trained_cats_14",
        ["Book Trained Cats 15"] = "book_trained_cats_15",
        ["Book Trained Cats 2"] = "book_trained_cats_2",
        ["Book Trained Cats 3"] = "book_trained_cats_3",
        ["Book Trained Cats 4"] = "book_trained_cats_4",
        ["Book Trained Cats 5"] = "book_trained_cats_5",
        ["Book Trained Cats 6"] = "book_trained_cats_6",
        ["Book Trained Cats 7"] = "book_trained_cats_7",
        ["Book Trained Cats 8"] = "book_trained_cats_8",
        ["Book Trained Cats 9"] = "book_trained_cats_9",
        ["Book Trained Wolves 1"] = "book_trained_wolves_1",
        ["Book Trained Wolves 10"] = "book_trained_wolves_10",
        ["Book Trained Wolves 11"] = "book_trained_wolves_11",
        ["Book Trained Wolves 12"] = "book_trained_wolves_12",
        ["Book Trained Wolves 13"] = "book_trained_wolves_13",
        ["Book Trained Wolves 14"] = "book_trained_wolves_14",
        ["Book Trained Wolves 15"] = "book_trained_wolves_15",
        ["Book Trained Wolves 2"] = "book_trained_wolves_2",
        ["Book Trained Wolves 3"] = "book_trained_wolves_3",
        ["Book Trained Wolves 4"] = "book_trained_wolves_4",
        ["Book Trained Wolves 5"] = "book_trained_wolves_5",
        ["Book Trained Wolves 6"] = "book_trained_wolves_6",
        ["Book Trained Wolves 7"] = "book_trained_wolves_7",
        ["Book Trained Wolves 8"] = "book_trained_wolves_8",
        ["Book Trained Wolves 9"] = "book_trained_wolves_9",
        ["Book Trap Damage 1"] = "book_trap_damage_1",
        ["Book Trap Damage 10"] = "book_trap_damage_10",
        ["Book Trap Damage 2"] = "book_trap_damage_2",
        ["Book Trap Damage 3"] = "book_trap_damage_3",
        ["Book Trap Damage 4"] = "book_trap_damage_4",
        ["Book Trap Damage 5"] = "book_trap_damage_5",
        ["Book Trap Damage 6"] = "book_trap_damage_6",
        ["Book Trap Damage 7"] = "book_trap_damage_7",
        ["Book Trap Damage 8"] = "book_trap_damage_8",
        ["Book Trap Damage 9"] = "book_trap_damage_9",
        ["Book Trap Speed 1"] = "book_trap_speed_1",
        ["Book Trap Speed 10"] = "book_trap_speed_10",
        ["Book Trap Speed 11"] = "book_trap_speed_11",
        ["Book Trap Speed 12"] = "book_trap_speed_12",
        ["Book Trap Speed 13"] = "book_trap_speed_13",
        ["Book Trap Speed 14"] = "book_trap_speed_14",
        ["Book Trap Speed 15"] = "book_trap_speed_15",
        ["Book Trap Speed 2"] = "book_trap_speed_2",
        ["Book Trap Speed 3"] = "book_trap_speed_3",
        ["Book Trap Speed 4"] = "book_trap_speed_4",
        ["Book Trap Speed 5"] = "book_trap_speed_5",
        ["Book Trap Speed 6"] = "book_trap_speed_6",
        ["Book Trap Speed 7"] = "book_trap_speed_7",
        ["Book Trap Speed 8"] = "book_trap_speed_8",
        ["Book Trap Speed 9"] = "book_trap_speed_9",
        ["Book Victim Dung Evade 1"] = "book_victim_dung_evade_1",
        ["Book Victim Dung Evade 10"] = "book_victim_dung_evade_10",
        ["Book Victim Dung Evade 2"] = "book_victim_dung_evade_2",
        ["Book Victim Dung Evade 3"] = "book_victim_dung_evade_3",
        ["Book Victim Dung Evade 4"] = "book_victim_dung_evade_4",
        ["Book Victim Dung Evade 5"] = "book_victim_dung_evade_5",
        ["Book Victim Dung Evade 6"] = "book_victim_dung_evade_6",
        ["Book Victim Dung Evade 7"] = "book_victim_dung_evade_7",
        ["Book Victim Dung Evade 8"] = "book_victim_dung_evade_8",
        ["Book Victim Dung Evade 9"] = "book_victim_dung_evade_9",
        ["Book Wagenburg Lieutenant Evade 1"] = "book_wagenburg_lieutenant_evade_1",
        ["Book Wagenburg Lieutenant Evade 10"] = "book_wagenburg_lieutenant_evade_10",
        ["Book Wagenburg Lieutenant Evade 2"] = "book_wagenburg_lieutenant_evade_2",
        ["Book Wagenburg Lieutenant Evade 3"] = "book_wagenburg_lieutenant_evade_3",
        ["Book Wagenburg Lieutenant Evade 4"] = "book_wagenburg_lieutenant_evade_4",
        ["Book Wagenburg Lieutenant Evade 5"] = "book_wagenburg_lieutenant_evade_5",
        ["Book Wagenburg Lieutenant Evade 6"] = "book_wagenburg_lieutenant_evade_6",
        ["Book Wagenburg Lieutenant Evade 7"] = "book_wagenburg_lieutenant_evade_7",
        ["Book Wagenburg Lieutenant Evade 8"] = "book_wagenburg_lieutenant_evade_8",
        ["Book Wagenburg Lieutenant Evade 9"] = "book_wagenburg_lieutenant_evade_9",
        ["Book Wagenburg Soldiers Evade 1"] = "book_wagenburg_soldiers_evade_1",
        ["Book Wagenburg Soldiers Evade 10"] = "book_wagenburg_soldiers_evade_10",
        ["Book Wagenburg Soldiers Evade 2"] = "book_wagenburg_soldiers_evade_2",
        ["Book Wagenburg Soldiers Evade 3"] = "book_wagenburg_soldiers_evade_3",
        ["Book Wagenburg Soldiers Evade 4"] = "book_wagenburg_soldiers_evade_4",
        ["Book Wagenburg Soldiers Evade 5"] = "book_wagenburg_soldiers_evade_5",
        ["Book Wagenburg Soldiers Evade 6"] = "book_wagenburg_soldiers_evade_6",
        ["Book Wagenburg Soldiers Evade 7"] = "book_wagenburg_soldiers_evade_7",
        ["Book Wagenburg Soldiers Evade 8"] = "book_wagenburg_soldiers_evade_8",
        ["Book Wagenburg Soldiers Evade 9"] = "book_wagenburg_soldiers_evade_9",
        ["Book Waggon Thill Damage 1"] = "book_waggon_thill_damage_1",
        ["Book Waggon Thill Damage 2"] = "book_waggon_thill_damage_2",
        ["Book Waggon Thill Damage 3"] = "book_waggon_thill_damage_3",
        ["Book Waggon Thill Damage 4"] = "book_waggon_thill_damage_4",
        ["Book Wine Heal 1"] = "book_wine_heal_1",
        ["Book Wine Heal 2"] = "book_wine_heal_2",
        ["Book Wine Heal 3"] = "book_wine_heal_3",
        ["Book Wine Heal 4"] = "book_wine_heal_4",
        ["Book Wine Heal 5"] = "book_wine_heal_5",
        ["Book Wine Heal 6"] = "book_wine_heal_6",
        ["Book Wolf Bite 1"] = "book_wolf_bite_1",
        ["Book Wolf Bite 10"] = "book_wolf_bite_10",
        ["Book Wolf Bite 11"] = "book_wolf_bite_11",
        ["Book Wolf Bite 12"] = "book_wolf_bite_12",
        ["Book Wolf Bite 13"] = "book_wolf_bite_13",
        ["Book Wolf Bite 14"] = "book_wolf_bite_14",
        ["Book Wolf Bite 15"] = "book_wolf_bite_15",
        ["Book Wolf Bite 2"] = "book_wolf_bite_2",
        ["Book Wolf Bite 3"] = "book_wolf_bite_3",
        ["Book Wolf Bite 4"] = "book_wolf_bite_4",
        ["Book Wolf Bite 5"] = "book_wolf_bite_5",
        ["Book Wolf Bite 6"] = "book_wolf_bite_6",
        ["Book Wolf Bite 7"] = "book_wolf_bite_7",
        ["Book Wolf Bite 8"] = "book_wolf_bite_8",
        ["Book Wolf Bite 9"] = "book_wolf_bite_9",
        ["Book Wolf Evade 1"] = "book_wolf_evade_1",
        ["Book Wolf Evade 10"] = "book_wolf_evade_10",
        ["Book Wolf Evade 2"] = "book_wolf_evade_2",
        ["Book Wolf Evade 3"] = "book_wolf_evade_3",
        ["Book Wolf Evade 4"] = "book_wolf_evade_4",
        ["Book Wolf Evade 5"] = "book_wolf_evade_5",
        ["Book Wolf Evade 6"] = "book_wolf_evade_6",
        ["Book Wolf Evade 7"] = "book_wolf_evade_7",
        ["Book Wolf Evade 8"] = "book_wolf_evade_8",
        ["Book Wolf Evade 9"] = "book_wolf_evade_9",
        ["Book Wood Gather 1"] = "book_wood_gather_1",
        ["Book Wood Gather 10"] = "book_wood_gather_10",
        ["Book Wood Gather 2"] = "book_wood_gather_2",
        ["Book Wood Gather 3"] = "book_wood_gather_3",
        ["Book Wood Gather 4"] = "book_wood_gather_4",
        ["Book Wood Gather 5"] = "book_wood_gather_5",
        ["Book Wood Gather 6"] = "book_wood_gather_6",
        ["Book Wood Gather 7"] = "book_wood_gather_7",
        ["Book Wood Gather 8"] = "book_wood_gather_8",
        ["Book Wood Gather 9"] = "book_wood_gather_9",
    },
    ["Tomes Scrolls Notes"] = {
        ["article_1"] = {
            ["Tome01 Page01"] = "tome01_page01",
            ["Tome01 Page02"] = "tome01_page02",
            ["Tome01 Page03"] = "tome01_page03",
            ["Tome01 Page04"] = "tome01_page04",
            ["Tome01 Page05"] = "tome01_page05",
            ["Tome01 Page06"] = "tome01_page06",
            ["Tome01 Page07"] = "tome01_page07",
            ["Tome01 Page08"] = "tome01_page08",
            ["Tome01 Page09"] = "tome01_page09",
            ["Tome01 Page10"] = "tome01_page10",
            ["Tome01 Page11"] = "tome01_page11",
            ["Tome01 Page12"] = "tome01_page12",
            ["Tome01 Page13"] = "tome01_page13",
            ["Tome01 Page14"] = "tome01_page14",
            ["Tome01 Page15"] = "tome01_page15",
            ["Tome01 Page16"] = "tome01_page16",
        },
        ["article_10"] = {
            ["Tome10 Page01"] = "tome10_page01",
            ["Tome10 Page02"] = "tome10_page02",
            ["Tome10 Page03"] = "tome10_page03",
            ["Tome10 Page04"] = "tome10_page04",
        },
        ["article_11"] = {
            ["Tome11 Page01"] = "tome11_page01",
            ["Tome11 Page02"] = "tome11_page02",
            ["Tome11 Page03"] = "tome11_page03",
            ["Tome11 Page04"] = "tome11_page04",
            ["Tome11 Page05"] = "tome11_page05",
            ["Tome11 Page06"] = "tome11_page06",
            ["Tome11 Page07"] = "tome11_page07",
            ["Tome11 Page08"] = "tome11_page08",
            ["Tome11 Page09"] = "tome11_page09",
            ["Tome11 Page10"] = "tome11_page10",
        },
        ["article_12"] = {
            ["Tome12 Page01"] = "tome12_page01",
            ["Tome12 Page02"] = "tome12_page02",
            ["Tome12 Page03"] = "tome12_page03",
            ["Tome12 Page04"] = "tome12_page04",
            ["Tome12 Page05"] = "tome12_page05",
            ["Tome12 Page06"] = "tome12_page06",
            ["Tome12 Page07"] = "tome12_page07",
            ["Tome12 Page08"] = "tome12_page08",
            ["Tome12 Page09"] = "tome12_page09",
            ["Tome12 Page10"] = "tome12_page10",
            ["Tome12 Page11"] = "tome12_page11",
            ["Tome12 Page12"] = "tome12_page12",
            ["Tome12 Page13"] = "tome12_page13",
            ["Tome12 Page14"] = "tome12_page14",
        },
        ["article_13"] = {
            ["Tome13 Page01"] = "tome13_page01",
            ["Tome13 Page02"] = "tome13_page02",
            ["Tome13 Page03"] = "tome13_page03",
            ["Tome13 Page04"] = "tome13_page04",
        },
        ["article_14"] = {
            ["Tome14 Page01"] = "tome14_page01",
            ["Tome14 Page02"] = "tome14_page02",
            ["Tome14 Page03"] = "tome14_page03",
            ["Tome14 Page04"] = "tome14_page04",
            ["Tome14 Page05"] = "tome14_page05",
            ["Tome14 Page06"] = "tome14_page06",
        },
        ["article_15"] = {
            ["Tome15 Page01"] = "tome15_page01",
            ["Tome15 Page02"] = "tome15_page02",
            ["Tome15 Page03"] = "tome15_page03",
            ["Tome15 Page04"] = "tome15_page04",
            ["Tome15 Page05"] = "tome15_page05",
            ["Tome15 Page06"] = "tome15_page06",
            ["Tome15 Page07"] = "tome15_page07",
            ["Tome15 Page08"] = "tome15_page08",
            ["Tome15 Page09"] = "tome15_page09",
            ["Tome15 Page10"] = "tome15_page10",
            ["Tome15 Page11"] = "tome15_page11",
            ["Tome15 Page12"] = "tome15_page12",
        },
        ["article_16"] = {
            ["Tome16 Page01"] = "tome16_page01",
            ["Tome16 Page02"] = "tome16_page02",
            ["Tome16 Page03"] = "tome16_page03",
            ["Tome16 Page04"] = "tome16_page04",
            ["Tome16 Page05"] = "tome16_page05",
            ["Tome16 Page06"] = "tome16_page06",
            ["Tome16 Page07"] = "tome16_page07",
            ["Tome16 Page08"] = "tome16_page08",
            ["Tome16 Page09"] = "tome16_page09",
        },
        ["article_17"] = {
            ["Tome17 Page01"] = "tome17_page01",
            ["Tome17 Page02"] = "tome17_page02",
            ["Tome17 Page03"] = "tome17_page03",
            ["Tome17 Page04"] = "tome17_page04",
        },
        ["article_18"] = {
            ["Tome18 Page01"] = "tome18_page01",
            ["Tome18 Page02"] = "tome18_page02",
            ["Tome18 Page03"] = "tome18_page03",
            ["Tome18 Page04"] = "tome18_page04",
            ["Tome18 Page05"] = "tome18_page05",
            ["Tome18 Page06"] = "tome18_page06",
            ["Tome18 Page07"] = "tome18_page07",
            ["Tome18 Page08"] = "tome18_page08",
            ["Tome18 Page09"] = "tome18_page09",
            ["Tome18 Page10"] = "tome18_page10",
            ["Tome18 Page11"] = "tome18_page11",
            ["Tome18 Page12"] = "tome18_page12",
        },
        ["article_19"] = {
            ["Tome19 Page01"] = "tome19_page01",
            ["Tome19 Page02"] = "tome19_page02",
            ["Tome19 Page03"] = "tome19_page03",
            ["Tome19 Page04"] = "tome19_page04",
            ["Tome19 Page05"] = "tome19_page05",
            ["Tome19 Page06"] = "tome19_page06",
            ["Tome19 Page07"] = "tome19_page07",
            ["Tome19 Page08"] = "tome19_page08",
            ["Tome19 Page09"] = "tome19_page09",
        },
        ["article_2"] = {
            ["Tome02 Page01"] = "tome02_page01",
            ["Tome02 Page02"] = "tome02_page02",
            ["Tome02 Page03"] = "tome02_page03",
            ["Tome02 Page04"] = "tome02_page04",
            ["Tome02 Page05"] = "tome02_page05",
            ["Tome02 Page06"] = "tome02_page06",
            ["Tome02 Page07"] = "tome02_page07",
            ["Tome02 Page08"] = "tome02_page08",
            ["Tome02 Page09"] = "tome02_page09",
            ["Tome02 Page10"] = "tome02_page10",
            ["Tome02 Page11"] = "tome02_page11",
            ["Tome02 Page12"] = "tome02_page12",
            ["Tome02 Page13"] = "tome02_page13",
            ["Tome02 Page14"] = "tome02_page14",
            ["Tome02 Page15"] = "tome02_page15",
            ["Tome02 Page16"] = "tome02_page16",
            ["Tome02 Page17"] = "tome02_page17",
            ["Tome02 Page18"] = "tome02_page18",
            ["Tome02 Page19"] = "tome02_page19",
            ["Tome02 Page20"] = "tome02_page20",
            ["Tome02 Page21"] = "tome02_page21",
            ["Tome02 Page22"] = "tome02_page22",
        },
        ["article_20"] = {
            ["Tome20 Page01"] = "tome20_page01",
            ["Tome20 Page02"] = "tome20_page02",
            ["Tome20 Page03"] = "tome20_page03",
            ["Tome20 Page04"] = "tome20_page04",
            ["Tome20 Page05"] = "tome20_page05",
        },
        ["article_21"] = {
            ["Tome21 Page01"] = "tome21_page01",
            ["Tome21 Page02"] = "tome21_page02",
            ["Tome21 Page03"] = "tome21_page03",
            ["Tome21 Page04"] = "tome21_page04",
            ["Tome21 Page05"] = "tome21_page05",
            ["Tome21 Page06"] = "tome21_page06",
            ["Tome21 Page07"] = "tome21_page07",
            ["Tome21 Page08"] = "tome21_page08",
            ["Tome21 Page09"] = "tome21_page09",
        },
        ["article_22"] = {
            ["Tome22 Page01"] = "tome22_page01",
            ["Tome22 Page02"] = "tome22_page02",
            ["Tome22 Page03"] = "tome22_page03",
            ["Tome22 Page04"] = "tome22_page04",
            ["Tome22 Page05"] = "tome22_page05",
            ["Tome22 Page06"] = "tome22_page06",
            ["Tome22 Page07"] = "tome22_page07",
            ["Tome22 Page08"] = "tome22_page08",
            ["Tome22 Page09"] = "tome22_page09",
            ["Tome22 Page10"] = "tome22_page10",
            ["Tome22 Page11"] = "tome22_page11",
            ["Tome22 Page12"] = "tome22_page12",
            ["Tome22 Page13"] = "tome22_page13",
        },
        ["article_3"] = {
            ["Tome03 Page01"] = "tome03_page01",
            ["Tome03 Page02"] = "tome03_page02",
            ["Tome03 Page03"] = "tome03_page03",
            ["Tome03 Page04"] = "tome03_page04",
            ["Tome03 Page05"] = "tome03_page05",
            ["Tome03 Page06"] = "tome03_page06",
            ["Tome03 Page07"] = "tome03_page07",
        },
        ["article_4"] = {
            ["Tome04 Page01"] = "tome04_page01",
            ["Tome04 Page02"] = "tome04_page02",
            ["Tome04 Page03"] = "tome04_page03",
            ["Tome04 Page04"] = "tome04_page04",
            ["Tome04 Page05"] = "tome04_page05",
            ["Tome04 Page06"] = "tome04_page06",
            ["Tome04 Page07"] = "tome04_page07",
            ["Tome04 Page08"] = "tome04_page08",
            ["Tome04 Page09"] = "tome04_page09",
            ["Tome04 Page10"] = "tome04_page10",
            ["Tome04 Page11"] = "tome04_page11",
            ["Tome04 Page12"] = "tome04_page12",
            ["Tome04 Page13"] = "tome04_page13",
            ["Tome04 Page14"] = "tome04_page14",
            ["Tome04 Page15"] = "tome04_page15",
            ["Tome04 Page16"] = "tome04_page16",
            ["Tome04 Page17"] = "tome04_page17",
            ["Tome04 Page18"] = "tome04_page18",
            ["Tome04 Page19"] = "tome04_page19",
            ["Tome04 Page20"] = "tome04_page20",
            ["Tome04 Page21"] = "tome04_page21",
            ["Tome04 Page22"] = "tome04_page22",
            ["Tome04 Page23"] = "tome04_page23",
            ["Tome04 Page24"] = "tome04_page24",
            ["Tome04 Page25"] = "tome04_page25",
            ["Tome04 Page26"] = "tome04_page26",
            ["Tome04 Page27"] = "tome04_page27",
            ["Tome04 Page28"] = "tome04_page28",
            ["Tome04 Page29"] = "tome04_page29",
            ["Tome04 Page30"] = "tome04_page30",
            ["Tome04 Page31"] = "tome04_page31",
            ["Tome04 Page32"] = "tome04_page32",
            ["Tome04 Page33"] = "tome04_page33",
            ["Tome04 Page34"] = "tome04_page34",
            ["Tome04 Page35"] = "tome04_page35",
            ["Tome04 Page36"] = "tome04_page36",
            ["Tome04 Page37"] = "tome04_page37",
            ["Tome04 Page38"] = "tome04_page38",
            ["Tome04 Page39"] = "tome04_page39",
            ["Tome04 Page40"] = "tome04_page40",
            ["Tome04 Page41"] = "tome04_page41",
            ["Tome04 Page42"] = "tome04_page42",
            ["Tome04 Page43"] = "tome04_page43",
            ["Tome04 Page44"] = "tome04_page44",
            ["Tome04 Page45"] = "tome04_page45",
            ["Tome04 Page46"] = "tome04_page46",
        },
        ["article_5"] = {
            ["Tome05 Page01"] = "tome05_page01",
            ["Tome05 Page02"] = "tome05_page02",
            ["Tome05 Page03"] = "tome05_page03",
            ["Tome05 Page04"] = "tome05_page04",
            ["Tome05 Page05"] = "tome05_page05",
            ["Tome05 Page06"] = "tome05_page06",
            ["Tome05 Page07"] = "tome05_page07",
            ["Tome05 Page08"] = "tome05_page08",
            ["Tome05 Page09"] = "tome05_page09",
            ["Tome05 Page10"] = "tome05_page10",
            ["Tome05 Page11"] = "tome05_page11",
            ["Tome05 Page12"] = "tome05_page12",
            ["Tome05 Page13"] = "tome05_page13",
            ["Tome05 Page14"] = "tome05_page14",
        },
        ["article_6"] = {
            ["Tome06 Page01"] = "tome06_page01",
            ["Tome06 Page02"] = "tome06_page02",
            ["Tome06 Page03"] = "tome06_page03",
        },
        ["article_7"] = {
            ["Tome07 Page01"] = "tome07_page01",
            ["Tome07 Page02"] = "tome07_page02",
            ["Tome07 Page03"] = "tome07_page03",
            ["Tome07 Page04"] = "tome07_page04",
            ["Tome07 Page05"] = "tome07_page05",
            ["Tome07 Page06"] = "tome07_page06",
            ["Tome07 Page07"] = "tome07_page07",
            ["Tome07 Page08"] = "tome07_page08",
            ["Tome07 Page09"] = "tome07_page09",
            ["Tome07 Page10"] = "tome07_page10",
            ["Tome07 Page11"] = "tome07_page11",
            ["Tome07 Page12"] = "tome07_page12",
            ["Tome07 Page13"] = "tome07_page13",
            ["Tome07 Page14"] = "tome07_page14",
            ["Tome07 Page15"] = "tome07_page15",
            ["Tome07 Page16"] = "tome07_page16",
            ["Tome07 Page17"] = "tome07_page17",
        },
        ["article_8"] = {
            ["Tome08 Page01"] = "tome08_page01",
            ["Tome08 Page02"] = "tome08_page02",
            ["Tome08 Page03"] = "tome08_page03",
            ["Tome08 Page04"] = "tome08_page04",
            ["Tome08 Page05"] = "tome08_page05",
            ["Tome08 Page06"] = "tome08_page06",
            ["Tome08 Page07"] = "tome08_page07",
            ["Tome08 Page08"] = "tome08_page08",
            ["Tome08 Page09"] = "tome08_page09",
            ["Tome08 Page10"] = "tome08_page10",
            ["Tome08 Page11"] = "tome08_page11",
            ["Tome08 Page12"] = "tome08_page12",
            ["Tome08 Page13"] = "tome08_page13",
        },
        ["article_9"] = {
            ["Tome09 Page01"] = "tome09_page01",
            ["Tome09 Page02"] = "tome09_page02",
            ["Tome09 Page03"] = "tome09_page03",
            ["Tome09 Page04"] = "tome09_page04",
            ["Tome09 Page05"] = "tome09_page05",
        },
    },
    ["Trophy Head Collections"] = {
        ["Aissa Head"] = "aissa_head",
        ["Chest Trophy"] = "chest_trophy",
        ["Cursed Lady Head"] = "cursed_lady_head",
        ["Eisenhorn Head"] = "eisenhorn_head",
        ["Halt Head"] = "halt_head",
        ["Harid Head"] = "harid_head",
        ["Karn Head"] = "karn_head",
        ["Rogvold Head"] = "rogvold_head",
    },
    ["Weapons"] = {
        ["Bomb"] = {
            ["Bomb"] = "bomb",
            ["Powder Barrel"] = "powder_barrel",
            ["Powder Charge"] = "powder_charge",
        },
        ["Runetraps"] = {
            ["Beartrap"] = "beartrap",
            ["Beartrap Copper"] = "beartrap_copper",
            ["Runetrap Fire"] = "runetrap_fire",
            ["Runetrap Freeze"] = "runetrap_freeze",
        },
        ["Shields Collections"] = {
            ["Shield Black"] = "shield_black",
            ["Shield Buckler"] = "shield_buckler",
            ["Shield Compound"] = "shield_compound",
            ["Shield Emperor"] = "shield_emperor",
            ["Shield Fear"] = "shield_fear",
            ["Shield Fire"] = "shield_fire",
            ["Shield Fire Black"] = "shield_fire_black",
            ["Shield Frost"] = "shield_frost",
            ["Shield Gladiator"] = "shield_gladiator",
            ["Shield Heavy"] = "shield_heavy",
            ["Shield Heavy Templar"] = "shield_heavy_templar",
            ["Shield Leather"] = "shield_leather",
            ["Shield Light"] = "shield_light",
            ["Shield Poison"] = "shield_poison",
            ["Shield Stun"] = "shield_stun",
            ["Shield Templar"] = "shield_templar",
            ["Shield Wicker"] = "shield_wicker",
        },
        ["Axe weapon"] = {
            ["Axe"] = "axe",
            ["Axe Berserk 2h"] = "axe_berserk_2h",
            ["Axe Headhunter"] = "axe_headhunter",
            ["Axe Master"] = "axe_master",
            ["Axe Squealing"] = "axe_squealing",
            ["Axe Torture"] = "axe_torture",
            ["Axe War"] = "axe_war",
            ["Throw Axe"] = "throw_axe",
        },
        ["Grenade"] = {
            ["Grenade Freeze"] = "grenade_freeze",
            ["Grenade Poison"] = "grenade_poison",
            ["Grenade Pumpkin"] = "grenade_pumpkin",
        },
        ["weapon black"] = {
            ["Axe Master Black"] = "axe_master_black",
            ["Axe Torture Black"] = "axe_torture_black",
            ["Black Flamberg"] = "black_flamberg",
            ["Black Halberd"] = "black_halberd",
            ["Black Halberd Grind5"] = "black_halberd_grind5",
            ["Black Poleaxe"] = "black_poleaxe",
            ["Black Poleaxe Grind5"] = "black_poleaxe_grind5",
            ["Black Scimitar"] = "black_scimitar",
            ["Black Scimitar Grind5"] = "black_scimitar_grind5",
            ["Black Shuko"] = "black_shuko",
            ["Bow Composite Black"] = "bow_composite_black",
            ["Claymore Black"] = "claymore_black",
            ["Claymore Black Grind5"] = "claymore_black_grind5",
            ["Glaive Black"] = "glaive_black",
            ["Katana Black"] = "katana_black",
            ["Katana Black Grind5"] = "katana_black_grind5",
            ["Throw Axe Black"] = "throw_axe_black",
        },
        ["Bow"] = {
            ["Bow Bone"] = "bow_bone",
            ["Bow Composite"] = "bow_composite",
            ["Bow Simple"] = "bow_simple",
            ["Crossbow Crow"] = "crossbow_crow",
            ["Crossbow Heavy"] = "crossbow_heavy",
            ["Crossbow Light"] = "crossbow_light",
            ["Crossbow Simple"] = "crossbow_simple",
        },
        ["weapon Decay"] = {
            ["Axe Blight"] = "axe_blight",
            ["Blight Sword"] = "blight_sword",
            ["Bow Blight"] = "bow_blight",
            ["Dagger Blight"] = "dagger_blight",
            ["Greatsword Blight"] = "greatsword_blight",
            ["Knuckles Blight"] = "knuckles_blight",
            ["Mace Blight 2h"] = "mace_blight_2h",
        },
        ["weapon Durable"] = {
            ["Dagger Durable"] = "dagger_durable",
            ["Hammer Durable"] = "hammer_durable",
            ["Mace Durable"] = "mace_durable",
            ["Pitchfork Durable"] = "pitchfork_durable",
        },
        ["Fire"] = {
            ["Flaming Bow"] = "flaming_bow",
            ["Flaming Flamberg"] = "flaming_flamberg",
            ["Flaming Halberd"] = "flaming_halberd",
            ["Flaming Hammer"] = "flaming_hammer",
            ["Flaming Partisan"] = "flaming_partisan",
            ["Flaming Sword"] = "flaming_sword",
        },
        ["Frost"] = {
            ["Axe Frost"] = "axe_frost",
            ["Bow Frost"] = "bow_frost",
            ["Dagger Frost"] = "dagger_frost",
            ["Frost Sword"] = "frost_sword",
            ["Glaive Frost"] = "glaive_frost",
            ["Halberd Frost"] = "halberd_frost",
            ["Mace Frost"] = "mace_frost",
            ["Scythe Frost"] = "scythe_frost",
        },
        ["weapon grind max"] = {
            ["Bastard Grind5"] = "bastard_grind5",
            ["Claymore Grind5"] = "claymore_grind5",
            ["Dagger Grind5"] = "dagger_grind5",
            ["Espadon Grind5"] = "espadon_grind5",
            ["Falchion Grind5"] = "falchion_grind5",
            ["Falchion Killer Grind5"] = "falchion_killer_grind5",
            ["Halberd Grind5"] = "halberd_grind5",
            ["Jambia Grind5"] = "jambia_grind5",
            ["Katana Grind5"] = "katana_grind5",
            ["Khopesh Grind5"] = "khopesh_grind5",
            ["Kriegsmesser Grind5"] = "kriegsmesser_grind5",
            ["Poleaxe Grind5"] = "poleaxe_grind5",
            ["Rapier Grind5"] = "rapier_grind5",
            ["Ritterschwert Grind5"] = "ritterschwert_grind5",
            ["Scimitar Grind5"] = "scimitar_grind5",
            ["Sickle Grind5"] = "sickle_grind5",
            ["Spear Grind5"] = "spear_grind5",
            ["Sword Crusher Grind5"] = "sword_crusher_grind5",
            ["Sword Grind5"] = "sword_grind5",
            ["Yataghan Grind5"] = "yataghan_grind5",
        },
        ["weapon mix"] = {
            ["Bastard"] = "bastard",
            ["Bastard Grind1"] = "bastard_grind1",
            ["Bastard Grind2"] = "bastard_grind2",
            ["Bastard Grind3"] = "bastard_grind3",
            ["Bastard Grind4"] = "bastard_grind4",
            ["Bastard Iron"] = "bastard_iron",
            ["Black Halberd Grind1"] = "black_halberd_grind1",
            ["Black Halberd Grind2"] = "black_halberd_grind2",
            ["Black Halberd Grind3"] = "black_halberd_grind3",
            ["Black Halberd Grind4"] = "black_halberd_grind4",
            ["Black Poleaxe Grind1"] = "black_poleaxe_grind1",
            ["Black Poleaxe Grind2"] = "black_poleaxe_grind2",
            ["Black Poleaxe Grind3"] = "black_poleaxe_grind3",
            ["Black Poleaxe Grind4"] = "black_poleaxe_grind4",
            ["Black Scimitar Grind1"] = "black_scimitar_grind1",
            ["Black Scimitar Grind2"] = "black_scimitar_grind2",
            ["Black Scimitar Grind3"] = "black_scimitar_grind3",
            ["Black Scimitar Grind4"] = "black_scimitar_grind4",
            ["Bone Sword"] = "bone_sword",
            ["Broom"] = "broom",
            ["Butcher Cleaver"] = "butcher_cleaver",
            ["Claymore"] = "claymore",
            ["Claymore Black Grind1"] = "claymore_black_grind1",
            ["Claymore Black Grind2"] = "claymore_black_grind2",
            ["Claymore Black Grind3"] = "claymore_black_grind3",
            ["Claymore Black Grind4"] = "claymore_black_grind4",
            ["Claymore Grind1"] = "claymore_grind1",
            ["Claymore Grind2"] = "claymore_grind2",
            ["Claymore Grind3"] = "claymore_grind3",
            ["Claymore Grind4"] = "claymore_grind4",
            ["Claymore Silver"] = "claymore_silver",
            ["Cudgel"] = "cudgel",
            ["Dagger"] = "dagger",
            ["Dagger Grind1"] = "dagger_grind1",
            ["Dagger Grind2"] = "dagger_grind2",
            ["Dagger Grind3"] = "dagger_grind3",
            ["Dagger Grind4"] = "dagger_grind4",
            ["Dagger Poisoned"] = "dagger_poisoned",
            ["Dawn Blades"] = "dawn_blades",
            ["Enlightener"] = "enlightener",
            ["Espadon"] = "espadon",
            ["Espadon Grind1"] = "espadon_grind1",
            ["Espadon Grind2"] = "espadon_grind2",
            ["Espadon Grind3"] = "espadon_grind3",
            ["Espadon Grind4"] = "espadon_grind4",
            ["Falchion"] = "falchion",
            ["Falchion Grind1"] = "falchion_grind1",
            ["Falchion Grind2"] = "falchion_grind2",
            ["Falchion Grind3"] = "falchion_grind3",
            ["Falchion Grind4"] = "falchion_grind4",
            ["Falchion Killer"] = "falchion_killer",
            ["Falchion Killer Grind1"] = "falchion_killer_grind1",
            ["Falchion Killer Grind2"] = "falchion_killer_grind2",
            ["Falchion Killer Grind3"] = "falchion_killer_grind3",
            ["Falchion Killer Grind4"] = "falchion_killer_grind4",
            ["Ghost King Sword"] = "ghost_king_sword",
            ["Ghost Sword"] = "ghost_sword",
            ["Glaive"] = "glaive",
            ["Guisarme"] = "guisarme",
            ["Halberd"] = "halberd",
            ["Halberd Grind1"] = "halberd_grind1",
            ["Halberd Grind2"] = "halberd_grind2",
            ["Halberd Grind3"] = "halberd_grind3",
            ["Halberd Grind4"] = "halberd_grind4",
            ["Hammer"] = "hammer",
            ["Hatchet"] = "hatchet",
            ["Hatchet Artisan"] = "hatchet_artisan",
            ["Hatchet Bronze"] = "hatchet_bronze",
            ["Hoe"] = "hoe",
            ["Jambia"] = "jambia",
            ["Jambia Grind1"] = "jambia_grind1",
            ["Jambia Grind2"] = "jambia_grind2",
            ["Jambia Grind3"] = "jambia_grind3",
            ["Jambia Grind4"] = "jambia_grind4",
            ["Katana"] = "katana",
            ["Katana Black Grind1"] = "katana_black_grind1",
            ["Katana Black Grind2"] = "katana_black_grind2",
            ["Katana Black Grind3"] = "katana_black_grind3",
            ["Katana Black Grind4"] = "katana_black_grind4",
            ["Katana Grind1"] = "katana_grind1",
            ["Katana Grind2"] = "katana_grind2",
            ["Katana Grind3"] = "katana_grind3",
            ["Katana Grind4"] = "katana_grind4",
            ["Khopesh"] = "khopesh",
            ["Khopesh Grind1"] = "khopesh_grind1",
            ["Khopesh Grind2"] = "khopesh_grind2",
            ["Khopesh Grind3"] = "khopesh_grind3",
            ["Khopesh Grind4"] = "khopesh_grind4",
            ["Kriegsmesser"] = "kriegsmesser",
            ["Kriegsmesser Grind1"] = "kriegsmesser_grind1",
            ["Kriegsmesser Grind2"] = "kriegsmesser_grind2",
            ["Kriegsmesser Grind3"] = "kriegsmesser_grind3",
            ["Kriegsmesser Grind4"] = "kriegsmesser_grind4",
            ["Kris"] = "kris",
            ["Mace"] = "mace",
            ["Mace Aztec"] = "mace_aztec",
            ["Mace Cursed"] = "mace_cursed",
            ["Mace Fist"] = "mace_fist",
            ["Mace Soul"] = "mace_soul",
            ["Markus Dagger"] = "markus_dagger",
            ["Morgenstern"] = "morgenstern",
            ["Morgenstern Novice"] = "morgenstern_novice",
            ["Nagamaki"] = "nagamaki",
            ["Nguest Sickle"] = "nguest_sickle",
            ["Paddle"] = "paddle",
            ["Pernach"] = "pernach",
            ["Pernach Novice"] = "pernach_novice",
            ["Pickaxe"] = "pickaxe",
            ["Pickaxe Artisan"] = "pickaxe_artisan",
            ["Pickaxe Bronze"] = "pickaxe_bronze",
            ["Pitchfork"] = "pitchfork",
            ["Poleaxe"] = "poleaxe",
            ["Poleaxe Grind1"] = "poleaxe_grind1",
            ["Poleaxe Grind2"] = "poleaxe_grind2",
            ["Poleaxe Grind3"] = "poleaxe_grind3",
            ["Poleaxe Grind4"] = "poleaxe_grind4",
            ["Rapier"] = "rapier",
            ["Rapier Grind1"] = "rapier_grind1",
            ["Rapier Grind2"] = "rapier_grind2",
            ["Rapier Grind3"] = "rapier_grind3",
            ["Rapier Grind4"] = "rapier_grind4",
            ["Ritterschwert"] = "ritterschwert",
            ["Ritterschwert Grind1"] = "ritterschwert_grind1",
            ["Ritterschwert Grind2"] = "ritterschwert_grind2",
            ["Ritterschwert Grind3"] = "ritterschwert_grind3",
            ["Ritterschwert Grind4"] = "ritterschwert_grind4",
            ["Royal mace"] = "kamiz",
            ["Rupert Sword"] = "rupert_sword",
            ["Scimitar"] = "scimitar",
            ["Scimitar Grind1"] = "scimitar_grind1",
            ["Scimitar Grind2"] = "scimitar_grind2",
            ["Scimitar Grind3"] = "scimitar_grind3",
            ["Scimitar Grind4"] = "scimitar_grind4",
            ["Scythe"] = "scythe",
            ["Scythe Fire"] = "scythe_fire",
            ["Scythe Moon"] = "scythe_moon",
            ["Shovel"] = "shovel",
            ["Shovel Monk"] = "shovel_monk",
            ["Shuko"] = "shuko",
            ["Sickle"] = "sickle",
            ["Sickle Grind1"] = "sickle_grind1",
            ["Sickle Grind2"] = "sickle_grind2",
            ["Sickle Grind3"] = "sickle_grind3",
            ["Sickle Grind4"] = "sickle_grind4",
            ["Skull Crusher"] = "skull_crusher",
            ["Smasher"] = "smasher",
            ["Soul Eater"] = "soul_eater",
            ["Spear"] = "spear",
            ["Spear Crit"] = "spear_crit",
            ["Spear Grind1"] = "spear_grind1",
            ["Spear Grind2"] = "spear_grind2",
            ["Spear Grind3"] = "spear_grind3",
            ["Spear Grind4"] = "spear_grind4",
            ["Stiletto"] = "stiletto",
            ["Strong Cudgel"] = "strong_cudgel",
            ["Strong Mace"] = "strong_mace",
            ["Sword"] = "sword",
            ["Sword Crusher"] = "sword_crusher",
            ["Sword Crusher Grind1"] = "sword_crusher_grind1",
            ["Sword Crusher Grind2"] = "sword_crusher_grind2",
            ["Sword Crusher Grind3"] = "sword_crusher_grind3",
            ["Sword Crusher Grind4"] = "sword_crusher_grind4",
            ["Sword Emperor"] = "sword_emperor",
            ["Sword Grind1"] = "sword_grind1",
            ["Sword Grind2"] = "sword_grind2",
            ["Sword Grind3"] = "sword_grind3",
            ["Sword Grind4"] = "sword_grind4",
            ["Templar Sword"] = "templar_sword",
            ["Temple Torch"] = "temple_torch",
            ["Thunder Knuckle"] = "thunder_knuckle",
            ["Torch"] = "torch",
            ["Trident Poison"] = "trident_poison",
            ["Waggon Thill"] = "waggon_thill",
            ["Warpick"] = "warpick",
            ["Watcher Sword"] = "watcher_sword",
            ["Wooden Sword"] = "wooden_sword",
            ["Yataghan"] = "yataghan",
            ["Yataghan Grind1"] = "yataghan_grind1",
            ["Yataghan Grind2"] = "yataghan_grind2",
            ["Yataghan Grind3"] = "yataghan_grind3",
            ["Yataghan Grind4"] = "yataghan_grind4",
        },
    },
    ["Equipment armors"] = {
        ["armor_mix"] = {
            ["Ailette Shirt"] = "ailette_shirt",
            ["Barbute Hat"] = "barbute_hat",
            ["Bechter Shirt"] = "bechter_shirt",
            ["Chaperon Hat"] = "chaperon_hat",
            ["Doublet Shirt"] = "doublet_shirt",
            ["Horned Hat"] = "horned_hat",
            ["Hw Coat"] = "hw_coat",
            ["Keeper Hat"] = "keeper_hat",
            ["Pullen Boots"] = "pullen_boots",
            ["Pumpkin Hat"] = "pumpkin_hat",
            ["Scout Boots"] = "scout_boots",
            ["Scout Shirt"] = "scout_shirt",
            ["Straw Hat"] = "straw_hat",
        },
        ["aventail"] = {
            ["Aventail Boots"] = "aventail_boots",
            ["Aventail Gloves"] = "aventail_gloves",
            ["Aventail Hat"] = "aventail_hat",
            ["Aventail Pants"] = "aventail_pants",
            ["Aventail Shirt"] = "aventail_shirt",
        },
        ["bard"] = {
            ["Bard Boots"] = "bard_boots",
            ["Bard Gloves"] = "bard_gloves",
            ["Bard Hat"] = "bard_hat",
            ["Bard Pants"] = "bard_pants",
            ["Bard Shirt"] = "bard_shirt",
        },
        ["bear"] = {
            ["Bear Boots"] = "bear_boots",
            ["Bear Gloves"] = "bear_gloves",
            ["Bear Hat"] = "bear_hat",
            ["Bear Pants"] = "bear_pants",
            ["Bear Shirt"] = "bear_shirt",
        },
        ["black_scaly"] = {
            ["Black Scaly Boots"] = "black_scaly_boots",
            ["Black Scaly Gloves"] = "black_scaly_gloves",
            ["Black Scaly Hat"] = "black_scaly_hat",
            ["Black Scaly Pants"] = "black_scaly_pants",
            ["Black Scaly Shirt"] = "black_scaly_shirt",
        },
        ["black_templar"] = {
            ["Black Templar Boots"] = "black_templar_boots",
            ["Black Templar Gloves"] = "black_templar_gloves",
            ["Black Templar Hat"] = "black_templar_hat",
            ["Black Templar Pants"] = "black_templar_pants",
            ["Black Templar Shirt"] = "black_templar_shirt",
        },
        ["black_warrior"] = {
            ["Black Warrior Boots"] = "black_warrior_boots",
            ["Black Warrior Gloves"] = "black_warrior_gloves",
            ["Black Warrior Hat"] = "black_warrior_hat",
            ["Black Warrior Pants"] = "black_warrior_pants",
            ["Black Warrior Shirt"] = "black_warrior_shirt",
        },
        ["brigants"] = {
            ["Brigant Boots"] = "brigant_boots",
            ["Brigant Gloves"] = "brigant_gloves",
            ["Brigant Hat"] = "brigant_hat",
            ["Brigant Pants"] = "brigant_pants",
            ["Brigant Shirt"] = "brigant_shirt",
        },
        ["chainmail"] = {
            ["Chainmail Boots"] = "chainmail_boots",
            ["Chainmail Gloves"] = "chainmail_gloves",
            ["Chainmail Hat"] = "chainmail_hat",
            ["Chainmail Pants"] = "chainmail_pants",
            ["Chainmail Shirt"] = "chainmail_shirt",
        },
        ["chainscaly"] = {
            ["Chainscaly Boots"] = "chainscaly_boots",
            ["Chainscaly Gloves"] = "chainscaly_gloves",
            ["Chainscaly Hat"] = "chainscaly_hat",
            ["Chainscaly Pants"] = "chainscaly_pants",
            ["Chainscaly Shirt"] = "chainscaly_shirt",
        },
        ["citizen"] = {
            ["Citizen Boots"] = "citizen_boots",
            ["Citizen Gloves"] = "citizen_gloves",
            ["Citizen Hat"] = "citizen_hat",
            ["Citizen Pants"] = "citizen_pants",
            ["Citizen Shirt"] = "citizen_shirt",
        },
        ["diplomat"] = {
            ["Diplomat Boots"] = "diplomat_boots",
            ["Diplomat Gloves"] = "diplomat_gloves",
            ["Diplomat Hat"] = "diplomat_hat",
            ["Diplomat Pants"] = "diplomat_pants",
            ["Diplomat Shirt"] = "diplomat_shirt",
        },
        ["dragon"] = {
            ["Dragon Boots"] = "dragon_boots",
            ["Dragon Gloves"] = "dragon_gloves",
            ["Dragon Hat"] = "dragon_hat",
            ["Dragon Pants"] = "dragon_pants",
            ["Dragon Shirt"] = "dragon_shirt",
        },
        ["duelist"] = {
            ["Duelist Boots"] = "duelist_boots",
            ["Duelist Gloves"] = "duelist_gloves",
            ["Duelist Hat"] = "duelist_hat",
            ["Duelist Pants"] = "duelist_pants",
            ["Duelist Shirt"] = "duelist_shirt",
        },
        ["east_champion"] = {
            ["East Champion Boots"] = "east_champion_boots",
            ["East Champion Gloves"] = "east_champion_gloves",
            ["East Champion Hat"] = "east_champion_hat",
            ["East Champion Pants"] = "east_champion_pants",
            ["East Champion Shirt"] = "east_champion_shirt",
        },
        ["executioner"] = {
            ["Executioner Boots"] = "executioner_boots",
            ["Executioner Gloves"] = "executioner_gloves",
            ["Executioner Hat"] = "executioner_hat",
            ["Executioner Pants"] = "executioner_pants",
            ["Executioner Shirt"] = "executioner_shirt",
        },
        ["gladiator"] = {
            ["Gladiator Boots"] = "gladiator_boots",
            ["Gladiator Gloves"] = "gladiator_gloves",
            ["Gladiator Hat"] = "gladiator_hat",
            ["Gladiator Pants"] = "gladiator_pants",
            ["Gladiator Shirt"] = "gladiator_shirt",
        },
        ["ice"] = {
            ["Ice Boots"] = "ice_boots",
            ["Ice Gloves"] = "ice_gloves",
            ["Ice Hat"] = "ice_hat",
            ["Ice Pants"] = "ice_pants",
            ["Ice Shirt"] = "ice_shirt",
        },
        ["leather"] = {
            ["Leather Boots"] = "leather_boots",
            ["Leather Gloves"] = "leather_gloves",
            ["Leather Hat"] = "leather_hat",
            ["Leather Pants"] = "leather_pants",
            ["Leather Shirt"] = "leather_shirt",
        },
        ["mourning_reaper"] = {
            ["Mourning Reaper Boots"] = "mourning_reaper_boots",
            ["Mourning Reaper Gloves"] = "mourning_reaper_gloves",
            ["Mourning Reaper Hat"] = "mourning_reaper_hat",
            ["Mourning Reaper Pants"] = "mourning_reaper_pants",
            ["Mourning Reaper Shirt"] = "mourning_reaper_shirt",
        },
        ["night_stalker"] = {
            ["Night Stalker Boots"] = "night_stalker_boots",
            ["Night Stalker Gloves"] = "night_stalker_gloves",
            ["Night Stalker Hat"] = "night_stalker_hat",
            ["Night Stalker Pants"] = "night_stalker_pants",
            ["Night Stalker Shirt"] = "night_stalker_shirt",
        },
        ["noker"] = {
            ["Noker Boots"] = "noker_boots",
            ["Noker Gloves"] = "noker_gloves",
            ["Noker Hat"] = "noker_hat",
            ["Noker Pants"] = "noker_pants",
            ["Noker Shirt"] = "noker_shirt",
        },
        ["piligrim"] = {
            ["Piligrim Boots"] = "piligrim_boots",
            ["Piligrim Gloves"] = "piligrim_gloves",
            ["Piligrim Hat"] = "piligrim_hat",
            ["Piligrim Pants"] = "piligrim_pants",
            ["Piligrim Shirt"] = "piligrim_shirt",
        },
        ["plague"] = {
            ["Plague Boots"] = "plague_boots",
            ["Plague Gloves"] = "plague_gloves",
            ["Plague Hat"] = "plague_hat",
            ["Plague Pants"] = "plague_pants",
            ["Plague Shirt"] = "plague_shirt",
        },
        ["scaly"] = {
            ["Scaly Boots"] = "scaly_boots",
            ["Scaly Gloves"] = "scaly_gloves",
            ["Scaly Hat"] = "scaly_hat",
            ["Scaly Pants"] = "scaly_pants",
            ["Scaly Shirt"] = "scaly_shirt",
        },
        ["scarlet_angel"] = {
            ["Scarlet Angel Boots"] = "scarlet_angel_boots",
            ["Scarlet Angel Gloves"] = "scarlet_angel_gloves",
            ["Scarlet Angel Hat"] = "scarlet_angel_hat",
            ["Scarlet Angel Pants"] = "scarlet_angel_pants",
            ["Scarlet Angel Shirt"] = "scarlet_angel_shirt",
        },
        ["simple"] = {
            ["Simple Boots"] = "simple_boots",
            ["Simple Gloves"] = "simple_gloves",
            ["Simple Hat"] = "simple_hat",
            ["Simple Pants"] = "simple_pants",
            ["Simple Shirt"] = "simple_shirt",
        },
        ["snow_hunter"] = {
            ["Snow Hunter Boots"] = "snow_hunter_boots",
            ["Snow Hunter Gloves"] = "snow_hunter_gloves",
            ["Snow Hunter Hat"] = "snow_hunter_hat",
            ["Snow Hunter Pants"] = "snow_hunter_pants",
            ["Snow Hunter Shirt"] = "snow_hunter_shirt",
        },
        ["soldier"] = {
            ["Soldier Boots"] = "soldier_boots",
            ["Soldier Gloves"] = "soldier_gloves",
            ["Soldier Hat"] = "soldier_hat",
            ["Soldier Pants"] = "soldier_pants",
            ["Soldier Shirt"] = "soldier_shirt",
        },
        ["spikes_armor"] = {
            ["Spikes Boots"] = "spikes_boots",
            ["Spikes Gloves"] = "spikes_gloves",
            ["Spikes Hat"] = "spikes_hat",
            ["Spikes Pants"] = "spikes_pants",
            ["Spikes Shirt"] = "spikes_shirt",
        },
        ["templar"] = {
            ["Templar Boots"] = "templar_boots",
            ["Templar Gloves"] = "templar_gloves",
            ["Templar Hat"] = "templar_hat",
            ["Templar Pants"] = "templar_pants",
            ["Templar Shirt"] = "templar_shirt",
        },
        ["thunderlords"] = {
            ["Thunderlord Boots"] = "thunderlord_boots",
            ["Thunderlord Gloves"] = "thunderlord_gloves",
            ["Thunderlord Hat"] = "thunderlord_hat",
            ["Thunderlord Pants"] = "thunderlord_pants",
            ["Thunderlord Shirt"] = "thunderlord_shirt",
        },
        ["warlock"] = {
            ["Warlock Boots"] = "warlock_boots",
            ["Warlock Gloves"] = "warlock_gloves",
            ["Warlock Hat"] = "warlock_hat",
            ["Warlock Pants"] = "warlock_pants",
            ["Warlock Shirt"] = "warlock_shirt",
        },
        ["winter"] = {
            ["Winter Boots"] = "winter_boots",
            ["Winter Gloves"] = "winter_gloves",
            ["Winter Hat"] = "winter_hat",
            ["Winter Hat Blue"] = "winter_hat_blue",
            ["Winter Pants"] = "winter_pants",
            ["Winter Shirt"] = "winter_shirt",
        },
        ["xmas"] = {
            ["Xmas Boots"] = "xmas_boots",
            ["Xmas Gloves"] = "xmas_gloves",
            ["Xmas Hat"] = "xmas_hat",
            ["Xmas Pants"] = "xmas_pants",
            ["Xmas Shirt"] = "xmas_shirt",
        },
    },
    ["furniture Special"] = {
        ["Altar"] = "altar",
        ["Bed"] = "bed",
        ["Blast Furnace"] = "blast_furnace",
        ["Chest Trophy"] = "chest_trophy",
        ["Dinner Table"] = "dinner_table",
        ["Fireplace"] = "fireplace",
        ["Rack Armor"] = "rack_armor",
        ["Rack Armor Elite"] = "rack_armor_elite",
        ["Rack Weapon"] = "rack_weapon",
        ["Rack Weapon Elite"] = "rack_weapon_elite",
        ["Scarecrow"] = "scarecrow",
        ["Strappado"] = "strappado",
        ["Throne Frozen"] = "throne_frozen",
        ["Torture Chair"] = "torture_chair",
        ["Workbench Alchemist"] = "workbench_alchemist",
        ["Workbench Armor"] = "workbench_armor",
        ["Workbench Grind"] = "workbench_grind",
        ["Workbench Mapmaker"] = "workbench_mapmaker",
        ["Workbench Weapon"] = "workbench_weapon",
        ["Xmas Tree"] = "xmas_tree",
    },
    ["Token"] = {
        ["Token Harat"] = "token_harat",
        ["Token Nameless"] = "token_nameless",
        ["Token Plague"] = "token_plague",
    },

    
 
    
    
    
}





-- ==================== UTILITY MODULE ====================
local Utility = {}

function Utility.safe_open(path, mode)
    local f, err = io.open(path, mode)
    if not f then
        gg.toast("❌ Failed to open file: " .. (err or "unknown"))
        return nil
    end
    return f
end

function Utility.safe_load_file(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local chunk = f:read("*a")
    f:close()
    local fn = load(chunk)
    if not fn then return nil end
    local ok, data = pcall(fn)
    return (ok and type(data)=="table") and data or nil
end

function Utility.text_to_hex_utf16le(str)
    local hex_arr = {}
    for i = 1, #str do
        local b = string.byte(str, i)
        table.insert(hex_arr, string.format("%02X 00", b))
    end
    return "h " .. table.concat(hex_arr, " ")
end

function Utility.show_toast(message, duration)
    gg.toast(message)
    gg.sleep(duration or 800)
end

function Utility.show_alert(title, message)
    gg.alert(message, title)
end

-- ==================== DATA MODULE ====================
local Data = {}

function Data.load()
    return ITEM_LIST_DATA
end

function Data.get_item_count()
    local count = 0
    local function count_Items(tbl)
        for _, v in pairs(tbl) do
            if type(v) == "table" then
                count_Items(v)
            elseif type(v) == "string" then
                count = count + 1
            end
        end
    end
    count_Items(ITEM_LIST_DATA)
    return count
end

-- ==================== UTF16 READER MODULE ====================
local Reader = {}

function Reader.utf16_to_utf8(cp_list)
    local out = {}
    for _, cp in ipairs(cp_list) do
        if cp <= 0x7F then
            table.insert(out, string.char(cp))
        elseif cp <= 0x7FF then
            table.insert(out, string.char(
                0xC0 + math.floor(cp/0x40),
                0x80 + (cp%0x40)
            ))
        elseif cp <= 0xFFFF then
            table.insert(out, string.char(
                0xE0 + math.floor(cp/0x1000),
                0x80 + (math.floor(cp/0x40)%0x40),
                0x80 + (cp%0x40)
            ))
        else
            table.insert(out, string.char(
                0xF0 + math.floor(cp/0x40000),
                0x80 + (math.floor(cp/0x1000)%0x40),
                0x80 + (math.floor(cp/0x40)%0x40),
                0x80 + (cp%0x40)
            ))
        end
    end
    return table.concat(out)
end

function Reader.read_utf16_string_at(addr)
    local addrs = {}
    
    -- Read before
    for i = Config.READ_LIMIT, 1, -1 do
        table.insert(addrs, addr - (i * 2))
    end
    
    -- Current address
    table.insert(addrs, addr)
    local mid = #addrs
    
    -- Read after
    for i = 1, Config.READ_LIMIT do
        table.insert(addrs, addr + (i * 2))
    end
    
    -- Read values
    local q = {}
    for _, a in ipairs(addrs) do
        table.insert(q, {address = a, flags = gg.TYPE_WORD})
    end
    
    local ok, vals = pcall(gg.getValues, q)
    if not ok then return "" end
    
    -- Convert
    local cu = {}
    for i, v in ipairs(vals) do
        cu[i] = (v.value < 0 and v.value + 0x10000 or v.value)
    end
    
    -- Find boundaries
    local s_i, e_i
    
    for i = mid, 1, -1 do
        if cu[i] == 0 then
            s_i = i + 1
            break
        end
    end
    s_i = s_i or 1
    
    for i = mid, #cu do
        if cu[i] == 0 then
            e_i = i - 1
            break
        end
    end
    e_i = e_i or #cu
    
    -- Extract string
    local slice = {}
    for i = s_i, e_i do
        if cu[i] ~= 0 then
            table.insert(slice, cu[i])
        end
    end
    
    if #slice == 0 then return "" end
    
    return Reader.utf16_to_utf8(slice):gsub("^%s+", ""):gsub("%s+$", "")
end


-- ==================== CLEANER MODULE (FIXED) ====================
local Cleaner = {}


function Cleaner.remove_all_temp_Items()
    local saved_Items = gg.getListItems()
    if not saved_Items or #saved_Items == 0 then
        return 0
    end
    
    local to_remove = {}
    
    -- HAPUS SEMUA TEMP Items KECUALI POINTER UTAMA
    for _, item in ipairs(saved_Items) do
        if item.name then
            -- Hapus semua temporary Items
            if item.name:find("^%[TEMP%]") or
               item.name:find("^Refine Result") or
               item.name:find("^BACKUP ") or
               item.name:find("^RESTORED ") or
               item.name:find("%[PET SKILL%]") or  -- TAMBAHAN
               item.name:find("^PET BACKUP ") or    -- TAMBAHAN
               item.name:find("^PET RESTORED ") then -- TAMBAHAN
                -- TAPI JANGAN HAPUS POINTER UTAMA!
                if not item.name:find("PTR →") and not item.name:find("PET PTR →") then
                    table.insert(to_remove, item.id)
                end
            end
        end
    end
    
    if #to_remove > 0 then
        pcall(gg.removeListItemsByIds, to_remove)
        return #to_remove
    end
    
    return 0
end

function Cleaner.remove_temp_item_entries()
    return Cleaner.remove_all_temp_Items()  -- Pakai fungsi yang sama
end

function Cleaner.remove_old_backups()
    local saved_Items = gg.getListItems()
    if not saved_Items or #saved_Items == 0 then
        return 0
    end
    
    local backups = {}
    local to_remove = {}
    
    -- Collect backup Items
    for _, item in ipairs(saved_Items) do
        if item.name and item.name:find("^BACKUP ") then
            table.insert(backups, {id = item.id, name = item.name})
        end
    end
    
    -- Remove oldest if exceed limit
    if #backups > MAX_BACKUP_Items then
        local excess = #backups - MAX_BACKUP_Items
        for i = 1, excess do
            if backups[i] then
                table.insert(to_remove, backups[i].id)
            end
        end
    end
    
    if #to_remove > 0 then
        pcall(gg.removeListItemsByIds, to_remove)
        return #to_remove
    end
    
    return 0
end

function Cleaner.preserve_main_pointers()
    local saved_Items = gg.getListItems()
    if not saved_Items or #saved_Items == 0 then
        return {}
    end
    
    local main_pointers = {}
    
    for _, item in ipairs(saved_Items) do
        if item.name and item.name:find("PTR →") then
            table.insert(main_pointers, {
                address = item.address,
                flags = item.flags,
                value = item.value,
                name = item.name,
                freeze = item.freeze or false
            })
        end
    end
    
    return main_pointers
end

-- ==================== SORTER MODULE ====================
local Sorter = {}

function Sorter.restore_old_pointer(backup_data)
    if not backup_data or #backup_data == 0 then
        Utility.show_toast("⚠️ No backup data found")
        return false
    end
    
    local restore_list = {}
    local delete_ids = {}
    
    -- Prepare restore values
    for _, item in ipairs(backup_data) do
        table.insert(restore_list, {
            address = item.address,
            flags = item.flags,
            value = item.value,
            name = item.name:gsub("^BACKUP ", "RESTORED ")
        })
    end
    
    -- Get IDs to delete
    local saved_list = gg.getListItems()
    for _, item in ipairs(saved_list) do
        if item.name and item.name:find("^BACKUP ") then
            table.insert(delete_ids, item.id)
        end
    end
    
    -- Restore values
    local ok, err = pcall(gg.setValues, restore_list)
    if not ok then
        Utility.show_alert("Restore Failed", "❌ Failed to restore pointers: " .. tostring(err))
        return false
    end
    
    Utility.show_toast("✅ Restored " .. #restore_list .. " pointers")
    
    -- Cleanup
    gg.sleep(500)
    Cleaner.remove_temp_item_entries()
    
    -- Remove backup Items
    if #delete_ids > 0 then
        pcall(gg.removeListItemsByIds, delete_ids)
    end
    
    return true
end

function Sorter.restore_to_target(target_item_name)
    local hex_pattern = Utility.text_to_hex_utf16le(target_item_name)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    
    Utility.show_toast("🔍 Finding item: " .. target_item_name)
    gg.searchNumber(hex_pattern, gg.TYPE_BYTE)
    gg.sleep(100)
    
    local found = gg.getResultsCount()
    if found > 0 then
        local first_result = gg.getResults(1)
        if first_result and first_result[1] then
            local first_val = first_result[1].value
            gg.refineNumber(tostring(first_val), gg.TYPE_BYTE)
            
            local success = Sorter.run(target_item_name, false)
            
            if success then
                Utility.show_toast("✅ Pointer restored: " .. target_item_name)
                gg.sleep(500)
                Cleaner.remove_temp_item_entries()
            else
                Utility.show_toast("❌ Failed to replace pointer")
            end
        else
            Utility.show_toast("⚠️ Failed to get result")
        end
    else
        Utility.show_toast("⚠️ Item not found: " .. target_item_name)
    end
end


function Sorter.auto_restore(backup_data)
    if not backup_data or #backup_data == 0 then
        Utility.show_toast("⚠️ No backup data for restore")
        return
    end
    
    local delay_seconds = math.floor(RESTORE_DELAY_MS / 1000)
    Utility.show_alert("Auto Restore", "⏳ Replace done! Will restore in " .. delay_seconds .. " seconds")
    gg.sleep(RESTORE_DELAY_MS)
    
    Sorter.restore_old_pointer(backup_data)
    GLOBAL_BACKUP_DATA = nil
    
    -- Final cleanup
    gg.sleep(1000)
    Cleaner.remove_temp_item_entries()
end

function Sorter.run(target_string, enable_auto_restore)
    enable_auto_restore = enable_auto_restore or false
    
    -- Cleanup before process
    Cleaner.remove_old_backups()
    local cleaned = Cleaner.remove_temp_item_entries()
    if cleaned > 0 then
        Utility.show_toast("🧹 Cleaned " .. cleaned .. " temp Items")
    end
    
    local results = gg.getResults(Config.MAX_RESULTS)
    if not results or #results == 0 then
        return false
    end
    
    -- Find string addresses
    local found = {}
    for _, r in ipairs(results) do
        local ok, s = pcall(Reader.read_utf16_string_at, r.address)
        if ok and s ~= "" then
            found[s] = found[s] or {}
            table.insert(found[s], r.address)
        end
    end
    
    local addrs = found[target_string]
    if not addrs or #addrs == 0 then
        if enable_auto_restore then
            Utility.show_alert("Not Found", "⚠️ String '" .. target_string .. "' not found")
        end
        return false
    end
    
    local first_addr = addrs[1]
    
    -- Get pointer info
    local info = gg.getTargetInfo()
    local ptr_type = (info and info.x64) and gg.TYPE_QWORD or gg.TYPE_DWORD
    local offset = (info and info.x64) and 0x14 or 0x0C
    
    -- Find pointers to update
    local saved = gg.getListItems()
    local update_list = {}
    
    for _, v in ipairs(saved) do
        if v.flags == ptr_type and not (v.name and v.name:find("%[TEMP%]")) then
            table.insert(update_list, {
                address = v.address,
                flags = ptr_type,
                name = v.name
            })
        end
    end
    
    if #update_list == 0 then
        if enable_auto_restore then
            Utility.show_alert("No Pointers", "⚠️ No matching pointers found")
        end
        return false
    end
    
    -- Set new values
    for _, u in ipairs(update_list) do
        u.value = first_addr - offset
    end
    
    -- Backup current values
    local backup_raw = {}
    for _, u in ipairs(update_list) do
        local ok, vals = pcall(gg.getValues, {{address = u.address, flags = u.flags}})
        if ok and vals and vals[1] then
            table.insert(backup_raw, {
                address = u.address,
                flags = u.flags,
                value = vals[1].value,
                name = "BACKUP " .. (u.name or "")
            })
        end
    end
    
    -- Save backup if auto-restore enabled
    if enable_auto_restore then
        GLOBAL_BACKUP_DATA = backup_raw
        if #GLOBAL_BACKUP_DATA > 0 then
            gg.addListItems(GLOBAL_BACKUP_DATA)
        end
    end
    
    -- Apply new pointer values
    local ok, err = pcall(gg.setValues, update_list)
    if not ok then
        Utility.show_alert("Update Failed", "❌ Failed to set pointers: " .. tostring(err))
        return false
    end
    
    Utility.show_toast("✅ Updated " .. #update_list .. " pointers")
    
    -- Cleanup temp markers
    gg.sleep(500)
    Cleaner.remove_temp_item_entries()
    
    -- Auto-restore if enabled
    if enable_auto_restore then
        Sorter.auto_restore(GLOBAL_BACKUP_DATA)
    end
    
    return true
end

-- ==================== QUEUE MODULE ====================
local Queue = {}

function Queue.is_in_queue(item_string)
    for _, item in ipairs(ItemQueue) do
        if item.item_string == item_string then
            return true
        end
    end
    return false
end

function Queue.view()
    if #ItemQueue == 0 then
        Utility.show_alert("Queue", "🛒 Queue is empty")
        return
    end
    
    local Items_text = ""
    for i, item_data in ipairs(ItemQueue) do
        Items_text = Items_text .. i .. ". " .. item_data.display_name .. "\n"
    end
    
    Utility.show_alert("Queue (" .. #ItemQueue .. " Items)", Items_text)
end

function Queue.clear()
    if #ItemQueue > 0 then
        ItemQueue = {}
        Utility.show_toast("🗑️ Queue cleared")
    else
        Utility.show_toast("⚠️ Queue already empty")
    end
end

function Queue.add(item_display_name, item_string)
    if Queue.is_in_queue(item_string) then
        Utility.show_toast("⚠️ Item already in queue: " .. item_display_name)
        return false
    end
    
    table.insert(ItemQueue, {
        display_name = item_display_name,
        item_string = item_string
    })
    Utility.show_toast("✅ Added to queue: " .. item_display_name)
    return true
end

function Queue.execute()
    if #ItemQueue == 0 then
        Utility.show_alert("Queue", "⚠️ Queue is empty")
        return
    end
    
    local total_Items = #ItemQueue
    local success_count = 0
    local failure_count = 0
    
    Utility.show_toast("⚡ Processing " .. total_Items .. " Items")
    
    -- Initial cleanup
    gg.sleep(500)
    Cleaner.remove_temp_item_entries()
    
    for i, item_data in ipairs(ItemQueue) do
        local item_name = item_data.item_string
        local display_name = item_data.display_name
        
        Utility.show_toast("⚙️ (" .. i .. "/" .. total_Items .. ") " .. display_name)
        
        -- Search item
        local hex_pattern = Utility.text_to_hex_utf16le(item_name)
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(hex_pattern, gg.TYPE_BYTE)
        gg.sleep(100)
        
        local found = gg.getResultsCount()
        if found > 0 then
            local first_result = gg.getResults(1)
            if first_result and first_result[1] then
                local first_val = first_result[1].value
                gg.refineNumber(tostring(first_val), gg.TYPE_BYTE)
                
                -- Replace pointer
                local success = Sorter.run(item_name, false)
                
                if success then
                    success_count = success_count + 1
                    
                    local delay_sec = math.floor(RESTORE_DELAY_MS / 1000)
                    Utility.show_alert("Item Processed", 
                        "✔️ " .. display_name .. " processed\n" ..
                        "⏳ Restoring in " .. delay_sec .. " seconds")
                    
                    gg.sleep(RESTORE_DELAY_MS)
                    
                    -- Restore to default item
                    Sorter.restore_to_target(Config.TARGET_STRING)
                    
                    -- Cleanup between Items
                    gg.sleep(300)
                    Cleaner.remove_temp_item_entries()
                    gg.sleep(500)
                else
                    failure_count = failure_count + 1
                    Utility.show_toast("❌ Failed: " .. display_name)
                end
            end
        else
            failure_count = failure_count + 1
            Utility.show_toast("❌ Not found: " .. display_name)
        end
    end
    
    -- Final cleanup
    gg.sleep(1000)
    Cleaner.remove_temp_item_entries()
    
    -- Preserve main pointers
    local main_pointers = Cleaner.preserve_main_pointers()
    if #main_pointers > 0 then
        Utility.show_toast("🔧 Preserved " .. #main_pointers .. " main pointers")
    end
    
    Utility.show_alert("Queue Complete", 
        "✅ Processed " .. total_Items .. " Items\n" ..
        "✔️ Successful: " .. success_count .. "\n" ..
        "❌ Failed: " .. failure_count)
    
    -- Clear queue
    ItemQueue = {}
end

-- ==================== SEARCH MODULE ====================
local Search = {}

function Search.find_Items(query)
    local data = Data.load()
    if not data then return {} end
    
    query = query:lower()
    local results = {}
    
    local function search_recursive(tbl, path)
        if type(tbl) ~= "table" then return end
        
        for name, value in pairs(tbl) do
            if type(value) == "string" then
                -- Check if item name matches query
                if name:lower():find(query) then
                    table.insert(results, {
                        display_name = name,
                        item_string = value,
                        path = path
                    })
                end
            elseif type(value) == "table" then
                local new_path = path
                if path == "" then
                    new_path = name
                else
                    new_path = path .. " > " .. name
                end
                search_recursive(value, new_path)
            end
        end
    end
    
    for category, content in pairs(data) do
        search_recursive(content, category)
    end
    
    return results
end

function Search.show_results(results, query)
    if #results == 0 then
        Utility.show_alert("Search Results", "❌ No Items found for: '" .. query .. "'")
        return
    end
    
    local menu_Items = {}
    local keymap = {}
    
    for i, result in ipairs(results) do
        -- Add icon based on item type
        local icon = "🔹"
        local name_lower = result.display_name:lower() 
        
        local display_text = icon .. " " .. result.display_name

        if Queue.is_in_queue(result.item_string) then
            display_text = "✅ " .. display_text
        end
        
        table.insert(menu_Items, display_text)
        table.insert(keymap, {
            display_name = result.display_name,
            item_string = result.item_string
        })
    end
    
    table.insert(menu_Items, "───────────────")
    table.insert(keymap, {action = "separator"})
    
    table.insert(menu_Items, "🔍 Search Again")
    table.insert(keymap, {action = "search_again"})
    
    table.insert(menu_Items, "🔙 Back")
    table.insert(keymap, {action = "back"})
    
    while true do
        local title = "🔍 Results for: '" .. query .. "' (" .. #results .. " Items)"
        local choice = gg.choice(menu_Items, nil, title)
        
        if not choice then return end
        
        local selected = keymap[choice]
        
        if selected.action == "search_again" then
            Search.prompt()
            return
        elseif selected.action == "back" then
            return
        elseif selected.action == "separator" then
            -- Skip separator
        else
            Queue.add(selected.display_name, selected.item_string)
            gg.sleep(800)
            Search.show_results(results, query)
            return
        end
    end
end

-- function Search.prompt()
--     local input = gg.prompt({
--         "🔍 Search for Items:",
--         "Enter item name (e.g., sword, ore, potion)"
--     }, {"", "Tip: Use keywords"}, {"text", "text"})
    
--     if not input or not input[1] or input[1]:gsub("%s+", "") == "" then
--         return
--     end
    
--     local query = input[1]
--     LAST_SEARCH_QUERY = query
    
--     Utility.show_toast("🔍 Searching: " .. query)
--     gg.sleep(300)
    
--     local results = Search.find_Items(query)
--     Search.show_results(results, query)
-- end

function Search.prompt()
    local input = gg.prompt({"🔍 Search for Items:"}, {""}, {"text"})
    
    if not input or not input[1] or input[1]:gsub("%s+", "") == "" then
        return
    end
    
    local query = input[1]
    LAST_SEARCH_QUERY = query
    
    Utility.show_toast("🔍 Searching: " .. query)
    gg.sleep(300)
    
    local results = Search.find_Items(query)
    Search.show_results(results, query)
end


-- ==================== EXPLORER MODULE ====================
local Explorer = {}

Explorer.Nav = {
    stack = {},
    path = {"Root"}
}

function Explorer.Nav.push(node, name)
    table.insert(Explorer.Nav.stack, node)
    table.insert(Explorer.Nav.path, name)
end

function Explorer.Nav.pop()
    if #Explorer.Nav.stack > 1 then
        table.remove(Explorer.Nav.stack)
        table.remove(Explorer.Nav.path)
        return true
    end
    return false
end

function Explorer.Nav.current()
    return Explorer.Nav.stack[#Explorer.Nav.stack]
end

function Explorer.get_icon_for_name(name)
    local icon_map = {
        ["New"] = "🆕",
        ["Bag"] = "🎒",
        ["Equipment"] = "👕",
        ["Chest"] = "💼",
        ["Building"] = "🏗️",
        ["Consumable"] = "🍽️",
        ["Potions"] = "🧪",
        ["Food"] = "🍗",
        ["Drink"] = "🍺",
        ["Gacha"] = "🎁",
        ["Special"] = "💎",
        ["Items"] = "📦",
        ["Key"] = "🗝️",
        ["Maps"] = "🗺️",
        ["Pets"] = "🐾",
        ["Cats"] = "🐱",
        ["Wolf"] = "🐺",
        ["Research"] = "📝",
        ["Spell"] = "🔮",
        ["Storage"] = "🗃️",
        ["Talisman"] = "🌀",
        ["Tattoo"] = "🎨",
        ["Book"] = "📕",
        ["Tome"] = "📜",
        ["Token"] = "💎",
        ["Trophy"] = "🏆",
        ["Frost"] = "❄️",
        ["Fire"] = "🔥",
        ["Weapons"] = "⚔️",
        ["Bomb"] = "💣",
        ["Runetraps"] = "🕳️",
        ["Shields"] = "🛡️",
        ["Grenade"] = "🧨",
        ["weapon"] = "🗡️",
        ["Bow"] = "🏹",
       
    

    }
    
    for keyword, icon in pairs(icon_map) do
        if name:find(keyword) then
            return icon
        end
    end
    
    return "📁"
end

function Explorer.build_menu(node)
    local folders = {}
    local Items = {}
    
    for name, value in pairs(node) do
        if type(value) == "table" then
            local icon = Explorer.get_icon_for_name(name)
            table.insert(folders, {
                name = icon .. " " .. name,
                original_name = name,
                value = value,
                isFolder = true
            })
        elseif type(value) == "string" then
            local icon = Explorer.get_icon_for_name(name)
            table.insert(Items, {
                name = icon .. " " .. name,
                original_name = name,
                value = value,
                isFolder = false
            })
        end
    end
    
    -- Sort alphabetically
    table.sort(folders, function(a, b)
        return (a.original_name or a.name):lower() < (b.original_name or b.name):lower()
    end)
    
    table.sort(Items, function(a, b)
        return (a.original_name or a.name):lower() < (b.original_name or b.name):lower()
    end)
    
    -- Build menu
    local menu = {}
    local keymap = {}
    
    -- Queue actions if Items in queue
    if #ItemQueue > 0 then
        table.insert(menu, "▶️ Execute Queue (" .. #ItemQueue .. ")")
        table.insert(keymap, {action = "execute_queue"})
        
        table.insert(menu, "👁️ View Queue")
        table.insert(keymap, {action = "view_queue"})
        
        table.insert(menu, "🗑️ Clear Queue")
        table.insert(keymap, {action = "clear_queue"})
        
        table.insert(menu, "───────────────")
        table.insert(keymap, {action = "separator"})
    end
    
    -- Search option
    table.insert(menu, "🔍 Search Items")
    table.insert(keymap, {action = "search"})
    
    table.insert(menu, "───────────────")
    table.insert(keymap, {action = "separator"})
    
    -- Add folders
    for _, f in ipairs(folders) do
        table.insert(menu, f.name)
        table.insert(keymap, f)
    end
    
    -- Add Items
    for _, i in ipairs(Items) do
        local item_name = i.name
        if Queue.is_in_queue(i.value) then
            item_name = "✅ " .. item_name
        end
        
        table.insert(menu, item_name)
        table.insert(keymap, i)
    end
    
    -- Back option
    table.insert(menu, "🔙 Back")
    table.insert(keymap, {action = "back"})
    
    return menu, keymap, #folders
end

function Explorer.run()
    local data = Data.load()
    if not data then
        Utility.show_alert("Error", "❌ Failed to load item data")
        return
    end
    
    Explorer.Nav.stack = {data}
    Explorer.Nav.path = {"Item Explorer"}
    
    while true do
        local node = Explorer.Nav.current()
        local menu, keymap, _ = Explorer.build_menu(node)
        
        local title = Explorer.Nav.path[#Explorer.Nav.path]
        if #ItemQueue > 0 then
            title = title .. " (🛒" .. #ItemQueue .. ")"
        end
        
        local choice = gg.choice(menu, nil, title)
        if not choice then return end
        
        local entry = keymap[choice]
        
        if not entry then
            if not Explorer.Nav.pop() then return end
        elseif entry.action == "execute_queue" then
            Queue.execute()
        elseif entry.action == "view_queue" then
            Queue.view()
        elseif entry.action == "clear_queue" then
            Queue.clear()
        elseif entry.action == "search" then
            Search.prompt()
        elseif entry.action == "separator" then
            -- Skip separator
        elseif entry.action == "back" then
            if not Explorer.Nav.pop() then return end
        elseif entry.isFolder then
            Explorer.Nav.push(entry.value, entry.original_name)
        else
            Queue.add(entry.original_name, entry.value)
        end
    end
end



-- ==================== POINTER SCANNER MODULE ====================
local PointerScanner = {}

function PointerScanner.scan()
    local saved_Items = gg.getListItems()
    if not saved_Items or #saved_Items == 0 then
        Utility.show_toast("⚠️ SaveList is empty")
        return false
    end
    
    gg.setRanges(gg.REGION_ANONYMOUS)
    
    local info = gg.getTargetInfo()
    local is64 = info.x64 or false
    local ptr_type = is64 and gg.TYPE_QWORD or gg.TYPE_DWORD
    local offset = is64 and 0x14 or 0x0C
    
    local pointer_found = false
    
    for _, item in ipairs(saved_Items) do
        local target_addr = item.address - offset
        local item_name = item.name or "Unknown"
        
        gg.clearResults()
        gg.searchNumber(tostring(target_addr), ptr_type)
        gg.sleep(50)
        
        local found_count = gg.getResultsCount()
        if found_count > 0 then
            local res = gg.getResults(found_count)
            local pointers = {}
            
            for _, r in ipairs(res) do
                table.insert(pointers, r.address)
            end
            
            if #pointers > 10 then
                gg.clearList()
                local to_save = {}
                
                for _, addr in ipairs(pointers) do
                    table.insert(to_save, {
                        address = addr,
                        flags = ptr_type,
                        name = "PTR → " .. item_name,
                        freeze = false
                    })
                end
                
                gg.addListItems(to_save)
                pointer_found = true
                break
            end
        end
        
        gg.clearResults()
    end
    
    if pointer_found then
        Utility.show_alert("Scan Complete", "✅ Step one Done Boss")
    else
        Utility.show_alert("Scan Failed", 
            "⚠️ No pointers found\n\n" ..
            "🔸 Drink Flask Empty first 3 times or more (Important!)\n" ..
            "to trigger the item ID")
    end
    
    return pointer_found
end

function PointerScanner.step_one()
    local confirm = gg.alert(
        "🎯 STEP ONE - POINTER SCAN\n\n" ..
        "⚠️ IMPORTANT:\n" ..
        "🔸 Drink Flask Empty first 3 times or more (Important!)\n" ..
        "🔸 For succesfully step one\n\n" ..
        "Continue?", "✅ YES", "❌ CANCEL"
    )
    
    if confirm ~= 1 then
        Utility.show_toast("❌ Scan cancelled")
        return
    end
    
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    
    local hex = Utility.text_to_hex_utf16le(Config.TARGET_STRING)
    Utility.show_toast("🔍 Scanning: " .. Config.TARGET_STRING)
    
    gg.searchNumber(hex, gg.TYPE_BYTE)
    gg.sleep(200)
    
    local count = gg.getResultsCount()
    if count > 0 then
        gg.refineNumber("102", gg.TYPE_BYTE)
        
        local refined_count = gg.getResultsCount()
        if refined_count > 0 then
            -- Save refined results
            local results = gg.getResults(Config.MAX_RESULTS)
            local to_save = {}
            
            for _, r in ipairs(results) do
                table.insert(to_save, {
                    address = r.address,
                    flags = gg.TYPE_BYTE,
                    name = "Refine Result"
                })
            end
            
            gg.clearList()
            gg.addListItems(to_save)
            
            -- Scan for pointers
            PointerScanner.scan()
        else
            Utility.show_toast("❌ No refined results")
        end
    else
        Utility.show_toast("❌ Item not found")
    end
end





--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- MOD SECTION FOR DEVELOPMENT
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

----------------------------------------------------
-- CHECK ARCH
----------------------------------------------------
local TI = gg.getTargetInfo()
if not TI or not TI.x64 then
    gg.alert("❌ ARM64 ONLY")
    os.exit()
end

--- STATE

STATE = {
    DUP = false,
    SPLIT = false,
    DURA = false,
    FREE = false,
    RESEARCH = false,
    INSTANT_KILL = false,
    CRAFT_SPEED = false,
    FREE_ASSEMBLE = false,
    UNLIMITED_PERKS = false,
}

CACHE = {
    DUP = {},
    SPLIT = {},
    DURA = {},
    FREE = {},
    RESEARCH = {},
    INSTANT_KILL = {},
    CRAFT_SPEED = {},
    FREE_ASSEMBLE = {},
    UNLIMITED_PERKS = {},
}

METHOD = {
    DUP = nil,
    SPLIT = nil,
    DURA = nil,
    FREE = nil,
    RESEARCH = nil,
    INSTANT_KILL = nil,
    CRAFT_SPEED = nil,
    FREE_ASSEMBLE = nil,
    UNLIMITED_PERKS = nil,
       
}
    


----------------------------------------------------
-- MEMORY UTIL
----------------------------------------------------
local function gv(a, t)
    return gg.getValues({{address=a, flags=t}})[1].value
end

local function sv(tbl)
    gg.setValues(tbl)
end

local function ptr(a)
    return gv(a, gg.TYPE_QWORD)
end

local function cstr(addr, s)
    local b = gg.bytes(s)
    for i = 1, #b do
        if gv(addr+i-1, gg.TYPE_BYTE) & 0xFF ~= b[i] then
            return false
        end
    end
    return gv(addr+#b, gg.TYPE_BYTE) == 0
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- IL2CPP METHOD FINDER (UNIFIED)
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
local function findMethod(clazz, method)
    local res = {}
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    gg.searchNumber(string.format("Q 00 '%s' 00", method), gg.TYPE_BYTE)

    local c = gg.getResultsCount()
    if c == 0 then return res end

    gg.refineNumber(method:byte(), gg.TYPE_BYTE)
    local t = gg.getResults(c)

    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    gg.loadResults(t)
    gg.searchPointer(0)
    t = gg.getResults(c)

    for _, v in ipairs(t) do
        local cls = ptr(ptr(v.address + 8) + 16)
        if cstr(cls, clazz) then
            table.insert(res, ptr(v.address - 16))
        end
    end

    gg.clearResults()
    return res
end

-- ==================== DUPLICATE V1 (5000)  ====================
function toggle_duplicate_v1()
    if STATE.DUP then
        sv(CACHE.DUP)
        CACHE.DUP = {}
        STATE.DUP = false
        gg.toast("🔴 Duplicate v1 OFF")
        return
    end

    if not METHOD.DUP then
        METHOD.DUP = findMethod("LimitedInventoryStack", "get__amount")
        if #METHOD.DUP == 0 then
            gg.alert("❌ not found")
            METHOD.DUP = nil
            return
        end
    end

    CACHE.DUP = {}
    local patch = {}

    for _, a in ipairs(METHOD.DUP) do
        table.insert(CACHE.DUP, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.DUP, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value="h007182D2"})  -- mov x0, #5000
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"})  -- ret
    end

    sv(patch)
    STATE.DUP = true
    gg.toast("🟢 Duplicate v1 ON")
end


----------------------------------------------------
-- SPLIT ITEM
----------------------------------------------------
function toggle_split()
    if STATE.SPLIT then
        sv(CACHE.SPLIT)
        CACHE.SPLIT = {}
        STATE.SPLIT = false
        gg.toast("🔴 Split OFF")
        return
    end

    if not METHOD.SPLIT then
        METHOD.SPLIT = findMethod("InventoryExtensions", "CanSplit")
        if #METHOD.SPLIT == 0 then
            gg.alert("❌ Split method not found")
            METHOD.SPLIT = nil
            return
        end
    end

    CACHE.SPLIT = {}
    local patch = {}

    for _, a in ipairs(METHOD.SPLIT) do
        table.insert(CACHE.SPLIT, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.SPLIT, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value="h200080D2"})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"})
    end

    sv(patch)
    STATE.SPLIT = true
    gg.toast("🟢 Split ON")
end

----------------------------------------------------
-- INFINITE DURABILITY
----------------------------------------------------
function toggle_dura()
    if STATE.DURA then
        sv(CACHE.DURA)
        CACHE.DURA = {}
        STATE.DURA = false
        gg.toast("🔴 Durability OFF")
        return
    end

    if not METHOD.DURA then
        METHOD.DURA = findMethod("DurabilityInventoryStack", "ChangeDurability")
        if #METHOD.DURA == 0 then
            gg.alert("❌ Durability method not found")
            METHOD.DURA = nil
            return
        end
    end

    CACHE.DURA = {}
    local patch = {}

    for _, a in ipairs(METHOD.DURA) do
        table.insert(CACHE.DURA, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.DURA, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value="h000080D2"})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"})
    end

    sv(patch)
    STATE.DURA = true
    gg.toast("🟢 Durability ON")
end

----------------------------------------------------
-- FREE ENERGY (zero consume)
----------------------------------------------------
function toggle_free()
    if STATE.FREE then
        sv(CACHE.FREE)
        CACHE.FREE = {}
        STATE.FREE = false
        gg.toast("🔴 Free Energy OFF")
        return
    end

    if not METHOD.FREE then
        METHOD.FREE = findMethod("MapMovement", "get_boostEnergyPrice")
        if #METHOD.FREE == 0 then
            gg.alert("❌ Energy method not found")
            METHOD.FREE = nil
            return
        end
    end

    CACHE.FREE = {}
    local patch = {}

    for _, a in ipairs(METHOD.FREE) do
        table.insert(CACHE.FREE, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.FREE, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value="h000080D2"})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"})
    end

    sv(patch)
    STATE.FREE = true
    gg.toast("🟢 Free Energy ON")
end

----------------------------------------------------
-- FREE craft 
----------------------------------------------------

function toggle_research_craft()
    if STATE.RESEARCH then
        gg.setValues(CACHE.RESEARCH)
        CACHE.RESEARCH = {}
        STATE.RESEARCH = false
        gg.toast("🔴 Research Craft OFF")
        return
    end

    if not METHOD.RESEARCH then
        METHOD.RESEARCH = findMethod("Research", "get_canCraft")
        if #METHOD.RESEARCH == 0 then
            gg.alert("❌ not found")
            METHOD.RESEARCH = nil
            return
        end
    end

    CACHE.RESEARCH = {}
    local patch = {}

    for _, a in ipairs(METHOD.RESEARCH) do
        -- backup
        table.insert(CACHE.RESEARCH, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.RESEARCH, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- patch return true
        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value="h200080D2"})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"})
    end

    gg.setValues(patch)
    STATE.RESEARCH = true
    gg.toast("🟢 FREECRAFT ON")
end



----------------------------------------------------
-- INSTANT KILL - FOR ALL WEAPONS (MELEE + RANGE)
----------------------------------------------------
function toggle_instant_kill()
    if STATE.INSTANT_KILL then
        sv(CACHE.INSTANT_KILL)
        CACHE.INSTANT_KILL = {}
        STATE.INSTANT_KILL = false
        gg.toast("🔴 Instant Kill OFF")
        return
    end

    -- Cari GetWeaponDamageBonus di WeaponAttackActivity (parent)
    if not METHOD.INSTANT_KILL then
        gg.toast("🔍 Scanning...")
        METHOD.INSTANT_KILL = findMethod("WeaponAttackActivity", "GetWeaponDamageBonus")
        
        if #METHOD.INSTANT_KILL == 0 then
            gg.alert("❌  not found!")
            return
        end
    end

    CACHE.INSTANT_KILL = {}
    local patch = {}
    
    for _, a in ipairs(METHOD.INSTANT_KILL) do
        -- Backup original
        for i = 0, 2 do
            table.insert(CACHE.INSTANT_KILL, {
                address = a + (i * 4),
                flags = gg.TYPE_DWORD,
                value = gv(a + (i * 4), gg.TYPE_DWORD)
            })
        end
        
        -- Patch: Return 9999 damage
        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = "hE0F98452"  -- mov w0, #9999
        })
        
        table.insert(patch, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = "hC0035FD6"  -- ret
        })
        
        table.insert(patch, {
            address = a + 8,
            flags = gg.TYPE_DWORD,
            value = "h00000000"  -- nop
        })
    end

    -- **TAMBAHAN: Juga patch CalculateDamage di RangeAttackActivity**
    if not METHOD.RANGE_DAMAGE then
        local range_methods = findMethod("RangeAttackActivity", "CalculateDamage")
        if #range_methods > 0 then
            METHOD.RANGE_DAMAGE = range_methods
           -- gg.toast("✅ Also found RangeAttackActivity.CalculateDamage")
        end
    end
    
    if METHOD.RANGE_DAMAGE then
        for _, a in ipairs(METHOD.RANGE_DAMAGE) do
            -- Backup range method
            for i = 0, 2 do
                table.insert(CACHE.INSTANT_KILL, {
                    address = a + (i * 4),
                    flags = gg.TYPE_DWORD,
                    value = gv(a + (i * 4), gg.TYPE_DWORD)
                })
            end
            
            -- Patch range method juga
            table.insert(patch, {
                address = a,
                flags = gg.TYPE_DWORD,
                value = "hE0F98452"  -- mov w0, #9999
            })
            
            table.insert(patch, {
                address = a + 4,
                flags = gg.TYPE_DWORD,
                value = "hC0035FD6"  -- ret
            })
            
            table.insert(patch, {
                address = a + 8,
                flags = gg.TYPE_DWORD,
                value = "h00000000"  -- nop
            })
        end
    end

    -- Apply all patches
    sv(patch)
    STATE.INSTANT_KILL = true
    gg.toast("☠️ INSTANT KILL ON")
end

----------------------------------------------------
-- crafting speed
----------------------------------------------------
local function toggle_crafting_speed()
    if STATE.CRAFT_SPEED then
        -- Restore original code
        sv(CACHE.CRAFT_SPEED)
        CACHE.CRAFT_SPEED = {}
        STATE.CRAFT_SPEED = false
        gg.toast("🔴 Craft Speed OFF")
        return
    end

    -- Cari method yang terkait waktu crafting
    if not METHOD.CRAFT_SPEED then
        --gg.toast("🔍 Scanning for crafting speed methods...")
        
        -- Coba beberapa method yang mungkin mengatur waktu crafting
        METHOD.CRAFT_SPEED = findMethod("Workbench", "GetRecipeTime")
        if #METHOD.CRAFT_SPEED == 0 then
            METHOD.CRAFT_SPEED = findMethod("WorkbenchRecipeDescription", "get_time")
        end
        if #METHOD.CRAFT_SPEED == 0 then
            METHOD.CRAFT_SPEED = findMethod("WorkbenchRecipeDescription", "get_requiredTime")
        end
        if #METHOD.CRAFT_SPEED == 0 then
            METHOD.CRAFT_SPEED = findMethod("WorkbenchRecipeDescription", "get_duration")
        end
        
        if #METHOD.CRAFT_SPEED == 0 then
            gg.alert("❌ Crafting time methods not found!\n\n" ..
                    "Try:\n1. Build a workbench first\n" ..
                    "2. Start crafting something\n" ..
                    "3. Try again\n\n" ..
                    "Jika masih tidak ketemu, method mungkin ada di class lain.")
            METHOD.CRAFT_SPEED = nil
            return
        end
    end

    -- Backup dan patch untuk SET WAKTU CRAFTING = 1 DETIK (bukan 0)
    CACHE.CRAFT_SPEED = {}
    local patch = {}
    
    local methods_found = #METHOD.CRAFT_SPEED
    gg.toast("✅ Found " .. methods_found .. " crafting time method(s)")
    
    for _, a in ipairs(METHOD.CRAFT_SPEED) do
        -- Backup original instructions (8-16 bytes)
        for i = 0, 3 do
            local addr = a + (i * 4)
            local current_val = gv(addr, gg.TYPE_DWORD)
            if current_val ~= 0 then -- Hanya backup yang bukan nol
                table.insert(CACHE.CRAFT_SPEED, {
                    address = addr,
                    flags = gg.TYPE_DWORD,
                    value = current_val
                })
            end
        end
        
        -- PATCH 1: Return 1 detik (bukan 0 agar lebih aman)
        -- mov w0, #1 ; ret
        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = "h200080D2"  -- mov w0, #1 (ARM64: mov immediate 1 ke register w0)
        })
        
        table.insert(patch, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = "hC0035FD6"  -- ret
        })
        
    
    end

    -- Apply patch
    local success, err = pcall(sv, patch)
    if not success then
        gg.alert("❌ Patch failed!\nError: " .. tostring(err))
        return
    end

    STATE.CRAFT_SPEED = true
    gg.toast("⚡ CRAFT SPEED ON - 1 Second Crafting!")
end


----------------------------------------------------
-- FREE ASSEMBLE - BuildingCollection.get_isBuilt()
----------------------------------------------------
function toggle_free_assemble()
    if STATE.FREE_ASSEMBLE then
        -- Restore original code
        if CACHE.FREE_ASSEMBLE and #CACHE.FREE_ASSEMBLE > 0 then
            gg.setValues(CACHE.FREE_ASSEMBLE)
            CACHE.FREE_ASSEMBLE = {}
        end
        STATE.FREE_ASSEMBLE = false
        gg.toast("🔴 Free Assemble OFF")
        return
    end

    -- CARI METHOD BuildingCollection.get_isBuilt()
    if not METHOD.FREE_ASSEMBLE then
        --gg.toast("🔍 Scanning BuildingCollection.get_isBuilt()...")
        
        -- Method utama berdasarkan dump
        METHOD.FREE_ASSEMBLE = findMethod("BuildingCollection", "get_isBuilt")
        
        if not METHOD.FREE_ASSEMBLE or #METHOD.FREE_ASSEMBLE == 0 then
          --  gg.alert("⚠️ get_isBuilt() not found!\n\nTrying CanComplete()...")
            
            -- Fallback ke CanComplete()
            METHOD.FREE_ASSEMBLE = findMethod("BuildingCollection", "CanComplete")
        end
        
        if not METHOD.FREE_ASSEMBLE or #METHOD.FREE_ASSEMBLE == 0 then
            gg.alert("❌ Cannot find  methods!\n\n" ..
                    "Try building something first.")
            METHOD.FREE_ASSEMBLE = nil
            return
        end
        
        --gg.toast("✅ Found " .. #METHOD.FREE_ASSEMBLE .. " method(s)")
    end

    -- Backup dan patch untuk selalu return TRUE
    CACHE.FREE_ASSEMBLE = {}
    local patch = {}

    for _, addr in ipairs(METHOD.FREE_ASSEMBLE) do
        -- Backup 8 bytes
        table.insert(CACHE.FREE_ASSEMBLE, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = gv(addr, gg.TYPE_DWORD)
        })
        table.insert(CACHE.FREE_ASSEMBLE, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = gv(addr + 4, gg.TYPE_DWORD)
        })

        -- Patch: mov w0, #1 ; ret
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800020  -- mov w0, #1
        })
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0  -- ret
        })
        
       -- gg.toast("📍 Patched @ " .. string.format("%X", addr))
    end

    -- Apply patch
    local success, err = pcall(gg.setValues, patch)
    if not success then
        gg.alert("❌ Patch failed!\nError: " .. tostring(err))
        return
    end

    STATE.FREE_ASSEMBLE = true
    gg.toast("🟢 FREE ASSEMBLE ON")
    
   
end





----------------------------------------------------
-- UNLIMITED ACTIVE PERK (2 METHOD FIX)
----------------------------------------------------
function toggle_unlimited_perk()
    if STATE.UNLIMITED_PERK then
        sv(CACHE.UNLIMITED_PERK)
        CACHE.UNLIMITED_PERK = {}
        STATE.UNLIMITED_PERK = false
        gg.toast("🔴 Unlimited Perk OFF")
        return
    end

    -- METHOD 1: isCharged
    METHOD.IS_CHARGED = METHOD.IS_CHARGED or
        findMethod("ActivePerkSlot", "get_isCharged")

    -- METHOD 2: Uncharge
    METHOD.UNCHARGE = METHOD.UNCHARGE or
        findMethod("ActivePerkSlot", "Uncharge")

    if #METHOD.IS_CHARGED == 0 or #METHOD.UNCHARGE == 0 then
        gg.alert("❌ Required methods not found")
        return
    end

    CACHE.UNLIMITED_PERK = {}
    local patch = {}

    -- patch isCharged → true
    for _, a in ipairs(METHOD.IS_CHARGED) do
        for i = 0, 2 do
            table.insert(CACHE.UNLIMITED_PERK, {
                address = a + (i * 4),
                flags = gg.TYPE_DWORD,
                value = gv(a + (i * 4), gg.TYPE_DWORD)
            })
        end

        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = 0x52800020 -- mov w0,#1
        })
        table.insert(patch, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- ret
        })
    end

    -- patch Uncharge → ret
    for _, a in ipairs(METHOD.UNCHARGE) do
        for i = 0, 1 do
            table.insert(CACHE.UNLIMITED_PERK, {
                address = a + (i * 4),
                flags = gg.TYPE_DWORD,
                value = gv(a + (i * 4), gg.TYPE_DWORD)
            })
        end

        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.UNLIMITED_PERK = true
    gg.toast("⚡ PERK UNLIMITED ACTIVE")
end


----------------------------------------------------
-- GOD MODE PLAYER ONLY (HIT + DOT) bug not use
----------------------------------------------------
-- function toggle_god_mtode()
--     if STATE.GOD_MODE then
--         sv(CACHE.GOD_MODE)
--         CACHE.GOD_MODE = {}
--         STATE.GOD_MODE = false
--         gg.toast("🔴 God Mode OFF")
--         return
--     end

--     ------------------------------------------------
--     -- FIND METHODS
--     ------------------------------------------------
--     METHOD.PROCESS_HIT = METHOD.PROCESS_HIT or
--         findMethod("HitCalculator", "ProcessHit")

--     METHOD.DOT_HIT = METHOD.DOT_HIT or
--         findMethod("CharacterTickingEffectBase", "Hit")

--     if #METHOD.PROCESS_HIT == 0 or #METHOD.DOT_HIT == 0 then
--         gg.alert("❌ God Mode methods not found")
--         return
--     end

--     CACHE.GOD_MODE = {}
--     local patch = {}

--     ------------------------------------------------
--     -- METHOD 1: ProcessHit (block all hit damage)
--     ------------------------------------------------
--     for _, a in ipairs(METHOD.PROCESS_HIT) do
--         -- backup
--         for i = 0, 3 do
--             table.insert(CACHE.GOD_MODE, {
--                 address = a + (i * 4),
--                 flags = gg.TYPE_DWORD,
--                 value = gv(a + (i * 4), gg.TYPE_DWORD)
--             })
--         end

--         -- return HitInfo with zero damage
--         table.insert(patch, {
--             address = a,
--             flags = gg.TYPE_DWORD,
--             value = 0x52800000 -- mov w0,#0
--         })
--         table.insert(patch, {
--             address = a + 4,
--             flags = gg.TYPE_DWORD,
--             value = 0xD65F03C0 -- ret
--         })
--     end

--     ------------------------------------------------
--     -- METHOD 2: DOT Hit (poison / burn / bleed)
--     ------------------------------------------------
--     for _, a in ipairs(METHOD.DOT_HIT) do
--         for i = 0, 2 do
--             table.insert(CACHE.GOD_MODE, {
--                 address = a + (i * 4),
--                 flags = gg.TYPE_DWORD,
--                 value = gv(a + (i * 4), gg.TYPE_DWORD)
--             })
--         end

--         -- cancel DOT hit
--         table.insert(patch, {
--             address = a,
--             flags = gg.TYPE_DWORD,
--             value = 0xD65F03C0 -- ret
--         })
--     end

--     ------------------------------------------------
--     -- APPLY
--     ------------------------------------------------
--     sv(patch)
--     STATE.GOD_MODE = true
--     gg.toast("🛡 GOD MODE ON (PLAYER)")
-- end

----------------------------------------------------







-- ==================== UPDATE count_active_mods ====================
local function count_active_mods()
    local count = 0
    if STATE.INSTANT_KILL then count = count + 1 end
    if STATE.DUP then count = count + 1 end       -- V1
    if STATE.SPLIT then count = count + 1 end
    if STATE.DURA then count = count + 1 end
    if STATE.FREE then count = count + 1 end
    if STATE.RESEARCH then count = count + 1 end
    if STATE.CRAFT_SPEED then count = count + 1 end
    if STATE.FREE_ASSEMBLE then count = count + 1 end
    if STATE.UNLIMITED_PERK then count = count + 1 end
    
    return count
end






-- ==================== UPDATE MOD SUB-MENU ====================
-- local function mod_sub_menu()
--     while true do
--         gg.sleep(150)
        
--         local active_count = count_active_mods()
        
--         local menu = gg.choice({
--             "════════════════════════",       -- Index 1
            
--             "☠️ Instant Kill " .. (STATE.INSTANT_KILL and "✅" or "🔴"),          -- Index 2
--             "✂️ Duplicate Item " .. (STATE.DUP and "✅" or "🔴"),           -- Index 3
--             "✂️ Split Weapon " .. (STATE.SPLIT and "✅" or "🔴"),               -- Index 4
--             "🔒 Lock Durability " .. (STATE.DURA and "✅" or "🔴"),             -- Index 5
--             "⚡️ Zero Energy Travel " .. (STATE.FREE and "✅" or "🔴"),         -- Index 6
--             "🛠️ Free Craft " .. (STATE.RESEARCH and "✅" or "🔴"),             -- Index 7
--             "🚀 Fast Crafting " .. (STATE.CRAFT_SPEED and "✅" or "🔴"),        -- Index 8
--             "🔨 Free Assemble " .. (STATE.FREE_ASSEMBLE and "✅" or "🔴"),      -- Index 9
--             "🌀 Unlimited Perks " .. (STATE.UNLIMITED_PERK and "✅" or "🔴"), --indez 10
            
--             "════════════════════════",       -- Index 11
--             "🔙 Back to Main Menu"            -- Index 
--              }, nil, "🛠️ INDIVIDUAL MOD TOGGLE\n" ..
--                "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
--                "Active: " .. active_count .. "/9 mods")
        
--         if menu == nil then
--             return
--         end
        
--         if menu == 2 then toggle_instant_kill()
--         elseif menu == 3 then toggle_duplicate_v1()
--         elseif menu == 4 then toggle_split()
--         elseif menu == 5 then toggle_dura()
--         elseif menu == 6 then toggle_free()
--         elseif menu == 7 then toggle_research_craft()
--         elseif menu == 8 then toggle_crafting_speed()
--         elseif menu == 9 then toggle_free_assemble()
--         elseif menu == 10 then toggle_unlimited_perk()
--        elseif menu == 12 then 
--             return
--         end
--     end
-- end



local function mod_sub_menu()
    while true do
        gg.sleep(150)

        local active_count = count_active_mods()

        local menu = gg.choice({
            "👤 MOD PLAYER",
            " ╰▶☠️ Instant Kill "          .. (STATE.INSTANT_KILL   and "✅" or "🔴"),
            " ╰▶⚡️ Zero Energy Travel "    .. (STATE.FREE          and "✅" or "🔴"),
            " ╰▶🌀 Unlimited Perks "        .. (STATE.UNLIMITED_PERK and "✅" or "🔴"),

            "📦 MOD ITEM ",
            " ╰▶✂️ Duplicate Item "        .. (STATE.DUP           and "✅" or "🔴"),
            " ╰▶✂️ Split Weapon "          .. (STATE.SPLIT         and "✅" or "🔴"),
            " ╰▶🔒 Lock Durability "        .. (STATE.DURA          and "✅" or "🔴"),

            "🛠️ MOD CRAFTING",
            " ╰▶🛠️ Free Craft "            .. (STATE.RESEARCH      and "✅" or "🔴"),
            " ╰▶🚀 Fast Crafting "          .. (STATE.CRAFT_SPEED   and "✅" or "🔴"),
            " ╰▶🔨 Free Assemble "          .. (STATE.FREE_ASSEMBLE and "✅" or "🔴"),

            "════════════════════════",
            "🔙 Back to Main Menu"
        }, nil,
        "🧩 MOD MENU [not work in emulator]\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "Active: " .. active_count .. "/9 mods")

        if not menu then
            return
        end

        -- MOD PLAYER
        if     menu == 2  then toggle_instant_kill()
        elseif menu == 3  then toggle_free()
        elseif menu == 4  then toggle_unlimited_perk()

        -- MOD ITEM
        elseif menu == 6  then toggle_duplicate_v1()
        elseif menu == 7  then toggle_split()
        elseif menu == 8  then toggle_dura()

        -- MOD CRAFTING
        elseif menu == 10 then toggle_research_craft()
        elseif menu == 11 then toggle_crafting_speed()
        elseif menu == 12 then toggle_free_assemble()

        -- BACK
        elseif menu == 14 then
            return
        end
    end
end





--end mod section


local function show_welcome()
    if not WELCOME_SHOWN then
        local welcome_msg = [[

 ✨ DRABOY GRIM SOUL TOOLS V3 
 📅 Version: 7.9.0 (64-bit)
 🛠️ Release: 19 Januari 2026
 ⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

 📝 UPDATE LOG:
 ⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
 🔸 💫 Replacement Item
 🔸 ⭐ Improve Ui
 🔸 ⭐ Small Fix

 List Mod Hack
 🔸 ☠️ Instant Kill
 🔸 ⚡️ Zero Energy Travel
 🔸 🌀 Unlimited Skill use
 🔸 ✂️ Duplicate Item
 🔸 ✂️ Split Weapon
 🔸 🔒 Lock Durability
 🔸 🛠️ Free Craft 
 🔸 🚀 Fast Crafting
 🔸 🔨 Free Assemble

 Note : Some Mod hack Not work in emulator
───────────────────────────────


 ⚠️ RULES & WARNINGS:
───────────────────────────────
 ✅ Don't Be Greedy use this
 ✅ Use by Your Own Risk
───────────────────────────────

]]
        gg.alert(welcome_msg, "LET'S GO! 🚀")
        WELCOME_SHOWN = true
       
    end
end

local function exit_script()
    -- Auto-deactivate semua mod sebelum keluar
    local active_mods = count_active_mods()
    
    if active_mods > 0 then
        -- Konfirmasi auto-deactivate
        local confirm = gg.alert(
            "🔴 EXIT SCRIPT\n" ..
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
            "⚠️  " .. active_mods .. " mods are still active!\n\n" ..
            "For safety, we recommend deactivating\n" ..
            "all mods before exiting.\n\n" ..
            "Auto-deactivate now?",
            "✅ YES, DEACTIVATE & EXIT",
            "❌ NO, EXIT WITHOUT DEACTIVATING",
            "⏸️ CANCEL EXIT"
        )
        
        if confirm == 1 then
            -- Auto-deactivate semua mod
            gg.toast("🔄 Auto-deactivating " .. active_mods .. " mods...")
            
            if STATE.INSTANT_KILL then toggle_instant_kill() end
            if STATE.DUP then toggle_duplicate_v1() end
            if STATE.SPLIT then toggle_split() end
            if STATE.DURA then toggle_dura() end
            if STATE.FREE then toggle_free() end
            if STATE.RESEARCH then toggle_research_craft() end
            if STATE.CRAFT_SPEED then toggle_crafting_speed() end
            if STATE.FREE_ASSEMBLE then toggle_free_assemble() end
            
            gg.sleep(500)
            gg.toast("✅ All mods deactivated")
        elseif confirm == 3 then
            -- Cancel exit
            gg.toast("⏸️ Exit cancelled")
            return
        end
        -- Jika confirm == 2, lanjut tanpa deactivate
    end
    
    print("------------------------------------------")
    print("✨ Draboy Tools V2 Ended Safely")
    print("❤️ say thanks with subscribe @DraboyGaming")
    print("------------------------------------------------")
    
    -- Proses pembersihan memori
    gg.clearResults()
    gg.clearList()
    
    -- Efek Loading saat keluar
    gg.toast("🧹 Cleaning script cache...")
    gg.sleep(500)
    gg.toast("👋 Stay Safe, Exile!")
    gg.sleep(500)
    
    os.exit()
end
-- ==================== SETTINGS MODULE ====================


local Settings = {}

function Settings.show()
    while true do
        local current_seconds = math.floor(RESTORE_DELAY_MS / 1000)
        local total_Items = Data.get_item_count()
        
        -- Menggunakan gaya header yang konsisten
        local header = "⚙️ SYSTEM CONFIGURATION\n" ..
                       "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
                       "📦 Database: " .. total_Items .. " Items\n" ..
                       "🛒 Queue Status: " .. #ItemQueue .. " Active"

        local choice = gg.choice({
            "⏱️ ADJUST RESTORE DELAY | [" .. current_seconds .. "s]", -- Choice 1
            "🧹 SYSTEM CLEANUP (SAVELIST)",                          -- Choice 2
            "📊 SHOW VERSION & CREDITS",                             -- Choice 3 (Call Welcome)
            "🔙 RETURN TO DASHBOARD"                                -- Choice 4
        }, nil, header)
        
        -- Tombol CANCEL atau Choice 4 akan kembali
        if not choice or choice == 4 then return end
        
        -- 1. ADJUST DELAY
        if choice == 1 then
            local input = gg.prompt({
                "⏰ Restore Delay (Seconds):",
            }, {tostring(current_seconds)}, {"number"})
            
            if input and input[1] then
                local seconds = tonumber(input[1])
                if seconds and seconds > 0 then
                    RESTORE_DELAY_MS = seconds * 1000
                    gg.toast("✅ Delay updated to " .. seconds .. "s")
                else
                    gg.toast("❌ Invalid input!")
                end
            end
            
        -- 2. CLEANUP
        elseif choice == 2 then
            local cleaned_temp = Cleaner.remove_temp_item_entries()
            local cleaned_backups = Cleaner.remove_old_backups()
            
            gg.alert("🧹 CLEANUP REPORT\n" ..
                     "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
                     "🔸 Temp Items Removed : " .. cleaned_temp .. "\n" ..
                     "🔸 Backups Cleared    : " .. cleaned_backups .. "\n" ..
                     "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
                     "✅ Memory Optimization Complete!")
                
        -- 3. SCRIPT INFO (MEMANGGIL WELCOME MENU)
        elseif choice == 3 then
            -- Reset flag agar welcome_msg bisa muncul lagi meskipun sudah pernah muncul
            WELCOME_SHOWN = false 
            show_welcome()
            -- Set true kembali agar tidak muncul otomatis di menu utama nanti
            WELCOME_SHOWN = true
        end
    end
end







-- ==================== MAIN MENU (MODERN UI) ====================
local function main_menu()
    while true do
        gg.sleep(150)
        if gg.isVisible(true) then
            gg.setVisible(false)
            
            -- UI Elements
            local cart_count = #ItemQueue
            local cart_label = cart_count > 0 and " [🛒 " .. cart_count .. " Items]" or " [Empty]"
            local active_mods = count_active_mods()
            local mod_status = active_mods > 0 and " [ACTIVE: " .. active_mods .. "/9]" or ""
            
            local menu = gg.choice({
                "💫 Menu Item Replacement", -- Header (Index 1)
                " ╰▶ ⭐ STEP ONE", --index 2
                " ╰▶ 🔎 Item Explorer" .. cart_label, -- index 3
                "════════════════════════════", -- index 4
               
                "⚡ MOD MENU" .. mod_status, -- Header baru (Index 5)
                " ╰▶ 🛠️ LIST MODS", -- (Index 6
                "════════════════════════════", -- index 7
                
                "⚙️ Settings",     -- Header (Index 8
                " ╰▶ 🛠️ System Settings", --  (Index 9
                " ╰▶ 🔴 Exit Script" --  (Index 10
            }, nil, "DRABOY GRIM SOUL SURVIVAL V2 \n──────────────────────────────\n📅 " .. os.date("%A, %d %B %Y"))
            
            if not menu then
                gg.setVisible(false)
            end
            
            -- Mapping Logic
            if menu == 2 then PointerScanner.step_one()        -- ⭐ STEP ONE
            elseif menu == 3 then Explorer.run()              -- 🔎 Item Explorer
            
            elseif menu == 6 then mod_sub_menu()             -- MOD MENU Individual
            elseif menu == 9 then Settings.show()            -- 🛠️ System Settings
            elseif menu == 10 then exit_script()              -- 🔴 Exit Script
            end
        end
    end
end

-- ==================== FANCY INITIALIZATION (SMOOTH VERSION) ====================
local function initialize()
    gg.clearResults()
    gg.setVisible(false)

    -- Animasi Loading Smooth (Frame lebih banyak agar transisi halus)
    local frames = {
        "▕      ▏", "▕▃     ▏", "▕▆▃    ▏", "▕▇▆▃   ▏", "▕██▇▆▃ ▏", 
        "▕ ███▇▆▏", "▕  ███▇▏", "▕   ███▏", "▕    ██▏", "▕     █▏",
        "▕      ▏", "▕     ▃▏", "▕    ▃▆▏", "▕   ▃▆▇▏", "▕ ▃▆▇█▏",
        "▕▆▇███ ▏", "▕▇███  ▏", "▕███   ▏", "▕██    ▏", "▕█     ▏"
    }
    
    -- Putar animasi 2 kali putaran agar terlihat loading
    for r = 1, 2 do
        for i, v in ipairs(frames) do
            gg.toast("🚀 Loading Draboy Tools " .. v)
            gg.sleep(60) -- Speed dipercepat agar terlihat smooth
        end
    end

    -- Ambil data
    local count = (Data and Data.get_item_count) and Data.get_item_count() or "2725"
    
    -- Alert dengan tampilan lebih bersih
    local msg = "✅ SYSTEM READY TO USE\n"
             .. "────────────────────────\n"
             .. "📦 Database : " .. count .. " Items Loaded\n"
             .. "🎮 Game     : Grim Soul 7.9.0\n"
             .. "🌐 Update   : Auto-Update Active\n"
             .. "────────────────────────\n"
             .. "📺 YouTube  : @DraboyGaming\n"
             .. "🙏 Support me by Subscribing!"

    local sel = gg.alert(msg, "🚀 START SYSTEM", "❌ EXIT")
    
    if sel ~= 1 then 
        gg.toast("👋 Script Closed")
        os.exit() 
    end

    show_welcome()
    gg.setVisible(true)
    main_menu()
end

initialize()
