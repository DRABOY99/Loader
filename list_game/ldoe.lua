-------------------------------------------------
-- WELCOME MESSAGE DESIGN BARU
-------------------------------------------------
local SCRIPT_VERSION = "V.3"
local RELEASE_DATE = "19-01-2026"

local function ShowWelcomeMessage()
    local response = gg.alert(
        "✨ Draboy Ldoe Tools 🇮🇩  " .. SCRIPT_VERSION .. "\n" ..
        "📅 Released: " .. RELEASE_DATE .. "\n" ..
        "━━━━━━━━━━━━━━━━━━━\n\n" ..
    

        "📢 Update Log:\n" ..
        "━━━━━━━━━━━━━━━━━━━\n" ..
        "🔥 Replacement Item\n" ..
        "🐶 Dog skill hack\n" ..
        
        "👑 Premium BATTLEPASS\n" ..
        "👑 Premium SURVIVOR PATH\n" ..
        "🛠️ Free Craft\n" ..
        "🏗️ Free Build\n" ..
        "🔨 Fast Workbench\n" ..

        "✂️ Split Weapon\n" ..
        "🎒 No Decrease Item Backpack\n" ..
        "⚡ Max Durability\n" ..
        "🎁 Gacha No Decrease In Inbox\n" ..
        "🎁 Infinite Item Inbox\n" ..
        
        "👕 Unlock All Skins Not Permanent\n" ..
        "🏍 Unlock All Bike Skins Not Permanent\n" ..
        "⚡ No Skill Cooldown\n" ..
        "🆓 Travel Energy\n" ..
        "🚽 No Defecate\n\n" ..
    
        "Note : Mod Feature Unstable in Emulator PC\n\n" ..
        

    
        
       
        "⚠️ Important:\n" ..
        "━━━━━━━━━━━━━━━━━━━\n" ..
        "⚠️ Use at Your Risk !\n",
       
        "🚀 START ", "🛑 EXIT"
    )
    
    if response == 1 then
        gg.toast("🔥 Draboy Ldoe Tools " .. SCRIPT_VERSION .. ": ONLINE")
        return true
    elseif response == 2 then
        gg.toast("👋 GoodBye!")
        os.exit()
    end
    return false
end

-------------------------------------------------
-- FUNCTION UNTUK MENAMPILKAN INFO GAME & VERSION
-------------------------------------------------
local function ShowGameAndVersionInfo()
    local TargetInfo = gg.getTargetInfo()
    local arch = TargetInfo.x64 and "64-bit (ARM64)" or "32-bit (ARMv7)"
    local status = TargetInfo.x64 and "✅ Compatible" or "⛔ Not Compatible"
    
    gg.alert(
        "🎮 GAME INFO & VERSION\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "📱 Script Version: " .. SCRIPT_VERSION .. "\n" ..
        "📅 Released: " .. RELEASE_DATE .. "\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "🎮 Game Info:\n" ..
        "📛 Game       : " .. (TargetInfo.label or "?") .. "\n" ..
        "📦 Package    : " .. gg.getTargetPackage() .. "\n" ..
        "🧠 Arsitektur : " .. arch .. "\n" ..
        "📊 Status     : " .. status .. "\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "⚠️ NOTE:\n this Script Only for 64-bit\n" ..
        "🔗 Youtube: @DraboyGaming",
        "OK"
    )
end

-------------------------------------------------
-- SHOW WELCOME ON FIRST RUN
-------------------------------------------------
if not _G.WELCOME_SHOWN then
    ShowWelcomeMessage()
    _G.WELCOME_SHOWN = true
end

-------------------------------------------------
-- CONFIG & PATH
---------------------------------
local SCRIPT_PATH = gg.getFile()


-------------------------------------------------
-- GLOBAL FLAGS
---------------------------------
local AUTO_SCAN_TARGET = nil
local MANUAL_SCAN_TARGET = nil
local MULTI_MODE = false 
_G.MULTI_DELAY = 8000 -- Default delay 8 detik

_G.REPLACE_HISTORY = _G.REPLACE_HISTORY or {}
_G.LAST_REPLACE_BACKUP = _G.LAST_REPLACE_BACKUP or nil 
_G.LAST_REPLACED_ITEM = _G.LAST_REPLACED_ITEM or nil 

-- Tambah di GLOBAL FLAGS:
_G.CURRENT_ACTIVE_ITEM = nil  -- Untuk tracking item aktif
_G.CURRENT_ACTIVE_NAME = nil

-- GLOBAL FLAGS - Add this with other global flags
_G.INFINITE_INBOX_ACTIVE = false


