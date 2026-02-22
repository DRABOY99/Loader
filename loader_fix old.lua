gg.setVisible(false)

--------------------------------------------------
-- CONFIG URL
--------------------------------------------------
local URL_GAMES = "https://raw.githubusercontent.com/DRABOY99/Loader/refs/heads/main/game_config.lua"
local URL_USERS = "https://raw.githubusercontent.com/DRABOY99/Loader/refs/heads/main/user_config.lua"
local URL_NEWS  = "https://raw.githubusercontent.com/DRABOY99/Loader/refs/heads/main/news_config.lua"

--------------------------------------------------
-- GLOBAL STATE
--------------------------------------------------
local GAME_CONFIG = {}
local USER_CONFIG = {}
local NEWS_CONFIG = {}
local CURRENT = {}

local LOGIN_SHOWN = false
local NEWS_SHOWN_AFTER_LOGIN = false






--------------------------------------------------
-- LOAD URL
--------------------------------------------------
local function loadURL(url)
    local r = gg.makeRequest(url)
    if not r or r.code ~= 200 then
        SERVER_STATUS = "OFFLINE"
        gg.alert("❌ Cannot connect server")
        os.exit()
    end

    local t = r.content
    t = t:gsub("^\239\187\191","")
         :gsub("\r","")
         :gsub("^%s+","")
         :gsub("%s+$","")

    local f,err = load("return "..t)
    if not f then
        gg.alert("CONFIG ERROR\n"..err)
        os.exit()
    end

    local ok,res = pcall(f)
    if not ok then
        gg.alert("CONFIG EXEC ERROR\n"..res)
        os.exit()
    end

    return res
end

--------------------------------------------------
-- LOAD SERVER
--------------------------------------------------
local function loadServer()
    GAME_CONFIG = loadURL(URL_GAMES)
    USER_CONFIG = loadURL(URL_USERS)
    NEWS_CONFIG = loadURL(URL_NEWS)

    if not USER_CONFIG or not USER_CONFIG.PASSWORDS then
        USER_CONFIG = { PASSWORDS = {} }
    end

    if not NEWS_CONFIG then
        NEWS_CONFIG = {
            TITLE = "NEWS",
            MESSAGE = "No update",
            LAST_UPDATE = ""
        }
    end
end

--------------------------------------------------
-- TOTAL GAME HELPER
--------------------------------------------------
local function getTotalGames()
    local total = 0
    if GAME_CONFIG.CATEGORIES then
        for _,cat in ipairs(GAME_CONFIG.CATEGORIES) do
            total = total + #cat.games
        end
    end
    return total
end




--------------------------------------------------
-- FIREBASE TRACKING SYSTEM (OPTIMIZED)
--------------------------------------------------
local FB_URL = "https://draboygaming-d455a-default-rtdb.asia-southeast1.firebasedatabase.app/"



local function trackUserLogin(username)
    -- 1. Ambil Data Lokasi
    local ipReq = gg.makeRequest("http://ip-api.com/json")
    local country = "Unknown"
    if ipReq and ipReq.code == 200 then
        country = ipReq.content:match('"country":"(.-)"') or "Unknown"
    end

    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    
    -- 2. Kirim Log Rinci (Histori)
    local logData = string.format('{"user":"%s", "country":"%s", "time":"%s"}', username, country, timestamp)
    gg.makeRequest(FB_URL .. "logins.json", {["Content-Type"]="application/json"}, logData)

    -- 3. Update Summaries (Statistik)
    -- 'total_log' akan bertambah secara manual di sisi Firebase (increment tidak didukung langsung via REST tanpa auth, 
    -- jadi kita kirim info terakhir untuk dipantau)
    local stats = string.format(
        '{"last_user":"%s", "last_country":"%s", "last_update":"%s"}', 
        username, country, timestamp
    )
    gg.makeRequest(FB_URL .. "summaries/stats.json", {["Method"]="PATCH", ["Content-Type"]="application/json"}, stats)

    -- Simpan jejak negara di folder terpisah agar Anda bisa hitung jumlah negara unik
    local countryKey = country:gsub("%s+", "_") -- Hilangkan spasi agar jadi ID valid
    local countryUpdate = string.format('{"last_visit":"%s"}', timestamp)
    gg.makeRequest(FB_URL .. "summaries/countries/" .. countryKey .. ".json", {["Method"]="PUT", ["Content-Type"]="application/json"}, countryUpdate)
