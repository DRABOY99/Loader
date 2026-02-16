----------------------------------------
-- 🚀 DRABOY ENGINE TOOLS
----------------------------------------

ON  = true
OFF = false

local CACHE_FILE = "/sdcard/.draboy/kingland_cache.lua"
local GAME_VERSION = gg.getTargetInfo().versionName
local LIB_NAME = "libil2cpp.so"

FEATURES = {}        -- Registered features
FEATURE_STATE = {}   -- Current ON/OFF state
CACHE = {}           -- Cached addresses/values

----------------------------------------------------
-- DATE UTILITY
----------------------------------------------------
local function get_date() return os.date("%d/%m/%Y") end

----------------------------------------
-- ARCH CHECK
----------------------------------------
local ti = gg.getTargetInfo()
if not ti.x64 then
    gg.alert("⚠ ARM64 ONLY")
    os.exit()
end

----------------------------------------
-- BASE ADDRESS
----------------------------------------
local function getBase()
    local r = gg.getRangesList(LIB_NAME)
    if not r or #r==0 then
        gg.alert("⚠ libil2cpp.so not found")
        os.exit()
    end
    for _,v in ipairs(r) do
        if v.state=="Xa" then return v.start end
    end
    return r[1].start
end

----------------------------------------
-- POINTER & STRING CHECK
----------------------------------------
local function ptr(addr)
    return gg.getValues({{address=addr,flags=gg.TYPE_QWORD}})[1].value
end

local function cstr(addr,str)
    local b=gg.bytes(str)
    for i=1,#b do
        if gg.getValues({{address=addr+i-1,flags=gg.TYPE_BYTE}})[1].value ~= b[i] then
            return false
        end
    end
    return true
end

----------------------------------------
-- METHOD FINDER
----------------------------------------
local function findMethod(className,methodName)
    local results={}
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    gg.searchNumber("Q 00 '"..methodName.."' 00",gg.TYPE_BYTE)
    if gg.getResultsCount()==0 then return results end

    local t=gg.getResults(gg.getResultsCount())
    gg.loadResults(t)
    gg.searchPointer(0)
    t=gg.getResults(gg.getResultsCount())

    for _,v in ipairs(t) do
        local classPtr=ptr(ptr(v.address+8)+16)
        if classPtr~=0 and cstr(classPtr,className) then
            local m=ptr(v.address-16)
            if m~=0 then table.insert(results,m) end
        end
    end

    gg.clearResults()
    return results
end

----------------------------------------
-- FEATURE REGISTER FUNCTION
----------------------------------------
local function registerFeature(name,class,method,opcodes,icon,displayName,order)
    FEATURES[name]={
        class=class,
        method=method,
        patch=opcodes,
        icon=icon or "",
        displayName=displayName or name,
        order=order or 999
    }
end

----------------------------------------
-- REGISTER FEATURES
----------------------------------------


registerFeature(
    "IAP_NON_CONSUMABLE",
    "IAPManager",
    "IsNonConsumablePurchased",
    {0x52800020,0xD65F03C0},
    "💎",
    "No ads, Double harvest, Triple boost,Army Fast",
    1
)


registerFeature(
    "IAP_SUBSCRIPTION",
    "IAPManager",
    "IsSubscriptionActive",
    {0x52800020,0xD65F03C0},
    "👑",
    "Unlock Subscription",
    2
)





----------------------------------------
-- HASH FUNCTION
----------------------------------------
local function calcHash(str)
    local hash=0
    for i=1,#str do
        hash=(hash*31+string.byte(str,i))%2147483647
    end
    return hash
end

----------------------------------------
-- CACHE SAVE
----------------------------------------
local function saveCache()
    local base=getBase()
    local out={"GAME_VERSION='"..GAME_VERSION.."'"}
    for feature,data in pairs(CACHE) do
        table.insert(out,feature.."={}")
        for i,v in ipairs(data) do
            local offset=v.address-base
            table.insert(out,string.format("%s[%d]={offset=%d,flags=%d,value=%d}",feature,i,offset,v.flags,v.value))
        end
    end
    local body=table.concat(out,"\n")
    table.insert(out,"CACHE_SIGNATURE="..calcHash(body))
    local f=io.open(CACHE_FILE,"w")
    f:write(table.concat(out,"\n"))
    f:close()
end

----------------------------------------
-- CACHE LOAD
----------------------------------------
local function loadCache()
    local f=io.open(CACHE_FILE,"r")
    if not f then return false end
    local content=f:read("*all")
    f:close()

    local env={}
    setmetatable(env,{__index=_G})
    local chunk=load(content,"cache","t",env)
    if not chunk then return false end
    pcall(chunk)

    -- verify hash
    local bodyLines={}
    for line in content:gmatch("[^\r\n]+") do
        if not line:find("CACHE_SIGNATURE") then table.insert(bodyLines,line) end
    end
    local expected=calcHash(table.concat(bodyLines,"\n"))
    if env.CACHE_SIGNATURE~=expected then
        gg.alert("🚨 CACHE TAMPERED! Rescan needed.")
        return false
    end
    if env.GAME_VERSION~=GAME_VERSION then
        gg.alert("⚠ Version changed → Rescan needed")
        return false
    end

    local base=getBase()
    CACHE={}
    for k,v in pairs(env) do
        if type(v)=="table" then
            CACHE[k]={}
            for i,x in ipairs(v) do
                CACHE[k][i]={address=base+x.offset,flags=x.flags,value=x.value}
            end
        end
    end
    return true
end