------------------------------------
-- 📌 LIST ITEM DATA (with Subcategories)
---------------------------------
local ITEM_DATA = {
    -- ========== RESOURCES ==========
    ["resources"] = {
        ["wood & logs"] = {
            ["wood"] = "wood",
            ["oak log"] = "resource_wood_2", 
            ["ash log"] = "resource_wood_3", 
        },
        ["stone & minerals"] = {
            ["limestone"] = "stone",
            ["copper ore"] = "resource_copper_ore", 
            ["iron ore"] = "resource_ore_1", 
            ["titanium ore"] = "resource_ore_3", 
            ["tungsten ore"] = "resource_ore_4", 
            ["bauxite ore"] = "resource_bauxite", 
            ["sulfur"] = "resource_sulfur", 
            ["quartz"] = "resource_quartz", 
            ["sand"] = "resource_sand", 
            ["halite"] = "resource_halite", 
            ["resource lead"] = "resource_lead", 
        },
        ["planks & bars"] = {
            ["pine plank"] = "resource_plank_1", 
            ["oak plank"] = "resource_plank_2", 
            ["ash plank"] = "resource_plank_3", 
            ["iron bar"] = "resource_bar_1", 
            ["steel bar"] = "resource_bar_2", 
            ["titanium bar"] = "resource_bar_3", 
            ["tungsten bar"] = "resource_bar_4", 
            ["aluminium bar"] = "resource_aluminium_bar", 
        },
        ["plates & wires"] = {
            ["iron plate"] = "resource_iron_plate", 
            ["steel plate"] = "resource_steel_plate", 
            ["aluminium plate"] = "resource_aluminium_plate", 
            ["aluminium wire"] = "resource_aluminium_wire", 
        },
        ["textile & leather"] = {
            ["piece of cloth"] = "resource_cloth", 
            ["thick fabric"] = "resource_thickcloth", 
            ["wool cloth"] = "resource_wool_cloth", 
            ["thickwool"] = "resource_thickwool", 
            ["animal hide"] = "resource_hide", 
            ["leather"] = "resource_leather", 
            ["thick leather"] = "resource_thick_leather", 
            ["thick hide"] = "resource_thick_hide", 
            ["fur"] = "resource_fur", 
            ["fur tanned"] = "resource_fur_tanned", 
            ["fiber"] = "resource_fiber", 
            ["rope"] = "resource_rope", 
        },
        ["chemicals"] = {
            ["gunpowder"] = "resource_gunpowder", 
            ["explosive material"] = "explosive", 
            ["acid"] = "resource_acid", 
            ["filter"] = "resource_filter", 
            ["charcoal"] = "resource_charcoal", 
            ["thermite"] = "resource_thermite", 
            ["spore blocker"] = "resource_spore_blocker", 
            ["iodine"] = "iodine", 
        },
        ["construction"] = {
            ["stone block"] = "resource_stoneblock", 
            ["concrete"] = "resource_concrete", 
            ["red brick"] = "resource_red_brick", 
            ["scraps metal"] = "resource_metalscraps", 
            ["plastic"] = "resource_plastic", 
            ["rubber"] = "resource_rubber", 
            ["adhesive"] = "resource_adhesive", 
            ["carbon"] = "resource_carbon", 
        },
        ["electronics"] = {
            ["glass"] = "resource_glass", 
            ["fiberglass"] = "resource_fiberglass", 
            ["milled quartz"] = "resource_milled_quartz", 
            ["resource_catalyst"] = "resource_catalyst", 
            ["electronic part"] = "resource_electronicparts", 
        },
        ["agriculture"] = {
            ["seed"] = "resource_seed", 
            ["corn seed"] = "resource_cornseed", 
            ["sapling"] = "resource_sapling", 
            ["peat"] = "resource_peat", 
        },
        ["misc resources"] = {
            ["alkohol"] = "resource_spirit", 
            ["seaweed"] = "resource_seaweed", 
            ["zombie bones"] = "resource_zombie_bones", 
        },
    },

    -- ========== VEHICLE PARTS ==========
    ["vehicle part"] = {
        ["chopper parts"] = {
            ["chopper wheel"] = "chopper_wheel",
            ["chopper fork"] = "chopper_fork",
            ["chopper gastank"] = "chopper_gastank",
        },
        ["ATV parts"] = {
            ["atv wheel"] = "atv_wheel",
            ["atv transmission"] = "atv_transmission",
        },
        ["truck parts"] = {
            ["truck wheel"] = "truck_wheel",
            ["truck chainsaw"] = "truck_chainsaw",
        },
        ["boat parts"] = {
            ["speedboat motor"] = "speedboat_motor",
            ["boat pump"] = "speedboat_pumpboat_motor",
            ["boat screw"] = "boat_screw",
        },
        ["bike equipment"] = {
            ["tire bike equipment"] = "tire_chains_bike_equipment",
            ["beacon bike equipment"] = "beacon_bike_equipment",
            ["nitro bike equipment"] = "nitro_bike_equipment",
            ["power frame bike equipment"] = "power_frame_bike_equipment",
            ["navigator bike equipment"] = "navigator_bike_equipment",
        },
    },  

    -- ========== SPARE PARTS ==========
    ["spareparts"] = {
        ["basic tools"] = {
            ["wrench"] = "junk_wrench",
            ["nails"] = "resource_nails",
            ["bolts"] = "screws",
            ["duct tape"] = "duct_tape",
            ["spring weapon"] = "resource_weaponparts",
        },
        ["mechanical parts"] = {
            ["bearing"] = "bearings",
            ["rubber parts"] = "rubber_parts",
            ["engine part"] = "engine_parts",
            ["turret parts"] = "turret_parts",
            ["weapon oil"] = "resource_weapon_oil",
            ["gunpart"] = "resource_hq_gunparts",
            ["resource_gear"] = "resource_gear", 
            ["hydraulic_parts"] = "hydraulic_parts", 
            ["steel pipes"] = "steel_pipes", 
        },
        ["electronics"] = {
            ["transistor"] = "transistor",
            ["electonic circuit"] = "microcircuit",
            ["thermal sensor"] = "thermal_sensor",
            ["lems"] = "resource_lens",
            ["car battery"] = "car_battery",
            ["powercell"] = "powercell", 
        },
        ["fuel & energy"] = {
            ["fuel canister"] = "resource_gasoline",
            ["gasoline bottle"] = "gasoline_bottle",
            ["gas bottle"] = "gas_bottle", 
        },
    },

        -- ========== CONSUMABLE ==========
    ["consumable"] = {
        ["medical"] = {
            ["bandage"] = "bandage",
            ["first aid kit"] = "aid_kit",
            ["air kit snow"] = "aid_kit_snow",
            ["inhaler"] = "inhaler",
            ["reagents box"] = "reagents_box",
            ["rad protect"] = "rad_protect",
            ["rad pills"] = "rad_reduce_pills",
        },
        ["food raw"] = {
            ["carrot"] = "carrot",
            ["berry"] = "berry",
            ["blue berry"] = "blue_berry",
            ["raw meat"] = "food_rawmeat",
            ["raw turkey meat"] = "food_raw_turkey",
            ["mushroom"] = "food_mushroom_normal",
            ["corn"] = "corn",
        },
        ["food cooked"] = {
            ["steak"] = "food_steak",
            ["jerky"] = "food_jerky",
            ["carrow stew"] = "food_carrot_stew",
            ["berry tea"] = "food_compote",
            ["food baked turkey"] = "food_baked_turkey",
        },
        ["fish"] = {
            ["fish perch"] = "food_raw_perch_2",
            ["fish carp"] = "food_raw_carp_2",
            ["fish salmon"] = "food_raw_salmon_2",
            ["fish catfish"] = "food_raw_catfish_2",
            ["fish sturgen"] = "food_raw_sturgeon_2",
            ["fish trout"] = "food_raw_trout_2",
        },
        ["canned & packaged"] = {
            ["canned foods"] = "food_beans",
            ["spices"] = "food_spices",
        },
        ["drinks"] = {
            ["Bottle water"] = "full_bottle",
            ["Beer"] = "food_beer",
            ["whiskey"] = "food_whiskey",
            ["food champagne"] = "food_champagne",
            ["food blue berry tincture"] = "food_blue_berry_tincture",
        },
        ["boosters"] = {
            ["vitamin xp buff"] = "vitamin_xp_buff",
            ["Frost Resistance stimulant"] = "winter_region_booster",
            ["island_region_booster"] = "island_region_booster",
        },
    },
    
    -- ========== DOGS ==========
    ["Dogs"] = {
        ["dog food"] = {
            ["dog traits"] = "dog_food_energy",
            ["dog food"] = "dog_food_special",
        },
        ["dog equipment"] = {
            ["dog collar"] = "dog_equip_collar",
            ["dog vest"] = "dog_tactical_vest",
            ["dog mask"] = "dog_equip_mask",
            ["dog equip harness"] = "dog_equip_harness",
        },
        ["dog breeds"] = {
            ["black dog shepherd"] = "dog_box_shop_black",
            ["white dog shepherd"] = "dog_box_shop_white",
            ["rottweiler dog rank iv"] = "dog_box_shop_rottweiler_t4",
            ["husky dog rank iv"] = "dog_box_shop_husky_t4",
            ["shepherd dog rank iv"] = "dog_box_shop_shepherd_t4",
            ["corgi dog rank iv"] = "dog_box_shop_corgi_t4",
            ["senbernar dog rank iv"] = "dog_box_shop_senbernar_t4",
            ["doberman dog rank iv"] = "dog_box_shop_dobermann_t4",
        },
    },

    -- ========== MUSIC ==========
    ["music"] = {
        ["player"] = {
            ["gramophone player"] = "furniture_gramophone",
        },
        ["event vinyls"] = {
            ["vinyl purge event"] = "gramophone_music_purge_event",
            ["vinyl valentine 2025 event"] = "gramophone_music_st_valentine_2025",
            ["vinyl transport hub event"] = "gramophone_music_transport_hub",
            ["vinyl port event"] = "gramophone_music_port",
            ["vinyl motel event"] = "gramophone_music_motel",
            ["vinyl hunting ground event"] = "gramophone_music_hunting_grounds",
            ["vinyl halloween event"] = "gramophone_music_halloween_commune",
            ["vinyl fair event"] = "gramophone_music_fair",
            ["vinyl factory event"] = "gramophone_music_factory",
            ["vinyl commune battle event"] = "gramophone_music_commune_battle",
            ["vinyl commune event"] = "gramophone_music_commune",
            ["vinyl chinese event"] = "gramophone_music_chinese_2024",
        },
    },

    -- ========== OTHER ITEMS ==========
    ["other"] = {
        ["access cards"] = {
            ["card a"] = "pass_card_a",
            ["card b"] = "pass_card_b",
            ["card c"] = "pass_card_c",
            ["card d"] = "pass_card_d",
            ["card f"] = "pass_card_f",
            ["card r"] = "pass_card_r",
            ["card z"] = "pass_card_z",
            ["lab card a normal"] = "lab_pass_card_sector_a",
            ["lab card b normal"] = "lab_pass_card_sector_b",
            ["lab card a hard"] = "lab_hardmod_pass_card_sector_a",
            ["lab card b hard"] = "lab_hardmod_pass_card_sector_b",
            ["transport hub terminal card"] = "transport_hub_terminal_card",
        },
        ["bunker items"] = {
            ["bungker tube tag"] = "bunker_reputation_tube",
            ["bungker dog tag"] = "bunker_reputation_dogtag",
            ["bungker notebook"] = "bunker_reputation_notebook",
            ["bungker floppy disk"] = "bunker_coordinates_floppy",
        },
        ["police station"] = {
            ["police coupon common"] = "police_coupon_common",
            ["police coupon uncommon"] = "police_coupon_uncommon",
            ["police coupon rare"] = "police_coupon_rare",
            ["police coupon very rare"] = "police_coupon_very_rare",
            ["jail key"] = "police_jail_key",
        },
        ["lab items"] = {
            ["lab item id card"] = "lab_reputation_item_easy",
            ["lab item hardrive"] = "lab_reputation_item_medium",
            ["lab item disk"] = "lab_reputation_item_hard",
        },
        ["reputation items"] = {
            ["briefcase"] = "season_06_reputation_briefcase",
            ["genesis reputation key"] = "genesis_reputation_key",
            ["genesis delivery reputation"] = "genesis_delivery_reputation_item",
        },
        ["delivery boxes"] = {
            ["deliverty tool box"] = "delivery_tools_box",
            ["delivery resources box"] = "delivery_resources_box",
            ["delivery toxic box"] = "delivery_toxic_box",
            ["delivery advanced resources box"] = "delivery_advanced_resources_box",
            ["delivery_premium_box"] = "delivery_premium_box",
        },
        ["radiotower"] = {
            ["radiotower amplifer"] = "radiotower_amplifier",
            ["radiotower antenna"] = "radiotower_antenna",
        },
        ["misc items"] = {
            ["finger"] = "convoy_finger",
            ["Chopper magazine"] = "chopper_experience_magazine",
            ["caps coin"] = "slot_machine_coin",
            ["coupon fair"] = "calendar_fair_gacha_coupon_item",
            ["Collector coupon"] = "season_15_guaranteed_gacha_skin_coupon",
            ["farm barn key"] = "farm_barn_key",
            ["raider map fragment"] = "new_slot_machine_map_fragment",
            ["raider map fragment full"] = "new_slot_machine_map_full",
            ["diskete weather station"] = "weather_discette_halloween_2025",
            ["diskete weather snowfall"] = "weather_discette_snowfall",
            ["quantum batteries"] = "coop_keys_view",
        },
    },

        -- ========== JUNK ==========
    ["junk"] = {
        ["containers"] = {
            ["Empty Can"] = "empty_can",
            ["Empty bottle"] = "empty_bottle",
        },
        ["electronics"] = {
            ["cell phone"] = "junk_cellphone",
            ["watch"] = "junk_watch",
            ["light bulb"] = "junk_lightbulb",
            ["batteries"] = "junk_batteries",
            ["camera"] = "junk_camera",
            ["flash light"] = "junk_flashlight",
            ["flashdrive"] = "junk_flashdrive",
        },
        ["valuables"] = {
            ["goldbar"] = "junk_goldbar",
        },
        ["misc junk"] = {
            ["cigarettes"] = "junk_cigarettes",
            ["lock"] = "junk_lock",
        },
    },

    -- ========== PAINT ==========
    ["Paint"] = {
        ["paint colors"] = {
            ["Green pain"] = "junk_paint",
            ["Black pain"] = "paint_black",
            ["Blue pain"] = "paint_blue",
            ["Red pain"] = "paint_red",
            ["White pain"] = "paint_white",
            ["Yellow pain"] = "paint_yellow",
        },
    },

    -- ========== HUNTING EVENT ==========
    ["Hunting Event Limited time"] = {
        ["animal parts"] = {
            ["Aligator Skin"] = "birthday_2024_resource_alligator_item",
            ["Bear Claw"] = "birthday_2024_resource_bear_item",
            ["Deer antler"] = "birthday_2024_resource_deer_item",
            ["Fox tail"] = "birthday_2024_resource_fox_item",
            ["Boar tusk"] = "birthday_2024_resource_hog_item",
            ["Wolf fur"] = "birthday_2024_resource_wolf_item",
        },
        ["materials"] = {
            ["Sample Box"] = "birthday_2024_resource_case_item",
            ["Abrasive"] = "birthday_2024_resource_emery",
        },
    },

     -- ========== new year EVENT ==========
    ["New Year Event 2025 Limited time"] = {
        ["bullet"] = {
            ["5.56 bullet cracker"] = "new_year_2025_bullet_scar",
            [".45 bullet cracker"] = "new_year_2025_bullet_shotgun",
            [".357 bullet cracker"] = "new_year_2025_bullet_colt",
           
        },
        ["materials"] = {
            ["copper pipe"] = "new_year_2024_copper_pipeline",
            ["Holiday brifcase"] = "new_year_2023_case_with_happines",
            ["christmas brifcase"] = "new_year_2022_briefcase",
           
        },
    },

    -- ========== EQUIPMENT ==========
    ["Equipment"] = {
        ["protective gear"] = {
            ["Gas mask"] = "gas_mask",
        },

        ["backpack"] = {
            ["Tactical Backpack"] = "backpack_military",
            ["backpack military"] = "backpack_12",
            ["simple backpack"] = "backpack_8",
        },

        ["Lubu set"] = {
            ["lu bu hat"] = "chinese_lubu_hat",
            ["lu bu shirt"] = "chinese_lubu_shirt",
            ["lu bu pants"] = "chinese_lubu_pants",
            ["lu bu boot"] = "chinese_lubu_boots",
        },

        ["Special Equipment"] = {
            ["deer hat"] = "deer_hat",
            ["Chrismas hat"] = "christmas_hat_2019",
            ["Chrismas shirt"] = "christmas_shirt_2019",
            ["Chrismas pants"] = "christmas_pants_2019",
        },

        ["CBRN COMBAT"] = {
            ["CBRN Helmet"] = "antirad_hat_fortified",
            ["CBRN armor"] = "antirad_shirt_fortified",
            ["CBRN pants"] = "antirad_pants_fortified",
            ["CBRN boots"] = "antirad_boots_fortified",
        },
        
        ["Anti radiation"] = {
            ["antirad Helmet"] = "antirad_hat",
            ["antirad armor"] = "antirad_shirt",
            ["antirad pants"] = "antirad_pants",
            ["antirad boots"] = "antirad_boots",
        },
        
        ["biker armor"] = {
            ["biker Helmet"] = "biker_helmet_fortified",
            ["biker armor"] = "biker_shirt_fortified",
            ["biker pants"] = "biker_pants_fortified",
            ["biker boots"] = "biker_boots_fortified",
        },

    },
    
     -- ========== Blueprint Weapon ==========
    ["Blueprint Weapon"] = {
        ["blueprints gacha"] = {
            ["blueprints tube exchange"] = "blueprints_tube_exchange",
            ["blueprints extremely rare"] = "rare_blueprints_tube_exchange",
        },
        ["Blueprint"] = {
            ["Glock Blueprint"] = "blueprints_tube_glock",
            ["Mini Uzi Blueprint"] = "blueprints_tube_mini_uzi",
            ["Homemade Pistol Blueprint"] = "blueprints_tube_pipe_pistol",
            ["ak47 Blueprint"] = "blueprints_tube_rifle_ak47",
            ["M16 Blueprint"] = "blueprints_tube_rifle_m16",
            ["FN Scar Blueprint"] = "blueprints_tube_rifle_scar_stock",
            ["Shotgun Blueprint"] = "blueprints_tube_shotgun",
            ["vss vintorez Blueprint"] = "blueprints_tube_vss_vintorez",
           
        },
    },

        -- ========== WEAPON RANGE ==========
    ["Weapon Range"] = {
        ["bows"] = {
            ["box simple"] = "bow_simple",
            ["crossbow single"] = "crossbow_single",
            ["crossbow light"] = "crossbow_light",
        },
        ["pistols"] = {
            ["Glock"] = "glock",
            ["pipe pistol"] = "pipe_pistol",
            ["colt pyton"] = "colt_python",
            
        },
        ["Fair Weapon"] = {
            ["fair glock"] = "calendar_fair_glock",
            ["fair m16"] = "calendar_fair_rifle_m16",
            ["fair scar"] = "calendar_fair_rifle_scar_stock",
            ["fair ak47"] = "calendar_fair_rifle_ak47",
        },
        ["Spore Weapon"] = {
            ["spore dissolver"] = "spore_dissolver",
            ["sporebreaker pistol"] = "sporebreaker_pistol",
            ["sporebreaker rifle"] = "sporebreaker_rifle",
            ["sporebreaker sniper rifle"] = "sporebreaker_sniper_rifle",
            ["sporebreaker greanade launcher"] = "sporebreaker_grenade_launcher",
            
        },
        ["rifles"] = {
            ["vss vintorez"] = "vss_vintorez",
            ["rifle m16"] = "rifle_m16",
            ["rifle ak47"] = "rifle_ak47",
            ["rifle_svd"] = "rifle_svd",
            ["rifle scar"] = "rifle_scar_stock",
            ["hunting rifle elite"] = "hunting_rifle_elite",
            
        },
        ["shotguns"] = {
            ["shotgun"] = "shotgun",
            ["winchester"] = "winchester",
            
        },
        ["Nomad ice Weapon"] = {
            ["flamethrower"] = "flamethrower",
            ["nomad fire rifle"] = "nomad_fire_rifle",
            ["Apocalypse Breath"] = "quad_barrel_shotgun",
            
        },
        ["Genesis Weapon"] = {
            ["neutralizer"] = "deagle",
            ["Ultimatum"] = "genesis_sniper_rifle",
            ["Equalizer"] = "genesis_rifle",
            ["Guardian"] = "genesis_shotgun",
            ["Resonance Gun"] = "genesis_gaus_rifle",
            
        },
        ["special weapons"] = {
            ["Minigun"] = "minigun",
            ["Grenade Launcher"] = "rifle_m32",
            ["flaregun"] = "christmas_flaregun",
            ["uzi"] = "mini_uzi",
            ["harpoon"] = "harpoon",
            ["earth drill"] = "earth_drill",
            
            
        },
    },

    -- ========== WEAPON NON-RANGE ==========
    ["Weapon NonRange"] = {
        ["basic melee"] = {
            ["weapon metal pipe"] = "lead_pipe",
            ["crowbar"] = "crowbar",
            ["torch"] = "torch",
            ["cleaver"] = "cleaver",
            ["machete"] = "machete",
            ["fair lead pipe"] = "calendar_fair_lead_pipe",
        },
        ["tools"] = {
            ["pickaxe"] = "pickaxe",
            ["pickaxe_iron"] = "pickaxe_iron",
            ["hatchet"] = "hatchet",
            ["hatchet_iron"] = "hatchet_iron",
            ["shovel"] = "shovel",
        },
        ["sports equipment"] = {
            ["makeshift bat"] = "bat",
            ["baseball bat"] = "baseballbat",
            ["hockey stick"] = "hockeystick",
            ["golf club"] = "golfclub",
        },
        ["spears"] = {
            ["spear_wooden"] = "spear_wooden",
            ["lubu weapon"] = "spear_chinese",
        },
        ["blades"] = {
            ["katana"] = "katana",
            ["sawblade"] = "sawblade",
            ["roadsign"] = "roadsign",
            ["paddle"] = "paddle",
            ["sword"] = "chinese_sword",
            ["scythe"] = "scythe",
            ["heavy raiders blade"] = "heavy_raiders_blade",
        },
        ["heavy weapons"] = {
            ["sledgehammer"] = "sledgehammer",
        },
        ["fishing"] = {
            ["fishing rod wooden"] = "fishing_rod_wooden",
            ["fishing rod profesional"] = "fishing_rod_professional",
            ["fishing rod rare"] = "fishing_rod_extra_professional",
        },
    },

    -- ========== BOMBS ==========
    ["bombs"] = {
        ["explosives"] = {
            ["land mine"] = "land_mine",
            ["c4 bomb"] = "c4_explosive",
            ["Grenade"] = "grenade",
            ["carrot grenade"] = "carrot_grenade",
            ["molotov"] = "molotov",
        },
    },

     -- ========== DRONE ==========
    ["drone"] = {
        ["drone parts"] = {
            ["drone controller"] = "drone_controller",
            ["drone battery"] = "drone_recharge_battery",
        },
        ["drone blueprints"] = {
            ["blueprint drone normal"] = "drone_blueprints_tube_exchange",
            ["blueprint drone rare"] = "blueprints_drone_module_tube_exchange",
        },
    },

        -- ========== FURNITURE STORAGE ==========
    ["furniture storage"] = {

        ["small storage"] = {
            ["small box"] = "furniture_chest_4",
            ["chest"] = "furniture_chest_8",
            ["trunk"] = "furniture_chest_16",
        },

         ["Weapon Rack"] = {
            ["weapon rack lv1"] = "furniture_weapon_wardrobe",
            ["weapon rack lv2"] = "furniture_weapon_wardrobe_t2",
        },

        ["specialized storage"] = {
            ["furniture medical storage"] = "furniture_medical_box",
            ["furniture decor storage"] = "furniture_decor_storage",
            ["furniture Divided storage"] = "furniture_mechanic_toolbox",
            ["furniture junk storage"] = "furniture_junk_box",
            ["furniture electonic storage"] = "furniture_electric_parts_box",
            ["furniture fish storage"] = "furniture_fish_storage",
            ["furniture fur storage"] = "furniture_fur_storage",
            ["furniture explosive storage"] = "furniture_explosives_storage",
            ["furniture ore storage"] = "furniture_ore_storage",
            ["furniture vehicle storage"] = "furniture_vehicle_parts_storage",
            ["furniture equipment storage"] = "furniture_equip_wardrobe",
        },
        ["large storage"] = {
            ["furniture bookself"] = "furniture_bookshelf",
            ["furniture builder storage"] = "furniture_builder_chest",
            ["furniture safe storage"] = "furniture_safe",
        },

        ["utility storage"] = {
            ["furniture another around"] = "furniture_bar",
            ["furniture gasoline storage"] = "gasoline_tank",
            ["fridge lv 1"] = "furniture_fridge_t1",
        },
    },
    
    -- ========== FURNITURE SEASON REWARD ==========
    ["furniture season reward"] = {
        ["seasonal decor"] = {
            ["Furniture Ice Block"] = "furniture_ice_block",
            ["Cat House"] = "furniture_cat_house",
            ["infected specimen"] = "furniture_infected_specimen",
            ["haloween scarecrow"] = "furniture_halloween_scarecrow",
            ["haloween pumpkin cadles"] = "furniture_halloween_pumpkin_candles",
            ["haloween pumpkin box"] = "furniture_halloween_pumpkin_box",
            ["christmas snowball"] = "furniture_christmas_snowball",
            ["bear statue"] = "furniture_ursa_major",
            ["pagoda"] = "furniture_chinese_summer_house",
            ["scarecrow"] = "furniture_antler_scarecrow",
            ["torch ritual"] = "furniture_antler_torch",
            ["candy grave"] = "furniture_candy_grave",
            ["christmas deer"] = "furniture_christmas_deer",
            ["snowban"] = "furniture_christmas_snowman",
            ["festive arc"] = "furniture_festive_arch",
            ["fireplace"] = "workbench_christmas_fireplace",
            ["furniture crypt"] = "furniture_crypt",
        },
        ["functional furniture"] = {
            ["holo projector"] = "furniture_holoprojector",
            ["sloth machine"] = "furniture_hacked_slot_machine",
            ["treadmill"] = "furniture_treadmill",
            ["trafic lights"] = "furniture_traffic_lights",
            ["turbo chopper"] = "furniture_turbo",
            ["comfort chair"] = "furniture_suspended_chair",
            ["surfboard"] = "furniture_surfboard",
            ["sporelab"] = "furniture_spore_lab",
            ["fireworks"] = "furniture_new_year_2023_fireworks",
            ["bbq steak stove"] = "bbq_steak_workbench",
            ["anchor"] = "furniture_anchor",
            ["avocado chair"] = "furniture_avocado",
            ["barbell"] = "furniture_barbell",
            ["basketball hoop"] = "furniture_basketball_hoop",
            ["birdbox"] = "furniture_bird_box",
            ["beatson"] = "furniture_beatson",
            ["brain freeze"] = "furniture_brain_freeze",
            ["carrot vending machine"] = "furniture_carrot_vending_machine",
            ["coffee table"] = "furniture_coffee_table",
            ["crater model"] = "furniture_crater_model",
            ["crossing sign"] = "furniture_crossing",
            ["dummy"] = "furniture_dummy",
            ["echo"] = "furniture_extractor",
            ["fish sign"] = "furniture_fishsign",
            ["krumpy doll"] = "furniture_krumpy",
            ["furniture weather station"] = "furniture_weather_station",
            ["furniture wheel of fortune"] = "furniture_home_wheel_of_fortune",
        },
        ["garden furniture"] = {
            ["garden bike"] = "furniture_8_march_garden_bike",
            ["garden chair"] = "furniture_8_march_garden_chair",
            ["garden fence"] = "furniture_8_march_garden_fence",
        },
    },
    
    -- ========== FURNITURE POSTER TROPHY ==========
    ["furniture poster trophy"] = {
        ["trophies"] = {
            ["blind head statue"] = "furniture_trophy_blind_tank",
            ["witch head statue"] = "furniture_trophy_witch",
            ["grinch head statue"] = "new_arena_trophy_grinch",
            ["krampus head statue"] = "new_arena_trophy_krampus",
            ["pair boss head statue"] = "new_arena_trophy_pair_boss",
            ["witch new head statue"] = "new_arena_trophy_witch",
            ["winter region trophy"] = "furniture_winter_region_trophy",
            ["island trophy alberd"] = "furniture_island_region_trophy",
        },
        ["posters"] = {
            ["poster halloween 2025"] = "furniture_poster_halloween_2025",
            ["birthday 2024 poster"] = "furniture_birthday_2024_poster",
            ["poster flag commune"] = "commune_2024_flag",
            ["poster sussie"] = "sussi_poster",
        },
        ["wall decorations"] = {
            ["ornament wall 1"] = "furniture_garland_halloween_2025",
            ["ornament wall 2"] = "furniture_garland_halloween_2025_2",
            ["ornament wall 3"] = "furniture_garland_halloween_2025_3",
            ["ornament Christmas toy"] = "furniture_garland_toy_new_year",
            ["ornament chrismas light"] = "furniture_garland_lights_new_year",
        },
    },

    -- ========== FURNITURE MIX ==========
    ["furniture mix"] = {
        ["power & utilities"] = {
            ["Generator"] = "generator",
        },
        ["plants"] = {
            ["sapling pine"] = "sapling_pine",
            ["sapling oak"] = "sapling_oak",
            ["sapling sakura"] = "sapling_sakura",
        },
        ["workbenches"] = {
            ["home workbench repair"] = "home_workbench_repair",
        },
        ["misc furniture"] = {
            ["broken bike"] = "furniture_broken_bike",
        },
    },

    -- ========== PACK ITEMS ==========
    ["Pack item, only replace in inbox !!"] = {
        ["weapon packs"] = {
            ["weapon part new"] = "dota_gacha_weapon_parts_new",
            ["guaranteed gacha weapon"] = "guaranteed_gacha_weapon_new",
            ["silencer weapon"] = "dota_gacha_weapon_silencer",
            ["Scorching weapon Limited Time"] = "dota_gacha_new_year_2024_weapon",
            ["assault pack"] = "dota_gacha_weapon_assault",
            ["suppersion pack"] = "dota_gacha_weapon_suppression",
           
        },

        ["amazon edition packs"] = {
             ["Stromtoopers pack"] = "ldoe_amazon_prime_2020_box_9",
             ["defender pack"] = "ldoe_amazon_prime_2020_box_8",
             ["guerrilas pack"] = "ldoe_amazon_prime_2020_box_7",
             ["saboteur pack"] = "ldoe_amazon_prime_2020_box_6",
             ["special operation pack"] = "ldoe_amazon_prime_2020_box_5",
           
        },

        ["gacha new model packs"] = {
             ["weapon nonRange pack"] = "gacha_halloween",
             ["body repair pack"] = "gacha_paint",
             ["enginer pack"] = "gacha_details",
             ["humanitarian aid pack"] = "gacha_food",
             ["resource pack"] = "gacha_resource",
             ["weapon pack"] = "gacha_modified_weapon",
             ["rare weapon pack"] = "gacha_rare_weapon",
             ["guns pack"] = "gacha_simple_weapon",
            
        },

        ["armor packs"] = {
            ["guaranteed gacha armor"] = "guaranteed_gacha_armor",
            ["antiradiation armor"] = "dota_gacha_bunker_bravo_new",
            ["armor piercing pack contain reanimator limited time"] = "dota_gacha_armor_piercer",
            ["veteran pack"] = "dota_gacha_oldsman",
            ["farmer pack"] = "dota_gacha_farmer",
            ["ambush pack"] = "dota_gacha_ambush",
            ["military pack"] = "dota_gacha_military_equipment",
            ["special force new pack"] = "dota_gacha_weapon_sf_new",
            ["unlocking pack"] = "dota_gacha_robbery_set",
            ["expert pack"] = "dota_gacha_expert",
            ["bunker pack"] = "dota_gacha_bunker",
        },

        ["sparepart packs"] = {
            ["atv pack"] = "dota_gacha_transport_atv",
            ["boat pack"] = "dota_gacha_transport_boat",
            ["chooper pack"] = "dota_gacha_transport_chopper",
            ["motor kit pack"] = "dota_gacha_motokit",
            
        },

        ["Dog packs"] = {
            ["basket with puppies"] = "guaranteed_gacha_dogs",
        },

        ["resource packs"] = {
            ["factory part new rope 100%"] = "dota_gacha_factory_parts_new",
            ["stash of making"] = "dota_gacha_furniture_set",
            ["building material"] = "dota_gacha_building",
            ["specialist pack"] = "dota_gacha_weapon_engineer",
            ["mechanic pack"] = "dota_gacha_weapon_mechanics",
            ["weapon part old pack"] = "dota_gacha_weapon_parts",
            ["factory part pack"] = "dota_gacha_factory_parts",
            ["resource pack"] = "dota_gacha_resource",
        },
        ["special packs"] = {
            ["destroyer pack"] = "dota_gacha_for_coins",
            ["Hunter pack limited time"] = "dota_gacha_birthday_2024",
            ["lubu pack limited time"] = "dota_gacha_chinese_2024",
            ["lubu pack 2 limited time"] = "chinese_2024_reputation_kumquat",
            ["biker pack limited time"] = "dota_gacha_daredevil",
            ["explorer pack experience"] = "dota_gacha_research_set",
           
        },
    },
}

