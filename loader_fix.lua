gg.setVisible(false)

--------------------------------------------------
-- CONFIG URL
--------------------------------------------------
local FB_URL = "https://draboyuser-92efb-default-rtdb.asia-southeast1.firebasedatabase.app/"
local URL_GAMES = "https://raw.githubusercontent.com/DRABOY99/Loader/refs/heads/main/game_config.lua"
local URL_NEWS = "https://raw.githubusercontent.com/DRABOY99/Loader/refs/heads/main/news_config.lua"


--------------------------------------------------
-- GLOBAL STATE
--------------------------------------------------
local GAME_CONFIG = {}
local USER_CONFIG = { PASSWORDS = {} }
local NEWS_CONFIG = {}
local CURRENT = {}
local REGISTER_STATUS = "ON"  -- Default ON
local menuActive = false  -- Flag to prevent multiple menu calls
local CACHE_FILE = "/storage/emulated/0/DRABOYGAMING_cache.txt"  -- File cache

--------------------------------------------------
-- JSON DECODER
--------------------------------------------------
local function decodeFirebase(js)
    local res = {}
    if not js or js == "null" then return res end
    
    js = js:gsub("%s+", "")
    
    -- Format {"user":"value"}
    for k, v in js:gmatch('"([^"]+)":"([^"]+)"') do
        res[k] = v
    end
    
    -- Format {"user":["value1","value2"]}
    for k, v in js:gmatch('"([^"]+)":%[(.-)%]') do
        local arr = {}
        for item in v:gmatch('"([^"]+)"') do
            table.insert(arr, item)
        end
        res[k] = arr
    end
    
    return res
end

--------------------------------------------------
-- LOAD SERVER
--------------------------------------------------
local function loadURL(url)
    local r = gg.makeRequest(url)
    if not r or r.code ~= 200 then return nil end
    local t = r.content:gsub("^\239\187\191",""):gsub("\r",""):gsub("^%s+",""):gsub("%s+$","")
    local f = load("return "..t)
    if f then return f() end
    return nil
end

local function loadServer()
    GAME_CONFIG = loadURL(URL_GAMES) or {CATEGORIES={}}
    NEWS_CONFIG = loadURL(URL_NEWS) or {TITLE="NEWS", MESSAGE="No update"}

    -- Load users
    local rU = gg.makeRequest(FB_URL .. "users.json")
    if rU and rU.code == 200 then
        USER_CONFIG.PASSWORDS = decodeFirebase(rU.content)
    else
        gg.alert("❌ Failed Connect to server!")
        os.exit()
    end
    
    -- Load status registrasi
    local rReg = gg.makeRequest(FB_URL .. "Config/Registrasi.json")
    if rReg and rReg.code == 200 and rReg.content ~= "null" then
        REGISTER_STATUS = rReg.content:gsub('"', '')  -- Hilangkan tanda kutip
    else
        REGISTER_STATUS = "ON"  -- Default jika tidak ada konfigurasi
    end
end

--------------------------------------------------
-- GET IP AND COUNTRY INFO
--------------------------------------------------
local function getIPInfo()
    local info = { ip = "Unknown", country = "Unknown" }
    local api = "http://ip-api.com/json/?fields=status,country,query"
    
    local r = gg.makeRequest(api)
    if r and r.code == 200 then
        local ip = r.content:match('"query":"(.-)"')
        local country = r.content:match('"country":"(.-)"')
        if ip then info.ip = ip end
        if country then info.country = country end
    end
    return info
end

--------------------------------------------------
-- TRACK USER LOGIN
--------------------------------------------------
local function trackUserLogin(username)
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local ipInfo = getIPInfo()
    
    local logData = string.format(
        '{"user":"%s", "time":"%s", "ip":"%s", "negara":"%s"}',
        username, timestamp, ipInfo.ip, ipInfo.country
    )
    
    gg.makeRequest(FB_URL .. "logins.json", {
        ["Content-Type"] = "application/json"
    }, logData)
    
    gg.toast("📍 Login dari: "..ipInfo.country)
end