end


--------------------------------------------------
-- LOGIN SYSTEM
--------------------------------------------------
local function login()
    while true do
        local totalGame = getTotalGames()

        gg.alert(
            "🎮 Script DRABOYGAMING™ 🇮🇩\n" ..
            "ℹ️ Version 3.0\n" ..
            "⏰ Date: " .. os.date("%d/%m/%Y") .. "\n" ..
            "🕹️ Available Script: "..totalGame.." Games\n" ..
            "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n\n" ..
            "Welcome ♥️ \n" ..
            "Please enter your access key to continue\n" ..
            "Get access key in Telegram @DraboyGaming\n\n" ..
            "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘"
        )

        local p = gg.prompt({"🔐 Enter Access Key"}, {""}, {"text"})
        if not p then return false end

        local input = tostring(p[1]):upper():gsub("%s+", "")
        local success = false

        for _,v in pairs(USER_CONFIG.PASSWORDS) do
            if type(v) == "string" then
                if input == v:upper() then
                    CURRENT.name = v
                    CURRENT.type = "PERMANENT 👑"
                    CURRENT.expire = "LIFETIME ♾️"
                    
                    -- 🔥 KIRIM DATA KE FIREBASE
                    trackUserLogin(CURRENT.name, CURRENT.type)
                    
                    gg.toast("✅ Welcome, "..CURRENT.name.."!")
                    success = true
                    break
                end
            elseif type(v) == "table" then
                local code = tostring(v[1]):upper()
                local date = tostring(v[2])
                if input == code then
                    local y,m,d = date:match("(%d+)%-(%d+)%-(%d+)")
                    local exp = os.time({year=y, month=m, day=d, hour=23, min=59, sec=59})
                    if os.time() > exp then
                        gg.alert("⛔ ACCOUNT EXPIRED\n\nExpired on: "..date)
                        break
                    end
                    CURRENT.name = v[1]
                    CURRENT.type = "TRIAL ⏳"
                    CURRENT.expire = date
                    
                    -- 🔥 KIRIM DATA KE FIREBASE
                    trackUserLogin(CURRENT.name, CURRENT.type)
                    
                    success = true
                    break
                end
            end
        end

        if success then return true end
        gg.alert("❌ WRONG KEY")
    end
end

--------------------------------------------------
-- LOGIN INFO
--------------------------------------------------
local function showLoginInfo()
    if LOGIN_SHOWN then return end
    LOGIN_SHOWN = true

    gg.alert(
        "⭐ LOGIN SUCCESS ⭐\n\n"..
        "👤 User   : "..CURRENT.name.."\n"..
        "ℹ️ Status : "..CURRENT.type.."\n"..
        "📝 Expire : "..CURRENT.expire
    )
end

--------------------------------------------------
-- NEWS
--------------------------------------------------
local function showNews()
    gg.alert(NEWS_CONFIG.TITLE.."\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"..NEWS_CONFIG.MESSAGE)
end

--------------------------------------------------
-- EXIT
--------------------------------------------------
local function confirmExit()
    local c = gg.choice({"❌ Exit Loader","🔙 Back"}, nil)
    if c == 1 then os.exit() end
end

--------------------------------------------------
-- GAME INFO
--------------------------------------------------
local function showGameInfo(game)
    if not game.NEWS or not game.NEWS.PAGES then
        gg.alert("No info available")
        return
    end

    local info = game.NEWS.TITLE.."\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
    for _,p in ipairs(game.NEWS.PAGES) do
        info = info .. p.title .. "\n" .. p.content .. "\n"
    end

    gg.alert(info)