----------------------------------------
-- PATCH FUNCTIONS
----------------------------------------
local function applyPatch(feature,newOpcodes)
    if not CACHE[feature] then return false end
    local list={}
    for i,v in ipairs(CACHE[feature]) do
        list[i]={address=v.address,flags=v.flags,value=newOpcodes[i]}
    end
    gg.setValues(list)
    FEATURE_STATE[feature]=ON
end

local function restorePatch(feature)
    if not CACHE[feature] then return end
    gg.setValues(CACHE[feature])
    FEATURE_STATE[feature]=OFF
end

local function buildFeature(feature,className,methodName,patchOpcodes)
    gg.toast("🔍 Scanning "..feature)
    local methods=findMethod(className,methodName)
    if #methods==0 then gg.alert("⚠ Method not found") return end
    CACHE[feature]={}
    for _,addr in ipairs(methods) do
        local orig={}
        for i=0,#patchOpcodes-1 do
            table.insert(orig,{address=addr+(i*4),flags=gg.TYPE_DWORD,value=gg.getValues({{address=addr+(i*4),flags=gg.TYPE_DWORD}})[1].value})
        end
        for _,v in ipairs(orig) do table.insert(CACHE[feature],v) end

        local patch={}
        for i=0,#patchOpcodes-1 do
            table.insert(patch,{address=addr+(i*4),flags=gg.TYPE_DWORD,value=patchOpcodes[i+1]})
        end
        gg.setValues(patch)
    end
    saveCache()
    FEATURE_STATE[feature]=ON
end

local function toggleFeature(name)
    local F=FEATURES[name]
    if FEATURE_STATE[name] then
        restorePatch(name)
        gg.toast(F.icon.." "..F.displayName.." OFF 🔴")
    else
        if CACHE[name] then
            applyPatch(name,F.patch)
            gg.toast(F.icon.." "..F.displayName.." ON ✅")
        else
            buildFeature(name,F.class,F.method,F.patch)
            gg.toast(F.icon.." "..F.displayName.." ON (Scan) ✅")
        end
    end
end

local function toggleAllFeatures(state)
    for name,_ in pairs(FEATURES) do
        if state==ON then
            if CACHE[name] then
                applyPatch(name,FEATURES[name].patch)
            else
                buildFeature(name,FEATURES[name].class,FEATURES[name].method,FEATURES[name].patch)
            end
        else
            restorePatch(name)
        end
        FEATURE_STATE[name]=state
    end
    gg.toast(state==ON and "✅ All Features Enabled" or "🔴 All Features Disabled")
end


----------------------------------------
-- CACHE STATUS
----------------------------------------
local function getCacheStatus()
    local f = io.open(CACHE_FILE,"r")
    if not f then
        return "NEED SCAN"
    end
    local content = f:read("*all")
    f:close()

    local env = {}
    setmetatable(env,{__index=_G})
    local chunk = load(content,"cache","t",env)
    if not chunk then
        return "CORRUPT"
    end
    pcall(chunk)

    -- cek signature
    local bodyLines={}
    for line in content:gmatch("[^\r\n]+") do
        if not line:find("CACHE_SIGNATURE") then table.insert(bodyLines,line) end
    end
    local expected = calcHash(table.concat(bodyLines,"\n"))

    if env.CACHE_SIGNATURE ~= expected then
        return "CORRUPT"
    elseif env.GAME_VERSION ~= GAME_VERSION then
        return "NEED SCAN"
    else
        return "READY"
    end
end


----------------------------------------
-- DYNAMIC MENU
----------------------------------------
local function mainMenu()
    local function status(v) return v and " [ON] ✅" or " [OFF] 🔴" end


    local keys={}
    for k,_ in pairs(FEATURES) do table.insert(keys,k) end
    
    table.sort(keys,function(a,b)
        return FEATURES[a].order < FEATURES[b].order
    end)

    local choices={"🟢 ENABLE ALL FEATURES","🔴 DISABLE ALL FEATURES"}
    for _,k in ipairs(keys) do
        local f=FEATURES[k]
        table.insert(choices,f.icon.." "..f.displayName..status(FEATURE_STATE[k]))
    end
    table.insert(choices,"❌ EXIT")

    local activeCount=0
    for _,k in ipairs(keys) do if FEATURE_STATE[k] then activeCount=activeCount+1 end end

    
    
    local cacheStatus = getCacheStatus()

    local header=table.concat({
        "🚀 DRABOY KINGLAND TOOLS",
        "────────────────────",
        "📅 "..get_date(),
        "🎮 Version: "..GAME_VERSION,
        "🗄 Cache Status: "..cacheStatus,    -- <<< baru
        "📊 Active Mods: "..activeCount,
        "────────────────────"
    },"\n")

    local m=gg.choice(choices,nil,header)
    if not m then return end
    if m==1 then toggleAllFeatures(ON)
    elseif m==2 then toggleAllFeatures(OFF)
    elseif m>=3 and m<=#keys+2 then toggleFeature(keys[m-2])
    else os.exit() end
end

----------------------------------------
-- INITIALIZE
----------------------------------------


local function initialize()
gg.clearResults()
gg.setVisible(false)
gg.toast("🚀 Loading Draboy Engine")
if loadCache() then gg.toast("💾 Cache Loaded") else gg.toast("⚠ First Scan Required") end
mainMenu()
while true do
if gg.isVisible(true) then gg.setVisible(false) mainMenu() end
gg.sleep(100)
end
end

----------------------------------------
-- RUN
----------------------------------------
initialize()