-------------------------------------------------
-- HELPER FUNCTIONS 
-------------------------------------------------
local function text_to_hex_utf16le(str)
    local hex_arr = {}
    for i = 1, #str do
        local b = string.byte(str, i)
        table.insert(hex_arr, string.format("%02X 00", b))
    end
    return "h " .. table.concat(hex_arr, " ")
end

-----------------------------------------------------------
-- function scan dan refine (AUTO REFINE VERSION)
-----------------------------------------------------------
local function ScanAndRefine(item_id, display_name, refine_value, data_type)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)

    local hex_pattern = text_to_hex_utf16le(item_id)
    gg.toast("🔍 Find: " .. (display_name or item_id))

    -- Step 1: Cari string UTF16
    gg.searchNumber(hex_pattern, gg.TYPE_BYTE)

    local found = gg.getResultsCount()
    if found == 0 then
        gg.alert("⚠️ Item '" .. (display_name or item_id) .. "' tidak ditemukan.")
        return false
    end

    gg.toast("✅ Found " .. found .. " addresses")

    -- Step 2: AUTO REFINE - pakai nilai pertama dari hasil
    if not refine_value then
        -- Ambil nilai byte pertama dari hasil pencarian
        local first_result = gg.getResults(1)[1]
        if first_result then
            refine_value = first_result.value
            data_type = gg.TYPE_BYTE
            gg.toast("🎯 Auto-refine menggunakan nilai: " .. refine_value .. " ('" .. string.char(refine_value) .. "')")
        else
            gg.toast("⚠️ Tidak bisa ambil nilai pertama, skip refine")
            return true  -- Return true meski tanpa refine
        end
    end

    -- Step 3: Lakukan refine dengan nilai yang dipilih
    gg.refineNumber(refine_value, data_type)

    local final_found = gg.getResultsCount()
    if final_found == 0 then
        -- Jika refine gagal, tetap gunakan hasil awal
        gg.toast("⚠️ Refine gagal, menggunakan hasil awal")
        gg.clearResults()
        gg.searchNumber(hex_pattern, gg.TYPE_BYTE)
        final_found = gg.getResultsCount()
    end

    gg.toast("🎯 Final result: " .. final_found .. " addresses")
    return true
end

---------------------------------
-- DATA HANDLER
---------------------------------
local Data = {}

function Data.load()
    if not ITEM_DATA then 
        gg.alert("⚠️ List Item Data Not found")
        return {}
    end
    return ITEM_DATA
end

-------------------------------------------------
-- function ReplaceItem auto (fixed QWORD/DWORD handling)
------------------------------------------
local function ReplaceItem(ptr)
    if not ptr then
        gg.alert("⚠️ Pointer invalid")
        return
    end

    local back5 = ptr - (5 * 4) -- alamat target yang ingin ditulis
    -- back5 is a number (decimal). We'll write numeric values to list.

    local list = gg.getListItems()
    if not list or #list == 0 then
        gg.alert("⚠️ SaveList Empty. Run Step One First")
        return
    end

    local edit = {}
    for i, v in ipairs(list) do
        -- only replace numeric pointer types (DWORD or QWORD)
        if v.flags == gg.TYPE_QWORD or v.flags == gg.TYPE_DWORD then
            local val = back5
            if v.flags == gg.TYPE_DWORD then
                -- ensure 32-bit wrap
                val = back5 % 4294967296
            end
            edit[#edit + 1] = {
                address = v.address,
                flags = v.flags,
                value = val
            }
        end
    end

    if #edit == 0 then
        gg.alert("⚠️ No QWORD/DWORD Address in SaveList!")
        return
    end

    -- konfirmasi sebelum replace
    local ask = gg.alert(
        "⚠️ Are you sure want to replace?\n\n" ..
        "🎯 Target: " .. (MANUAL_SCAN_TARGET or "Unknown") .. "\n\n" ..
        "🔁 Proses.",
        "Gass", "nope"
    )

    if ask ~= 1 then
        gg.toast("⛔ Replace cancelled user")
        return
    end

    -- backup current list values for revert
    _G.LAST_REPLACE_BACKUP = list
    _G.LAST_REPLACED_ITEM = MANUAL_SCAN_TARGET or "Unknown Item"

    local ok, err = pcall(gg.setValues, edit)
    if not ok then
        gg.alert("⚠️ Replace failed: " .. tostring(err))
        return
    end

    gg.toast("🔥 Replace Done: " .. (_G.LAST_REPLACED_ITEM))
end

-------------------------------------------------
-- fungsi revert (restore)
---------------------------------
local function RevertReplace()
    if not _G.LAST_REPLACE_BACKUP then
        gg.alert("⚠️ There's no data to Restore!")
        return
    end

    local restore = {}
    for _, v in ipairs(_G.LAST_REPLACE_BACKUP) do
        -- try to convert numeric if possible, but set as original value
        local orig_val = v.value
        -- gg.setValues accepts numbers or strings; keep original type
        restore[#restore + 1] = {
            address = v.address,
            flags = v.flags,
            value = tonumber(orig_val) or tostring(orig_val)
        }
    end
   
    -- RESET ITEM AKTIF SETELAH RESTORE
    _G.CURRENT_ACTIVE_ITEM = nil
    _G.CURRENT_ACTIVE_NAME = nil

    local ok, err = pcall(gg.setValues, restore)
    if not ok then
        gg.alert("⚠️ Restore failed: " .. tostring(err))
        return
    end

    gg.toast("🔥 Restore done!")
    _G.LAST_REPLACE_BACKUP = nil
    _G.LAST_REPLACED_ITEM = nil
end

-------------------------------------------------
-- UTF16 READER & SORTER
---------------------------------
local MAX_RESULTS = 500
local READ_LIMIT = 40

local function utf16_to_utf8(cp_list)
    local out = {}
    for _, cp in ipairs(cp_list) do
        if cp <= 0x7F then
            table.insert(out, string.char(cp))
        elseif cp <= 0x7FF then
            table.insert(out, string.char(
                0xC0 + math.floor(cp / 0x40),
                0x80 + (cp % 0x40)
            ))
        elseif cp <= 0xFFFF then
            table.insert(out, string.char(
                0xE0 + math.floor(cp / 0x1000),
                0x80 + (math.floor(cp / 0x40) % 0x40),
                0x80 + (cp % 0x40)
            ))
        else
            table.insert(out, string.char(
                0xF0 + math.floor(cp / 0x40000),
                0x80 + (math.floor(cp / 0x1000) % 0x40),
                0x80 + (math.floor(cp / 0x40) % 0x40),
                0x80 + (cp % 0x40)
            ))
        end
    end
    return table.concat(out)
end

local function batch_read_words(addrs)
    local q = {}
    for _, a in ipairs(addrs) do
        table.insert(q, { address = a, flags = gg.TYPE_WORD })
    end
    local ok, vals = pcall(gg.getValues, q)
    if not ok or not vals then return nil end
    local out = {}
    for i, v in ipairs(vals) do out[i] = v.value end
    return out
end

local function read_utf16_string_at(addr)
    local addrs = {}
    for i = READ_LIMIT, 1, -1 do table.insert(addrs, addr - (i * 2)) end
    table.insert(addrs, addr)
    local mid = #addrs
    for i = 1, READ_LIMIT do table.insert(addrs, addr + (i * 2)) end

    local vals = batch_read_words(addrs)
    if not vals then return "" end

    local cu = {}
    for i, v in ipairs(vals) do cu[i] = (v < 0 and v + 0x10000 or v) end

    local s_i, e_i
    for i = mid, 1, -1 do if cu[i] == 0 then s_i = i + 1 break end end
    s_i = s_i or 1
    for i = mid, #cu do if cu[i] == 0 then e_i = i - 1 break end end
    e_i = e_i or #cu

    local slice = {}
    for i = s_i, e_i do
        if cu[i] ~= 0 then table.insert(slice, cu[i]) end
    end

    if #slice == 0 then return "" end
    return utf16_to_utf8(slice):gsub("^%s+", ""):gsub("%s+$", "")
end

-------------------------------------------------
-- SORTER MAIN
---------------------------------
local Sorter = {}

function Sorter.run()
    local results = gg.getResults(MAX_RESULTS)
    if not results or #results == 0 then
        if not AUTO_SCAN_TARGET and not MANUAL_SCAN_TARGET then
            gg.alert("⚠️ No Data UTF-16.")
        end
        return false
    end

    local found = {}
    for _, r in ipairs(results) do
        local ok, s = pcall(read_utf16_string_at, r.address)
        if ok and s ~= "" then
            found[s] = found[s] or {}
            table.insert(found[s], r.address)
        end
    end

    if not next(found) then
        gg.alert("⚠️ no string valid in address")
        return false
    end

    -- AUTO MODE
    if AUTO_SCAN_TARGET then
        local chosen = AUTO_SCAN_TARGET
        if found[chosen] then
            local addrs = found[chosen]
            local list_to_save = {}
            for _, val_addr in ipairs(addrs) do
                table.insert(list_to_save, {
                    address = val_addr,
                    flags = gg.TYPE_WORD,
                    name = chosen
                })
            end
            gg.clearList() 
            gg.addListItems(list_to_save)
            return true 
        else
            gg.alert("⚠️ [Mode Auto] id String '" .. chosen .. "' not found in refine.")
            return false
        end
    end

    -- MANUAL MODE
    if MANUAL_SCAN_TARGET then
        local chosen = MANUAL_SCAN_TARGET
        local addrs = found[chosen]

        if addrs and #addrs > 0 then
            local first_addr = addrs[1]
            local ask = gg.alert("🔎 found id continue?", "Ok", "Nope")
            if ask ~= 1 then
                gg.toast("⛔ Replace canceled")
                return false
            end

            if _G.LAST_REPLACE_BACKUP then
                RevertReplace() 
            end
            ReplaceItem(first_addr)
            return true
        else
            gg.alert("⚠️ String not found in refine.")
            return false
        end
    end
    
    return false
end

-------------------------------------------------
-- POINTER SCANNER
---------------------------------
local PtrScan = {}

function PtrScan.run()
    local saved_items = gg.getListItems()
    if not saved_items or #saved_items == 0 then
        if not AUTO_SCAN_TARGET then
            gg.alert("⚠️ SaveList empty! cant do Pointer Scan.")
        end
        return false
    end

    gg.setRanges(gg.REGION_ANONYMOUS)

    local info = gg.getTargetInfo()
    local is64 = info.x64 or false

    local ptr_type = is64 and gg.TYPE_QWORD or gg.TYPE_DWORD
    local offset_dec = tonumber(is64 and "14" or "0C", 16)

    local all_pointers_to_save = {}
    local total_hits = 0

    for i, item in ipairs(saved_items) do
        local target_addr = item.address - offset_dec
        local item_name = item.name or "Unknown"

        gg.clearResults()
        gg.searchNumber(tostring(target_addr), ptr_type)

        local found_count = gg.getResultsCount()
        if found_count > 0 then
            local res = gg.getResults(found_count)

            if found_count > 100 or AUTO_SCAN_TARGET then 
                for _, r in ipairs(res) do
                    table.insert(all_pointers_to_save, {
                        address = r.address,
                        flags = ptr_type,
                        name = "PTR -> " .. item_name,
                        freeze = false
                    })
                    total_hits = total_hits + 1
                end
            end
        end
        gg.clearResults()
    end

    if total_hits > 0 then
        gg.clearList()
        gg.addListItems(all_pointers_to_save)
        gg.alert("✅ Done Step one ")
        return true
    else
        gg.alert("⚠️ No pointer founds.")
        return false
    end
end