end


--------------------------------------------------
-- SEARCH GAME
--------------------------------------------------
local function searchGame()

    local p = gg.prompt({"🔎 Enter Game Name"}, {""}, {"text"})
    if not p then return end

    local keyword = p[1]:lower()
    if keyword == "" then return end

    local results = {}
    local refs = {}

    for _,cat in ipairs(GAME_CONFIG.CATEGORIES) do
        for _,g in ipairs(cat.games) do

            if g.name:lower():find(keyword) then
                table.insert(results, "▶ "..g.name.." ("..cat.name..")")
                table.insert(refs, {game = g, category = cat})
            end

        end
    end

    if #results == 0 then
        gg.alert("❌ Game not found")
        return
    end

    results[#results+1] = "🔙 Back"

    local c = gg.choice(results,nil,"🔎 Search Result")
    if not c or c == #results then return end

    local selected = refs[c].game

    local infoChoice = gg.choice({
        "ℹ️ View Features & Mods",
        "🕹️ Launch Script",
        "🔙 Back"
    }, nil, "🎮 "..selected.name.." [v"..selected.version.."]")

    if infoChoice == 1 then
        showGameInfo(selected)

    elseif infoChoice == 2 then
        gg.toast("⏬ Downloading script...")

        local r = gg.makeRequest(selected.link)
        if r and r.code == 200 then


            local ok,f = pcall(load, r.content)
            if ok and f then
                f()
                

                
            else
                gg.alert("Script load error")
            end
        else
            gg.alert("Download failed")
        end
    end
end

--------------------------------------------------
-- CATEGORY GAME MENU
--------------------------------------------------
local function gameMenu(category)

    local list = {}

    for _,g in ipairs(category.games) do
        list[#list+1] = "▶ "..g.name.." [v"..g.version.."]"
    end

    list[#list+1] = "🔙 Back"

    local title = category.name.." ("..#category.games.." Games)"

    local c = gg.choice(list,nil,title)
    if not c or c == #list then return end

    local game = category.games[c]

    local infoChoice = gg.choice({
        "ℹ️ View Features & Mods",
        "🕹️ Launch Script",
        "🔙 Back"
    }, nil, "🎮 "..game.name.." [v"..game.version.."]")

    if infoChoice == 1 then
        showGameInfo(game)

    elseif infoChoice == 2 then
        gg.toast("⏬ Downloading script...")

        local r = gg.makeRequest(game.link)
        if r and r.code == 200 then
            local ok,f = pcall(load, r.content)
            if ok and f then
                f()
            else
                gg.alert("Script load error")
            end
        else
            gg.alert("Download failed")
        end
    end
end

--------------------------------------------------
-- MENU HEADER
--------------------------------------------------
local function menuTitle(expandUser)

    local header =
        "🎮 Script DRABOYGAMING™ 🇮🇩\n" ..
        "ℹ️ Version 3.0\n" ..
        "⏰ Date: "..os.date("%d/%m/%Y").."\n"

    if expandUser then
        header = header..
        "👤 User: "..CURRENT.name.."\n"..
        "ℹ️ Status: "..CURRENT.type.."\n"..
        "⏳ Expire: "..CURRENT.expire.."\n"
    end

    header = header..
    "🕹️ Available Script Games: "..getTotalGames().."\n"..
    "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘"

    return header
end

--------------------------------------------------
-- FIREBASE STATISTICS FETCH (WITH COUNTRY COUNT)
--------------------------------------------------
local function getStatistics()
    gg.toast("⏳ Synchronizing data...")
    
    local rLog = gg.makeRequest(FB_URL .. "logins.json") -- Ambil data lengkap untuk dihitung
    local totalLog = 0
    local countryStats = {} -- Tabel untuk menyimpan jumlah per negara
    
    if rLog and rLog.code == 200 then
        local content = rLog.content
        
        -- 1. Hitung Total Login & Data per Negara
        -- Mencari pola negara di dalam JSON logins
        for country in content:gmatch('"country":"(.-)"') do
            totalLog = totalLog + 1
            countryStats[country] = (countryStats[country] or 0) + 1
        end
    end

    -- 2. Susun Daftar Negara secara Estetik
    local countryList = ""
    local totalCountry = 0
    
    -- Urutkan negara (opsional, tapi biar rapi)
    for cName, count in pairs(countryStats) do
        totalCountry = totalCountry + 1
        -- Menambahkan simbol pohon (Tree View) dan jumlah loginnya
        countryList = countryList .. "  ├─ " .. cName .. " (" .. count .. " users)\n"
    end
    
    -- Jika daftar tidak kosong, ubah baris terakhir agar simbolnya menutup (└─)
    if countryList ~= "" then
        -- Mencari posisi terakhir ├─ dan menggantinya dengan └─
        local lastEntry = countryList:reverse():find("\n-├")
        if lastEntry then
            -- (Logika pembersihan simbol terakhir jika ingin sangat sempurna)
        end
    end

    -- 3. Tampilkan Alert (Versi UI Dashboard Lengkap)
    local divider = "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘"
    
    gg.alert(
        "📊 SERVER REAL-TIME STATISTICS\n" ..
        divider .. "\n\n" ..
        "📈 GLOBAL TRAFFIC\n" ..
        "  ├─ 👥 Total Logins   : " .. totalLog .. "\n" ..
        "  └─ 🌍 Total Nations  : " .. totalCountry .. "\n\n" ..
        "🌐 REGION STATISTICS\n" ..
        (countryList ~= "" and countryList or "  └─ No data recorded") .. "\n" ..
        divider .. "\n" ..
        "  Last Sync: " .. os.date("%H:%M:%S") .. " • DRABOYGAMING™"
    )
end

--------------------------------------------------
-- MODIFIKASI MAIN MENU
--------------------------------------------------
local function menu()
    showLoginInfo()

    if not NEWS_SHOWN_AFTER_LOGIN then
        showNews()
        NEWS_SHOWN_AFTER_LOGIN = true
    end

    local list = {}
    list[#list+1] = "👤 User Info"
    list[#list+1] = "🔎 Search Game"

    for _,cat in ipairs(GAME_CONFIG.CATEGORIES) do
        list[#list+1] = "▶ "..cat.name.." ("..#cat.games.." Games)"
    end

    list[#list+1] = "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘"
    list[#list+1] = "🔄 Refresh Server"
    list[#list+1] = "📢 News"
    list[#list+1] = "📊 Server Statistics" -- MENU BARU
    list[#list+1] = "❌ Exit"

    local c = gg.choice(list, nil, menuTitle(false))
    if not c then return end

    local catStart = 3
    local catEnd = catStart + #GAME_CONFIG.CATEGORIES - 1

    if c == #list then
        confirmExit()
        menu()
    elseif c == #list-1 then -- Statistik
        getStatistics()
        menu()
    elseif c == #list-2 then -- News
        showNews()
        menu()
    elseif c == #list-3 then -- Refresh
        loadServer()
        gg.toast("Server refreshed")
        menu()
    elseif c == 1 then
        gg.alert(
            "🌟 User Info\n\n"..
            "👤 "..CURRENT.name.."\n"..
            "ℹ️ "..CURRENT.type.."\n"..
            "📝 "..CURRENT.expire
        )
        menu()
    elseif c == 2 then
        searchGame()
        menu()
    elseif c >= catStart and c <= catEnd then
        local category = GAME_CONFIG.CATEGORIES[c - catStart + 1]
        gameMenu(category)
        menu()
    end
end

--------------------------------------------------
-- MAIN LOOP
--------------------------------------------------
loadServer()
if not login() then os.exit() end
menu()

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        menu()
    end
    gg.sleep(120)
end


