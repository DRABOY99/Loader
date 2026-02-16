----------------------------------------------------
-- FUNGSI PEMBANTU (DATE & COUNTER)
----------------------------------------------------
local function get_date()
    return os.date("%d/%m/%Y") 
end


----------------------------------------------------
-- CHECK REPLACEMENT STATUS
----------------------------------------------------
function check_replacement_status()
    if not CACHE.QTY or not CACHE.QTY.results then
        return "❌ NOT READY"
    end
    
    local total = #CACHE.QTY.results
    if total == 3 then
        return "✅ READY"
    elseif total > 0 then
        return "🟡 PARTIAL (" .. total .. "/3)"
    else
        return "❌ NOT READY"
    end
end


----------------------------------------------------
-- COUNT ACTIVE MODS
----------------------------------------------------
function count_active_mods()
    local c = 0
    for _, v in pairs(STATE) do
        if v then c = c + 1 end
    end
    return c
end


----------------------------------------------------
-- CHECK ARCH
----------------------------------------------------
local TI = gg.getTargetInfo()
if not TI or not TI.x64 then
    gg.alert("❌ ARM64 ONLY")
    os.exit()
end


-- LIST ITEM PER KATEGORI
ITEM_CATEGORIES = {
        ["🌱 Crops"] = {
    
            {name="truffle", id=160023},
            {name="white truffle", id=160024},
            {name="miracle truffle", id=160025},
            {name="Bamboo shot", id=160026},
            {name="Timber bamboo shot", id=160027},
            {name="curve bamboo shot", id=160028},
            {name="Weed", id=170000},
            {name="Apple", id=190000},
            {name="Banana", id=190001},
            {name="Peach", id=190002},
            {name="orange", id=190003},
            {name="coconut", id=190009},
        
            {name="Grass", id=19999},
            
            {name="asparagus", id=10000},
            {name="asparagus white", id=10001},
            {name="asparagus purple", id=10002},
            {name="phalanx", id=10003},
            {name="phalanx macedonia", id=10005},
            {name="phalanx sparta", id=10007},
            
            {name="Brocoli", id=10008},
            {name="brocolini", id=10009},
            {name="Cauliflower", id=10010},
            {name="Romanesco", id=10011},
            {name="Blue Brocoli", id=10013},
            {name="evergreen", id=10014},
            
            {name="cabbage", id=10016},
            {name="Red cabbage", id=10017},
            {name="Pepper cabbage", id=10018},
            {name="Dome cabbage", id=10019},
            {name="Pointy cabbage", id=10021},
            {name="whitesphere cabbage", id=10022},
            
            {name="celery", id=10024},
            {name="mistic herb", id=10025},
            {name="white celery", id=10026},
            {name="royal herb", id=10027},
            {name="ice celery", id=10028},
            {name="blue celery", id=10030},
            
            {name="corn", id=10032},
            {name="fodder corn", id=10033},
            {name="sweet corn", id=10034},
            {name="sunset corn", id=10035},
            {name="glass gem corn", id=10036},
            {name="Cristal corn", id=10038},
            
            {name="Carrot", id=10040},
            {name="Baby Carrot", id=10041},
            {name="Black carrot", id=10042},
            {name="white carrot", id=10043},
            {name="Aqua carrot", id=10046},
            {name="Alraune carrot", id=10047},
            
            {name="Eggplant", id=10048},
            {name="white eggplant", id=10051},
            {name="lightbulp eggplant", id=10052},
            {name="rock eggplant", id=10053},
            {name="water eggplant", id=10054},
            {name="red eggplant", id=10055},
            
            {name="green bell pepper", id=10056},
            {name="red bell pepper", id=10057},
            {name="yellow bell pepper", id=10058},
            {name="magic bell pepper", id=10059},
            {name="golden bell pepper", id=10060},
            {name="white bell pepper", id=10062},
            
            {name="Lettuce", id=10064},
            {name="Endive", id=10065},
            {name="Romaine Lettuce", id=10066},
            {name="Ice Lettuce", id=10067},
            {name="Red leaf Lettuce", id=10069},
            {name="Blue Lettuce", id=10071},
            
            {name="Onion", id=10072},
            {name="res Onion", id=10073},
            {name="Leek", id=10074},
            {name="Garlic", id=10075},
            {name="Colorful Teardrop", id=10078},
            {name="Jewel onion", id=10079},
            
            {name="Pumkin", id=10080},
            {name="zuchini", id=10081},
            {name="Squash", id=10082},
            {name="Giant Squash", id=10083},
            {name="Jack o latern", id=10084},
            {name="Cream Pumkin", id=10085},
            
            {name="Pineapple", id=10088},
            {name="Peach pineapple", id=10089},
            {name="gold barrel pineapple", id=10090},
            {name="dragon pineapple", id=10091},
            {name="Crystal pineapple", id=10092},
            {name="water dragon pine apple", id=10094},
            
            {name="Potato", id=10096},
            {name="black potato", id=10097},
            {name="sweet potato", id=10098},
            {name="sieglinde", id=10100},
            {name="long sweet potato", id=10101},
            {name="ice potato", id=10102},
            
            {name="strawberry", id=10104},
            {name="white berry", id=10105},
            {name="angel latern", id=10106},
            {name="princess eye", id=10108},
            {name="Aqua berry", id=10109},
            {name="snow latern", id=10111},
            
            {name="soybeans", id=10112},
            {name="green pea", id=10113},
            {name="chickpea", id=10114},
            {name="lentil", id=10115},
            {name="diamond pea", id=10116},
            {name="white soybean", id=10117},
            
            {name="spinach", id=10120},
            {name="watercress", id=10121},
            {name="kale", id=10123},
            {name="sand kale", id=10124},
            {name="lilac spinach", id=10125},
            {name="pink spinach", id=10127},
            
            {name="tomato", id=10128},
            {name="sand marzano", id=10129},
            {name="ice tomato", id=10130},
            {name="killer tomato", id=10131},
            {name="sun tomato", id=10132},
            {name="crimson", id=10133},
            
            {name="turnip", id=10136},
            {name="beet", id=10137},
            {name="water beet", id=10138},
            {name="hearth of the earth", id=10139},
            {name="red turnip", id=10141},
            {name="giant hearth", id=10143},
            
            {name="wheat", id=10144},
            {name="barley", id=10145},
            {name="rye", id=10146},
            {name="rice", id=10147},
            {name="lava rice", id=10148},
            {name="snow wheat", id=10149},
            
            {name="watermelon", id=10152},
            {name="mellow yellow", id=10153},
            {name="cannon ball", id=10154},
            {name="snowman", id=10156},
            {name="blue melon", id=10157},
            {name="glitterball", id=10158},
        },
     
        ["🌺 flower"] = {
            {name="daisy", id=10160},
            {name="pink daisy", id=10161},
            {name="orange daisy", id=10162},
            {name="white daisy", id=10163},
            {name="ice daisy", id=10164},
            {name="Aqua daisy", id=10166},
            
            {name="goldband Lily", id=10168},
            {name="edelweiss", id=10169},
            {name="Ican lily", id=10170},
            {name="stargazer", id=10171},
            {name="water Lily", id=10173},
            {name="edelblau", id=10174},
            
            {name="Hibiscus", id=10176},
            {name="hollyhock", id=10177},
            {name="stripped hibiscus", id=10178},
            {name="cotton rosemallow", id=10179},
            {name="violet hibiscus", id=10180},
            {name="blue hibiscus", id=10182},
            
            {name="lotus", id=10184},
            {name="water lotus", id=10185},
            {name="lullaby", id=10186},
            {name="nirvana", id=10187},
            {name="mountain lotus", id=10189},
            {name="snow queen", id=10190},
            
            {name="marguerite", id=10192},
            {name="yellow marguerite", id=10193},
            {name="pink marguerite", id=10194},
            {name="purple marguerite", id=10195},
            {name="chamomile", id=10196},
            {name="aqua chamomile", id=10199},
            
            {name="strawberry pansky", id=10200},
            {name="violet pansky", id=10201},
            {name="viola", id=10203},
            {name="blue valentine", id=10204},
            {name="snow white pansky", id=10206},
            {name="aquature", id=10207},
            
            {name="queen of the night", id=10208},
            {name="flowing cloud", id=10209},
            {name="clear water", id=10210},
            {name="orchid cactus", id=10213},
            {name="ephiphylum", id=10214},
            {name="pink orchid cactus", id=10215},
            
            {name="red rose", id=10216},
            {name="pink rose", id=10217},
            {name="blue rose", id=10218},
            {name="white rose", id=10219},
            {name="moon river", id=10220},
            {name="solar ray", id=10221},
            
            {name="sunflower", id=10225},
            {name="moulin rouge", id=10226},
            {name="white night", id=10227},
            {name="ecplise", id=10229},
            {name="lemon aura", id=10230},
            {name="incredible sunflower", id=10231},
            
            {name="tulip", id=10233},
            {name="yellow tulip", id=10234},
            {name="white tulip", id=10235},
            {name="ice trumpet", id=10237},
            {name="champagne flute", id=10238},
            {name="holy grail", id=10239},
        
        },
            
        ["🐾 Dairy product"] = {  
            {name="milk", id=80000},
            {name="jersey milk", id=80001},
            {name="ayrshire milk", id=80002},
            {name="milk 🌟", id=80010},
            {name="jersey milk 🌟", id=80011},
            {name="ayrshire milk 🌟", id=80012},
            {name="milk 🌟🌟", id=80018},
            {name="jersey milk 🌟🌟", id=80019},
            {name="ayrshire milk 🌟🌟", id=80020},
            {name="milk 🌟🌟🌟", id=80026},
            {name="jersey milk 🌟🌟", id=80027},
            {name="ayrshire milk 🌟🌟🌟", id=80028},
            {name="egg", id=80003},
            {name="Araucania egg", id=80004},
            {name="silkie egg", id=80005},
            {name="egg 🌟", id=80013},
            {name="Araucania egg 🌟", id=80014},
            {name="silkie egg 🌟", id=80015},
            {name="egg 🌟🌟", id=80021},
            {name="Araucania egg 🌟🌟", id=80022},
            {name="silkie egg 🌟🌟", id=80023},
            {name="egg 🌟🌟🌟", id=80029},
            {name="Araucania egg 🌟🌟🌟", id=80030},
            {name="silkie egg 🌟🌟🌟", id=80031},
            {name="sheep wool", id=80006},
            {name="valaise blacknose sheep wool", id=80007},
            {name="fabric cloth", id=80008},
            {name="high quality fabric cloth", id=80009},

        },
    
        ["🏝️ seashell"] = {
            {name="Mussel", id=160000},
            {name="oyster", id=160001},
            {name="razor clam", id=160002},
            {name="Clam", id=160003},
            {name="large clam", id=160004},
            {name="surf clam", id=160005},
            {name="ark clam", id=160006},
            {name="egg cockle", id=160007},
            {name="yesso scalop", id=160008},
            {name="Akoya pearl oyster", id=160009},
            {name="geodock", id=160010}, 
        
        },
        
        ["🎣 Fish"] = {
             --   {name="Bait_00", id=100000},
                {name="Lv 1 bait", id=100001},
                {name="LV 2 bait", id=100002},
                {name="LV 3 bait", id=100003},
                {name="Big Fish bait", id=100004},
                {name="Rare bait", id=100005},
                
                {name="crucian carp", id=110000},
                {name="goldfish", id=110001},
                {name="calico goldfish", id=110002},
                
                {name="walleye", id=110003},
                {name="red eye", id=110004},
                {name="tiger eye", id=110005},
                
                {name="dorado", id=110006},
                {name="silver dorado", id=110007},
                {name="golden dorado", id=110008},
                
                {name="arowana", id=110009},
                {name="green arowana", id=110010},
                {name="banjar arowana", id=110011},
                {name="super red arowana", id=110012},
                {name="pirarucu", id=110013},
                
                {name="tilapia", id=110014},
                {name="Nile tilapia", id=110015},
                {name="Mozambique tilapia", id=110016},
                
                {name="piranha", id=110017},
                {name="diamond piranha", id=110018},
                {name="white piranha", id=110019},
                
                {name="red crayfish", id=110020},
                {name="blue crayfish", id=110021},
                
                {name="mosquito fish", id=110023},
                {name="smelt", id=110024},
                
                {name="perch", id=110026},
                {name="yellow perch", id=110027},
                {name="akame", id=110028},
                
                {name="goby", id=110029},
                {name="black goby", id=110030},
                
                {name="rainbow Trout", id=110032},
                {name="huchen", id=110033},
                {name="hidhogg", id=110034},
                
                {name="barracuda", id=110035},
                {name="blue barracuda", id=110036},
                
                {name="sardine", id=110038},
                {name="round herring", id=110040},
                
                {name="cod", id=110041},
                {name="pollock", id=110042},
                {name="safeon cod", id=110043},
                
                {name="red seabream", id=110044},
                {name="black porry", id=110045},
                {name="red bream", id=110047},
                
                {name="Yellowfin tuna", id=110049},
                {name="bluefin tuna", id=110050},
                
                {name="tiger prawn", id=110052},
                {name="black tiger prawn", id=110053},
                
                {name="lobster", id=110055},
                {name="continental lobster", id=110056},
                
                {name="seabass", id=110061},
                {name="snakehead", id=110062},
                
                {name="black carp", id=110063},
                {name="koi", id=110064},
                {name="golden carp", id=110065},
                
                {name="mahi mahi", id=110066},
        
        },
    
        ["🍄‍🟫 mushroom"] = {
            {name="mushroom", id=160013},
            {name="white mushroom", id=160014},
            {name="Jumbo mushroom", id=160015},
            {name="Shitake mushroom", id=160016},
            {name="porchini mushroom", id=160017},
            {name="matsunake mushroom", id=160018},
            {name="morel mushroom", id=160019},
            
        },
    
        ["⛏️ Ore mining"] = {
            {name="stone", id=180000},
            {name="iron ore", id=180001},
            {name="broonze ore", id=180002},
            {name="silver ore", id=180003},
            {name="gold ore", id=180004},
            {name="titanium ore", id=180005},
            {name="platinum ore", id=180006},
            {name="Damascus steel ore", id=180007},
            {name="Orichalum ore", id=180008},
            {name="Adamantite ore", id=180009},
            {name="raw glass gemstone", id=180010},
            {name="raw agate gemstone", id=180011}, 
            {name="raw jade gemstone", id=180012},
            {name="raw crystal gemstone", id=180013},
            {name="raw amethist gemstone", id=180014},
            {name="raw garnet gemstone", id=180015},
            {name="raw moonstone gemstone", id=180016},
            {name="raw topaz gemstone", id=180017},
            {name="raw Opal gemstone", id=180018},
            {name="raw Aquamarine gemstone", id=180019},
            {name="raw emeral gemstone", id=180020},
            {name="raw saphire gemstone", id=180021},
            {name="raw Ruby gemstone", id=180022},
            {name="raw diamond gemstone", id=180023},
            {name="raw tanzanite gemstone", id=180024},
            {name="raw tourmaline gemstone", id=180025},
            {name="raw alexandrite gemstone", id=180026},
            {name="material stone", id=181000},
            {name="iron", id=181001},
            {name="bronze", id=181002},
            {name="silver", id=181003},
            {name="gold", id=181004},
            {name="titanium", id=181005},
            {name="platinum", id=181006},
            {name="Damascus", id=181007},
            {name="Orichalum", id=181008},
            {name="Adamantite", id=181009},
            {name="glass", id=181010},
            {name="agate", id=181011},
            {name="jade", id=181012},
            {name="crystal", id=181013},
            {name="amethist", id=181014},
            {name="garnet", id=181015},
            {name="moonstone", id=181016},
            {name="topaz", id=181017},
            {name="Opal", id=181018},
            {name="Aquamarine", id=181019},
            {name="emeral", id=181020},
            {name="saphire", id=181021},
            {name="Ruby", id=181022},
            {name="diamond", id=181023},
            {name="tanzanite", id=181024},
            {name="tourmaline", id=181025},
            {name="alexandrite", id=181026},
    
        },
    
        ["🪵 Lumber"] = {
            {name="Lumber", id=200000},
            {name="board Lumber", id=200001},
            {name="high quality board Lumber", id=200002},
            {name="square lumber", id=200003},
            {name="high quality square lumber", id=200004},
            {name="palm lumber", id=200006},
            {name="palm board lumber", id=200007},
            {name="palm square lumber", id=200008},
            {name="sturdy lumber", id=200009},
            {name="sturdy board lumber", id=200010},
            {name="sturdy square lumber", id=200011},
        },
    
        ["💠 Fertilizer"] = {
        {name="Fertilizer", id=60001},
        {name="spring Fertilizer", id=60005},
        {name="summer Fertilizer", id=60006},
        {name="fall Fertilizer", id=60007},
        {name="winter Fertilizer", id=60008},
        {name="volcanic Fertilizer", id=60009},
        {name="Desert Fertilizer", id=60010},
        {name="flatlands Fertilizer", id=60012},
        
        {name="Composite LV 1", id=60050},
        {name="Compost_02", id=60051},
        {name="Compost_03", id=60052},
        
        },
  
      ["🌟 other"] = {
      
        {name="animal food", id=90000},
        {name="small sprinkle", id=210000},
        {name="sprinkle", id=210001},
        {name="splendid sprinkle", id=210002},
            {name="DebugCompost_01", id=900001},
    
        },
  
}

