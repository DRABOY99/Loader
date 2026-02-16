-------------------------------------------------
-- WELCOME MESSAGE DESIGN BARU
-------------------------------------------------
local SCRIPT_VERSION = "V.1"
local RELEASE_DATE = "23-01-2026"

local function ShowWelcomeMessage()
    local response = gg.alert(
        "✨ Draboy Jurrasic survival Tools 🇮🇩  " .. SCRIPT_VERSION .. "\n" ..
        "📅 Released: " .. RELEASE_DATE .. "\n" ..
        "━━━━━━━━━━━━━━━━━━━\n\n" ..
    

        "📢 Update Log:\n" ..
        "━━━━━━━━━━━━━━━━━━━\n" ..
        "⚠️ Don't use you real account !!\n" ..
        "Still Beta Tested\n" ..
        "But you can try playaround\n\n" ..
        "List Features\n" ..
        "🔥 Replacement Item\n" ..
        "🎁 Infinite Item Inbox\n" ..
        "👑 Premium BATTLEPASS\n" ..
        "✂️ Split Weapon\n" ..
        "🎒 No Decrease Item Backpack\n" ..
        "⚡ Max Durability\n\n" ..
    
        "Note : Mod Feature Unstable in Emulator PC\n\n" ..
      
        "⚠️ Important:\n" ..
        "━━━━━━━━━━━━━━━━━━━\n" ..
        "⚠️ Use at Your Risk !\n",
       
        "🚀 START ", "🛑 EXIT"
    )
    
    if response == 1 then
        gg.toast("🔥 Draboy Jurrasic survival Tools " .. SCRIPT_VERSION .. ": ONLINE")
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
_G.MULTI_DELAY = 5000 -- Default delay 5 detik

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
    ["item"] = {
    
            ["palm log"] = "wood",
            ["stone"] = "stone", 
            ["Hunter token"] = "hunters_token", 
            ["fuel canister"] = "resource_gasoline",
            ["wiring"] = "wire",
            ["Incubator lamb"] = "incubator_ceramic_lamp",
            ["rubbber"] = "rubber_parts",
            
            ["Paint green"] = "junk_paint",
            ["Paint black"] = "paint_black",
            ["Paint blue"] = "paint_blue",
            ["Paint red"] = "paint_red",
            ["Paint white"] = "paint_white",
            ["Paint yellow"] = "paint_yellow",
            
     
    },
    
     ["Dino collection"] = {
                ["egg raptor"] = "pet_egg_01",
                ["egg triceratops"] = "pet_egg_02", 
                ["egg tirex"] = "pet_egg_tirex", 
                ["scales blue"] = "trophy_scales_red", 
                ["scales green"] = "trophy_scales_green", 
                ["scales red"] = "trophy_scales_red", 
                ["bones baryonyx"] = "baryonyx_bone", 
                ["bones megalosaurus"] = "megalosaurus_bone", 
                ["claw"] = "trophy_claw_1", 
                ["claw rare"] = "trophy_claw_2", 
                ["Fang"] = "trophy_fangs_1", 
                ["Fang rare"] = "trophy_fangs_2", 
                ["Egg shell"] = "trophy_shell", 
                ["sadle tirex"] = "saddle", 
                
          
            
    },
    
       ["furniture"] = { 
                ["baryonyx furniture"] = "buildingsite_trophy_baryonyx",
                ["megalosaurus furniture"] = "buildingsite_trophy_megalosaurus", 
            },
    

        -- ========== CONSUMABLE ==========
    ["consumable"] = {
        
            ["bandage"] = "bandage",
            ["first aid kit"] = "aid_kit",
            ["Bottle water"] = "full_bottle",
            ["Beer"] = "food_beer",
            
        
    },
    
   

    -- ========== EQUIPMENT ==========
    ["Equipment"] = {
        
            ["reinforce Backpack"] = "backpack_military",
            ["hunter backpack"] = "backpack_12",
            ["common backpack"] = "backpack_8",
            
            ["military boots"] = "tactical_boots",
            ["military hat"] = "tactical_hat",
            ["military pants"] = "tactical_pants",
            ["military shirt"] = "tactical_shirt",
             
            
            ["juggernout armor"] = "juggernaut_armor",
            ["juggernout boots"] = "juggernaut_boots",
            ["juggernout hat"] = "juggernaut_hat",
            ["juggernout pants"] = "juggernaut_pants",
            
            ["hunters body armor"] = "kevlar_armor_1",
            ["hunters body boots"] = "kevlar_boots_1",
            ["hunters body helmet"] = "kevlar_hat_1",
            ["hunters body pants"] = "kevlar_pants_1",
            
            ["reinforce armor 2"] = "kevlar_armor_2",
            ["reinforce boots 2"] = "kevlar_boots_2",
            ["reinforce hat 2"] = "kevlar_hat_2",
            ["reinforce pants 2"] = "kevlar_pants_2",
            
            
            ["swat boots"] = "sf_boots",
            ["swat hat"] = "sf_hat",
            ["swat pats"] = "sf_pants",
            ["swat shirt"] = "sf_shirt",
            
            ["simple boots"] = "simple_boots",
            ["simple hat"] = "simple_hat",
            ["simple pants"] = "simple_pants",
            ["simple shirt"] = "simple_shirt",
            
            ["camouflage boots"] = "stealth_boots",
            ["camouflage hat"] = "stealth_hat",
            ["camouflage pants"] = "stealth_pants",
            ["camouflage shirt"] = "stealth_armor",
            
            ["thick boots"] = "thick_boots",
            ["thick hat"] = "thick_hat",
            ["thick pants"] = "thick_pants",
            ["thick shirt"] = "thick_shirt",
            
            ["improve boots"] = "thick_boots_improved",
            ["improve hat"] = "thick_hat_improved",
            ["improve pants"] = "thick_pants_improved",
            ["improve shirt"] = "thick_shirt_improved",
  

    },

    -- ========== WEAPON RANGE ==========
    ["Weapon"] = {
        
            ["compound bow"] = "compound_bow",
            ["shotgun"] = "shotgun",
            ["winchester"] = "winchester",
            ["sawed off shotgun"] = "sawed_off_shotgun",
            ["Benelli M4"] = "benelli_M4",
            ["Ak74"] = "rifle_ak74",
            ["M416"] = "rifle_m416",
            ["uzi"] = "uzi",
            ["P90"] = "fn_p90",
            ["vector"] = "kriss_vector",
            ["ump45"] = "ump",
            ["AWP"] = "awp",
            ["Desert eagle"] = "desert_eagle",
            ["Beretta 92"] = "beretta_92",
            ["Karabiner 98"] = "karabiner_98",
            ["thompson gun"] = "thompson",
            ["magnum"] = "magnum_44",
            ["barrett m82"] = "barrett_m82",
            ["grenade launcher"] = "lg5",
            ["Usas 12"] = "usas12",
            ["Aug weapon"] = "aug",
            
            
            ["shovel"] = "shovel",
            ["Skull crusher"] = "sledgehammer",
            ["Spear"] = "spear_wooden",
            ["electrick shock"] = "electroshock",
            ["military machete"] = "tactical_machete",
               

       
    },


   
    
   

    -- ========== PACK ITEMS ==========
    ["Pack item, only replace in inbox !!"] = {
        ["all packs"] = {
            ["builder pack"] = "dota_gacha_building",
            ["experience builder pack"] = "dota_gacha_building_2",
            
            
            ["swatt pack"] = "dota_gacha_weapon_sf_b",
            ["gunsmith pack"] = "dota_gacha_weapon_engineer",
            ["suppression pack"] = "dota_gacha_weapon_suppression",
            ["hunter pack"] = "dota_gacha_robbery_set",
            ["destruction pack"] = "dota_gacha_weapon_exclusive",
            
            ["⚠️ not ready gacha Chrismas"] = "dota_gacha_christmas",
            ["⚠️ not ready weapon gacha ?"] = "dota_gacha_ambush",
            ["⚠️ not ready gacha anniversary ?"] = "dota_gacha_anniversary",
            
            ["⚠️ not ready swatt pack new"] = "dota_gacha_weapon_sf_new",
            ["⚠️ not ready weapon gacha 2"] = "dota_gacha_weapon_assault",
            ["⚠️ not ready military equipment"] = "dota_gacha_military_equipment",
            ["⚠️ not ready bunker"] = "dota_gacha_bunker",
            
             
           
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
    SavedInbox = {}
    gg.clearList()

    gg.toast("🔍 Start Infinite inbox (New Struct)...")

    -------------------------------------------------
    -- ✅ STEP 1: SEARCH 1000;20;1;1000;20::
    -------------------------------------------------
    gg.searchNumber(
        "1000;20;1;1000;20::",
        gg.TYPE_DWORD,
        false,
        gg.SIGN_EQUAL,
        0,
        -1,
        gg.REGION_ANONYMOUS
    )

    local count = gg.getResultsCount()
    if count == 0 then
        gg.alert("❌ No data found for pattern 1000;20;1;1000;20::")
        return
    end

    gg.toast("🔍 Found " .. count .. " inbox structures")

    local results = gg.getResults(count)

    -- simpan SEMUA hasil tanpa refine
    for i, v in ipairs(results) do
        v.name = "INBOX_STRUCT_" .. i
        v.freeze = false
    end

    gg.addListItems(results)

    -------------------------------------------------
    -- ✅ STEP 3: MODIFY ALL VALUES
    -------------------------------------------------
    local allItems = gg.getListItems()

    if #allItems == 0 then
        gg.alert("❌ No items in save list to modify!")
        return
    end

    -- backup untuk restore
    for _, v in ipairs(allItems) do
        table.insert(SavedInbox, {
            address = v.address,
            flags = v.flags,
            value = v.value,
            name = v.name
        })
    end

    -- ubah semua value
    local toWrite = {}
    for _, v in ipairs(allItems) do
        table.insert(toWrite, {
            address = v.address,
            flags = gg.TYPE_DWORD,
            value = -999999999,
            freeze = false
        })
    end

    gg.setValues(toWrite)
    gg.clearResults()

    _G.INFINITE_INBOX_ACTIVE = true

    gg.alert(
        "🎉 Infinite Inbox Active!\n\n" ..
        "⚠️ Remember Click RESTORE in menu infinite inbox\n" ..
        "📊 Status: ❌ Not yet Restore"
    )
end

-------------------------------------------------
-- 📌 RESTORE INFINITE INBOX (UNCHANGED)
-------------------------------------------------
function InfiniteInbox_Restore()
    if #SavedInbox == 0 then
        gg.alert("❌ No data backup For restore!")
        return
    end

    local c = gg.alert(
        "🔄 Restore " .. #SavedInbox .. " Back to Normal?\n\nContinue?",
        "✅ OK", "❌ NOPE"
    )

    if c ~= 1 then
        gg.toast("❌ Restore Canceled.")
        return
    end

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

    SavedInbox = {}
    _G.INFINITE_INBOX_ACTIVE = false

    local message = "✅ Successfully restored " .. restored .. " items"
    if failed > 0 then
        message = message .. "\n⚠️ Failed to restore " .. failed .. " items"
    end

    gg.alert(message)
    gg.clearList()
end

-------------------------------------------------
-- 📌 MENU
-------------------------------------------------
function Menu_InfiniteInbox()
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
-- STATE / CACHE /METHOD
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘


STATE = {  
    SPLIT_WEAPON = false,
    NO_DIRT = false,
    UNLOCK_PREMIUM = false,  
    NO_DECREASE_BACKPACK = false,
    TROPHY_PREMIUM = false,     
    FREE_BUILD = false,     
    MAX_DURABILITY = false,     
    ONE_HIT = false,     
}

CACHE = {
    SPLIT_WEAPON = {},
    UNLOCK_PREMIUM = {}, 
    NO_DECREASE_BACKPACK = {},  
    FREE_BUILD = {},  
    MAX_DURABILITY = {},  
    ONE_HIT = {},  
       
}

METHOD = {

    SPLIT_WEAPON = {
        CLASS = "Inventories",
        NAME  = "CheckSplit",
        ADDR  = {}
    },
    
    UNLOCK_PREMIUM = {  
        CLASS = "ResourceRequirement",
        NAME  = "OnCheck",
        ADDR  = {}
    },
    
    NO_DECREASE_BACKPACK = {
        CLASS = "ConsumeInventoryItemBehaviour",
        NAME  = "Use",
        ADDR  = {}
    },

    FREE_BUILD = {
        CLASS = "BuildingCollection",
        NAME  = "get_IsBuilt",
        ADDR  = {}
    },

    MAX_DURABILITY = {
        CLASS = "BaseDurabilityInventoryStack`1",
        NAME  = "get_Durability",
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
-- SPLIT WEAPON
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘
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
--FREE FINALIZE
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

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
--MAX DURABILITY
--⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘

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
        " ╰▶🏗️ Free Assemble" .. status(STATE.FREE_BUILD),      
        -- Header: Inventory & Items
        "🎒 INVENTORY & ITEMS",
        " ╰▶✂️ Split Weapon" .. status(STATE.SPLIT_WEAPON),
        " ╰▶🎒 No Decrease Item Backpack" .. status(STATE.NO_DECREASE_BACKPACK),
        " ╰▶⚡ Max Durability" .. status(STATE.MAX_DURABILITY),
        
        -- Header: Premium Features
        "👑 PREMIUM FEATURES",
        " ╰▶👑 Premium BATTLEPASS" .. status(STATE.UNLOCK_PREMIUM),
        
        -- Navigation
        "────────────────────────────",
        "🔙 Back to Main Menu"
    }, nil, header)
    
    if choice == nil then return end
       
    if choice == 2 then toggle_free_build()
        elseif choice == 4 then toggle_split_weapon()
        elseif choice == 5 then toggle_no_decrease_backpack()
        elseif choice == 6 then toggle_max_durability()
        elseif choice == 8 then toggle_unlock_premium()
        elseif choice == 10 then return  -- Back to Main Menu
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
            " ╰▶ 📂 MOD HACK", --index 7 
            "⚙️ Settings", --index 8
            " ╰▶📊 Game Information", --index 9
            " ╰▶🏠 Home Screen", --index 10
            " ╰▶❌ Exit Script" --index 11
        }, nil, "✨ Draboy Jurrasic Tools " .. SCRIPT_VERSION .. "\n" .. status_text)

        -- Handle pilihan berdasarkan nomor
        if c == 2 then

            -- 🤖 STEP ONE
            local step_one_menu = gg.choice({

                "💫 QUICK SCAN",  --index 1
                " ╰▶🧪 Scan Empty Bottle", --index 2
                " ╰▶🧶 Scan palm log", --index 3
                " ╰▶🧵 Scan Rope", --index 4
                "⭐ ADVANCED", --index 5
                " ╰▶📁 Choose from Item Explorer", --index 6
                " ╰▶🔍 Find Item (Search Bar)", --index 7
                " ╰▶✍️ Input ID Manual", --index 8
                "⬅️ Back to Main Menu" --index 9

            }, nil, "🤖 STEP ONE - Select Scan Method")
            
            if step_one_menu == 2 then AutoScanAndPointerSuite("empty_bottle", "Empty Bottle")
            elseif step_one_menu == 3 then AutoScanAndPointerSuite("wood", "palm log")
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
            
        elseif c == 7 then all_mods_menu()
            
        elseif c == 9 then ShowGameAndVersionInfo()
            
        elseif c == 10 then ShowWelcomeMessage()
            
       elseif c == 11 then
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