--------------------------------------------------
-- CACHE LOGIN SYSTEM
--------------------------------------------------
local function saveLoginCache(username, password, expire, userType)
    local cacheData = string.format(
        "username=%s\npassword=%s\nexpire=%s\ntype=%s\ntimestamp=%s",
        username,
        password,
        expire,
        userType,
        os.time()
    )
    
    -- Simpan ke file
    local file = io.open(CACHE_FILE, "w")
    if file then
        file:write(cacheData)
        file:close()
        gg.toast("💾 Login cache saved")
    end
end

local function loadLoginCache()
    local file = io.open(CACHE_FILE, "r")
    if not file then return nil end
    
    local cache = {}
    for line in file:lines() do
        local key, value = line:match("([^=]+)=(.+)")
        if key and value then
            cache[key] = value
        end
    end
    file:close()
    
    -- Validasi cache (max 7 hari)
    if cache.timestamp and (os.time() - tonumber(cache.timestamp)) < 604800 then  -- 7 hari
        return cache
    end
    
    return nil  -- Cache expired
end

local function clearLoginCache()
    os.remove(CACHE_FILE)
    gg.toast("🗑️ Cache cleared")
end



--------------------------------------------------
-- GET STATISTICS (HITUNG USER AKTIF PER NEGARA)
--------------------------------------------------
local function getStatistics()
    -- Ambil status registrasi terbaru dari Firebase
    local rReg = gg.makeRequest(FB_URL .. "Config/Registrasi.json")
    local currentRegStatus = "ON"
    if rReg and rReg.code == 200 and rReg.content ~= "null" then
        currentRegStatus = rReg.content:gsub('"', '')
    end
    
    -- Ambil data logins
    local rLog = gg.makeRequest(FB_URL .. "logins.json")
    local total = 0
    local countries = {}          -- Untuk hitung user unik per negara
    local activeUsers = {}         -- Untuk total user aktif
    
    if rLog and rLog.code == 200 and rLog.content ~= "null" then
        -- Struktur untuk menyimpan user per negara
        local usersByCountry = {}
        
        for loginId, data in rLog.content:gmatch('"(.-)":{(.-)}') do
            total = total + 1
            
            local negara = data:match('"negara":"(.-)"') or "Unknown"
            local user = data:match('"user":"(.-)"') or "Unknown"
            
            -- Simpan user unik per negara
            if not usersByCountry[negara] then
                usersByCountry[negara] = {}
            end
            usersByCountry[negara][user] = true
            
            -- Untuk total user aktif (global)
            activeUsers[user] = true
        end
        
        -- Hitung jumlah user unik per negara
        for negara, users in pairs(usersByCountry) do
            local userCount = 0
            for _ in pairs(users) do
                userCount = userCount + 1
            end
            countries[negara] = userCount
        end
    end
    
    -- Buat daftar negara dengan jumlah USER AKTIF (bukan login)
    local countryList = ""
    local sortedCountries = {}
    for c, count in pairs(countries) do
        table.insert(sortedCountries, {name=c, count=count})
    end
    table.sort(sortedCountries, function(a,b) return a.count > b.count end)
    
    -- Tampilkan semua negara
    if #sortedCountries > 0 then
        for i, data in ipairs(sortedCountries) do
            countryList = countryList .. "   " .. i .. ". " .. data.name .. ": " .. data.count .. " user\n"
        end
    else
        countryList = "   Belum ada data negara\n"
    end
    
    -- Hitung total user aktif global
    local totalActiveUsers = 0
    for _ in pairs(activeUsers) do
        totalActiveUsers = totalActiveUsers + 1
    end
    
    local stats = "📊 SERVER STATISTICS\n"
    stats = stats.."⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
    stats = stats.."👥 Total Logins: "..total.."\n"
    stats = stats.."👤 Total User Aktif: "..totalActiveUsers.."\n"
    stats = stats.."⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
    stats = stats.."📌 USER AKTIF PER NEGARA:\n\n"..countryList
    stats = stats.."⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
    stats = stats.."🔰 Status Registration: "..(currentRegStatus == "ON" and "✅ Open" or "❌ Close").."\n"
    stats = stats.."🕐 Update: "..os.date("%H:%M:%S")
    
    gg.alert(stats)