-- Menu kategori menampilkan list kategori + tombol search
function show_category_menu()
    local categories = {"🔍 Cari Item"}  -- tombol search paling atas
    for k,_ in pairs(ITEM_CATEGORIES) do
        table.insert(categories, k)
    end

    local cat = gg.choice(categories, nil, "📂 Pilih Kategori")
    if cat == nil then return end

    if cat == 1 then
        search_item_all_categories()  -- search semua item
    else
        show_items_in_category(categories[cat])
    end
end

-- Menu item menampilkan list item kategori (tanpa tombol search)

function show_items_in_category(catName)
    local list = {}

    -- list item
    for _, item in ipairs(ITEM_CATEGORIES[catName]) do
        table.insert(list, "🔹 " .. item.name)
    end

    -- tombol back di paling bawah
    table.insert(list, "⬅️ Back")

    local choice = gg.choice(list, nil, catName)
    if choice == nil then return end

    -- jika pilih Back
    if choice == #list then
        show_category_menu()
        return
    end

    -- item tetap sesuai index
    local selectedItem = ITEM_CATEGORIES[catName][choice]

    SELECTED_ITEM_ID = selectedItem.id
    gg.toast("✅ Selected: " .. selectedItem.name)
end

-- Fungsi search item di semua kategori
function search_item_all_categories()
    local searchText = gg.prompt({"Masukkan nama item"}, {""}, {"text"})
    if searchText == nil or searchText[1] == "" then return end
    local keyword = searchText[1]:lower()

    local results = {}
    local map = {}  -- simpan mapping ke kategori + indeks
    for catName, items in pairs(ITEM_CATEGORIES) do
        for idx, item in ipairs(items) do
            if item.name:lower():find(keyword) then
                table.insert(results, item.name .. " [" .. catName .. "]")
                map[#results] = {cat=catName, index=idx}
            end
        end
    end

    if #results == 0 then
        gg.alert("❌ Item tidak ditemukan")
        return
    end

    local choice = gg.choice(results, nil, "🔍 Hasil pencarian")
    if choice == nil then return end

    local sel = map[choice]
    local selectedItem = ITEM_CATEGORIES[sel.cat][sel.index]
    
    SELECTED_ITEM_ID = selectedItem.id
gg.toast("✅ Selected: " .. selectedItem.name)
end






----------------------------------------------------
-- STATE / CACHE
----------------------------------------------------
STATE = {
    STOP_TIME = false,
    UNLIMITED_GIFT = false,
    INFINITE_STAMINA = false,
    INSTANT_HARVEST = false,
    
}

CACHE = {
    STOP_TIME = {},
    UNLIMITED_GIFT = {},
    INFINITE_STAMINA = {},
    INSTANT_HARVEST = {},
    
}





----------------------------------------------------
-- UPDATE METHOD INFO (TAMBAH FREE BUILD METHODS)
----------------------------------------------------


METHOD = {
    STOP_TIME = {
        CLASS = "SunLightControl",
        NAME  = "OnLateUpdate",
        ADDR  = {}
    },
    
    
    
  
}



CACHE.QTY = {
    results = {},
    scanned = false
}


SELECTED_ITEM_ID = nil

function edit_qty_menu()
    local total = #CACHE.QTY.results

    local statusText
    if total == 3 then
        statusText = "✅ READY"
    else
        statusText = "⏳ NOT READY (" .. total .. ")"
    end

    local header =
        "🤖 SMART AUTO-REFINE SYSTEM\n" ..
        "─────────────────────────────\n" ..
        "Status: " .. statusText .. "\n" ..
        "─────────────────────────────"

    -- Menu berbeda berdasarkan status
    local menuItems = {}
    
    if total == 3 then
        -- Menu saat READY
        table.insert(menuItems, "✏️ Change Qty")
        table.insert(menuItems, "🔄 Replace Item")
        table.insert(menuItems, "♻️ Reset scan")
        table.insert(menuItems, "⬅️ Back")
    else
        -- Menu saat NOT READY
        if #CACHE.QTY.results == 0 then
            table.insert(menuItems, "🚀 Start Auto-Refine")
        else
            table.insert(menuItems, "⏩ Continue Auto-Refine")
        end
        table.insert(menuItems, "♻️ Reset scan")
        table.insert(menuItems, "⬅️ Back")
    end

    local menu = gg.choice(menuItems, nil, header)
    if menu == nil then return end

    if total == 3 then
        -- Menu saat READY
        if menu == 1 then
            -- Change Qty
            local p = gg.prompt({"Change QTY To"}, {999}, {"number"})
            if not p then return end

            for _, v in ipairs(CACHE.QTY.results) do
                v.value = p[1]
            end

            gg.setValues(CACHE.QTY.results)
            gg.alert("✅ Done, Reopen backpack")
            
        elseif menu == 2 then
            -- Replace Item
            replace_item_from_qty()
            
        elseif menu == 3 then
            -- Reset scan
            CACHE.QTY.results = {}
            CACHE.QTY.scanned = false
            gg.clearResults()
            gg.toast("♻️ Scan Reset")
            
        elseif menu == 4 then
            -- Back
            return
        end
        
    else
        -- Menu saat NOT READY
        if menu == 1 then
            -- Start/Continue Auto-Refine
            start_auto_refine_loop()
            
        elseif menu == 2 then
            -- Reset scan
            CACHE.QTY.results = {}
            CACHE.QTY.scanned = false
            gg.clearResults()
            gg.toast("♻️ Scan Reset")
            
        elseif menu == 3 then
            -- Back
            return
        end
    end

    -- Refresh menu
    edit_qty_menu()
end

function start_auto_refine_loop()
    local function refine_iteration()
        -- Cek jika sudah READY
        if #CACHE.QTY.results == 3 then 
            return true 
        end
        
        -- **SIMPLE PROMPT - sama seperti step one**
        local p = gg.prompt({
            "🔄 Refine [" .. #CACHE.QTY.results .. "/3]\n" ..
            "Input NEW quantity:"
        }, {0}, {"number"})
        
        if not p then 
            return false  -- User cancel
        end
        
        -- Process refine
        gg.loadResults(CACHE.QTY.results)
        gg.refineNumber(p[1], gg.TYPE_DWORD)
        local newCount = gg.getResultCount()
        
        if newCount == 0 then
            gg.alert("❌ No results for: " .. p[1])
            return false
        end
        
        CACHE.QTY.results = gg.getResults(newCount)
        
        -- Cek jika sudah READY
        if newCount == 3 then
            gg.alert("✅ READY! Auto-refine complete.")
            return true
        else
            -- Timer untuk pindah item (simplified message)
            gg.alert(
                "✅ Found " .. newCount .. " addresses\n" ..
                "⏳ Move item in 5 seconds..."
            )
            
            -- Simple countdown
            for i = 5, 1, -1 do
                gg.toast("Move item... " .. i .. "s")
                gg.sleep(1000)
            end
            
            return refine_iteration()  -- Loop lagi
        end
    end
    
    -- Start pertama kali (STEP ONE)
    if #CACHE.QTY.results == 0 then
        -- **SIMPLE PROMPT - konsisten dengan refine**
        local p = gg.prompt({
            "🚀 Step One\n" ..
            "Input current quantity:"
        }, {0}, {"number"})
        
        if not p then 
            return false 
        end
        
        gg.clearResults()
        gg.searchNumber(p[1], gg.TYPE_DWORD)
        local c = gg.getResultCount()
        
        if c == 0 then
            gg.alert("❌ No results for: " .. p[1])
            return false
        end
        
        CACHE.QTY.results = gg.getResults(c)
        
        -- Simple message
        gg.alert("✅ Found " .. c .. " addresses\n⏳ Move item in 5s...")
        
        -- Simple countdown
        for i = 5, 1, -1 do
            gg.toast("Move item... " .. i .. "s")
            gg.sleep(1000)
        end
    end
    
    -- Mulai loop refine
    return refine_iteration()
end




function pick_item_from_list()
    local main_menu = {"🔍 CARI ITEM"} -- Tambahkan opsi cari di awal
    local categories = {}
    
    -- Masukkan semua kategori ke list menu
    for k, _ in pairs(ITEM_CATEGORIES) do
        table.insert(categories, k)
        table.insert(main_menu, "🔹 " .. k)
    end

    local choice = gg.choice(main_menu, nil, "🏷️ Menu Item")
    if not choice then return nil end

    local keyword = ""
    local items_to_search = {}

    if choice == 1 then
        -- Mode Pencarian Global
        local p = gg.prompt({"Ketik nama item:"}, {""}, {"text"})
        if not p or p[1] == "" then return nil end
        keyword = p[1]:lower()
        
        -- Gabungkan semua item dari semua kategori untuk dicari
        for _, catItems in pairs(ITEM_CATEGORIES) do
            for _, item in ipairs(catItems) do
                table.insert(items_to_search, item)
            end
        end
    else
        -- Mode Pilih Kategori
        local catName = categories[choice - 1] -- -1 karena index 1 dipakai "Cari Item"
        items_to_search = ITEM_CATEGORIES[catName]
    end

    -- Filter item berdasarkan keyword (jika ada) atau tampilkan semua dalam kategori
    local list = {}
    local map = {}

    for _, item in ipairs(items_to_search) do
        if keyword == "" or item.name:lower():find(keyword, 1, true) then
            table.insert(list, "🔹 " .. item.name)
            table.insert(map, item)
        end
    end

    if #list == 0 then
        gg.alert("❌ Item tidak ditemukan")
        return nil
    end

    local i = gg.choice(list, nil, "📦 Hasil Pilih")
    if not i then return nil end

    return map[i].id, map[i].name
end





----------------------------------------------------
-- REPLACE ITEM
----------------------------------------------------
    
   


function replace_item_from_qty2addres()
    if #CACHE.QTY.results ~= 3 then
        gg.alert("❌ NOT READY")
        return
    end

    -- pilih item dari list
    local itemId, itemName = pick_item_from_list()
    if not itemId then
        gg.toast("❌ CANCEL")
        return
    end

    -- PREVIEW
    local confirm = gg.alert(
        "📦 PREVIEW ITEM\n" ..
        "────────────────────\n" ..
        "Nama : " .. itemName .. "\n" ..
        
        "────────────────────\n" ..
        "Continue replace?",
        "✅ Yes",
        "❌ Nope"
    )

    if confirm ~= 1 then
        gg.toast("❌ Replace Canceled")
        return
    end

    -- go to address pertama & kedua, mundur 1 baris (-4)
    local target1 = CACHE.QTY.results[1].address - 4
    local target2 = CACHE.QTY.results[2].address - 4

    -- replace kedua address
    gg.setValues({
        {address = target1, flags = gg.TYPE_DWORD, value = itemId},
        {address = target2, flags = gg.TYPE_DWORD, value = itemId}
    })

    SELECTED_ITEM_ID = itemId
    gg.alert("✅ ITEM REPLACE → " .. itemName .. "")
end

function replace_item_from_qty()
    if #CACHE.QTY.results ~= 3 then
        gg.alert("❌ NOT READY")
        return
    end

    -- pilih item dari list
    local itemId, itemName = pick_item_from_list()
    if not itemId then
        gg.toast("❌ CANCEL")
        return
    end

    -- PREVIEW
    local confirm = gg.alert(
        "📦 PREVIEW ITEM\n" ..
        "────────────────────\n" ..
        "Nama : " .. itemName .. "\n" ..
        "────────────────────\n" ..
        "Continue replace?",
        "✅ Yes",
        "❌ Nope"
    )

    if confirm ~= 1 then
        gg.toast("❌ Replace Canceled")
        return
    end

    -- go to address pertama, kedua, ketiga & mundur 1 baris (-4)
    local target1 = CACHE.QTY.results[1].address - 4
    local target2 = CACHE.QTY.results[2].address - 4
    local target3 = CACHE.QTY.results[3].address - 4

    -- replace ketiga address
    gg.setValues({
        {address = target1, flags = gg.TYPE_DWORD, value = itemId},
        {address = target2, flags = gg.TYPE_DWORD, value = itemId},
        {address = target3, flags = gg.TYPE_DWORD, value = itemId}
    })

    SELECTED_ITEM_ID = itemId
    gg.alert("✅ ITEM REPLACE → " .. itemName .. "")
end


----------------------------------------------------
-- MEMORY UTIL
----------------------------------------------------
local function gv(a, t)
    return gg.getValues({{address=a, flags=t}})[1].value
end

local function sv(t)
    gg.setValues(t)
end

local function ptr(a)
    return gv(a, gg.TYPE_QWORD)
end

----------------------------------------------------
-- STRING CHECK
----------------------------------------------------
local function cstr(addr, s)
    for i = 1, #s do
        if gv(addr + i - 1, gg.TYPE_BYTE) ~= s:byte(i) then
            return false
        end
    end
    return gv(addr + #s, gg.TYPE_BYTE) == 0
end

----------------------------------------------------
-- GENERIC METHOD FINDER
----------------------------------------------------
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


----------------------------------------------------
-- TOGGLE STOP TIME (SKIP INCREMENT ONLY)
----------------------------------------------------
function toggle_stop_time_safe()
    if STATE.STOP_TIME then
        -- Restore patch
        if #CACHE.STOP_TIME > 0 then
            sv(CACHE.STOP_TIME)
            CACHE.STOP_TIME = {}
        end
        
        STATE.STOP_TIME = false
        gg.toast("🕒 Time Normal")
        return
    end

    -- Cari method OnLateUpdate
    if #METHOD.STOP_TIME.ADDR == 0 then
        gg.toast("🔍 find...")
        METHOD.STOP_TIME.ADDR = findMethod(
            METHOD.STOP_TIME.CLASS,
            "OnLateUpdate"
        )
        
        if #METHOD.STOP_TIME.ADDR == 0 then
            gg.alert("❌ FAILED")
            return
        end
    end

    local patch = {}
    CACHE.STOP_TIME = {}
    
    for _, addr in ipairs(METHOD.STOP_TIME.ADDR) do
        -- Analisis assembly untuk mencari instruksi yang menambah waktu
        -- Biasanya ada instruksi seperti: fadd s0, s0, s1 (penambahan float)
        
        -- Scan 64 byte pertama method
        local instructions = {}
        for i = 0, 60, 4 do
            local instr = gv(addr + i, gg.TYPE_DWORD)
            table.insert(instructions, {offset = i, value = instr})
        end
        
        -- Cari instruksi FMADD, FADD, atau ADD yang mungkin menambah waktu
        local found = false
        for _, instr in ipairs(instructions) do
            local opcode = instr.value
            
            -- Pattern untuk instruksi floating point add
            -- fadd s0, s0, s1 = 0x1E202820
            -- fadd d0, d0, d1 = 0x1E602820
            -- fmadd s0, s0, s1, s2 = 0x1F001001
            
            if (opcode & 0xFFE0FC00) == 0x1E000000 then -- FADD (scalar)
                -- Simpan instruksi asli
                table.insert(CACHE.STOP_TIME, {
                    address = addr + instr.offset,
                    flags = gg.TYPE_DWORD,
                    value = opcode
                })
                
                -- Ganti dengan NOP
                table.insert(patch, {
                    address = addr + instr.offset,
                    flags = gg.TYPE_DWORD,
                    value = 0xD503201F -- nop
                })
                
                found = true
                --gg.toast(string.format("✅ Found FADD at +%X", instr.offset))
            end
        end
        
        if not found then
            -- Fallback: patch awal method dengan conditional branch
            for i = 0, 11, 4 do
                table.insert(CACHE.STOP_TIME, {
                    address = addr + i,
                    flags = gg.TYPE_DWORD,
                    value = gv(addr + i, gg.TYPE_DWORD)
                })
            end
            
            -- Branch ke akhir method (skip update logic)
            -- b #0x20 (jump 32 byte)
            table.insert(patch, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = 0x14000008 -- b #0x20
            })
        end
    end
    
    if #patch > 0 then
        sv(patch)
        STATE.STOP_TIME = true
        gg.toast("⏸️ Time Pause")
    else
        gg.alert("❌ failed")
    end
end









----------------------------------------------------
-- TOGGLE unlimited gif
----------------------------------------------------


STATE.UNLIMITED_GIFT = false
CACHE.UNLIMITED_GIFT = {}

METHOD.UNLIMITED_GIFT = {
    CLASS = "NpcInfo",
    NAME  = "GetGift",
    ADDR  = {}
}


function toggle_unlimited_gift()
    if STATE.UNLIMITED_GIFT then
        if #CACHE.UNLIMITED_GIFT > 0 then
            sv(CACHE.UNLIMITED_GIFT)
            CACHE.UNLIMITED_GIFT = {}
        end
        STATE.UNLIMITED_GIFT = false
        gg.toast("🎁 Gift limit normal")
        return
    end

    if #METHOD.UNLIMITED_GIFT.ADDR == 0 then
        gg.toast("🔍 Find...")
        METHOD.UNLIMITED_GIFT.ADDR = findMethod(
            METHOD.UNLIMITED_GIFT.CLASS,
            METHOD.UNLIMITED_GIFT.NAME
        )

        if #METHOD.UNLIMITED_GIFT.ADDR == 0 then
            gg.alert("❌ failed")
            return
        end
    end

    local patch = {}
    CACHE.UNLIMITED_GIFT = {}

    for _, addr in ipairs(METHOD.UNLIMITED_GIFT.ADDR) do
        -- backup
        for i = 0, 8, 4 do
            table.insert(CACHE.UNLIMITED_GIFT, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- MOV W0, #0  → return false
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800000
        })

        -- RET
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.UNLIMITED_GIFT = true
    gg.toast("🎁 UNLIMITED NPC GIFT")
