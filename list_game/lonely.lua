----------------------------------------------------
-- DRABOY Lonely Survivor Tools
----------------------------------------------------

LUA = 'LonelySurvivor Draboy Edition'
GProcess = 'com.cobby.lonelysurvivor'
xbit = 64



----------------------------------------------------
-- DATE & TIME
----------------------------------------------------
local function get_datetime()
    return os.date("%d/%m/%Y %H:%M")
end

----------------------------------------------------
-- SIMPLE LOADING
----------------------------------------------------
local function show_loading(message, duration)
    for i = 1, duration do
        gg.toast(message .. "...")
        gg.sleep(200)
    end
end

----------------------------------------------------
-- SIMPLE ALERT
----------------------------------------------------
local function beauty_alert(title, message)
    gg.alert(title .. "\n\n" .. message)
end

----------------------------------------------------
-- GLOBAL STATE
----------------------------------------------------
STATE = { 
    GOD_MODE = false,
    ATK_HP_SET = false
}
CACHE = { GOD_MODE = nil }

----------------------------------------------------
-- APEX GLOBAL VAR
----------------------------------------------------
E = nil
x = nil
t = nil
o = nil
r = nil
gmhp = nil
gmatk = nil
GM_WAIT = false

----------------------------------------------------
-- FORMAT NUMBER
----------------------------------------------------
function format_number(num)
    if not num then return "0" end
    local formatted = tostring(math.floor(num))
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

----------------------------------------------------
-- STEP 1
----------------------------------------------------
function step_one_set_atk_hp()
    local p = gg.prompt(
        {"Input Total ATK", "Input Total HP"},
        {gmatk or 0, gmhp or 0},
        {"number", "number"}
    )

    if not p then return end

    gmatk = tonumber(p[1])
    gmhp  = tonumber(p[2])
    
    if gmatk and gmhp then
        STATE.ATK_HP_SET = true
        show_loading("Procces", 3)
        gg.toast("ATK & HP Saved")
        step_two_activate_godmode()
    else
        beauty_alert("❌ Error", "Input Not valid")
    end
end




----------------------------------------------------
-- STEP 2 WAIT
----------------------------------------------------

function step_two_activate_godmodex()

    if not STATE.ATK_HP_SET then
        beauty_alert("Info", "Set ATK & HP dulu")
        return
    end

    -- Jika God Mode sudah aktif
    if STATE.GOD_MODE then
        gg.alert("System Ready Tap GG to deactivate God Mode")
        GM_WAIT = true
        return
    end

    -- Jika God Mode belum aktif
    gg.alert("System Ready, Play Game → Level Up → Tap GG to activate Icon")
    GM_WAIT = true
end


function step_two_activate_godmode()

    if not STATE.ATK_HP_SET then
        beauty_alert("Info", "Set ATK & HP dulu")
        return
    end

    if STATE.GOD_MODE then
        execute_godmode()
        return
    end

    gg.toast("Activating God Mode...")
    gg.sleep(300)

    execute_godmode()
end


----------------------------------------------------
-- EXECUTE GODMODE
----------------------------------------------------
function execute_godmode()

    if STATE.GOD_MODE then
        if CACHE.GOD_MODE then
            gg.setValues(CACHE.GOD_MODE)
        end
        STATE.GOD_MODE = false
        GM_WAIT = false
        gg.toast("❌ God Mode OFF")
        return
    end

    x = "BattleUnitData"
    t = 32
    o = 0x18
    class()

    x = gmhp
    refine()
    check()

    if E == 0 then 
        beauty_alert("⚠️ Error", "not found")
        GM_WAIT = false
        return 
    end
    
    o = 16
    offset()
    x = gmatk
    refine()
    check()

    if E == 0 then 
        beauty_alert("⚠️ Error", "Data ATK failed")
        GM_WAIT = false
        return 
    end

    o = -40
    offset()

    local y = gg.getResults(1)
    if not y or #y == 0 then
        GM_WAIT = false
        return
    end

    local list = {
        {address = y[1].address + 0x10, flags = 32}, --curent hp
        {address = y[1].address + 0x18, flags = 32}, -- max hp
        {address = y[1].address + 0x28, flags = 32}, -- atk
        {address = y[1].address + 0x30, flags = 16}, -- movespeed
        {address = y[1].address + 0x40, flags = 4}, -- bullet count
        {address = y[1].address + 0x44, flags = 4}, -- hit count
        {address = y[1].address + 0x60, flags = 16}, -- coin add
        
        
            
    }

    CACHE.GOD_MODE = gg.getValues(list)

    local z = {1e12, 1e12, 1e12, 15, 20, 1000000, 10000000}
    

    for i, v in ipairs(list) do
        list[i].value = z[i]
    end

    gg.setValues(list)

    STATE.GOD_MODE = true
    GM_WAIT = false
    gg.toast("✅ God Mode ON")