-------------------------------------------------
-- AUTO EXECUTE
---------------------------------
local function AutoScanAndPointerSuite(item_id, display_name)
    -- Jika display_name tidak diberikan, cari di ITEM_DATA
    if not display_name or display_name == item_id then
        display_name = item_id
        for k, v in pairs(ITEM_DATA) do
            if type(v) == "table" then
                for sub_k, sub_v in pairs(v) do
                    if sub_v == item_id then 
                        display_name = sub_k
                        break 
                    end
                end
            elseif v == item_id then
                display_name = k
            end
        end
    end
    
    -- SIMPAN ITEM AKTIF
    _G.CURRENT_ACTIVE_ITEM = item_id
    _G.CURRENT_ACTIVE_NAME = display_name
    
    gg.clearList()
    
    -- Gunakan auto-refine (parameter refine_value kosong)
    local success_scan = ScanAndRefine(item_id, display_name)  -- TANPA refine_value!

    if success_scan then
        AUTO_SCAN_TARGET = item_id
        local success_sort = Sorter.run()

        if success_sort then
            PtrScan.run()
        else
            gg.alert("⚠️ Gagal proses string data untuk: " .. display_name)
        end

        AUTO_SCAN_TARGET = nil
    else
        gg.alert("❌ Scan gagal: " .. display_name)
    end
end

-------------------------------------------------
-- NAVIGATION ICON MENU
---------------------------------
local Nav = { stack = {}, path = { "List Item" } }

function Nav.push(node, name)
    table.insert(Nav.stack, node)
    table.insert(Nav.path, name)
end

function Nav.pop()
    if #Nav.stack > 1 then
        table.remove(Nav.stack)
        table.remove(Nav.path)
        return true
    end
    return false
end