end



----------------------------------------------------
-- TOGGLE unlimited stamina
----------------------------------------------------

STATE.INFINITE_STAMINA = false
CACHE.INFINITE_STAMINA = {}

METHOD.INFINITE_STAMINA = {
    CLASS = "HpCostController",
    NAME1 = "ApplyHpCostImpl",
    NAME2 = "set_IsLock",
    ADDR1 = {},
    ADDR2 = {}
}

function toggle_infinite_stamina()
    if STATE.INFINITE_STAMINA then
        if #CACHE.INFINITE_STAMINA > 0 then
            sv(CACHE.INFINITE_STAMINA)
            CACHE.INFINITE_STAMINA = {}
        end
        STATE.INFINITE_STAMINA = false
        gg.toast("⚡ Stamina Normal")
        return
    end

    -- FIND METHODS
    if #METHOD.INFINITE_STAMINA.ADDR1 == 0 then
        METHOD.INFINITE_STAMINA.ADDR1 =
            findMethod("HpCostController", "ApplyHpCostImpl")
    end

    if #METHOD.INFINITE_STAMINA.ADDR2 == 0 then
        METHOD.INFINITE_STAMINA.ADDR2 =
            findMethod("HpCostController", "set_IsLock")
    end

    if #METHOD.INFINITE_STAMINA.ADDR1 == 0 then
        gg.alert("❌ ApplyHpCostImpl not found")
        return
    end

    local patch = {}
    CACHE.INFINITE_STAMINA = {}

    ------------------------------------------------
    -- PATCH 1 : disable stamina decrease
    ------------------------------------------------
    for _, addr in ipairs(METHOD.INFINITE_STAMINA.ADDR1) do
        for i = 0, 8, 4 do
            table.insert(CACHE.INFINITE_STAMINA, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- RET
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    ------------------------------------------------
    -- PATCH 2 : force IsLock = true
    ------------------------------------------------
    for _, addr in ipairs(METHOD.INFINITE_STAMINA.ADDR2) do
        for i = 0, 8, 4 do
            table.insert(CACHE.INFINITE_STAMINA, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- MOV W0, #1
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800020
        })

        -- RET
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.INFINITE_STAMINA = true
    gg.toast("⚡ INFINITE STAMINA")