end

--------------------------------------------------
-- GAME MENU
--------------------------------------------------
local function showGameNews(game)
    if not game.NEWS then
        gg.alert("ℹ️ Tidak ada informasi untuk game ini")
        return true  -- Return true to indicate we should go back
    end
    
    while true do
        local pages = game.NEWS.PAGES or {}
        local options = {}
        
        for i, page in ipairs(pages) do
            table.insert(options, page.title or "Halaman "..i)
        end
        table.insert(options, "🔙 Kembali")
        
        local choice = gg.choice(options, nil, game.NEWS.TITLE or game.name)
        
        if not choice or choice == #options then
            return true  -- Return true to go back to game menu
        end
        
        if choice <= #pages then
            gg.alert(pages[choice].content or "Konten tidak tersedia")
            -- After alert, loop continues to show news menu again
        end
    end
end

local function gameMenu(category)
    while true do
        local list = {}
        for _, g in ipairs(category.games or {}) do
            table.insert(list, "▶ "..g.name)
        end
        table.insert(list, "🔙 Back")
        
        local c = gg.choice(list, nil, "📁 "..category.name)
        
        if not c or c == #list then
            return  -- Return to main menu
        end
        
        local g = category.games[c]
        
        while true do
            local opt = gg.choice({
                "🕹️ Run Script",
                "ℹ️ Info Game",
                "📢 Feature Script",
                "🔙 Back"
            }, nil, g.name.." v"..g.version)
            
            if not opt or opt == 4 then
                break  -- Back to game list
            end
            if opt == 1 then
                if not g.link or g.link == "" then
                    gg.alert("❌ Link script tidak tersedia!")
                    return
                end
                gg.toast("⏬ Mendownload script...")
  
                local r = gg.makeRequest(g.link)
                if r and r.code == 200 then
                    local success, err = pcall(load(r.content))
                    if success then
                        success()
                        -- After script runs, wait a bit before showing menu again
                        gg.sleep(500)
                    end
                else
                    gg.alert("❌ Gagal mendownload script!")
                end
                
            elseif opt == 2 then
                gg.alert("📌 Information GAME\n" ..
                    "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n" ..
                    "🎮 Nama: " .. g.name .. "\n" ..
                    "📦 Versi: " .. g.version .. "\n" ..
                    "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n" ..
                    "✅ Press OK for back to menu")
                    
            elseif opt == 3 then
                if showGameNews(g) then
                    -- If showGameNews returns true, continue to next iteration of game options loop
                end
            end
        end
    end
end

--------------------------------------------------
-- MAIN MENU
--------------------------------------------------
local function showNews()
    gg.alert(NEWS_CONFIG.TITLE.."\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"..NEWS_CONFIG.MESSAGE)
end

local function getTotalGames()
    local total = 0
    for _, cat in ipairs(GAME_CONFIG.CATEGORIES or {}) do
        total = total + #(cat.games or {})
    end
    return total
end