function Nav.current()
    return Nav.stack[#Nav.stack]
end

-----BUILD MENU 

local function build_menu(node)
    local folders, items = {}, {}

    for k, v in pairs(node) do
        if type(v) == "table" then
            -- CEK APAKAH INI SUBCATEGORY ATAU ITEM LANGSUNG
            local hasSubItems = false
            local isNestedStructure = false
            
            for _, subv in pairs(v) do
                if type(subv) == "string" then
                    hasSubItems = true
                    break
                elseif type(subv) == "table" then
                    isNestedStructure = true
                    break
                end
            end
            
            if hasSubItems then
                -- Ini adalah subcategory yang berisi item langsung
                table.insert(folders, { 
                    name = k, 
                    value = v, 
                    isFolder = true, 
                    isSubcategory = true,
                    containsItems = true
                })
            elseif isNestedStructure then
                -- Ini adalah main category dengan subcategories lagi
                table.insert(folders, { 
                    name = k, 
                    value = v, 
                    isFolder = true, 
                    isSubcategory = false,
                    containsItems = false
                })
            else
                -- Table kosong atau struktur tidak dikenali
                table.insert(folders, { 
                    name = k, 
                    value = v, 
                    isFolder = true, 
                    isSubcategory = false,
                    containsItems = false
                })
            end
        elseif type(v) == "string" then
            -- Ini adalah item langsung tanpa subcategory
            table.insert(items, { 
                name = k, 
                value = v, 
                isFolder = false 
            })
        end
    end

    table.sort(folders, function(a, b) return a.name:lower() < b.name:lower() end)
    table.sort(items, function(a, b) return a.name:lower() < b.name:lower() end)

    local menu, keymap = {}, {}
    
    -- Tampilkan main categories terlebih dahulu
    for _, f in ipairs(folders) do
        if not f.isSubcategory then
            -- Main category dengan icon sesuai mapping
            local icon_map = {
                ["resources"] = "⛏️",
                ["vehicle part"] = "🏍️",
                ["spareparts"] = "🔩",
                ["consumable"] = "🍖",
                ["Dogs"] = "🐕",
                ["music"] = "🎵",
                ["other"] = "📌",
                ["junk"] = "🗑️",
                ["Paint"] = "🎨",
                ["Hunting Event Limited time"] = "🎯",
                ["Equipment"] = "🎒",
                ["Weapon Range"] = "🔫",
                ["Weapon NonRange"] = "🗡️",
                ["bombs"] = "💣",
                ["drone"] = "🚁",
                ["furniture storage"] = "📦",
                ["furniture season reward"] = "🏆",
                ["furniture poster trophy"] = "🖼️",
                ["furniture mix"] = "🛠️",
                ["Pack item, only replace in inbox !!"] = "🎁",
            }
            local icon = icon_map[f.name] or "📂"
            table.insert(menu, icon .. " " .. f.name)
        else
            -- Subcategory dengan icon khusus
            table.insert(menu, "📁 " .. f.name)
        end
        table.insert(keymap, f)
    end
    
    -- Tampilkan items langsung (jika ada di level ini)
    for _, i in ipairs(items) do
        table.insert(menu, "   • " .. i.name)
        table.insert(keymap, i)
    end

    table.insert(menu, "🔙 Back")
    return menu, keymap, #folders
end

-------------------------------------------------
-- CHOOSE ITEM FROM EXPLORER DATA FOR STEP ONE
-------------------------------------------------
local function ChooseItemFromExplorer()
    local data = Data.load()
    if not data or not next(data) then
        gg.alert("⚠️ Item data not loaded!")
        return nil
    end
    
    local NavTemp = { stack = { data }, path = { "List Item" } }
    
    while true do
        local node = NavTemp.stack[#NavTemp.stack]
        local menu, keymap, folderCount = build_menu(node)
        
        local title = "📁 Choose Item for Step One > " .. table.concat(NavTemp.path, " > ")
        
        local choice = gg.choice(menu, nil, title)
        if not choice then return nil end
        
        -- Jika pilihan terakhir (Back)
        if choice > #keymap then
            if #NavTemp.stack > 1 then
                table.remove(NavTemp.stack)
                table.remove(NavTemp.path)
            else
                return nil
            end
        else
            local entry = keymap[choice]
            
            if entry.isFolder then
                -- CEK JIKA INI KATEGORI PACK ITEM
                if entry.name == "Pack item, only replace in inbox !!" then
                    local confirm = gg.alert(
                        "⚠️ PACK ITEM WARNING ⚠️\n\n" ..
                        "This category contains PACK ITEMS only!\n\n" ..
                        "📌 IMPORTANT:\n" ..
                        "• These items can ONLY be replaced in INBOX\n" ..
                        "• Not working in inventory/chest\n" ..
                        "• Make sure item is in inbox first\n" ..
                        "• Use with caution!\n\n" ..
                        "Continue to browse pack items?",
                        "✅ YES, CONTINUE", "❌ NO, GO BACK"
                    )
                    
                    if confirm ~= 1 then
                        -- Kembali ke menu sebelumnya
                        if #NavTemp.stack > 1 then
                            table.remove(NavTemp.stack)
                            table.remove(NavTemp.path)
                        end
                        goto continue
                    end
                end
                
                -- Masuk ke folder
                table.insert(NavTemp.stack, entry.value)
                table.insert(NavTemp.path, entry.name)
            else
                -- Item terpilih, cek apakah dari kategori Pack
                local is_pack_item = false
                for i, path_segment in ipairs(NavTemp.path) do
                    if path_segment == "Pack item, only replace in inbox !!" then
                        is_pack_item = true
                        break
                    end
                end
                
                if is_pack_item then
                    -- TAMPILKAN ALERT KHUSUS UNTUK PACK ITEM
                    local pack_confirm = gg.alert(
                        "⚠️ PACK ITEM SELECTED ⚠️\n\n" ..
                        "📦 Item: " .. entry.name .. "\n\n" ..
                        "📌 IMPORTANT WARNING:\n\n" ..
                        "✅ CAN ONLY be replaced in INBOX\n" ..
                        "❌ NOT working in inventory/storage\n" ..
                        "❌ NOT working in chest/backpack\n" ..
                        "⚠️ After done replace,don't open it first!\n" ..
                        "⚠️ Eat something and FC game, restart!\n" ..
                        "⚠️ Use at your own risk!\n\n" ..
                        "Do you want to proceed with Step One for this pack item?",
                        "✅ YES, I UNDERSTAND", "❌ NO, CANCEL"
                    )
                    
                    if pack_confirm ~= 1 then
                        goto continue
                    end
                end
                
                -- Kembalikan ID dan nama
                return {
                    id = entry.value,
                    name = entry.name
                }
            end
        end
        
        ::continue::
    end
end

-------------------------------------------------
-- EXPLORER ACTIONS
-------------------------------------------------
local function item_actions_single(item_id, display_name)
    -- CEK APAKAH ITEM DARI KATEGORI PACK
    local is_pack_item = false
    local pack_category = "Pack item, only replace in inbox !!"
    
    -- Cari di ITEM_DATA apakah item ini termasuk pack item
    for category_name, category_data in pairs(ITEM_DATA) do
        if category_name == pack_category and type(category_data) == "table" then
            -- Cari di semua subkategori pack
            for subcat_name, subcat_data in pairs(category_data) do
                if type(subcat_data) == "table" then
                    for item_name, item_value in pairs(subcat_data) do
                        if item_value == item_id then
                            is_pack_item = true
                            break
                        end
                    end
                end
            end
        end
    end
    
    if is_pack_item then
        -- TAMPILKAN WARNING TAMBAHAN SEBELUM SCAN
        local final_warning = gg.alert(
            "🚨 FINAL WARNING - PACK ITEM 🚨\n\n" ..
            "Item: " .. display_name .. "\n" ..
            "ID: " .. item_id .. "\n\n" ..
            "⚠️ REMEMBER:\n" ..
            "⚠️ After done replace,don't open it first!\n" ..
            "⚠️ Eat something and FC game, restart!\n" ..
            "⚠️ Make sure you're replacing inbox item!\n\n" ..
            "Are you sure this item is in your INBOX?",
            "✅ YES, IN INBOX", "❌ NO, CANCEL"
        )
        
        if final_warning ~= 1 then
            gg.toast("⛔ Pack item scan cancelled")
            return false
        end
    end
    
    MANUAL_SCAN_TARGET = item_id

    local success_scan = ScanAndRefine(item_id, display_name)

    if success_scan then
        local success_sort = Sorter.run()
        MANUAL_SCAN_TARGET = nil
        return success_sort
    else
        MANUAL_SCAN_TARGET = nil
        return false
    end
end

-- Fungsi untuk menambahkan alert di explorer juga
local function show_pack_warning_if_needed(item_id, display_name, path)
    if string.find(path or "", "Pack item, only replace in inbox !!") then
        gg.alert(
            "📦 PACK ITEM ADDED TO QUEUE\n\n" ..
            "Item: " .. display_name .. "\n\n" ..
            "⚠️ Remember: Only works in INBOX!\n" ..
            "Make sure item is in inbox when replacing.",
            "✅ OK"
        )
    end
end

local QUEUE = {} -- queue untuk multi-replace

local function queue_add(item_id, display_name)
    table.insert(QUEUE, { id = item_id, name = display_name })
    gg.toast("✅ add to Queue: " .. (display_name or item_id) .. " (Total: " .. tostring(#QUEUE) .. ")")
end

local function queue_clear()
    QUEUE = {}
    gg.toast("🗑 Queue empty")
end

local function queue_show()
    if #QUEUE == 0 then
        gg.alert("📭 Queue kosong.")
        return
    end
    
    local menu = {"📋 DAFTAR QUEUE (" .. #QUEUE .. " items):"}
    for i, v in ipairs(QUEUE) do
        table.insert(menu, i .. ". " .. (v.name or v.id))
    end
    table.insert(menu, "🗑 Delete All")
    table.insert(menu, "🔙 Kembali")
    
    local sel = gg.choice(menu, nil, "Multi Replace Queue")
    
    if sel then
        if sel == #menu - 1 then
            queue_clear()
        elseif sel <= #QUEUE then
            -- Tampilkan info item
            gg.alert("Item: " .. QUEUE[sel].name .. "\nID: " .. QUEUE[sel].id)
        end
    end
end

local function queue_run()
    if #QUEUE == 0 then
        gg.alert("⚠️ Queue kosong jir !!. add item first.")
        return
    end

    local confirm = gg.alert(
        "🔁 Start Multi Replace (" .. tostring(#QUEUE) .. " item)?",
        "Ok",
        "Nope"
    )
    if confirm ~= 1 then
        gg.toast("⛔ Multi Replace canceled")
        return
    end

    gg.toast("🔥 Start Multi Replace...")
    
    for i, x in ipairs(QUEUE) do
        local percent = math.floor((i / #QUEUE) * 100)

        -- tampilkan status progres
        gg.toast("🔁 (" .. i .. "/" .. #QUEUE .. ") [" .. percent .. "%] replace: " .. (x.name or x.id))

        -- jalankan replace single
        item_actions_single(x.id, x.name)
        gg.sleep(_G.MULTI_DELAY or 8000)

        -- revert setelah setiap replace
        if _G.LAST_REPLACE_BACKUP then
            RevertReplace()
            gg.sleep(800)
        end

        -- STOP TOTAL bila user membuka GG
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast("⛔ Multi Replace stop totaly by user!")
            break
        end
    end

    gg.toast("✔️ Multi Replace Done!")
    queue_clear()
end

-------------------------------------------------
-- HELPER FUNCTIONS UNTUK EXPLORER
-------------------------------------------------

local function SearchItemGlobal()
    local keyword = gg.prompt({"🔍 Find Name Item (Min 3 Word):"}, nil, {"text"})
    if not keyword or not keyword[1] or #keyword[1] < 3 then
        gg.alert("⚠️ 3 Word Min for Search!")
        return
    end
    
    local key = keyword[1]:lower()
    local results = {}
    
    -- Fungsi rekursif untuk mencari di semua nested structure
    local function search_in_table(tbl, current_path)
        for name, value in pairs(tbl) do
            if type(value) == "table" then
                -- Cari di sub-table
                search_in_table(value, current_path .. " > " .. name)
            elseif type(value) == "string" then
                -- Cek jika nama mengandung keyword
                if string.find(name:lower(), key) then
                    table.insert(results, {
                        name = "Found: " .. name .. " (" .. current_path .. ")",
                        value = value,
                        path = current_path
                    })
                end
            end
        end
    end
    
    -- Mulai pencarian dari root
    for category_name, category_data in pairs(ITEM_DATA) do
        if type(category_data) == "table" then
            search_in_table(category_data, category_name)
        elseif type(category_data) == "string" then
            if string.find(category_name:lower(), key) then
                table.insert(results, {
                    name = "Found: " .. category_name,
                    value = category_data,
                    path = "Root"
                })
            end
        end
    end

    if #results == 0 then
        gg.alert("❌ Item tidak ditemukan dengan kata kunci: " .. key)
        return
    end

    local menu_items = {}
    for _, v in ipairs(results) do
        table.insert(menu_items, v.name)
    end
    
    local sel = gg.choice(menu_items, nil, "🔍 Search Results: '" .. key .. "' (" .. #results .. " items)")
    if sel then
        local chosen = results[sel]
        item_actions_single(chosen.value, chosen.name)
    end
end

local function InputManualID()
    local prompt = gg.prompt(
        {"✍️ Insert Item ID UTF16 :", "Name Item (Optional):"},
        {"resource_...", "Custom Item"},
        {"text", "text"}
    )
    
    if not prompt then return end
    
    local id_val = prompt[1]
    local disp_name = prompt[2]
    
    if id_val == "" then return end
    
    item_actions_single(id_val, disp_name)
end

-- fungsi explorer() versi baru dengan support subcategories
-- Update bagian explorer() untuk menampilkan warning
local function explorer()
    local data = Data.load()
    if not next(data) then return false end

    -- Main Explorer Menu
    local mode_sel = gg.choice({
        "🧭 Replace Item 1 time",
        "🔁 Replace Item Cart System",
        "🔍 Find Item In List",
        "✍️ Input ID UTF16 Manual",
        "⚙️ Setting Delay Time (Cart System)",
        "⬅️ Back to Main Menu"
    }, nil, "Choose Explorer Mode")

    if not mode_sel or mode_sel == 6 then return false end

    -- NEW FEATURES
    if mode_sel == 3 then
        SearchItemGlobal()
        return true
    elseif mode_sel == 4 then
        InputManualID()
        return true
    elseif mode_sel == 5 then
        local ask_delay = gg.prompt({"⏱️ Set Delay Multi-Mode,8000 default value its mean 8 Second:"}, {_G.MULTI_DELAY}, {"number"})
        if ask_delay then 
            _G.MULTI_DELAY = tonumber(ask_delay[1]) 
            gg.alert("✅ Delay Set To: " .. _G.MULTI_DELAY .. "ms")
        end
        return true
    end

    -- SET MODE
    if mode_sel == 1 then 
        MULTI_MODE = false
    elseif mode_sel == 2 then 
        MULTI_MODE = true 
    end

    -- Inisialisasi navigation stack
    Nav.stack = { data }
    Nav.path = { "List Item" }

    -- Main explorer loop
    while true do
        local node = Nav.current()
        local menu, keymap, folderCount = build_menu(node)
        
        local title_text = MULTI_MODE and "🧭 EXPLORER (Multi) > " or "🧭 EXPLORER > "
        local full_title = title_text .. table.concat(Nav.path, " > ")

        if MULTI_MODE then
            -- Tampilkan opsi pengelolaan queue di atas menu
            local header = {
                "▶ Start Replace (Queue: " .. tostring(#QUEUE) .. ")",
                "📋 View Queue",
                "🗑 Clear Queue",
            }
            for i = #header, 1, -1 do 
                table.insert(menu, 1, header[i]) 
            end
            
            -- Sesuaikan keymap untuk header
            for i = #header, 1, -1 do 
                table.insert(keymap, 1, { 
                    name = header[i], 
                    value = nil, 
                    isHeader = true 
                }) 
            end

            local sel = gg.choice(menu, nil, full_title)
            
            if not sel then 
                return false 
            end

            -- Handle header actions
            if MULTI_MODE and sel <= 3 then
                if sel == 1 then
                    queue_run()
                elseif sel == 2 then
                    queue_show()
                elseif sel == 3 then
                    queue_clear()
                end
                -- Tetap di explorer
            else
                -- Adjust index untuk keymap karena header ditambahkan ketika MULTI_MODE
                local keyIndex = sel
                local entry = keymap[keyIndex]

                if not entry then
                    if not Nav.pop() then 
                        return false 
                    end
                elseif entry.isFolder then

                    -- CEK JIKA INI KATEGORI PACK ITEM
                    if entry.name == "Pack item, only replace in inbox !!" then
                        local pack_warning = gg.alert(
                            "⚠️ PACK ITEM CATEGORY ⚠️\n\n" ..
                            "  Items in this category can ONLY be\n" ..
                            "  replaced when they are in your INBOX!\n\n" ..
                            "  Continue to browse pack items?",
                            "✅ YES, CONTINUE", "❌ NO, GO BACK"
                        )
                        
                        if pack_warning ~= 1 then
                            if not Nav.pop() then 
                                return false 
                            end
                            goto continue_loop
                        end
                    end
                    
                    -- Masuk ke folder/subcategory
                    Nav.push(entry.value, entry.name)
                else
                    -- Cek apakah ini pack item
                    local is_pack = false
                    for _, path_seg in ipairs(Nav.path) do
                        if path_seg == "Pack item, only replace in inbox !!" then
                            is_pack = true
                            break
                        end
                    end
                    
                    if is_pack then
                        local pack_alert = gg.alert(
                            "📦 ADD PACK ITEM TO QUEUE?\n\n" ..

                            "Item: " .. entry.name .. "\n\n" ..

                            "⚠️ This is a PACK ITEM!\n" ..

                            "  Will only work if item is in INBOX.\n\n" ..

                            "Add to queue?",

                            "✅ YES, ADD TO QUEUE", "❌ NO, CANCEL"
                        )
                        
                        if pack_alert ~= 1 then
                            goto continue_loop
                        end
                    end
                    
                    -- Pilih item untuk ditambahkan ke queue
                    queue_add(entry.value, entry.name)
                    show_pack_warning_if_needed(entry.value, entry.name, table.concat(Nav.path, " > "))
                end
            end
        else
            -- Single mode (non-MULTI)
            local sel = gg.choice(menu, nil, full_title)
            
            if not sel then 
                return false 
            end

            local entry = keymap[sel]

            if not entry then
                -- Kembali
                if not Nav.pop() then 
                    return false 
                end
            elseif entry.isFolder then
                -- CEK JIKA INI KATEGORI PACK ITEM
                if entry.name == "Pack item, only replace in inbox !!" then
                    local pack_warning = gg.alert(
                        "⚠️ PACK ITEM CATEGORY ⚠️\n\n" ..

                        "  Items in this category can ONLY be\n" ..

                        "  replaced when they are in your INBOX!\n\n" ..

                        "  Continue to browse pack items?",

                        "✅ YES, CONTINUE", "❌ NO, GO BACK"
                    )
                    
                    if pack_warning ~= 1 then
                        if not Nav.pop() then 
                            return false 
                        end
                        goto continue_loop
                    end
                end
                
                -- Masuk ke folder/subcategory
                Nav.push(entry.value, entry.name)
            else
                -- Cek apakah ini pack item
                local is_pack = false
                for _, path_seg in ipairs(Nav.path) do
                    if path_seg == "Pack item, only replace in inbox !!" then
                        is_pack = true
                        break
                    end
                end
                
                if is_pack then
                    local pack_alert = gg.alert(
                        "📦 PACK ITEM SELECTED ⚠️\n\n" ..
                        "  Item: " .. entry.name .. "\n\n" ..
                        "  This item ONLY works in INBOX!\n" ..
                        "  Not in inventory/chest.\n\n" ..
                        "  Continue with replace?",

                        "✅ YES, INBOX ONLY", "❌ NO, CANCEL"
                    )
                    
                    if pack_alert ~= 1 then
                        goto continue_loop
                    end
                end
                
                -- Pilih item dan langsung jalankan aksi
                local success = item_actions_single(entry.value, entry.name) 
                if success then 
                    return true 
                end
            end
        end
        
        ::continue_loop::
        
        -- Check jika user menutup explorer
        if gg.isVisible(true) then
            gg.setVisible(false)
        end
    end
end

-------------------------------------------------
-- 📌 INFINITE INBOX (REVISED VERSION)
-------------------------------------------------
local SavedInbox = {}

function InfiniteInbox_Start()
    local c = gg.alert(
        "📌 Draboy's Notes:\n\n" ..
        "   🔹 Click Once Infinite.\n" ..
        "   🔹 Click Twice Delete. not working on some item\n" ..
        "   🔹 Not working for: weapons, Settlement items.\n" ..
        "   🔹 Energy Drink, Reanimator, dog, and other special items.\n" ..
        "   🔹 You must click Restore in menu infinite inbox when you are done!\n\n" ..
        "      Continue?",
        "▶ Go", "❌ Nope"
    )

    if c ~= 1 then
        gg.toast("❌ Canceled.")
        return
    end

    gg.clearResults()
    SavedInbox = {} -- Reset backup data
    gg.clearList()  -- Clear save list

    gg.toast("🔍 Start Infinite inbox (Revised)...")

    -------------------------------------------------
    -- ✅ STEP 1: PENCARIAN 999;1;1::10
    -------------------------------------------------
    gg.searchNumber("999;1;1::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, gg.REGION_ANONYMOUS)
    
    if gg.getResultsCount() == 0 then
        gg.alert("❌ No data found for pattern 999;1;1::10")
        return
    end
    
    gg.toast("🔍 Found " .. gg.getResultsCount() .. " results for 999;1;1::10")
    
    -- Refine untuk mendapatkan nilai 1
    gg.refineNumber("1", gg.TYPE_DWORD)
    
    local results1 = gg.getResults(gg.getResultsCount())
    gg.toast("✅ Refined to " .. #results1 .. " values of 1")
    
    -- Simpan hasil ke save list dengan nama "INBOX_1"
    for i, v in ipairs(results1) do
        v.name = "INBOX_1_" .. i
        v.freeze = false
    end
    gg.addListItems(results1)
    
    -------------------------------------------------
    -- ✅ STEP 2: PENCARIAN 999;1;20::10
    -------------------------------------------------
    gg.clearResults()
    gg.searchNumber("999;1;20::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, gg.REGION_ANONYMOUS)
    
    if gg.getResultsCount() == 0 then
        gg.toast("⚠️ No data found for pattern 999;1;20::10")
    else
        gg.toast("🔍 Found " .. gg.getResultsCount() .. " results for 999;1;20::10")
        
        -- Refine untuk mendapatkan nilai 20
        gg.refineNumber("20", gg.TYPE_DWORD)
        
        local results20 = gg.getResults(gg.getResultsCount())
        gg.toast("✅ Refined to " .. #results20 .. " values of 20")
        
        -- Simpan hasil ke save list dengan nama "INBOX_20"
        for i, v in ipairs(results20) do
            v.name = "INBOX_20_" .. i
            v.freeze = false
        end
        gg.addListItems(results20)
    end
    
    -------------------------------------------------
    -- ✅ STEP 3: MENGUBAH SEMUA NILAI DI SAVELIST
    -------------------------------------------------
    local allItems = gg.getListItems()
    
    if #allItems == 0 then
        gg.alert("❌ No items in save list to modify!.")
        return
    end
    
    -- Simpan backup untuk restore
    for _, v in ipairs(allItems) do
        table.insert(SavedInbox, {
            address = v.address,
            flags = v.flags,
            value = v.value,
            name = v.name
        })
    end
    
    -- Buat array untuk modifikasi
    local toWrite = {}
    for _, v in ipairs(allItems) do
        table.insert(toWrite, {
            address = v.address,
            flags = gg.TYPE_DWORD,
            value = -999999999,
            freeze = false
        })
    end
    
    -- Terapkan modifikasi
    gg.setValues(toWrite)
    gg.clearResults()
    
    -- Update status aktif
    _G.INFINITE_INBOX_ACTIVE = true
    
    -- Tampilkan statistik
    local count1 = 0
    local count20 = 0
    
    for _, v in ipairs(allItems) do
        if v.value == 1 then
            count1 = count1 + 1
        elseif v.value == 20 then
            count20 = count20 + 1
        end
    end
    
    gg.alert(
        "🎉 Infinite Inbox Active!\n\n" ..
        "⚠️ Remember Click RESTORE in menu infinite inbox\n" ..
        "📊 Status: ❌ Not yet Restore"
    )
end

-------------------------------------------------
-- 📌 RESTORE INFINITE INBOX (REVISED)
-------------------------------------------------
function InfiniteInbox_Restore()
    if #SavedInbox == 0 then
        gg.alert("❌ No data backup For restore!")
        return
    end

    local c = gg.alert(
        "🔄 Restore " .. #SavedInbox .. " Back to Normal?\n\n" ..
        "Continue?",
        "✅ OK", "❌ NOPE"
    )

    if c ~= 1 then
        gg.toast("❌ Restore Canceled.")
        return
    end

    -------------------------------------------------
    -- RESTORE SETIAP ADDRESS KE NILAI ASLI
    -------------------------------------------------
    local restored = 0
    local failed = 0
    
    for _, v in ipairs(SavedInbox) do
        local success = pcall(gg.setValues, {v})
        if success then
            restored = restored + 1
        else
            failed = failed + 1
        end
    end

    -- Clear data
    SavedInbox = {}
    _G.INFINITE_INBOX_ACTIVE = false
    
    -- Tampilkan hasil
    local message = "✅ Successfully restored " .. restored .. " items"
    if failed > 0 then
        message = message .. "\n⚠️ Failed to restore " .. failed .. " items"
    end
    
    gg.alert(message)
    
    -- Clear list juga untuk kebersihan
    gg.clearList()
end

-------------------------------------------------
-- 📌 MENU INFINITE INBOX (SIMPLE)
-------------------------------------------------
function Menu_InfiniteInbox()
    -- BUAT JUDUL DENGAN STATUS
    local title = "📦 Infinite Inbox Tools"
    if _G.INFINITE_INBOX_ACTIVE then
        title = "⚠️ INFINITE INBOX: ACTIVE (" .. #SavedInbox .. " items)"
    end
    
    local m = gg.choice({
        "▶ Start Infinite Inbox",
        "⏪ Restore Inbox",
        "❌ Exit"
    }, nil, title)

    if m == 1 then
        InfiniteInbox_Start()
    elseif m == 2 then
        InfiniteInbox_Restore()
    end
end

-------------------------------------------------
-- 📱 TARGET INFO
-------------------------------------------------
local TargetInfo = gg.getTargetInfo()

    local function Is64Bit()
        return TargetInfo.x64 == true
    end

    local function Require64Bit()
        if not Is64Bit() then
            gg.alert(
                "⛔ AKSES Forbiden\n\n" ..
                "Only Work On GAME 64-BIT.\n\n" ..
                "📛 Game    : " .. (TargetInfo.label or "?") .. "\n" ..
                "📦 Package : " .. gg.getTargetPackage() .. "\n" ..
                "🧠 Bit     : 32-bit (ARMv7)",
                "OK"
            )
            return false
        end
        return true
    end

    local function ShowGameInfo()
    local arch = Is64Bit() and "64-bit (ARM64)" or "32-bit (ARMv7)"
    local status = Is64Bit() and "✅ Compatible" or "⛔ Not Compatible"

    gg.alert(
        "🎮 GAME INFO\n\n" ..
        "📛 Game       : " .. (TargetInfo.label or "?") .. "\n" ..
        "📦 Package    : " .. gg.getTargetPackage() .. "\n" ..
        "🧠 Arsitektur : " .. arch .. "\n" ..
        "📊 Status     : " .. status .. "\n\n" ..
        "⚠️ NOTE:\n this Script Only for 64-bit",
        "OK"
    )
end

-------------------------------------------------
-- 📌 DOG SKILL REPLACEMENT
-------------------------------------------------
local DogSkillData = {
    ["🐕 Rare Skills"] = {
        ["╰▶🌟 True Friends"] = "dog_outdoor_perk",
        ["╰▶🛡️ Guard [Can Attack Horde]"] = "horde_attack_perk",
        ["╰▶🍖 Earner [Decrease food]"] = "special_consumption_perk",
        
    },
    
    ["🐕 CORGI Dog Skills Only"] = {
        ["╰▶💎 Lucky Coin Corgi"] = "coin_master_perk",
        ["╰▶🍖 Full [No need food]"] = "zero_consumption_perk",
    },
    
    ["🐕 SAINT SENBERNARD Dog Skill ONLY"] = {
        ["╰▶⚔️ Mighty Claws (Ignore Icy Armor)"] = "dog_perk_senbernar_damage",
        ["╰▶❄️ Frost Resistant"] = "dog_perk_senbernar_warm_consumable_duration_5",
        ["╰▶🔥 Warm ties"] = "dog_perk_senbernar_cold_resistant_5",
    },

    ["🐕 Dobberman Dog Skill ONLY"] = {
        ["╰▶🧪 Spore Immunity"] = "dog_perk_dobermann_spore_resistant_5",
        ["╰▶🎯 +25% Crit Chance"] = "dog_perk_dobermann_crit_chance_5",
        ["╰▶🎭 Spore Reaper"] = "dog_perk_dobermann_mask_plus_5",
    },

    ["🐕 Resilence Rottweiler Dog Skill ONLY"] = {
        ["╰▶💪 20% Resilence"] = "dog_perk_rottweiler_wearniess_1",
        ["╰▶💪 40% Resilence"] = "dog_perk_rottweiler_wearniess_2",
        ["╰▶💪 60% Resilence"] = "dog_perk_rottweiler_wearniess_3",
        ["╰▶💪 80% Resilence"] = "dog_perk_rottweiler_wearniess_4",
        ["╰▶💪 100% Resilence"] = "dog_perk_rottweiler_wearniess_5",
    },

    ["🥊 Fighter Rottweiler Dog Skill ONLY"] = {
        ["╰▶🥊 50% Fighter"] = "dog_perk_rottweiler_damage_1",
        ["╰▶🥊 100% Fighter"] = "dog_perk_rottweiler_damage_2",
        ["╰▶🥊 150% Fighter"] = "dog_perk_rottweiler_damage_3",
        ["╰▶🥊 200% Fighter"] = "dog_perk_rottweiler_damage_4",
        ["╰▶🥊 300% Fighter"] = "dog_perk_rottweiler_damage_5",
    },

    ["🐺 Predator Rottweiler Dog Skill ONLY [Increase Bleed]"] = {
        ["╰▶🐺 Predator 1"] = "dog_perk_bleed_1",
        ["╰▶🐺 Predator 2"] = "dog_perk_bleed_2",
        ["╰▶🐺 Predator 3"] = "dog_perk_bleed_3",
        ["╰▶🐺 Predator 4"] = "dog_perk_bleed_4",
        ["╰▶🐺 Predator 5"] = "dog_perk_bleed_5",
    },


    ["📈 Carefull [Increase Puppy Grow Speed]"] = {
        ["╰▶📈 0.5% Careful"] = "growth_speed_boost_perk_1",
        ["╰▶📈 1% Careful"] = "growth_speed_boost_perk_2",
        ["╰▶📈 1.5% Careful"] = "growth_speed_boost_perk_3",
        ["╰▶📈 2% Careful"] = "growth_speed_boost_perk_4",
        ["╰▶📈 2.5% Careful"] = "growth_speed_boost_perk_5",
        ["╰▶📈 3% Careful"] = "growth_speed_boost_perk_6",
        ["╰▶📈 4% Careful"] = "growth_speed_boost_perk_7",
        ["╰▶📈 5% Careful"] = "growth_speed_boost_perk_8",
    },

    ["🤝 Companion [Increase experience]"] = {
        ["╰▶🤝 1% Companion"] = "dog_experience_boost_perk_1",
        ["╰▶🤝 2% Companion"] = "dog_experience_boost_perk_2",
        ["╰▶🤝 3% Companion"] = "dog_experience_boost_perk_3",
        ["╰▶🤝 4% Companion"] = "dog_experience_boost_perk_4",
        ["╰▶🤝 5% Companion"] = "dog_experience_boost_perk_5",
        ["╰▶🤝 6% Companion"] = "dog_experience_boost_perk_6",
        ["╰▶🤝 7% Companion"] = "dog_experience_boost_perk_7",
        ["╰▶🤝 8% Companion"] = "dog_experience_boost_perk_8",
        ["╰▶🤝 9% Companion"] = "dog_experience_boost_perk_9",
        ["╰▶🤝 10% Companion"] = "dog_experience_boost_perk_10",
    },

    ["📦 Well stocked [Decreases need food]"] = {
        ["╰▶📦 0.5% well stocked"] = "dog_consumption_perk_1",
        ["╰▶📦 1.0% well stocked"] = "dog_consumption_perk_2",
        ["╰▶📦 1.5% well stocked"] = "dog_consumption_perk_3",
        ["╰▶📦 2.0% well stocked"] = "dog_consumption_perk_4",
        ["╰▶📦 2.5% well stocked"] = "dog_consumption_perk_5",
        ["╰▶📦 3.0% well stocked"] = "dog_consumption_perk_6",
        ["╰▶📦 4.0% well stocked"] = "dog_consumption_perk_7",
        ["╰▶📦 5.0% well stocked"] = "dog_consumption_perk_8",
    },

    ["🎯 Hunter [Find Rare animal]"] = {
        ["╰▶🎯 1% Hunter"] = "rare_animal_boost_perk_1",
        ["╰▶🎯 2% Hunter"] = "rare_animal_boost_perk_2",
        ["╰▶🎯 3% Hunter"] = "rare_animal_boost_perk_3",
        ["╰▶🎯 4% Hunter"] = "rare_animal_boost_perk_4",
        ["╰▶🎯 5% Hunter"] = "rare_animal_boost_perk_5",
    },
 

    ["🧠 Witty [Increase High Breedings]"] = {
        ["╰▶🧠 0.25% Witty"] = "coupling_boost_perk_1",
        ["╰▶🧠 0.5% Witty"] = "coupling_boost_perk_2",
        ["╰▶🧠 0.75% Witty"] = "coupling_boost_perk_3",
        ["╰▶🧠 1% Witty"] = "coupling_boost_perk_4",
        ["╰▶🧠 1.25% Witty"] = "coupling_boost_perk_5",
    },

    ["👑 Leader Skill All Dog [Increase Damage all dog]"] = {
        ["╰▶👑 1% Leader"] = "dog_weapon_boost_perk_1",
        ["╰▶👑 2% Leader"] = "dog_weapon_boost_perk_2",
        ["╰▶👑 3% Leader"] = "dog_weapon_boost_perk_3",
        ["╰▶👑 4% Leader"] = "dog_weapon_boost_perk_4",
        ["╰▶👑 5% Leader"] = "dog_weapon_boost_perk_5",
    },

    ["🔍 Blood Hound [Increase finding rare item)]"] = {
        ["╰▶🔍 1% Hound"] = "rare_items_boost_perk_1",
        ["╰▶🔍 2% Hound"] = "rare_items_boost_perk_2",
        ["╰▶🔍 3% Hound"] = "rare_items_boost_perk_3",
        ["╰▶🔍 4% Hound"] = "rare_items_boost_perk_4",
        ["╰▶🔍 5% Hound"] = "rare_items_boost_perk_5",
    },
}
-- Fungsi Step One untuk Dog Skill
local function DogSkill_StepOne()
    local skill_menu = {}
    local skill_map = {}
    
    -- 1. Kumpulkan dan urutkan kategori ALFABET
    local categories = {}
    for category_name, _ in pairs(DogSkillData) do
        table.insert(categories, category_name)
    end
    table.sort(categories) -- Urutkan alfabet
    
    -- Tampilkan kategori dan item dengan icon (URUT)
    for _, category_name in ipairs(categories) do
        local category_data = DogSkillData[category_name]
        
        -- Tambahkan kategori sebagai header
        table.insert(skill_menu, "" .. category_name .. "")
        table.insert(skill_map, {isCategory = true, name = category_name})
        
        -- 2. Kumpulkan dan urutkan item dalam kategori ALFABET
        local category_items = {}
        for display_name, skill_id in pairs(category_data) do
            table.insert(category_items, {
                name = display_name,
                id = skill_id
            })
        end
        
        -- Urutkan item berdasarkan nama (alfabet)
        table.sort(category_items, function(a, b)
            return a.name:lower() < b.name:lower()
        end)
        
        -- Tambahkan item yang sudah diurutkan
        for _, item in ipairs(category_items) do
            table.insert(skill_menu, "   " .. item.name)
            table.insert(skill_map, {
                isCategory = false, 
                name = item.name, 
                id = item.id,
                category = category_name
            })
        end
        
        -- Tambahkan separator antar kategori
        table.insert(skill_menu, "")
        table.insert(skill_map, {isSeparator = true})
    end
    
    -- Hapus separator terakhir jika ada
    if #skill_map > 0 and skill_map[#skill_map].isSeparator then
        table.remove(skill_menu, #skill_menu)
        table.remove(skill_map, #skill_map)
    end
    
    table.insert(skill_menu, "🔙 Kembali")
    
    local sel = gg.choice(skill_menu, nil, "🐕 Choose Dog Skill (Step One)")
    if not sel or sel > #skill_map then 
        return false 
    end
    
    local chosen = skill_map[sel]
    
    -- Skip jika yang dipilih adalah kategori atau separator
    if chosen.isCategory or chosen.isSeparator then
        return DogSkill_StepOne() -- Tampilkan ulang menu
    end
    
    -- Jalankan seperti Step One
    gg.clearList()
    local success_scan = ScanAndRefine(chosen.id, chosen.name)
    
    if success_scan then
        AUTO_SCAN_TARGET = chosen.id
        local success_sort = Sorter.run()
        
        if success_sort then
            PtrScan.run()
            AUTO_SCAN_TARGET = nil
            
            gg.alert("✅ Step One Dog Skill '" .. chosen.name .. "' Done!\n\nKategori: " .. chosen.category .. "\n\nNow Choose Step Two.")
            return true
        end
        AUTO_SCAN_TARGET = nil
    else
        gg.alert("⚠️ Failed scan dog skill: " .. chosen.name)
    end
    
    return false
end


-- Fungsi Step Two untuk Dog Skill
local function DogSkill_StepTwo()
    local skill_menu = {}
    local skill_map = {}
    
    -- 1. Kumpulkan dan urutkan kategori ALFABET
    local categories = {}
    for category_name, _ in pairs(DogSkillData) do
        table.insert(categories, category_name)
    end
    table.sort(categories) -- Urutkan alfabet
    
    -- Tampilkan kategori dan item dengan icon (URUT)
    for _, category_name in ipairs(categories) do
        local category_data = DogSkillData[category_name]
        
        -- Tambahkan kategori sebagai header
        table.insert(skill_menu, "───────── " .. category_name .. " ─────────")
        table.insert(skill_map, {isCategory = true, name = category_name})
        
        -- 2. Kumpulkan dan urutkan item dalam kategori ALFABET
        local category_items = {}
        for display_name, skill_id in pairs(category_data) do
            table.insert(category_items, {
                name = display_name,
                id = skill_id
            })
        end
        
        -- Urutkan item berdasarkan nama (alfabet)
        table.sort(category_items, function(a, b)
            return a.name:lower() < b.name:lower()
        end)
        
        
        -- Tambahkan item yang sudah diurutkan
        for _, item in ipairs(category_items) do
            table.insert(skill_menu, "   " .. item.name)
            table.insert(skill_map, {
                isCategory = false, 
                name = item.name, 
                id = item.id,
                category = category_name
            })
        end
        
        -- Tambahkan separator antar kategori
        table.insert(skill_menu, "")
        table.insert(skill_map, {isSeparator = true})
    end
    
    -- Hapus separator terakhir jika ada
    if #skill_map > 0 and skill_map[#skill_map].isSeparator then
        table.remove(skill_menu, #skill_menu)
        table.remove(skill_map, #skill_map)
    end
    
    table.insert(skill_menu, "🔙 Kembali")
    
    local sel = gg.choice(skill_menu, nil, "🎯 Choose Dog Skill Target (Step Two)")
    if not sel or sel > #skill_map then 
        return false 
    end
    
    local chosen = skill_map[sel]
    
    -- Skip jika yang dipilih adalah kategori atau separator
    if chosen.isCategory or chosen.isSeparator then
        return DogSkill_StepTwo() -- Tampilkan ulang menu
    end
    
    -- Cek SaveList ada atau tidak
    local saved_items = gg.getListItems()
    if not saved_items or #saved_items == 0 then
        gg.alert("⚠️ SaveList Empty! Run Step One First.")
        return false
    end
    
    -- **Pastikan AUTO_SCAN_TARGET nil**
    AUTO_SCAN_TARGET = nil
    
    -- Jalankan replace seperti di explorer
    MANUAL_SCAN_TARGET = chosen.id
    local success_scan = ScanAndRefine(chosen.id, chosen.name)
    
    if success_scan then
        local success_sort = Sorter.run()
        MANUAL_SCAN_TARGET = nil
        
        if success_sort then
            -- Alert untuk pindahkan dog
            local confirm = gg.alert(
                "⚠️ Please Move DOG to other SLOT!, dont move to slot base or player just in kennel\n\n" ..
                "Categori: " .. chosen.category .. "\n" ..
                "Skill: " .. chosen.name .. "\n\n" ..
                "⏳ I give you time 8 second to move the dog !\n\n" ..
                "OK, Gass"
            )
            
            if confirm == 1 then
                gg.toast("⏳ Time 8 Second Running... Cmon move u ass dog to another slot!")
                gg.sleep(8000)
                
                -- Restore nilai ke semula
                if _G.LAST_REPLACE_BACKUP then
                    RevertReplace()
                    gg.alert("✅ Replace Done!\n\nSkill: " .. chosen.name .. "\nCategory: " .. chosen.category .. "\n\nMove again to another slot to see results.")
                else
                    gg.toast("⚠️ No data For restore")
                end
                gg.clearList()
                gg.clearResults()
            end
            return true
        else
            gg.alert("⚠️ Failed do Sorter.run() on skill: " .. chosen.name .. "\n\nJust make sure u dog have that skill.")
        end
    else
        MANUAL_SCAN_TARGET = nil
        gg.alert("⚠️ Failed scan dog skill target: " .. chosen.name .. "\n\nSkill not found in Game.")
    end
    
    return false
end

-- Menu Dog Skill Replacement
local function Menu_DogSkillReplacement()
    while true do
        local menu_sel = gg.choice({
            "🐕 Step One - Choose Skill & Scan",
            "🎯 Step Two - Choose Skill Target & Replace",
            "🔙 Back to Main Menu"
        }, nil, "🐕 Dog Skill Replacement")
        
        if not menu_sel then return false end
        
        if menu_sel == 1 then
                
            -- TAMBAHKAN ALERT DI SINI SAJA
            local info = gg.alert(
                "⚠️ Caution! this is high risk feature see tutoral first \n\n" ..
                " 🔸 Make sure the dog is in the kennel slot.\n" ..
                " 🔸 not in the yard or accompanying the player.\n" ..
                " 🔸 Change Skill dog only in the kennel.\n" ..
                " 🔸 It is better to replace a Tier 4 Dog.\n" ..
                " 🔸 The Lucky Coin skill is only for Corgi-type dogs.\n" ..
                " 🔸 Just Replace skil for skill dog type ONLY.\n" ..
                " 🔸 Use at Your Risk ! \n" ..
                " 🔸 Don't be too greedy, use as needed. ! \n\n" ..
                "Understood?",
                "✅ Go", "❌ Nope"
            )
            
            if info == 1 then
                DogSkill_StepOne()
            end
          
        elseif menu_sel == 2 then
            DogSkill_StepTwo()
        elseif menu_sel == 3 then
            return true
        end
    end
end


-- start mod feature
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- FUNGSI PEMBANTU (DATE & COUNTER)
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
local function get_date()
    return os.date("%d/%m/%Y") 
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- COUNT ACTIVE MODS
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
function count_active_mods()
    local c = 0
    for _, v in pairs(STATE) do
        if v then c = c + 1 end
    end
    
    return c
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- CHECK ARCH
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
local TI = gg.getTargetInfo()
if not TI or not TI.x64 then
    gg.alert("❌ ARM64 ONLY")
    os.exit()
end











--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- 📌 star mod section logic
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘








--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- STATE / CACHE (UPDATE)
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE = {
    FREE_CRAFT = false,
    SPLIT_WEAPON = false,
    NO_DIRT = false,
    UNLOCK_PREMIUM = false,  -- TAMBAH INI
    NO_PERK_COOLDOWN = false,  -- TAMBAH INI
    NO_DECREASE_BACKPACK = false,  -- TAMBAH INI

    TROPHY_PREMIUM = false,          -- TAMBAH INI
    
    
}

CACHE = {
    FREE_CRAFT = {},
    SPLIT_WEAPON = {},
    NO_DIRT = {},
    UNLOCK_PREMIUM = {},  -- TAMBAH INI
    NO_PERK_COOLDOWN = {},  -- TAMBAH INI
    NO_DECREASE_BACKPACK = {},  -- TAMBAH INI
    
    TROPHY_PREMIUM = {},             -- TAMBAH INI
    
    
    
}





--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- UPDATE METHOD
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


METHOD = {
    FREE_CRAFT = {
        CLASS = "Inventories",
        NAME  = "GetStackAmount",
        ADDR  = {}
    },

    SPLIT_WEAPON = {
        CLASS = "Inventories",
        NAME  = "CheckSplit",
        ADDR  = {}
    },
    
    
    NO_DIRT = {
        CLASS = "ConsumableResource",
        NAME  = "InnerSetAmount",
        ADDR  = {}
    },
    UNLOCK_PREMIUM = {  -- TAMBAH INI
        CLASS = "ResourceRequirement",
        NAME  = "OnCheck",
        ADDR  = {}
    },
    
    NO_PERK_COOLDOWN = {  -- TAMBAH INI
        CLASS = "PlayerPerkSlotBase",
        NAME  = "CheckUsePerk",
        ADDR  = {}
    },
    
    NO_DECREASE_BACKPACK = {  -- TAMBAH INI
        CLASS = "ConsumeInventoryItemBehaviour",
        NAME  = "Use",
        ADDR  = {}
    },
    
    GACHA_NO_DECREASE = {  -- TAMBAH INI
        CLASS = "ShopInboxGachaItem",
        NAME  = "Take",
        ADDR  = {}
    },
    TROPHY_PREMIUM = {               -- TAMBAH INI
        CLASS = "TrophyRoadModel",
        NAME  = "ThereIsAnyPremium",
        ADDR  = {}
    },
    
    
    
    
    
    
    
    
}





--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- MEMORY UTIL
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

local function gv(a, t)
    return gg.getValues({{address=a, flags=t}})[1].value
end

local function sv(t)
    gg.setValues(t)
end

local function ptr(a)
    return gv(a, gg.TYPE_QWORD)
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- STRING CHECK
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
local function cstr(addr, s)
    for i = 1, #s do
        if gv(addr + i - 1, gg.TYPE_BYTE) ~= s:byte(i) then
            return false
        end
    end
    return gv(addr + #s, gg.TYPE_BYTE) == 0
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- GENERIC METHOD FINDER
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

-- Fungsi findMethod ORIGINAL (jangan diubah!)
local function findMethod(className, methodName)
    local res = {}
    
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    gg.searchNumber("Q 00 '"..methodName.."' 00", gg.TYPE_BYTE)
    
    if gg.getResultsCount() == 0 then return res end
    
    local t = gg.getResults(gg.getResultsCount())
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    gg.loadResults(t)
    gg.searchPointer(0)
    
    t = gg.getResults(gg.getResultsCount())
    
    for _, v in ipairs(t) do
        local classPtr = ptr(ptr(v.address + 8) + 16)
        if classPtr ~= 0 and cstr(classPtr, className) then
            local m = ptr(v.address - 16)
            if m ~= 0 then
                table.insert(res, m)
            end
        end
    end
    
    gg.clearResults()
    return res
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- toggle function mod
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--survivor path premium
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

function toggle_trophy_premium()
    if STATE.TROPHY_PREMIUM then
        sv(CACHE.TROPHY_PREMIUM)
        CACHE.TROPHY_PREMIUM = {}
        STATE.TROPHY_PREMIUM = false
        gg.toast("🛑 SURVIVOR PATH PREMIUM OFF")
        return
    end

    if #METHOD.TROPHY_PREMIUM.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.TROPHY_PREMIUM.ADDR = findMethod(
            "TrophyRoadModel",
            "ThereIsAnyPremium"
        )
        
        if #METHOD.TROPHY_PREMIUM.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.TROPHY_PREMIUM = {}

    for _, a in ipairs(METHOD.TROPHY_PREMIUM.ADDR) do
        -- Simpan original
        for i = 0, 2 do
            table.insert(CACHE.TROPHY_PREMIUM, {
                address = a + (i*4),
                flags = gg.TYPE_DWORD,
                value = gv(a + (i*4), gg.TYPE_DWORD)
            })
        end

        -- Patch: Always return true (w0 = 1)
        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = 0x52800020  -- mov w0, #1
        })
        table.insert(patch, {
            address = a+4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0  -- ret
        })
        table.insert(patch, {
            address = a+8,
            flags = gg.TYPE_DWORD,
            value = 0xD503201F  -- nop
        })
    end

    sv(patch)
    STATE.TROPHY_PREMIUM = true
    gg.toast("✅ survivor path premium ON\n👑 Premium Rewards Unlocked!")
end





--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--item no drecease
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

function toggle_no_decrease_backpack()
    if STATE.NO_DECREASE_BACKPACK then
        sv(CACHE.NO_DECREASE_BACKPACK)
        CACHE.NO_DECREASE_BACKPACK = {}
        STATE.NO_DECREASE_BACKPACK = false
        gg.toast("🛑 NO DECREASE BACKPACK OFF")
        return
    end

    if #METHOD.NO_DECREASE_BACKPACK.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.NO_DECREASE_BACKPACK.ADDR = findMethod(
            METHOD.NO_DECREASE_BACKPACK.CLASS,
            METHOD.NO_DECREASE_BACKPACK.NAME
        )

        if #METHOD.NO_DECREASE_BACKPACK.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.NO_DECREASE_BACKPACK = {}

    for _, a in ipairs(METHOD.NO_DECREASE_BACKPACK.ADDR) do
        -- Simpan original instructions (3x DWORD untuk safety)
        table.insert(CACHE.NO_DECREASE_BACKPACK, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.NO_DECREASE_BACKPACK, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})
        table.insert(CACHE.NO_DECREASE_BACKPACK, {address=a+8, flags=gg.TYPE_DWORD, value=gv(a+8, gg.TYPE_DWORD)})

        -- Patch: Return immediately (tidak eksekusi pengurangan item)
        -- mov w0, #1  (return true/success)
        -- ret
        -- nop
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
        table.insert(patch, {address=a+8, flags=gg.TYPE_DWORD, value=0xD503201F}) -- nop
    end

    sv(patch)
    STATE.NO_DECREASE_BACKPACK = true
    gg.toast("✅ NO DECREASE ITEM ON")
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--SKILL NO COOLDOWN
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

function toggle_no_perk_cooldown()
    if STATE.NO_PERK_COOLDOWN then
        sv(CACHE.NO_PERK_COOLDOWN)
        CACHE.NO_PERK_COOLDOWN = {}
        STATE.NO_PERK_COOLDOWN = false
        gg.toast("🛑 NO SKILL COOLDOWN OFF")
        return
    end

    if #METHOD.NO_PERK_COOLDOWN.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.NO_PERK_COOLDOWN.ADDR = findMethod(
            METHOD.NO_PERK_COOLDOWN.CLASS,
            METHOD.NO_PERK_COOLDOWN.NAME
        )

        if #METHOD.NO_PERK_COOLDOWN.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.NO_PERK_COOLDOWN = {}

    for _, a in ipairs(METHOD.NO_PERK_COOLDOWN.ADDR) do
        -- Simpan original instructions (2x DWORD)
        table.insert(CACHE.NO_PERK_COOLDOWN, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.NO_PERK_COOLDOWN, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- Patch: Always return true (w0 = 1)
        -- mov w0, #1  (0x52800020)
        -- ret         (0xD65F03C0)
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.NO_PERK_COOLDOWN = true
    gg.toast("✅ NO SKILL COOLDOWN ON")
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--BATTLEPASS PREMIUM
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

function toggle_unlock_premium()
    if STATE.UNLOCK_PREMIUM then
        sv(CACHE.UNLOCK_PREMIUM)
        CACHE.UNLOCK_PREMIUM = {}
        STATE.UNLOCK_PREMIUM = false
        gg.toast("🛑 BATTLEPASS PREMIUM OFF")
        return
    end

    if #METHOD.UNLOCK_PREMIUM.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.UNLOCK_PREMIUM.ADDR = findMethod(
            METHOD.UNLOCK_PREMIUM.CLASS,
            METHOD.UNLOCK_PREMIUM.NAME
        )

        if #METHOD.UNLOCK_PREMIUM.ADDR == 0 then
            gg.alert("❌FAILED")
            return
        end
    end

    local patch = {}
    CACHE.UNLOCK_PREMIUM = {}

    for _, a in ipairs(METHOD.UNLOCK_PREMIUM.ADDR) do
        -- Simpan original instructions (3x DWORD)
        table.insert(CACHE.UNLOCK_PREMIUM, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.UNLOCK_PREMIUM, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})
        table.insert(CACHE.UNLOCK_PREMIUM, {address=a+8, flags=gg.TYPE_DWORD, value=gv(a+8, gg.TYPE_DWORD)})

        -- Patch: Always return true (w0 = 1)
        -- mov w0, #1  (0x52800020)
        -- ret         (0xD65F03C0)
        -- nop         (0xD503201F) untuk alignment
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
        table.insert(patch, {address=a+8, flags=gg.TYPE_DWORD, value=0xD503201F}) -- nop
    end

    sv(patch)
    STATE.UNLOCK_PREMIUM = true
    gg.toast("✅ BATTLEPASS PREMIUM ON")
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- FREECRAFT
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


-- freecraft 
function toggle_free_craft()
    if STATE.FREE_CRAFT then
        sv(CACHE.FREE_CRAFT)
        CACHE.FREE_CRAFT = {}
        STATE.FREE_CRAFT = false
        gg.toast("🛑 FREE CRAFT OFF")
        return
    end

    if #METHOD.FREE_CRAFT.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.FREE_CRAFT.ADDR = findMethod(
            METHOD.FREE_CRAFT.CLASS,
            METHOD.FREE_CRAFT.NAME
        )

        if #METHOD.FREE_CRAFT.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.FREE_CRAFT = {}

    for _, a in ipairs(METHOD.FREE_CRAFT.ADDR) do

        table.insert(CACHE.FREE_CRAFT, {address=a, flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.FREE_CRAFT, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})
        table.insert(CACHE.FREE_CRAFT, {address=a+8, flags=gg.TYPE_DWORD, value=gv(a+8, gg.TYPE_DWORD)})


        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52804E00}) -- mov w0,#9999
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret

    end

    sv(patch)
    STATE.FREE_CRAFT = true
    gg.toast("✅ FREE CRAFT ON")
end


--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- SPLIT WEAPON
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


-- split weapon
function toggle_split_weapon()

    
    if STATE.SPLIT_WEAPON then
        sv(CACHE.SPLIT_WEAPON)
        CACHE.SPLIT_WEAPON = {}
        STATE.SPLIT_WEAPON = false
    
        -- FORCE REFRESH STACK (fix minus)
        gg.toast("🔄...")
        gg.sleep(300)
    
        -- trigger UI reload
        gg.setVisible(true)
        gg.sleep(50)
        gg.setVisible(false)
    
        gg.toast("🛑 SPLIT MANY OFF")
        return
    end

    if #METHOD.SPLIT_WEAPON.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.SPLIT_WEAPON.ADDR = findMethod(
            METHOD.SPLIT_WEAPON.CLASS,
            METHOD.SPLIT_WEAPON.NAME
        )

        if #METHOD.SPLIT_WEAPON.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.SPLIT_WEAPON = {}

    for _, a in ipairs(METHOD.SPLIT_WEAPON.ADDR) do
        table.insert(CACHE.SPLIT_WEAPON, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.SPLIT_WEAPON, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- bool true → w0 = 1
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.SPLIT_WEAPON = true
    gg.toast("✅ SPLIT ITEM ON")
end


--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--ALWAYS CLEAN NO DEFECATE
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘



-- no dirt playe
function toggle_no_dirt()
    if STATE.NO_DIRT then
        sv(CACHE.NO_DIRT)
        CACHE.NO_DIRT = {}
        STATE.NO_DIRT = false
        gg.toast("🛑 ALWAYS CLEAN ENABLED")
        return
    end

    if #METHOD.NO_DIRT.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.NO_DIRT.ADDR = findMethod(
            METHOD.NO_DIRT.CLASS,
            METHOD.NO_DIRT.NAME
        )

        if #METHOD.NO_DIRT.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.NO_DIRT = {}

    for _, a in ipairs(METHOD.NO_DIRT.ADDR) do
        table.insert(CACHE.NO_DIRT, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.NO_DIRT, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- ret → block cleanliness change
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0xD65F03C0})
    end

    sv(patch)
    STATE.NO_DIRT = true
    gg.toast("✅ ALWAYS CLEAN NO DEFECATE ON")
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

--FREE FINALIZE

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE.FREE_BUILD = false
CACHE.FREE_BUILD = {}
METHOD.FREE_BUILD = {
    CLASS = "BuildingCollection",
    NAME  = "get_IsBuilt",
    ADDR  = {}
}

function toggle_free_build()
    if STATE.FREE_BUILD then
        sv(CACHE.FREE_BUILD)
        CACHE.FREE_BUILD = {}
        STATE.FREE_BUILD = false
        gg.toast("🛑 FREE FINALIZE OFF")
        return
    end

    if #METHOD.FREE_BUILD.ADDR == 0 then
        gg.toast("🔍...")
        METHOD.FREE_BUILD.ADDR = findMethod(
            "BuildingCollection",
            "get_IsBuilt"
        )

        if #METHOD.FREE_BUILD.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.FREE_BUILD = {}

    for _, a in ipairs(METHOD.FREE_BUILD.ADDR) do
        -- backup first 4 bytes
        table.insert(CACHE.FREE_BUILD, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.FREE_BUILD, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- patch: mov w0,#1 ; ret
        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value=0x52800020})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0})
    end

    sv(patch)
    STATE.FREE_BUILD = true
    gg.toast("✅ FREE FINALIZE ON")
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--FREE ENERGY
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


-- STATE / CACHE
STATE.FREE_ENERGY = false
CACHE.FREE_ENERGY = {}
METHOD.FREE_ENERGY = {
    CLASS = "GlobalMapMovement",
    NAME  = "IsFreeRun",
    ADDR  = {}
}

-- Toggle Free Energy
function toggle_free_energy()
    if STATE.FREE_ENERGY then
        sv(CACHE.FREE_ENERGY)
        CACHE.FREE_ENERGY = {}
        STATE.FREE_ENERGY = false
        gg.toast("🛑 FREE ENERGY OFF")
        return
    end

    if #METHOD.FREE_ENERGY.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.FREE_ENERGY.ADDR = findMethod(
            METHOD.FREE_ENERGY.CLASS,
            METHOD.FREE_ENERGY.NAME
        )

        if #METHOD.FREE_ENERGY.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.FREE_ENERGY = {}

    for _, a in ipairs(METHOD.FREE_ENERGY.ADDR) do
        -- backup dulu
        table.insert(CACHE.FREE_ENERGY, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.FREE_ENERGY, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        -- patch: selalu return true (w0 = 1 ; ret)
        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.FREE_ENERGY = true
    gg.toast("✅ FREE ENERGY ON")
end


--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--MAX DURABILITY
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
STATE.MAX_DURABILITY = false
CACHE.MAX_DURABILITY = {}
METHOD.MAX_DURABILITY = {
    CLASS = "BaseDurabilityInventoryStack`1",
    NAME  = "get_Durability",
    ADDR  = {}
}

function toggle_max_durability()
    if STATE.MAX_DURABILITY then
        sv(CACHE.MAX_DURABILITY)
        CACHE.MAX_DURABILITY = {}
        STATE.MAX_DURABILITY = false
        gg.toast("🛑 MAX DURABILITY OFF")
        return
    end

    if #METHOD.MAX_DURABILITY.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.MAX_DURABILITY.ADDR = findMethod(
            "BaseDurabilityInventoryStack`1",
            "get_Durability"
        )

        if #METHOD.MAX_DURABILITY.ADDR == 0 then
            gg.alert("❌ get_Durability not found")
            return
        end
    end

    local patch = {}
    CACHE.MAX_DURABILITY = {}

    for _, a in ipairs(METHOD.MAX_DURABILITY.ADDR) do
        table.insert(CACHE.MAX_DURABILITY, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.MAX_DURABILITY, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52804E00}) -- mov w0,#9999
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.MAX_DURABILITY = true
    gg.toast("✅ MAX DURABILITY ON")
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--FAST WORKBENCE
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE.FAST_WORKBENCH = false
CACHE.FAST_WORKBENCH = {}
METHOD.FAST_WORKBENCH = {
    CLASS = "Workbench`1",
    NAME  = "GetRecipeTime",
    ADDR  = {}
}

-- Opcode patch untuk return double 0.01 detik + ret (ARM64)
local currentRefineValue = {
    0xF2800000, -- MOV W0,#0 (dummy, bisa diubah)
    0xF2A00000, -- MOV W0,#1 (dummy)
    0xF2C00000, -- MOV W0,#2 (dummy)
    0xF2E7FE00, -- extended MOV
    0x9E670000, -- FMOV D0,#0.01
    0xD65F03C0  -- RET
}

function toggle_fast_workbench()
    if STATE.FAST_WORKBENCH then
        sv(CACHE.FAST_WORKBENCH)
        CACHE.FAST_WORKBENCH = {}
        STATE.FAST_WORKBENCH = false
        gg.toast("🛑 FAST WORKBENCH OFF")
        return
    end

    if #METHOD.FAST_WORKBENCH.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.FAST_WORKBENCH.ADDR = findMethod(
            "Workbench`1",
            "GetRecipeTime"
        )

        if #METHOD.FAST_WORKBENCH.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.FAST_WORKBENCH = {}

    for _, a in ipairs(METHOD.FAST_WORKBENCH.ADDR) do
        -- Backup 6 instruction (24 bytes)
        for i = 0, 20, 4 do
            table.insert(CACHE.FAST_WORKBENCH, {address=a+i, flags=gg.TYPE_DWORD, value=gv(a+i, gg.TYPE_DWORD)})
        end

        -- Apply patch
        for i, opcode in ipairs(currentRefineValue) do
            table.insert(patch, {address=a+(i-1)*4, flags=gg.TYPE_DWORD, value=opcode})
        end
    end

    sv(patch)
    STATE.FAST_WORKBENCH = true
    gg.toast("✅ FAST WORKBENCH ON")
end


--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- UNLOACK SKIN NOT PERMANENT
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE.UNLOCK_SKINS = false
CACHE.UNLOCK_SKINS = {}
METHOD.UNLOCK_SKINS = {
    CLASS = "CharacterSkin",
    NAME  = "get_IsAvailable",
    ADDR  = {}
}


function toggle_unlock_skins()
    if STATE.UNLOCK_SKINS then
        sv(CACHE.UNLOCK_SKINS)
        CACHE.UNLOCK_SKINS = {}
        STATE.UNLOCK_SKINS = false
        gg.toast("🛑 UNLOCK SKIN OFF")
        return
    end

    if #METHOD.UNLOCK_SKINS.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.UNLOCK_SKINS.ADDR = findMethod(
            METHOD.UNLOCK_SKINS.CLASS,
            METHOD.UNLOCK_SKINS.NAME
        )

        if #METHOD.UNLOCK_SKINS.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.UNLOCK_SKINS = {}

    for _, a in ipairs(METHOD.UNLOCK_SKINS.ADDR) do
        -- Backup 8 bytes
        table.insert(CACHE.UNLOCK_SKINS, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.UNLOCK_SKINS, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})
        
        -- Patch: Always return true
        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value=0x52800020}) -- mov w0,#1
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.UNLOCK_SKINS = true
    gg.toast("✅ ALL SKINS UNLOCKED")