end




METHOD.INSTANT_HARVEST = {
    CLASS = "CropInfoUpdater",
    NAME  = "IsMaxGrowPhase",
    ADDR  = {}
}

STATE.INSTANT_HARVEST = false
CACHE.INSTANT_HARVEST = {}

function toggle_instant_harvest()
    if STATE.INSTANT_HARVEST then
        sv(CACHE.INSTANT_HARVEST)
        CACHE.INSTANT_HARVEST = {}
        STATE.INSTANT_HARVEST = false
        gg.toast("🌱 Harvest Normal")
        return
    end

    if #METHOD.INSTANT_HARVEST.ADDR == 0 then
        METHOD.INSTANT_HARVEST.ADDR =
            findMethod("CropInfoUpdater", "IsMaxGrowPhase")

        if #METHOD.INSTANT_HARVEST.ADDR == 0 then
            gg.alert("❌ IsMaxGrowPhase not found")
            return
        end
    end

    local patch = {}
    CACHE.INSTANT_HARVEST = {}

    for _, addr in ipairs(METHOD.INSTANT_HARVEST.ADDR) do
        -- backup
        for i = 0, 8, 4 do
            table.insert(CACHE.INSTANT_HARVEST, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- return true
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800020 -- MOV W0,#1
        })
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- RET
        })
    end

    sv(patch)
    STATE.INSTANT_HARVEST = true
    gg.toast("🌾 INSTANT HARVEST")