end

----------------------------------------------------
-- RESET
----------------------------------------------------
function reset_all_settings()

    if STATE.GOD_MODE and CACHE.GOD_MODE then
        gg.setValues(CACHE.GOD_MODE)
    end

    STATE.GOD_MODE = false
    STATE.ATK_HP_SET = false
    gmatk = nil
    gmhp = nil
    GM_WAIT = false

    gg.toast(" ✅ Reset Done")
end

----------------------------------------------------
-- HEADER
----------------------------------------------------
local function create_header()
    return "🚀 Draboy Lonely Survivor Tools\n🗓️ " .. get_datetime()
end

----------------------------------------------------
-- STATUS
----------------------------------------------------
local function create_status_panel()

    local s1 = STATE.ATK_HP_SET and "✅ READY" or "❌ Not Ready"
    local s2 = STATE.GOD_MODE and "✅ ACTIVE" or " ❌ Not Active"

    return "Set ATK & HP : " .. s1 .. "\nGod Mode : " .. s2
end

----------------------------------------------------
-- MENU
----------------------------------------------------
function main_menu()

    local menu_items = {
        "📝 Set ATK & HP",
        "💪 God Mode",
        "🔁 Reset",
        "❌ Exit"
    }

    local m = gg.choice(menu_items, nil,
        create_header() .. "\n\n" ..
        create_status_panel()
    )

    if m == 1 then 
        step_one_set_atk_hp() 
    elseif m == 2 then 
        step_two_activate_godmode() 
    elseif m == 3 then 
        reset_all_settings() 
    elseif m == 4 then 
        os.exit() 
    end
end

----------------------------------------------------
-- APEX ENGINE (TIDAK DIUBAH)
----------------------------------------------------
function class()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    gg.searchNumber(":"..x, 1)
    if gg.getResultsCount() == 0 then E = 0 return end

    apexu = gg.getResults(1)
    gg.getResults(gg.getResultsCount())
    gg.refineNumber(tonumber(apexu[1].value), 1)

    apexu = gg.getResults(gg.getResultsCount())
    gg.clearResults()

    for i, v in ipairs(apexu) do
        apexu[i].address = apexu[i].address - 1
        apexu[i].flags = 1
    end

    apexu = gg.getValues(apexu)
    apexa = {}
    apexaa = 1

    for i, v in pairs(apexu) do
        if apexu[i].value == 0 then
            apexa[apexaa] = {address = apexu[i].address, flags = 1}
            apexaa = apexaa + 1
        end
    end

    if #(apexa) == 0 then gg.clearResults() E = 0 return end

    for i, v in ipairs(apexa) do
        apexa[i].address = apexa[i].address + #(x) + 1
    end

    apexa = gg.getValues(apexa)
    apexs = {}
    apexbb = 1

    for i, v in ipairs(apexa) do
        if apexa[i].value == 0 then
            apexs[apexbb] = {address = apexa[i].address, flags = 1}
            apexbb = apexbb + 1
        end
    end

    if #(apexs) == 0 then gg.clearResults() E = 0 return end

    for i, v in ipairs(apexs) do
        apexs[i].address = apexs[i].address - #(x)
    end

    gg.loadResults(apexs)
    gg.searchPointer(0)

    if gg.getResultsCount() == 0 then E = 0 return end

    apexu = gg.getResults(gg.getResultsCount())
    gg.clearResults()

    if gg.getTargetInfo().x64 then
        apexo1 = 48
        apexo2 = 56
        apexvt = 32
    else
        apexo1 = 24
        apexo2 = 28
        apexvt = 4
    end

    ERROR = 0
    ::TRYAGAIN::

    apexy = {}
    apexz = {}

    for i, v in ipairs(apexu) do
        apexy[i] = {address = apexu[i].address + apexo1, flags = apexvt}
        apexz[i] = {address = apexu[i].address + apexo2, flags = apexvt}
    end

    apexy = gg.getValues(apexy)
    apexz = gg.getValues(apexz)

    apexp = {}
    apexxx = 1

    for i, v in ipairs(apexy) do
        if apexy[i].value == apexz[i].value and #(tostring(apexy[i].value)) >= 8 then
            apexp[apexxx] = apexy[i].value
            apexxx = apexxx + 1
        end
    end

    if #(apexp) == 0 and ERROR == 0 then
        if gg.getTargetInfo().x64 then
            apexo1 = 32
            apexo2 = 40
        else
            apexo1 = 16
            apexo2 = 20
        end
        ERROR = 2
        goto TRYAGAIN
    end

    if #(apexp) == 0 then E = 0 return end

    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()

    apexxxx = 1

    for i, v in ipairs(apexp) do
        gg.searchNumber(tonumber(apexp[i]), apexvt)

        if gg.getResultsCount() ~= 0 then
            apexxx = gg.getResults(gg.getResultsCount())
            gg.clearResults()

            for q = 1, #apexxx do
                apexxx[q].name = "APEX[GG]v2"
            end

            gg.addListItems(apexxx)
            apexxxx = apexxxx + 1
        end
        gg.clearResults()
    end

    if apexxxx == 1 then gg.clearResults() E = 0 return end

    apexload = {}
    apexremove = {}
    apexxx = 1

    apexu = gg.getListItems()

    for i, v in ipairs(apexu) do
        if apexu[i].name == "APEX[GG]v2" then
            apexload[apexxx] = {address = apexu[i].address + o, flags = t}
            apexremove[apexxx] = apexu[i]
            apexxx = apexxx + 1
        end
    end

    apexload = gg.getValues(apexload)
    gg.loadResults(apexload)
    gg.removeListItems(apexremove)