end

--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
-- SKINN BIKE UNLOCK
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

STATE.UNLOCK_BIKE = false
CACHE.UNLOCK_BIKE = {}
METHOD.UNLOCK_BIKE = {
    CLASS = "TransportPaintsDialogController",
    NAME  = "PaintIsLocked",
    ADDR  = {}
}


function toggle_unlock_bike()
    if STATE.UNLOCK_BIKE then
        sv(CACHE.UNLOCK_BIKE)
        CACHE.UNLOCK_BIKE = {}
        STATE.UNLOCK_BIKE = false
        gg.toast("🛑 BIKE SKINS LOCKED")
        return
    end

    if #METHOD.UNLOCK_BIKE.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.UNLOCK_BIKE.ADDR = findMethod(
            METHOD.UNLOCK_BIKE.CLASS,
            METHOD.UNLOCK_BIKE.NAME
        )

        if #METHOD.UNLOCK_BIKE.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.UNLOCK_BIKE = {}

    for _, a in ipairs(METHOD.UNLOCK_BIKE.ADDR) do
        -- Backup 8 bytes
        table.insert(CACHE.UNLOCK_BIKE, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.UNLOCK_BIKE, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})
        
        -- Patch: Always return false (so unlocked)
        table.insert(patch, {address=a, flags=gg.TYPE_DWORD, value=0x52800000}) -- mov w0,#0
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0}) -- ret
    end

    sv(patch)
    STATE.UNLOCK_BIKE = true
    gg.toast("✅ ALL BIKE SKINS UNLOCKED")