end




METHOD.BEST_QUALITY = {
    CLASS = "CropInfoUpdater",
    NAME  = "GetQualityPointWatering",
    ADDR  = {}
}

STATE.BEST_QUALITY = false
CACHE.BEST_QUALITY = {}

function toggle_best_quality()
    if STATE.BEST_QUALITY then
        sv(CACHE.BEST_QUALITY)
        CACHE.BEST_QUALITY = {}
        STATE.BEST_QUALITY = false
        gg.toast("🌱 Quality Normal")
        return
    end

    if #METHOD.BEST_QUALITY.ADDR == 0 then
        METHOD.BEST_QUALITY.ADDR =
            findMethod("CropInfoUpdater", "GetQualityPointWatering")

        if #METHOD.BEST_QUALITY.ADDR == 0 then
            gg.alert("❌ GetQualityPointWatering not found")
            return
        end
    end

    local patch = {}
    CACHE.BEST_QUALITY = {}

    for _, addr in ipairs(METHOD.BEST_QUALITY.ADDR) do
        -- backup
        for i = 0, 8, 4 do
            table.insert(CACHE.BEST_QUALITY, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- return high quality point
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800C80 -- MOV W0,#100
        })
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- RET
        })
    end

    sv(patch)
    STATE.BEST_QUALITY = true
    gg.toast("🌟 ALWAYS BEST QUALITY")