--------------------------------------------------
-- SEARCH GAME FEATURE
--------------------------------------------------
local function searchGame()
    local p = gg.prompt({
        "🔍 Masukkan nama game (min 3 huruf)"
    }, {""}, {"text"})
    
    if not p then return end
    
    local keyword = tostring(p[1]):gsub("%s+", ""):lower()
    
    if keyword == "" or string.len(keyword) < 3 then
        gg.alert("❌ Masukkan minimal 3 huruf untuk mencari!")
        return
    end
    
    gg.toast("⏳ Mencari: '"..keyword.."'...")
    
    -- Kumpulkan semua game yang cocok
    local results = {}
    local resultCategories = {}  -- Untuk menyimpan kategori asli
    
    for _, cat in ipairs(GAME_CONFIG.CATEGORIES or {}) do
        for _, g in ipairs(cat.games or {}) do
            local gameName = g.name:lower()
            if gameName:find(keyword, 1, true) then
                table.insert(results, {
                    name = g.name,
                    version = g.version,
                    link = g.link,
                    category = cat.name,
                    news = g.NEWS
                })
            end
        end
    end
    
    -- Urutkan hasil berdasarkan abjad
    table.sort(results, function(a, b) return a.name < b.name end)
    
    -- Tampilkan hasil
    if #results == 0 then
        gg.alert("🔍 HASIL PENCARIAN\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nTidak ditemukan game dengan kata kunci:\n'"..keyword.."'\n\n💡 Coba kata kunci lain")
        return
    end
    
    -- Buat list hasil pencarian
    local options = {}
    for i, game in ipairs(results) do
        table.insert(options, "📌 "..game.name)
    end
    table.insert(options, "🔙 Kembali ke Menu Utama")
    
    local choice = gg.choice(options, nil, 
        "🔍 HASIL PENCARIAN\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n" ..
        "Kata kunci: "..keyword.."\n" ..
        "Ditemukan: "..#results.." game\n" ..
        "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘")
    
    if not choice or choice == #options then
        return
    end
    
    -- Tampilkan detail game yang dipilih
    local g = results[choice]
    
    while true do
        local opt = gg.choice({
            "🕹️ Run Script",
            "ℹ️ Info Game",
            "📢 Feature Script",
            "🔙 Kembali ke Hasil"
        }, nil, g.name.." v"..g.version.."\n📁 "..g.category)
        
        if not opt or opt == 4 then
            break  -- Kembali ke hasil pencarian
        end
        
        if opt == 1 then
            if not g.link or g.link == "" then
                gg.alert("❌ Link script tidak tersedia!")
                break
            end
            
            gg.toast("⏬ Mendownload script...")
            local r = gg.makeRequest(g.link)
            
            if r and r.code == 200 then
                local success, err = pcall(load(r.content))
                if success then
                    success()
                    gg.sleep(500)
                else
                 --   gg.alert("❌ Error saat menjalankan script:\n"..tostring(err))
                end
            else
                gg.alert("❌ Gagal mendownload script!")
            end
            
        elseif opt == 2 then
            gg.alert("📌 INFORMATION GAME\n" ..
                "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n" ..
                "🎮 Nama: " .. g.name .. "\n" ..
                "📦 Versi: " .. g.version .. "\n" ..
                "📁 Kategori: " .. g.category .. "\n" ..
                "⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n" ..
                "✅ Tekan OK untuk kembali")
            
        elseif opt == 3 then
            if g.news then
                local pages = g.news.PAGES or {}
                local newsOptions = {}
                
                for i, page in ipairs(pages) do
                    table.insert(newsOptions, page.title or "Halaman "..i)
                end
                table.insert(newsOptions, "🔙 Kembali")
                
                local newsChoice = gg.choice(newsOptions, nil, g.news.TITLE or "Fitur Game")
                
                if newsChoice and newsChoice <= #pages then
                    gg.alert(pages[newsChoice].content or "Konten tidak tersedia")
                end
            else
                gg.alert("ℹ️ Tidak ada informasi fitur untuk game ini")
            end
        end
    end
    
    -- Setelah selesai dengan game, kembali ke hasil pencarian (rekursif)
    searchGame()  -- Tampilkan hasil pencarian lagi
end

