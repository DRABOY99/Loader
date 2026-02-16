----------------------------------------------------
-- DATE
----------------------------------------------------
local function get_date()
    return os.date("%d/%m/%Y")
end

----------------------------------------------------
-- CHECK ARCH
----------------------------------------------------
local TI = gg.getTargetInfo()
if not TI or not TI.x64 then
    gg.alert("ARM64 ONLY")
    os.exit()
end

----------------------------------------------------
-- GLOBAL TABLE
----------------------------------------------------
STATE  = {}
CACHE  = {}
METHOD = {}

STATE.INFINITE_OXYGEN = false
CACHE.INFINITE_OXYGEN = {}

METHOD.INFINITE_OXYGEN = {
    CLASS = "PlayerOxegen",
    NAME  = "DicreaseOxegen",
    ADDR  = {}
}

STATE.GOD_MODE = false
CACHE.GOD_MODE = {}

METHOD.GOD_MODE = {
    CLASS = "PlayerHealth",
    NAME  = "TakeDamage",
    ADDR  = {}
}


STATE.DAMAGE_MULTI = false

CACHE.DAMAGE_MULTI = {}


METHOD.DAMAGE_MULTI = {
    CLASS = "PlayerStats",
    NAME  = "GetDamage",
    ADDR  = {}
   -- float 
}




----------------------------------------------------
-- UTILS
----------------------------------------------------
local function gv(a,t)
    return gg.getValues({{address=a,flags=t}})[1].value
end

local function sv(t)
    gg.setValues(t)
end

local function ptr(a)
    if a == 0 then return 0 end
    return gv(a, gg.TYPE_QWORD)
end

local function cstr(addr, s)
    if addr == 0 then return false end
    for i=1,#s do
        if gv(addr+i-1, gg.TYPE_BYTE) ~= s:byte(i) then
            return false
        end
    end
    return true
end

----------------------------------------------------
-- METHOD FINDER
----------------------------------------------------
local function findMethod(className, methodName)

    local results = {}

    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)

    gg.searchNumber("Q 00 '"..methodName.."' 00", gg.TYPE_BYTE)

    if gg.getResultsCount() == 0 then return results end

    local t = gg.getResults(gg.getResultsCount())

    gg.loadResults(t)
    gg.searchPointer(0)

    t = gg.getResults(gg.getResultsCount())

    for _,v in ipairs(t) do

        local classPtr = ptr(ptr(v.address + 8) + 16)

        if classPtr ~= 0 and cstr(classPtr, className) then

            local methodAddr = ptr(v.address - 16)

            if methodAddr ~= 0 then
                table.insert(results, methodAddr)
            end
        end
    end

    gg.clearResults()
    return results
end