end


METHOD.ALWAYS_WET = {
    CLASS = "CropInfoUpdater",
    NAME  = "IsWeatherWatering",
    ADDR  = {}
}

STATE.ALWAYS_WET = false
CACHE.ALWAYS_WET = {}

function toggle_always_wet()
    if STATE.ALWAYS_WET then
        sv(CACHE.ALWAYS_WET)
        CACHE.ALWAYS_WET = {}
        STATE.ALWAYS_WET = false
        gg.toast("💧 Water Normal")
        return
    end

    if #METHOD.ALWAYS_WET.ADDR == 0 then
        METHOD.ALWAYS_WET.ADDR =
            findMethod("CropInfoUpdater", "IsWeatherWatering")

        if #METHOD.ALWAYS_WET.ADDR == 0 then
            gg.alert("❌ IsWeatherWatering not found")
            return
        end
    end

    local patch = {}
    CACHE.ALWAYS_WET = {}

    for _, addr in ipairs(METHOD.ALWAYS_WET.ADDR) do
        -- backup
        for i = 0, 8, 4 do
            table.insert(CACHE.ALWAYS_WET, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- always true
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0x52800020 -- MOV W0,#1
        })
        table.insert(patch, {
            address = addr + 4,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- RET
        })
    end

    sv(patch)
    STATE.ALWAYS_WET = true
    gg.toast("💧 ALWAYS WET")