local function menu()
    if menuActive then return end  -- Prevent multiple menu calls
    menuActive = true
    
    while true do
        
        
        local mainList = {"👤 Profil Saya", "🔍 Cari Game", "🗑️ Clear Cache"}  -- Tambah ini
        
        for _, cat in ipairs(GAME_CONFIG.CATEGORIES or {}) do
            table.insert(mainList, cat.name.." ["..#(cat.games or {}).."]")
        end
        
        table.insert(mainList, "📊 Statistik")
        table.insert(mainList, "📢 Pengumuman")
        table.insert(mainList, "🔄 Refresh")
        table.insert(mainList, "❌ Keluar")
        
        local title = "🎮 DRABOYGAMING™ 🇮🇩\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
        title = title.."👤 "..CURRENT.name.." ["..CURRENT.type.."]\n"
        title = title.."📅 "..CURRENT.expire.."\n"
        title = title.."🎯 Total Script: "..getTotalGames()
        
        local c = gg.choice(mainList, nil, title)
        
        if not c then
            -- User pressed back/cancel, keep menu showing
            goto continue
        end
        
        if mainList[c] == "❌ Keluar" then
            menuActive = false
            os.exit()
            
        elseif mainList[c] == "🔄 Refresh" then
            loadServer()
            gg.toast("🔄 Data diperbarui!")
            
        elseif mainList[c] == "📢 Pengumuman" then
            showNews()
            
        elseif mainList[c] == "📊 Statistik" then
            getStatistics()
            
        
        elseif mainList[c] == "👤 Profil Saya" then
            gg.alert("👤 PROFIL\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nUsername: "..CURRENT.name.."\nTipe: "..CURRENT.type.."\nExpire: "..CURRENT.expire)
            
        elseif mainList[c] == "🔍 Cari Game" then
            searchGame()
            
        elseif mainList[c] == "🗑️ Clear Cache" then  -- TAMBAHKAN INI
            local confirm = gg.choice({
                "✅ Ya, Hapus",
                "❌ Batal"
            }, nil, "🗑️ HAPUS CACHE?\nCache login akan dihapus.\nNext time harus login manual.")
            
            if confirm == 1 then
                clearLoginCache()
            end
            
        else
            for i, cat in ipairs(GAME_CONFIG.CATEGORIES or {}) do
                if mainList[c] == cat.name.." ["..#(cat.games or {}).."]" then
                    gameMenu(cat)
                    break
                end
            end
        end
        
        ::continue::
    end
    
    menuActive = false
end

--------------------------------------------------
-- REGISTER (TANPA REFERRAL CODE)
--------------------------------------------------
local function register()
    -- Cek status registrasi
    if REGISTER_STATUS ~= "ON" then
        gg.alert("❌ REGISTRASI DITUTUP\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nMaaf, pendaftaran akun baru sedang ditutup.\nSilakan coba lagi nanti.")
        return false
    end
    
    local p = gg.prompt({
        "👤 Username Baru",
        "🔐 Password",
        "🔐 Konfirmasi Password"
    }, {"", "", ""}, {"text", "text", "text"})
    
    if not p then return false end
    
    local user = tostring(p[1]):gsub("%s+", "")
    local pass = tostring(p[2]):gsub("%s+", "")
    local confirm = tostring(p[3]):gsub("%s+", "")
    
    -- Validasi input
    if user == "" or pass == "" or confirm == "" then
        gg.alert("❌ Semua field harus diisi!")
        return false
    end
    
    if string.len(user) < 3 then
        gg.alert("❌ Username minimal 3 karakter!")
        return false
    end
    
    if string.len(pass) < 3 then
        gg.alert("❌ Password minimal 3 karakter!")
        return false
    end
    
    if pass ~= confirm then
        gg.alert("❌ Password dan konfirmasi tidak cocok!")
        return false
    end
    
    -- Cek username sudah terdaftar
    gg.toast("⏳ Memeriksa ketersediaan username...")
    
    local userUrl = FB_URL .. "users/" .. user .. ".json"
    local checkUser = gg.makeRequest(userUrl)
    
    if checkUser and checkUser.code == 200 and checkUser.content ~= "null" and checkUser.content ~= "" then
        gg.alert("❌ Username '"..user.."' sudah digunakan!\nSilakan pilih username lain.")
        return false
    end
    
    -- Konfirmasi
    local confirmReg = gg.choice({
        "✅ Gas, Create",
        "❌ Batal"
    }, nil, "🔍 KONFIRMASI REGISTRASI\nUsername: "..user.."\nPassword: "..pass)
    
    if not confirmReg or confirmReg == 2 then
        gg.alert("❌ Pendaftaran dibatalkan.")
        return false
    end
    
    -- Buat user trial 30 hari
    local exp = os.date("%Y-%m-%d", os.time() + (86400 * 30))
    local data = string.format('["%s", "%s"]', pass, exp)
    
    gg.toast("⏳ Mendaftarkan akun...")
    
    local saveUrl = FB_URL .. "users/" .. user .. ".json"
    local saveResult = gg.makeRequest(saveUrl, {
        ["Content-Type"] = "application/json",
        ["X-HTTP-Method-Override"] = "PUT"
    }, data)
    
    if saveResult and saveResult.code == 200 then
        gg.alert("✅ REGISTRASI BERHASIL!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nUsername: "..user.."\nPassword: "..pass.."\nBerlaku sampai: "..exp)
        
        -- Reload data
        loadServer()
        
        -- Tanya login
        local loginNow = gg.choice({
            "🔐 Login Now",
            "⏰ Nanti Saja"
        }, nil, "✅ REGISTRASI SUKSES!")
        
        if loginNow == 1 then
            -- Auto login
            for username, data in pairs(USER_CONFIG.PASSWORDS) do
                if username:lower() == user:lower() then
                    if type(data) == "table" and data[1] == pass then
                        CURRENT.name = username
                        CURRENT.type = "TRIAL ⏳"
                        CURRENT.expire = data[2]
                        trackUserLogin(username)
                        gg.alert("✅ LOGIN SUKSES!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nSelamat datang "..username)
                        showNews()
                        return true
                    end
                end
            end
        end
        return true
    else
        gg.alert("❌ Gagal mendaftar! Kode error: " .. (saveResult and saveResult.code or "unknown"))
        return false
    end
end

local function login()
    -- Cek cache terlebih dahulu
    local cached = loadLoginCache()
    
    if cached then
        -- Verifikasi cached credentials dengan database
        for username, data in pairs(USER_CONFIG.PASSWORDS) do
            if username:lower() == cached.username:lower() then
                if type(data) == "string" and cached.password == data then
                    -- PERMANENT user
                    CURRENT.name = username
                    CURRENT.type = "PERMANENT 👑"
                    CURRENT.expire = "LIFETIME ♾️"
                    trackUserLogin(username)
                    
                    -- Tanya apakah ingin menggunakan cache atau login ulang
                    local choice = gg.choice({
                        "✅ Gunakan Cache (Lebih Cepat)",
                        "🔄 Login Ulang",
                        "❌ Batal"
                    }, nil, "🔓 CACHE DITEMUKAN\nUser: "..username.."\nTipe: PERMANENT\n\nLogin menggunakan cache?")
                    
                    if choice == 1 then
                        gg.alert("✅ LOGIN SUKSES (CACHE)!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nSelamat datang "..username)
                        showNews()
                        return true
                    elseif choice == 2 then
                        clearLoginCache()  -- Hapus cache, lanjut login manual
                    else
                        os.exit()
                    end
                    
                elseif type(data) == "table" and cached.password == data[1] then
                    -- TRIAL user
                    local y, m, d = tostring(data[2]):match("(%d+)-(%d+)-(%d+)")
                    if y then
                        local exp = os.time({year=tonumber(y), month=tonumber(m), day=tonumber(d), hour=23, min=59, sec=59})
                        if os.time() < exp then
                            CURRENT.name = username
                            CURRENT.type = "TRIAL ⏳"
                            CURRENT.expire = data[2]
                            trackUserLogin(username)
                            
                            local choice = gg.choice({
                                "✅ Gunakan Cache",
                                "🔄 Login Ulang",
                                "❌ Batal"
                            }, nil, "🔓 CACHE DITEMUKAN\nUser: "..username.."\nExp: "..data[2].."\n\nLogin menggunakan cache?")
                            
                            if choice == 1 then
                                gg.alert("✅ LOGIN SUKSES (CACHE)!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nSelamat datang "..username)
                                showNews()
                                return true
                            elseif choice == 2 then
                                clearLoginCache()
                            else
                                os.exit()
                            end
                        end
                    end
                end
                break
            end
        end
    end
    
    -- Jika tidak ada cache atau cache tidak valid, lanjut login manual
    while true do
        -- Ambil status registrasi TERBARU setiap kali loop
        local rReg = gg.makeRequest(FB_URL .. "Config/Registrasi.json")
        local currentRegStatus = "ON"
        if rReg and rReg.code == 200 and rReg.content ~= "null" then
            currentRegStatus = rReg.content:gsub('"', '')
        end
        
        -- Tentukan opsi berdasarkan status registrasi
        local options = {"🔐 Login"}
        if currentRegStatus == "ON" then
            table.insert(options, "📝 Create New Account")
        end
        table.insert(options, "❌ Exit")
        
        local title = "🎮 DRABOYGAMING™ 🇮🇩\n"
        title = title.."⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\n"
        title = title.."📊 Total Game Script: "..getTotalGames().."\n"
        title = title.."🔰 Registrasi: "..(currentRegStatus == "ON" and "✅ OPEN" or "❌ CLOSE")
        
        local choice = gg.choice(options, nil, title)

        if not choice then 
            os.exit() 
        end
        
        -- Login
        if options[choice] == "🔐 Login" then
            local p = gg.prompt({
                "👤 Username",
                "🔐 Password"
            }, {"", ""}, {"text", "text"})
            
            if p then
                local inputUser = tostring(p[1]):gsub("%s+", "")
                local inputPass = tostring(p[2]):gsub("%s+", "")
                
                if inputUser == "" or inputPass == "" then
                    gg.alert("❌ Username dan Password harus diisi!")
                    goto continue
                end
                
                local found = false
                for username, data in pairs(USER_CONFIG.PASSWORDS) do
                    if username:lower() == inputUser:lower() then
                        found = true
                        
                        if type(data) == "string" then
                            -- PERMANENT user
                            if inputPass == data then
                                CURRENT.name = username
                                CURRENT.type = "PERMANENT 👑"
                                CURRENT.expire = "LIFETIME ♾️"
                                trackUserLogin(username)
                                
                                -- Tanya apakah ingin menyimpan cache
                                local saveCache = gg.choice({
                                    "✅ Ya, Simpan",
                                    "❌ Tidak"
                                }, nil, "💾 SIMPAN CACHE?\nLogin lebih cepat next time?")
                                
                                if saveCache == 1 then
                                    saveLoginCache(username, inputPass, "LIFETIME", "PERMANENT")
                                end
                                
                                gg.alert("✅ LOGIN SUKSES!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nSelamat datang "..username)
                                showNews()
                                return true
                            else
                                gg.alert("❌ Password Wrong!")
                                break
                            end
                            
                        elseif type(data) == "table" then
                            -- TRIAL user
                            if inputPass == data[1] then
                                local y, m, d = tostring(data[2]):match("(%d+)-(%d+)-(%d+)")
                                if y then
                                    local exp = os.time({year=tonumber(y), month=tonumber(m), day=tonumber(d), hour=23, min=59, sec=59})
                                    if os.time() < exp then
                                        CURRENT.name = username
                                        CURRENT.type = "TRIAL ⏳"
                                        CURRENT.expire = data[2]
                                        trackUserLogin(username)
                                        
                                        local saveCache = gg.choice({
                                            "✅ Ya, Simpan",
                                            "❌ Tidak"
                                        }, nil, "💾 SIMPAN CACHE?\nLogin lebih cepat next time?")
                                        
                                        if saveCache == 1 then
                                            saveLoginCache(username, inputPass, data[2], "TRIAL")
                                        end
                                        
                                        gg.alert("✅ LOGIN SUKSES!\n⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘\nWELCOME "..username)
                                        showNews()
                                        return true
                                    else
                                        gg.alert("⛔ Akun expired pada "..data[2])
                                        break
                                    end
                                end
                            else
                                gg.alert("❌ Password salah!")
                                break
                            end
                        end
                    end
                end
                
                if not found then
                    gg.alert("❌ Username Not Found!")
                end
            end
            
        -- Register
        elseif options[choice] == "📝 Create New Account" then
            if register() then
                return true
            end
            
        -- Keluar
        elseif options[choice] == "❌ Exit" then
            os.exit()
        end
        
        ::continue::
    end
end

--------------------------------------------------
-- START
--------------------------------------------------
loadServer()
if not login() then os.exit() end

-- Main loop with improved visibility handling
gg.setVisible(false)
menu()

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        menu()
    end
    gg.sleep(100)  -- Reduced sleep time for better responsiveness
end