end



--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
--GACHA NO DECREASE IN INBOX
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE.GACHA = false
CACHE.GACHA = {}

METHOD.GACHA = {
    CLASS = "ShopInboxGachaItem",
    NAME  = "Take",
    ADDR  = {}
}

function toggle_gacha_no_decrease()
    if STATE.GACHA then
        sv(CACHE.GACHA)
        CACHE.GACHA = {}
        STATE.GACHA = false
        gg.toast("🛑 GACHA NO DECREASE OFF")
        return
    end

    if #METHOD.GACHA.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.GACHA.ADDR = findMethod(
            METHOD.GACHA.CLASS,
            METHOD.GACHA.NAME
        )

        if #METHOD.GACHA.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.GACHA = {}

    for _, a in ipairs(METHOD.GACHA.ADDR) do
        -- backup
        table.insert(CACHE.GACHA, {address=a,   flags=gg.TYPE_DWORD, value=gv(a,   gg.TYPE_DWORD)})
        table.insert(CACHE.GACHA, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        ------------------------------------------------
        -- Force Take() return TRUE
        -- so gacha is never consumed
        ------------------------------------------------
        -- mov w0,#1
        -- ret
        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value=0x52800020})
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value=0xD65F03C0})
    end

    sv(patch)
    STATE.GACHA = true
    gg.toast("✅ GACHA NO DECREASE ON")