end


METHOD.ALWAYS_FERTILIZER = {
    CLASS = "CropInfoUpdater",
    NAME  = "OnDayFinishedFertilizerTerm",
    ADDR  = {}
}

STATE.ALWAYS_FERTILIZER = false
CACHE.ALWAYS_FERTILIZER = {}

function toggle_always_fertilizer()
    if STATE.ALWAYS_FERTILIZER then
        sv(CACHE.ALWAYS_FERTILIZER)
        CACHE.ALWAYS_FERTILIZER = {}
        STATE.ALWAYS_FERTILIZER = false
        gg.toast("🌿 Fertilizer Normal")
        return
    end

    METHOD.ALWAYS_FERTILIZER.ADDR =
        findMethod("CropInfoUpdater", "OnDayFinishedFertilizerTerm")

    if #METHOD.ALWAYS_FERTILIZER.ADDR == 0 then
        gg.alert("❌ Fertilizer method not found")
        return
    end

    local patch = {}
    CACHE.ALWAYS_FERTILIZER = {}

    for _, addr in ipairs(METHOD.ALWAYS_FERTILIZER.ADDR) do
        -- backup
        for i = 0, 8, 4 do
            table.insert(CACHE.ALWAYS_FERTILIZER, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        -- RET
        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0
        })
    end

    sv(patch)
    STATE.ALWAYS_FERTILIZER = true
    gg.toast("🌿 ALWAYS FERTILIZER")
end



METHOD.NO_WEED_STONE = {
    CLASS = "CropInfoUpdater",
    NAME  = "OnDayFinishedCreateObstacle",
    ADDR  = {}
}

STATE.NO_WEED_STONE = false
CACHE.NO_WEED_STONE = {}