end

----------------------------------------------------
-- HELPERS
----------------------------------------------------
function refine() gg.refineNumber(x, t) end
function check() E = gg.getResultsCount() end

function offset()
    local addoff = gg.getResults(gg.getResultsCount())
    for i, v in ipairs(addoff) do
        addoff[i].address = addoff[i].address + o
        addoff[i].flags = t
    end
    gg.loadResults(addoff)
end

--------------------------------------------------
-- 🚀 INITIALIZATION & ANIMATION (DRABOY VERSION)
----------------------------------------------------
function initialize()

    gg.clearResults()
    gg.setVisible(false)

    ----------------------------------------------------
    -- LOADING ANIMATION
    ----------------------------------------------------
    local frames = {
        "▕      ▏","▕▃     ▏","▕▆▃    ▏","▕▇▆▃   ▏","▕██▇▆▃ ▏",
        "▕ ███▇▆▏","▕  ███▇▏","▕   ███▏","▕    ██▏","▕     █▏",
        "▕      ▏","▕     ▃▏","▕    ▃▆▏","▕   ▃▆▇▏","▕ ▃▆▇█▏",
        "▕▆▇███ ▏","▕▇███  ▏","▕███   ▏","▕██    ▏","▕█     ▏"
    }

    for r = 1,2 do
        for _,v in ipairs(frames) do
            gg.toast("🚀 Loading Draboy Tools "..v)
            gg.sleep(60)
        end
    end

    ----------------------------------------------------
    -- READY MESSAGE
    ----------------------------------------------------
    local msg =
        "✅ SYSTEM READY TO USE\n" ..
        "────────────────────────\n" ..
        "👤 Author   : Draboy\n" ..
        "🎮 Game     : Lonely Survivor Tools\n" ..
        "⚙️ Status   : ARM64 / Optimized\n" ..
        "📅 Date     : "..get_datetime().."\n" ..
        "────────────────────────\n" ..
        "💪 Feature  : God Mode\n" ..
        "────────────────────────"

    local sel = gg.alert(msg, "🚀 START SYSTEM", "❌ EXIT")

    if sel ~= 1 then
        gg.toast("👋 Script Closed")
        os.exit()
    end
end


----------------------------------------------------
-- START SCRIPT
----------------------------------------------------
initialize()
main_menu()
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        

        if GM_WAIT then
            execute_godmode()
        else
            main_menu()
        end
    end
    gg.sleep(100)
end