end




-------------------------------------------------
-- 📌 menu for mod
-------------------------------------------------



function all_mods_menu()
    local function status(state)
        return state and " ✅" or " 🛑"
    end
    
    local active = count_active_mods()
    local header = "📂 ALL MODS (" .. active .. " active)\n" ..
                   "────────────────"
    
    local choice = gg.choice({
        -- Header: Crafting & Building
        "🛠️ CRAFTING & BUILDING",
        " ╰▶🛠️ Free Craft" .. status(STATE.FREE_CRAFT),
        " ╰▶🏗️ Free Build" .. status(STATE.FREE_BUILD),
        " ╰▶🔨 Fast Workbench" .. status(STATE.FAST_WORKBENCH),
        
        -- Header: Inventory & Items
        "🎒 INVENTORY & ITEMS",
        " ╰▶✂️ Split Weapon" .. status(STATE.SPLIT_WEAPON),
        " ╰▶🎒 No Decrease Item Backpack" .. status(STATE.NO_DECREASE_BACKPACK),
        " ╰▶⚡ Max Durability" .. status(STATE.MAX_DURABILITY),
        " ╰▶🎁 Gacha No Decrease In Inbox" .. status(STATE.GACHA),
        
        -- Header: Premium Features
        "👑 PREMIUM FEATURES",
        " ╰▶👑 Premium BATTLEPASS" .. status(STATE.UNLOCK_PREMIUM),
        " ╰▶👑 Premium SURVIVOR PATH" .. status(STATE.TROPHY_PREMIUM),
        
        -- Header: Skins (Temporary)
        "👕 SKINS (TEMPORARY)",
        " ╰▶👕 Unlock All Skins" .. status(STATE.UNLOCK_SKINS),
        " ╰▶🏍 Unlock All Bike Skins" .. status(STATE.UNLOCK_BIKE),
       
        -- Header: Character & Stats
        "🙍🏻‍♂️ CHARACTER & STATS",
        " ╰▶⚡ No Skill Cooldown" .. status(STATE.NO_PERK_COOLDOWN),
        " ╰▶🆓 Travel Energy" .. status(STATE.FREE_ENERGY),
        " ╰▶🚽 No Defecate" .. status(STATE.NO_DIRT),
        
        -- Navigation
        "────────────────────────────",
        "🔙 Back to Main Menu"
    }, nil, header)
    
    if choice == nil then return end
    
    -- Handler dengan penyesuaian untuk header
    -- Note: Header tidak bisa dipilih (harus skip)
    
    if choice == 2 then toggle_free_craft()
    elseif choice == 3 then toggle_free_build()
    elseif choice == 4 then toggle_fast_workbench()
    elseif choice == 6 then toggle_split_weapon()
    elseif choice == 7 then toggle_no_decrease_backpack()
    elseif choice == 8 then toggle_max_durability()
    elseif choice == 9 then toggle_gacha_no_decrease()
    elseif choice == 11 then toggle_unlock_premium()
    elseif choice == 12 then toggle_trophy_premium()
    elseif choice == 14 then toggle_unlock_skins()
    elseif choice == 15 then toggle_unlock_bike()
    elseif choice == 17 then toggle_no_perk_cooldown()
    elseif choice == 18 then toggle_free_energy()
    elseif choice == 19 then toggle_no_dirt()
    elseif choice == 21 then return  -- Back to Main Menu
    end
    
    return all_mods_menu()
end




-------------------------------------------------
-- UPDATE MAIN MENU - UI FRIENDLY VERSION
-------------------------------------------------
while true do
    gg.sleep(150)
    
    -- CEK JIKA GG VISIBLE (artinya user klik icon GG)
    if gg.isVisible(true) then
        gg.setVisible(false)
        
        -- BUAT STATUS BAR
        local status_text = ""
        if _G.CURRENT_ACTIVE_ITEM then
            status_text = "📌 Active Item: " .. (_G.CURRENT_ACTIVE_NAME or _G.CURRENT_ACTIVE_ITEM)
        else
            status_text = "📌 No active item selected"
        end
        
        -- Status restore
        local restore_status = " ╰▶🔄 Restore Changes"
        if _G.LAST_REPLACED_ITEM then
            restore_status = " ╰▶⚠️ RESTORE: " .. _G.LAST_REPLACED_ITEM
        end
        
        -- Status inbox
        local inbox_status = " ╰▶📦 Infinite Inbox"
        if _G.INFINITE_INBOX_ACTIVE then
            inbox_status = " ╰▶🚨 INFINITE INBOX: NEED RESTORE!"
        end

        -- MENU UTAMA DENGAN PENGELOMPOKAN YANG JELAS
        local c = gg.choice({
            "💫 Menu Item Replacemen", --index 1
            " ╰▶🤖 STEP ONE: " .. (_G.CURRENT_ACTIVE_NAME and "✅ " .. _G.CURRENT_ACTIVE_NAME or "🔍 Select Item"), --index 2
            " ╰▶🧭 ITEM EXPLORER", --index 3
              restore_status, --index 4
            "✨ Other Menu", --index 5
               inbox_status, --index 6
            " ╰▶ 🐕 DOG SKILL HACK", --index 7 
            " ╰▶ 📂 MOD HACK", --index 8 
            "⚙️ Settings", --index 9
            " ╰▶📊 Game Information", --index 10
            " ╰▶🏠 Home Screen", --index 11
            " ╰▶❌ Exit Script" --index 12
        }, nil, "✨ Draboy LDOE Tools " .. SCRIPT_VERSION .. "\n" .. status_text)

        -- Handle pilihan berdasarkan nomor
        if c == 2 then

            -- 🤖 STEP ONE
            local step_one_menu = gg.choice({

                "💫 QUICK SCAN",  --index 1
                " ╰▶🧪 Scan Empty Bottle", --index 2
                " ╰▶🧶 Scan Fiber", --index 3
                " ╰▶🧵 Scan Rope", --index 4
                "⭐ ADVANCED", --index 5
                " ╰▶📁 Choose from Item Explorer", --index 6
                " ╰▶🔍 Find Item (Search Bar)", --index 7
                " ╰▶✍️ Input ID Manual", --index 8
                "⬅️ Back to Main Menu" --index 9

            }, nil, "🤖 STEP ONE - Select Scan Method")
            
            if step_one_menu == 2 then AutoScanAndPointerSuite("empty_bottle", "Empty Bottle")
            elseif step_one_menu == 3 then AutoScanAndPointerSuite("resource_fiber", "Fiber")
            elseif step_one_menu == 4 then AutoScanAndPointerSuite("resource_rope", "Rope")
            elseif step_one_menu == 6 then

                            -- 📁 Pilih dari Item Explorer
                            local selected = ChooseItemFromExplorer()
                            if selected then
                                local confirm = gg.alert(
                                    "🎯 ITEM SELECTED\n\n" ..
                                    "📝 Name: " .. selected.name .. "\n" ..
                                    "🔑 ID: " .. selected.id .. "\n\n" ..
                                    "Will use AUTO-REFINE method\n\n" ..
                                    "Start Step One Scan?",
                                    "✅ START SCAN", "❌ CANCEL"
                                )
                                
                                if confirm == 1 then
                                    AutoScanAndPointerSuite(selected.id, selected.name)
                                end
                            end

                    elseif step_one_menu == 7 then
                        
                        -- 🔍 Find Item (Search Bar) - Step One Process
                        local keyword = gg.prompt({"🔍 Find Item Name (Min 3 characters):"}, nil, {"text"})
                        if not keyword or not keyword[1] or #keyword[1] < 3 then
                            gg.alert("⚠️ Minimum 3 characters for search!")
                        else
                            local key = keyword[1]:lower()
                            local results = {}
                            
                            -- Fungsi rekursif untuk mencari di semua nested structure
                            local function search_in_table(tbl, current_path)
                                for name, value in pairs(tbl) do
                                    if type(value) == "table" then
                                        -- Cari di sub-table
                                        search_in_table(value, current_path .. " > " .. name)
                                    elseif type(value) == "string" then
                                        -- Cek jika nama mengandung keyword
                                        if string.find(name:lower(), key) then
                                            table.insert(results, {
                                                name = name,
                                                value = value,
                                                path = current_path
                                            })
                                        end
                                    end
                                end
                            end
                            
                            -- Mulai pencarian dari root
                            for category_name, category_data in pairs(ITEM_DATA) do
                                if type(category_data) == "table" then
                                    search_in_table(category_data, category_name)
                                elseif type(category_data) == "string" then
                                    if string.find(category_name:lower(), key) then
                                        table.insert(results, {
                                            name = category_name,
                                            value = category_data,
                                            path = "Root"
                                        })
                                    end
                                end
                            end

                            if #results == 0 then
                                gg.alert("❌ Item not found with keyword: " .. key)
                            else
                                -- Tampilkan hasil pencarian
                                local menu_items = {}
                                for _, v in ipairs(results) do
                                    -- Potong path jika terlalu panjang
                                    local display_path = v.path
                                    if #display_path > 30 then
                                        display_path = "..." .. display_path:sub(-27)
                                    end
                                    table.insert(menu_items, v.name .. " (" .. display_path .. ")")
                                end
                                
                                local sel = gg.choice(menu_items, nil, "🔍 Search Results: '" .. key .. "' (" .. #results .. " items)")
                                if sel then
                                    local chosen = results[sel]
                                    local confirm = gg.alert(
                                        "🎯 ITEM FOUND\n\n" ..
                                        "📝 Name: " .. chosen.name .. "\n" ..
                                        "📁 Path: " .. chosen.path .. "\n" ..
                                        "🔑 ID: " .. chosen.value .. "\n\n" ..
                                        "Run Step One Scan for this item?",
                                        "✅ START STEP ONE", "❌ CANCEL"
                                    )
                                    
                                    if confirm == 1 then
                                        AutoScanAndPointerSuite(chosen.value, chosen.name)
                                    end
                                end
                            end
                        end



                    elseif step_one_menu == 8 then
                            -- ✍️ Input Manual Text
                            local input = gg.prompt({
                                "✍️ MANUAL ITEM INPUT",
                                "Item ID UTF16:",
                                "Display Name (Optional):"
                            }, {
                                "backpack_military",
                                "Backpack Military"
                            }, {"text", "text"})
                            
                            if input and input[1] and input[1] ~= "" then
                                local item_id = input[1]
                                local item_name = input[2] or item_id
                                
                                gg.alert(
                                    "⚠️ CONFIRMATION\n\n" ..
                                    "📝 Name: " .. item_name .. "\n" ..
                                    "🔑 ID: " .. item_id .. "\n\n" ..
                                    "Start scanning?",
                                    "✅ START", "❌ CANCEL"
                                )
                                
                                AutoScanAndPointerSuite(item_id, item_name)
                            end
                        end
            
        elseif c == 3 then explorer()
            
        elseif c == 4 then

                -- RESTORE CHANGES
                local confirm_msg = "⚠️ RESTORE CHANGES\n\n"
                
                if _G.LAST_REPLACED_ITEM then
                    confirm_msg = confirm_msg .. "Last Replaced: " .. _G.LAST_REPLACED_ITEM .. "\n\n"
                end
                
                confirm_msg = confirm_msg .. "Restore all changes to original values?"
                
                local confirm = gg.alert(confirm_msg, "✅ RESTORE", "❌ CANCEL")
                if confirm == 1 then
                    RevertReplace()
                end
            
        elseif c == 6 then
            -- 📦 INFINITE INBOX
            Menu_InfiniteInbox()
            
        elseif c == 7 then
                        -- 🐾 DOG SKILL HACK
                        local dog_menu = gg.choice({
                            "🐾 DOG SKILL HACK",
                            " ╰▶📋 Step 1: Select Skill & Scan",
                            " ╰▶🎯 Step 2: Replace Skill",
                            " ╰▶ℹ️ Instructions & Info",
                            "",
                            " ╰▶⬅️ Back to Main Menu"
                        }, nil, "🐕 Dog Skill Hack - By Temujin™")
                        
                        if dog_menu == 2 then
                            -- Step One dengan alert warning
                            local info = gg.alert(
                                "⚠️ HIGH RISK FEATURE\n\n" ..
                                "📌 IMPORTANT NOTES:\n\n" ..
                                "• Make sure dog is in kennel slot\n" ..
                                "• Not in yard or with player\n" ..
                                "• Better to replace Tier 4 Dog\n" ..
                                "• Lucky Coin skill = Corgi only\n" ..
                                "• Replace skill with same type ONLY\n" ..
                                "• Use at your own risk!\n" ..
                                "• Don't be greedy!\n\n" ..
                                "Do you understand?",
                                "✅ I UNDERSTAND, CONTINUE", "❌ CANCEL"
                            )
                            
                            if info == 1 then
                                DogSkill_StepOne()
                            end
                            
                        elseif dog_menu == 3 then
                            DogSkill_StepTwo()
                        elseif dog_menu == 4 then
                            gg.alert(
                                "🐕 DOG SKILL GUIDE\n\n" ..
                                "📌 HOW TO USE:\n\n" ..
                                "1. STEP ONE: Select skill to scan\n" ..
                                "2. STEP TWO: Select target skill\n" ..
                                "3. Move dog to different slot\n" ..
                                "4. Wait 8 seconds\n" ..
                                "5. Check results\n\n" ..
                                "⚠️ WARNING: High risk feature!\n" ..
                                "Inspired by Temujin™",
                                "✅ GOT IT"
                            )
                        end

        elseif c == 8 then all_mods_menu()
            
        elseif c == 10 then ShowGameAndVersionInfo()
            
        elseif c == 11 then ShowWelcomeMessage()
            
       elseif c == 12 then
            -- ❌ EXIT SCRIPT
            local message =
                "⚠️ EXIT SCRIPT\n\n" ..
                "Are you sure you want to exit?\n\n"
           

            local confirm = gg.alert(
                message,
                "✅ YES, EXIT",
                "❌ CANCEL"
            )

            if confirm == 1 then
                gg.clearList()
                gg.clearResults()
                gg.toast("👋 Goodbye!")
                os.exit()
            end
        end

        
      
    end
end