function toggle_no_weed_stone()
    if STATE.NO_WEED_STONE then
        sv(CACHE.NO_WEED_STONE)
        CACHE.NO_WEED_STONE = {}
        STATE.NO_WEED_STONE = false
        gg.toast("🌱 Obstacle Normal")
        return
    end

    METHOD.NO_WEED_STONE.ADDR =
        findMethod("CropInfoUpdater", "OnDayFinishedCreateObstacle")

    if #METHOD.NO_WEED_STONE.ADDR == 0 then
        gg.alert("❌ Obstacle method not found")
        return
    end

    local patch = {}
    CACHE.NO_WEED_STONE = {}

    for _, addr in ipairs(METHOD.NO_WEED_STONE.ADDR) do
        for i = 0, 8, 4 do
            table.insert(CACHE.NO_WEED_STONE, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end

        table.insert(patch, {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = 0xD65F03C0 -- RET
        })
    end

    sv(patch)
    STATE.NO_WEED_STONE = true
    gg.toast("🚫 NO WEED / NO STONE")
end



-------------------------------------------------------
---main menu
----------------------------------------------------
function main_menu()
    local function status(state)
        return state and " [ON] ✅" or " [OFF] 🔴"
    end

    local divider = "──────────────────────────────"
    local header = "🚀 DRABOY HARVEST MOON TOOLS\n" ..
                   divider .. "\n" ..
                   "📅 Date: " .. get_date() .. "\n" ..
                   "📊 Active Mods: " .. count_active_mods() .. "\n" ..
                   "🔄 Replacement status: " .. check_replacement_status() .. "\n" ..
                   divider
       
    local m = gg.choice({
    "🔄 Smart System Replacement",  -- menu baru paling atas
    "📦 List Item",
    "⏸️ Stop Time" .. status(STATE.STOP_TIME),
    "🎁 No limit gift NPC" .. status(STATE.UNLIMITED_GIFT),
    "💪 Infinite Stamina" .. status(STATE.INFINITE_STAMINA),
    "⚡ instant harvest" .. status(STATE.INSTANT_HARVEST),
    "🌟 Best Quality crop" .. status(STATE.BEST_QUALITY),
    "💧 Always Wet Crop" .. status(STATE.ALWAYS_WET),
    "🌿 ALWAYS FERTILIZER" .. status(STATE.ALWAYS_FERTILIZER),
    "🚫 No weed and stone" .. status(STATE.NO_WEED_STONE),
    
    "❌ Exit"}, nil, header)



    if m == nil then return end
    
    if m == 1 then edit_qty_menu() 
elseif m == 2 then show_category_menu()
elseif m == 3 then toggle_stop_time_safe()
elseif m == 4 then toggle_unlimited_gift()
elseif m == 5 then toggle_infinite_stamina()
elseif m == 6 then toggle_instant_harvest()
elseif m == 7 then toggle_best_quality()
elseif m == 8 then toggle_always_wet()
elseif m == 9 then toggle_always_fertilizer()
elseif m == 10 then toggle_no_weed_stone()
elseif m == 11 then os.exit()
end



    return main_menu()
end

-- Tambahkan variabel global di luar function
local PASSWORD_ENTERED = false

function main_messsnu()
    local function status(state)
        return state and " [ON] ✅" or " [OFF] 🔴"
    end

    local divider = "──────────────────────────────"
    
    -- Tambah status akses di header
    local access_status = PASSWORD_ENTERED and "🟢 Access Granted" or "🔴 Access Denied"
    
    local header = "🚀 DRABOY HARVEST MOON TOOLS\n" ..
                   divider .. "\n" ..
                   "📅 Date: " .. get_date() .. "\n" ..
                   "📊 Active Mods: " .. count_active_mods() .. "\n" ..
                   "🔄 Replacement status: " .. check_replacement_status() .. "\n" ..
                   "🔐 Smart System Access: " .. access_status .. "\n" ..
                   divider
    
    -- Daftar password yang valid
    local PASSWORDS = {
        "12345",    -- Password utama
        "admin",    -- Password admin
        "harvest",  -- Password user
        "moon2024", -- Password spesifik
        "draboy"    -- Password default
    }
    
    local menu_items = {
        "🔄 Smart System Replacement",
        "📦 List Item",
        "⏸️ Stop Time" .. status(STATE.STOP_TIME),
        "🎁 No limit gift NPC" .. status(STATE.UNLIMITED_GIFT),
        "💪 Infinite Stamina" .. status(STATE.INFINITE_STAMINA),
        "⚡ instant harvest" .. status(STATE.INSTANT_HARVEST),
        "🌟 Best Quality crop" .. status(STATE.BEST_QUALITY),
        "💧 Always Wet Crop" .. status(STATE.ALWAYS_WET),
        "🌿 ALWAYS FERTILIZER" .. status(STATE.ALWAYS_FERTILIZER),
        "🚫 No weed and stone" .. status(STATE.NO_WEED_STONE),
        "❌ Exit"
    }
    
    -- Fungsi untuk verifikasi password dengan banyak opsi
    local function verify_password()
        -- Jika sudah pernah masuk password yang benar, langsung return true
        if PASSWORD_ENTERED then
            return true
        end
        
        gg.alert("⚠️ PASSWORD REQUIRED\n\nMenu Smart System Replacement requires authentication.")
        local input = gg.prompt({"Enter password:"}, nil, {"text"})
        
        if input == nil then
            return false
        end
        
        -- Cek apakah password cocok dengan salah satu di daftar
        local entered_pass = input[1]
        for _, valid_pass in ipairs(PASSWORDS) do
            if entered_pass == valid_pass then
                PASSWORD_ENTERED = true  -- Set ke true secara global
                gg.alert("✅ Access Granted!\n\nYou won't need to enter password again.")
                return true
            end
        end
        
        gg.alert("❌ Wrong password!")
        return false
    end

    local m = gg.choice(menu_items, nil, header)

    if m == nil then return end
    
    if m == 1 then edit_qty_menu()
    
     --   if verify_password() then
            -- Refresh menu untuk update status di header
        --    edit_qty_menu()
      --  end
    elseif m == 2 then 
        show_category_menu()
    elseif m == 3 then 
        toggle_stop_time_safe()
    elseif m == 4 then 
        toggle_unlimited_gift()
    elseif m == 5 then 
        toggle_infinite_stamina()
    elseif m == 6 then 
        toggle_instant_harvest()
    elseif m == 7 then 
        toggle_best_quality()
    elseif m == 8 then 
        toggle_always_wet()
    elseif m == 9 then 
        toggle_always_fertilizer()
    elseif m == 10 then 
        toggle_no_weed_stone()
    elseif m == 11 then 
        os.exit()
    end

    return main_menu()
end




                             

----------------------------------------------------
-- 🚀 INITIALIZATION & ANIMATION (FIXED)
----------------------------------------------------
function initialize()
    gg.clearResults()
    gg.setVisible(false)

    -- Animasi Loading Smooth
    local frames = {
        "▕      ▏", "▕▃     ▏", "▕▆▃    ▏", "▕▇▆▃   ▏", "▕██▇▆▃ ▏", 
        "▕ ███▇▆▏", "▕  ███▇▏", "▕   ███▏", "▕    ██▏", "▕     █▏",
        "▕      ▏", "▕     ▃▏", "▕    ▃▆▏", "▕   ▃▆▇▏", "▕ ▃▆▇█▏",
        "▕▆▇███ ▏", "▕▇███  ▏", "▕███   ▏", "▕██    ▏", "▕█     ▏"
    }
    
    for r = 1, 2 do
        for i, v in ipairs(frames) do
            gg.toast("🚀 Loading Draboy Tools " .. v)
            gg.sleep(60) 
        end
    end
    
 -- Hitung total item
local function get_total_items()
    local total = 0
    for _, items in pairs(ITEM_CATEGORIES) do
        total = total + #items
    end
    return total
end

-- Pesan utama
local msg = "✅ SYSTEM READY TO USE\n"
         .. "────────────────────────\n"
         .. "👤 Author   : Draboy\n"
         .. "🎮 Game     : Harvest Moon\n"
         .. "⚙️ Status   : ARM64 / Optimized\n"
         .. "────────────────────────\n"
         .. "📦 Total items: " .. get_total_items() .. "\n"
         .. "────────────────────────\n"
         .. "📺 YouTube  : @DraboyGaming\n"
         .. "🙏 Support me by Subscribing!"

local sel = gg.alert(msg, "🚀 START SYSTEM", "❌ EXIT")

if sel ~= 1 then 
    gg.toast("👋 Script Closed")
    os.exit() 
end

    


    -- 1. LANGSUNG MUNCULKAN MENU (Tanpa klik ikon)
    main_menu()
    
    -- 2. LOOP UTAMA (Untuk penggunaan selanjutnya via ikon GG)
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            main_menu()
        end
        gg.sleep(100)
    end
end

-- Jalankan inisialisasi
initialize()