----------------------------------------------------
-- TOGGLE OXYGEN
----------------------------------------------------
function toggle_infinite_oxygen()

    if STATE.INFINITE_OXYGEN then

        if #CACHE.INFINITE_OXYGEN > 0 then
            sv(CACHE.INFINITE_OXYGEN)
        end

        CACHE.INFINITE_OXYGEN = {}
        STATE.INFINITE_OXYGEN = false
        gg.toast("Oxygen Normal")
        return
    end

    if #METHOD.INFINITE_OXYGEN.ADDR == 0 then

        gg.toast("Finding Oxygen...")

        METHOD.INFINITE_OXYGEN.ADDR =
            findMethod(
                METHOD.INFINITE_OXYGEN.CLASS,
                METHOD.INFINITE_OXYGEN.NAME
            )

        if #METHOD.INFINITE_OXYGEN.ADDR == 0 then
            gg.alert("Method not found")
            return
        end
    end

    local patch = {}
    CACHE.INFINITE_OXYGEN = {}

    for _,addr in ipairs(METHOD.INFINITE_OXYGEN.ADDR) do

        -- Backup 3 instruction
        for i = 0,8,4 do
            table.insert(CACHE.INFINITE_OXYGEN,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- SAFE RETURN (MOV W0,#0 + RET)
        table.insert(patch,{
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800000
        })

        table.insert(patch,{
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.INFINITE_OXYGEN = true
    gg.toast("Infinite Oxygen ON")
end


----------------------------------------------------
-- GOD MODE TOGGLE
----------------------------------------------------
function toggle_god_mode()

    if STATE.GOD_MODE then

        if #CACHE.GOD_MODE > 0 then
            sv(CACHE.GOD_MODE)
        end

        CACHE.GOD_MODE = {}
        STATE.GOD_MODE = false
        gg.toast("God Mode OFF")
        return
    end

    if #METHOD.GOD_MODE.ADDR == 0 then

        gg.toast("Finding God Mode...")

        METHOD.GOD_MODE.ADDR =
            findMethod(
                METHOD.GOD_MODE.CLASS,
                METHOD.GOD_MODE.NAME
            )

        if #METHOD.GOD_MODE.ADDR == 0 then
            gg.alert("TakeDamage Not Found")
            return
        end
    end

    local patch = {}
    CACHE.GOD_MODE = {}

    for _,addr in ipairs(METHOD.GOD_MODE.ADDR) do

        -- Backup instruction
        for i = 0,8,4 do
            table.insert(CACHE.GOD_MODE,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- SAFE RETURN
        table.insert(patch,{
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800000
        })

        table.insert(patch,{
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.GOD_MODE = true
    gg.toast("God Mode ON")
end

function toggle_damage_multi()

    if STATE.DAMAGE_MULTI then

        if #CACHE.DAMAGE_MULTI > 0 then
            sv(CACHE.DAMAGE_MULTI)
        end

        CACHE.DAMAGE_MULTI = {}
        STATE.DAMAGE_MULTI = false
        gg.toast("Damage Normal")
        return
    end

    if #METHOD.DAMAGE_MULTI.ADDR == 0 then

        gg.toast("Finding Damage Method...")

        METHOD.DAMAGE_MULTI.ADDR =
            findMethod(
                METHOD.DAMAGE_MULTI.CLASS,
                METHOD.DAMAGE_MULTI.NAME
            )

        if #METHOD.DAMAGE_MULTI.ADDR == 0 then
            gg.alert("GetDamage Not Found")
            return
        end
    end

    local patch = {}
    CACHE.DAMAGE_MULTI = {}

    for _,addr in ipairs(METHOD.DAMAGE_MULTI.ADDR) do

        -- Backup
        for i = 0,12,4 do
            table.insert(CACHE.DAMAGE_MULTI,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end


table.insert(patch,{
    address = addr,
    flags = gg.TYPE_DWORD,
    value = 0x528D6500 -- MOV W0,#0x6B28
})

table.insert(patch,{
    address = addr + 4,
    flags = gg.TYPE_DWORD,
    value = 0x72A9CDC0 -- MOVK W0,#0x4E6E,LSL#16
})

table.insert(patch,{
    address = addr + 8,
    flags = gg.TYPE_DWORD,
    value = 0x1E270000 -- FMOV S0,W0
})

table.insert(patch,{
    address = addr + 12,
    flags = gg.TYPE_DWORD,
    value = 0xD65F03C0 -- RET
})


    end

    sv(patch)
    STATE.DAMAGE_MULTI = true
    gg.toast("One Hit Enabled")
end



STATE.TRIPLE_DAMAGE = false
CACHE.TRIPLE_DAMAGE = {}

METHOD.TRIPLE_DAMAGE = {
    CLASS = "PurchasesController",
    NAME  = "Is3XDamageBought",
    ADDR  = {}
}

function toggle_triple_damage()

    if STATE.TRIPLE_DAMAGE then

        if #CACHE.TRIPLE_DAMAGE > 0 then
            sv(CACHE.TRIPLE_DAMAGE)
        end

        CACHE.TRIPLE_DAMAGE = {}
        STATE.TRIPLE_DAMAGE = false
        gg.toast("3X Damage OFF")
        return
    end


    ------------------------------------------------
    -- FIND METHOD
    ------------------------------------------------
    if #METHOD.TRIPLE_DAMAGE.ADDR == 0 then

        gg.toast("Finding 3X Purchase Check...")

        METHOD.TRIPLE_DAMAGE.ADDR =
            findMethod(
                METHOD.TRIPLE_DAMAGE.CLASS,
                METHOD.TRIPLE_DAMAGE.NAME
            )

        if #METHOD.TRIPLE_DAMAGE.ADDR == 0 then
            gg.alert("Is3XDamageBought Not Found")
            return
        end
    end


    local patch = {}
    CACHE.TRIPLE_DAMAGE = {}

    for _,addr in ipairs(METHOD.TRIPLE_DAMAGE.ADDR) do

        -- Backup
        for i = 0,8,4 do
            table.insert(CACHE.TRIPLE_DAMAGE,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end


        ------------------------------------------------
        -- FORCE RETURN TRUE
        ------------------------------------------------
        table.insert(patch,{
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800020 -- MOV W0,#1
        })

        table.insert(patch,{
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- RET
        })

    end


    sv(patch)
    STATE.TRIPLE_DAMAGE = true
    gg.toast("3X Damage Unlocked")

end



STATE.NO_ADS = false
CACHE.NO_ADS = {}

METHOD.NO_ADS = {
    CLASS = "PurchasesController",
    NAME  = "IsNoAdsBought",
    ADDR  = {}
}

function toggle_no_ads()

    if STATE.NO_ADS then
        if #CACHE.NO_ADS > 0 then sv(CACHE.NO_ADS) end
        CACHE.NO_ADS = {}
        STATE.NO_ADS = false
        gg.toast("No Ads OFF")
        return
    end

    if #METHOD.NO_ADS.ADDR == 0 then
        METHOD.NO_ADS.ADDR = findMethod(METHOD.NO_ADS.CLASS, METHOD.NO_ADS.NAME)
        if #METHOD.NO_ADS.ADDR == 0 then
            gg.alert(" Not Found")
            return
        end
    end

    local patch = {}
    CACHE.NO_ADS = {}

    for _,addr in ipairs(METHOD.NO_ADS.ADDR) do
        for i=0,8,4 do
            table.insert(CACHE.NO_ADS,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch,{address = addr,     flags = gg.TYPE_DWORD, value = 0x52800020}) -- true
        table.insert(patch,{address = addr + 4, flags = gg.TYPE_DWORD, value = 0xD65F03C0}) -- RET
    end

    sv(patch)
    STATE.NO_ADS = true
    gg.toast("No Ads Enabled")
end

STATE.CHEAP_PASS = false
CACHE.CHEAP_PASS = {}

METHOD.CHEAP_PASS = {
    CLASS = "PurchasesController",
    NAME  = "IsCheapSurvivorPassBought",
    ADDR  = {}
}

function toggle_cheap_pass()

    if STATE.CHEAP_PASS then
        if #CACHE.CHEAP_PASS > 0 then sv(CACHE.CHEAP_PASS) end
        CACHE.CHEAP_PASS = {}
        STATE.CHEAP_PASS = false
        gg.toast("Cheap Survivor Pass OFF")
        return
    end

    if #METHOD.CHEAP_PASS.ADDR == 0 then
        METHOD.CHEAP_PASS.ADDR = findMethod(METHOD.CHEAP_PASS.CLASS, METHOD.CHEAP_PASS.NAME)
        if #METHOD.CHEAP_PASS.ADDR == 0 then
            gg.alert(" Not Found")
            return
        end
    end

    local patch = {}
    CACHE.CHEAP_PASS = {}

    for _,addr in ipairs(METHOD.CHEAP_PASS.ADDR) do
        for i=0,8,4 do
            table.insert(CACHE.CHEAP_PASS,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch,{address = addr,     flags = gg.TYPE_DWORD, value = 0x52800020}) -- true
        table.insert(patch,{address = addr + 4, flags = gg.TYPE_DWORD, value = 0xD65F03C0}) -- RET
    end

    sv(patch)
    STATE.CHEAP_PASS = true
    gg.toast("Cheap Survivor Pass Enabled")
end

STATE.EXPENSIVE_PASS = false
CACHE.EXPENSIVE_PASS = {}

METHOD.EXPENSIVE_PASS = {
    CLASS = "PurchasesController",
    NAME  = "IsExpensiveSurvivorPassBought",
    ADDR  = {}
}

function toggle_expensive_pass()

    if STATE.EXPENSIVE_PASS then
        if #CACHE.EXPENSIVE_PASS > 0 then sv(CACHE.EXPENSIVE_PASS) end
        CACHE.EXPENSIVE_PASS = {}
        STATE.EXPENSIVE_PASS = false
        gg.toast("Expensive Survivor Pass OFF")
        return
    end

    if #METHOD.EXPENSIVE_PASS.ADDR == 0 then
        METHOD.EXPENSIVE_PASS.ADDR = findMethod(METHOD.EXPENSIVE_PASS.CLASS, METHOD.EXPENSIVE_PASS.NAME)
        if #METHOD.EXPENSIVE_PASS.ADDR == 0 then
            gg.alert(" Not Found")
            return
        end
    end

    local patch = {}
    CACHE.EXPENSIVE_PASS = {}

    for _,addr in ipairs(METHOD.EXPENSIVE_PASS.ADDR) do
        for i=0,8,4 do
            table.insert(CACHE.EXPENSIVE_PASS,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch,{address = addr,     flags = gg.TYPE_DWORD, value = 0x52800020}) -- true
        table.insert(patch,{address = addr + 4, flags = gg.TYPE_DWORD, value = 0xD65F03C0}) -- RET
    end

    sv(patch)
    STATE.EXPENSIVE_PASS = true
    gg.toast("Expensive Survivor Pass Enabled")
end


STATE.TIMER_SPEED = false
CACHE.TIMER_SPEED = {}

METHOD.TIMER_SPEED = {
    CLASS = "PurchasesController",
    NAME  = "IsTimerSpeedUpBought",
    ADDR  = {}
}

function toggle_timer_speed()

    if STATE.TIMER_SPEED then
        if #CACHE.TIMER_SPEED > 0 then sv(CACHE.TIMER_SPEED) end
        CACHE.TIMER_SPEED = {}
        STATE.TIMER_SPEED = false
        gg.toast("Timer Speed OFF")
        return
    end

    if #METHOD.TIMER_SPEED.ADDR == 0 then
        METHOD.TIMER_SPEED.ADDR = findMethod(METHOD.TIMER_SPEED.CLASS, METHOD.TIMER_SPEED.NAME)
        if #METHOD.TIMER_SPEED.ADDR == 0 then
            gg.alert(" Not Found")
            return
        end
    end

    local patch = {}
    CACHE.TIMER_SPEED = {}

    for _,addr in ipairs(METHOD.TIMER_SPEED.ADDR) do
        for i=0,8,4 do
            table.insert(CACHE.TIMER_SPEED,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch,{address = addr,     flags = gg.TYPE_DWORD, value = 0x52800020}) -- true
        table.insert(patch,{address = addr + 4, flags = gg.TYPE_DWORD, value = 0xD65F03C0}) -- RET
    end

    sv(patch)
    STATE.TIMER_SPEED = true
    gg.toast("Timer Speed Enabled")
end


STATE.SCAVENGER_BOOST = false
CACHE.SCAVENGER_BOOST = {}

METHOD.SCAVENGER_BOOST = {
    CLASS = "PurchasesController",
    NAME  = "IsScavengerBoostBought",
    ADDR  = {}
}

function toggle_scavenger_boost()

    if STATE.SCAVENGER_BOOST then
        if #CACHE.SCAVENGER_BOOST > 0 then sv(CACHE.SCAVENGER_BOOST) end
        CACHE.SCAVENGER_BOOST = {}
        STATE.SCAVENGER_BOOST = false
        gg.toast("Scavenger Boost OFF")
        return
    end

    if #METHOD.SCAVENGER_BOOST.ADDR == 0 then
        METHOD.SCAVENGER_BOOST.ADDR = findMethod(METHOD.SCAVENGER_BOOST.CLASS, METHOD.SCAVENGER_BOOST.NAME)
        if #METHOD.SCAVENGER_BOOST.ADDR == 0 then
            gg.alert(" Not Found")
            return
        end
    end

    local patch = {}
    CACHE.SCAVENGER_BOOST = {}

    for _,addr in ipairs(METHOD.SCAVENGER_BOOST.ADDR) do
        for i=0,8,4 do
            table.insert(CACHE.SCAVENGER_BOOST,{
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch,{address = addr,     flags = gg.TYPE_DWORD, value = 0x52800020}) -- true
        table.insert(patch,{address = addr + 4, flags = gg.TYPE_DWORD, value = 0xD65F03C0}) -- RET
    end

    sv(patch)
    STATE.SCAVENGER_BOOST = true
    gg.toast("Scavenger Boost Enabled")
end


----------------------------------------------------
-- MOD COUNTER
----------------------------------------------------
local function count_active_mods()
    local total = 0
    for _,v in pairs(STATE) do
        if v == true then total = total + 1 end
    end
    return total
end

----------------------------------------------------
-- MAIN MENU (DRABOY STYLE CLEAN)
----------------------------------------------------
function main_menu()

    local function status(v)
        return v and " [ON] ✅" or " [OFF] 🔴"
    end

    local divider = "───────────────────"

    local header =
        "🚀 DRABOY MARS SURVIVOR TOOLS\n" ..
        divider .. "\n" ..
        "📅 Date : "..get_date().."\n" ..
        "📊 Active Mods : "..count_active_mods().."\n" ..
        divider

    
    
    local m = gg.choice({

    "🛡 God Mode"..status(STATE.GOD_MODE),
    "🫁 Infinite Oxygen"..status(STATE.INFINITE_OXYGEN),
    "⚔ One Hit"..status(STATE.DAMAGE_MULTI),
    "🪓 3x Damage"..status(STATE.TRIPLE_DAMAGE),
    "❌ No ads"..status(STATE.NO_ADS),
    "🌟 Survivor pass"..status(STATE.CHEAP_PASS),
    "🏆 Elite Survivor pass"..status(STATE.EXPENSIVE_PASS),
    "⏰ Time Boost forever"..status(STATE.TIMER_SPEED),
    "🔥 Scavenger 2x loot"..status(STATE.SCAVENGER_BOOST),
    "❌ Exit"

}, nil, header)

    if m == nil then return end
    
    if m == 1 then toggle_god_mode()

    elseif m == 2 then toggle_infinite_oxygen()
    elseif m == 3 then toggle_damage_multi()
    elseif m == 4 then toggle_triple_damage()
    elseif m == 5 then toggle_no_ads()
    elseif m == 6 then toggle_cheap_pass()
    
    elseif m == 7 then toggle_expensive_pass()
    elseif m == 8 then toggle_timer_speed()
    elseif m == 9 then toggle_scavenger_boost()

    elseif m == 10 then os.exit() end


    return main_menu()
end

----------------------------------------------------
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
        "🎮 Game   : Mars Survivor Tools\n" ..
        "⚙️ Status   : ARM64 / Optimized\n" ..
        "📅 Date     : "..get_date().."\n" ..
        "────────────────────────\n" ..
        "📝 Feature :\n\n" ..
        "🛡 God Mode\n" ..
        "🫁 Infinite Oxygen\n" ..
        "⚔ One Hit\n" ..
        "🪓 3x Damage\n" ..
        "❌ No ads\n" ..
        "🌟 Survivor pass\n" ..
        "🏆 Elite Survivor pass\n" ..
        "⏰ Time Boost forever\n" ..
        "🔥 Scavenger 2x loot\n" ..
        "────────────────────────"

    local sel = gg.alert(msg, "🚀 START SYSTEM", "❌ EXIT")

    if sel ~= 1 then
        gg.toast("👋 Script Closed")
        os.exit()
    end

    ----------------------------------------------------
    -- AUTO SHOW MENU
    ----------------------------------------------------
    main_menu()

    ----------------------------------------------------
    -- LISTENER LOOP
    ----------------------------------------------------
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            main_menu()
        end
        gg.sleep(100)
    end
end

----------------------------------------------------
-- RUN SCRIPT
----------------------------------------------------
initialize()
