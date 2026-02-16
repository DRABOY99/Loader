local ItemExplorer = {}

ItemExplorer.item_data = {

    ["🏗️ Building Items"] = {
        ["Building Arch"] = "633",
        ["Building Arch_Level2_"] = "634",
        ["Building Arch_Level3_"] = "635",
        ["Building Arch_Level4_"] = "636",
        ["Building Arch_level5_"] = "696",
        ["Building Door"] = "103",
        ["Building Door_level2_"] = "107",
        ["Building Door_level3_"] = "111",
        ["Building Door_level4_"] = "115",
        ["Building Door_level5_"] = "695",
        ["Building Floor"] = "100",
        ["Building Floor_level2_"] = "104",
        ["Building Floor_level3_"] = "108",
        ["Building Floor_level4_"] = "112",
        ["Building Floor_level5_"] = "692",
        ["Building Ladder"] = "99",
        ["Building Ladder_level2_"] = "799",
        ["Building Ladder_level3_"] = "800",
        ["Building Ladder_level4_"] = "801",
        ["Building Ladder_level5_"] = "802",
        ["Building Wall"] = "101",
        ["Building Wall_level2_"] = "105",
        ["Building Wall_level3_"] = "109",
        ["Building Wall_level4_"] = "113",
        ["Building Wall_level5_"] = "693",
        ["Building Window"] = "102",
        ["Building Window_level2_"] = "106",
        ["Building Window_level3_"] = "110",
        ["Building Window_level4_"] = "114",
        ["Building Window_level5_"] = "694",
    },
    
    ["👕 Clothes Items"] = {
        ["Clothes AdvancedSantaHat"] = "865",
        ["Clothes AntiradiationHeadProtection"] = "753",
        ["Clothes AntiradiationProtectiveBoots"] = "756",
        ["Clothes AntiradiationProtectiveJacket"] = "754",
        ["Clothes AntiradiationProtectivePants"] = "755",
        ["Clothes AssaultArmor"] = "229",
        ["Clothes AssaultBoots"] = "228",
        ["Clothes AssaultHelmet"] = "227",
        ["Clothes AssaultPants"] = "230",
        ["Clothes BaseballCap"] = "177",
        ["Clothes BeetlejuiceBoots"] = "853",
        ["Clothes BeetlejuiceCape"] = "851",
        ["Clothes BeetlejuiceHat"] = "850",
        ["Clothes BeetlejuicePants"] = "852",
        ["Clothes BlackBoots"] = "741",
        ["Clothes BloodstainedJacket"] = "301",
        ["Clothes BloodthirstyBoots"] = "315",
        ["Clothes BootsReinforced"] = "214",
        ["Clothes BootsReinforcedWithMetalElements"] = "218",
        ["Clothes CargoPants"] = "176",
        ["Clothes CarnifexMask"] = "300",
        ["Clothes ChristmasPajamaPants"] = "772",
        ["Clothes ChristmasSweater"] = "771",
        ["Clothes ClimberBackpack"] = "805",
        ["Clothes CombatReefer"] = "313",
        ["Clothes ComedianFieldCoat"] = "305",
        ["Clothes Cowboyhat"] = "211",
        ["Clothes CrazyGasMask"] = "808",
        ["Clothes ExperimentalBodyArmor"] = "237",
        ["Clothes ExperimentalBoots"] = "236",
        ["Clothes ExperimentalHelmet"] = "235",
        ["Clothes ExperimentalPants"] = "238",
        ["Clothes FearsomeGasMask"] = "296",
        ["Clothes FightingBreeches"] = "314",
        ["Clothes FootballHelmet"] = "207",
        ["Clothes GasMask"] = "173",
        ["Clothes GhoulBoots"] = "840",
        ["Clothes GhoulCloak"] = "838",
        ["Clothes GhoulHat"] = "837",
        ["Clothes GhoulPants"] = "839",
        ["Clothes GingerbreadMansBoots"] = "777",
        ["Clothes GingerbreadMansHoodie"] = "775",
        ["Clothes GingerbreadMansMask"] = "774",
        ["Clothes GingerbreadMansPants"] = "776",
        ["Clothes HalloweenBoots"] = "718",
        ["Clothes HalloweenCuirass"] = "716",
        ["Clothes HalloweenPants"] = "717",
        ["Clothes HangmanBoots"] = "303",
        ["Clothes HatoftheRighteous"] = "308",
        ["Clothes HikingBoots"] = "178",
        ["Clothes HolyRollerBreeches"] = "310",
        ["Clothes Jacket"] = "179",
        ["Clothes JackolanternsBoots"] = "722",
        ["Clothes JackolanternsHelmet"] = "719",
        ["Clothes JackolanternsJacket"] = "720",
        ["Clothes JackolanternsPants"] = "721",
        ["Clothes JacktheRippersBoots"] = "710",
        ["Clothes JacktheRippersHat"] = "707",
        ["Clothes JacktheRippersJacket"] = "708",
        ["Clothes JacktheRippersPants"] = "709",
        ["Clothes JasonsBloodstainedJacket"] = "712",
        ["Clothes JasonsBloodstainedPants"] = "713",
        ["Clothes JasonsBoots"] = "714",
        ["Clothes JasonsMask"] = "711",
        ["Clothes Jeans"] = "180",
        ["Clothes JokerBoots"] = "849",
        ["Clothes JokerCape"] = "847",
        ["Clothes JokerHat"] = "846",
        ["Clothes JokerPants"] = "848",
        ["Clothes JollyRogerJacket"] = "297",
        ["Clothes LaughingGasMask"] = "304",
        ["Clothes LightweightTacticalBoots"] = "792",
        ["Clothes MaskwithSymbol"] = "738",
        ["Clothes MetalBarrelArmorForTheChestSection"] = "216",
        ["Clothes MetalBarreledTrousers"] = "217",
        ["Clothes MetalHelmet"] = "219",
        ["Clothes MetalWreckageForTheChestSection"] = "220",
        ["Clothes MetalrubbedTrousers"] = "221",
        ["Clothes MilitaryBackpack"] = "171",
        ["Clothes MilitaryBodyArmor"] = "224",
        ["Clothes MilitaryBoots"] = "226",
        ["Clothes MilitaryHelmet"] = "223",
        ["Clothes MilitaryPants"] = "225",
        ["Clothes Minekickers"] = "307",
        ["Clothes MisshapenMask"] = "312",
        ["Clothes MoraleOfficerCoat"] = "309",
        ["Clothes MotorcycleHelmetSkull"] = "715",
        ["Clothes Motorcyclehelmet"] = "215",
        ["Clothes NotFortheWeatherBreeches"] = "298",
        ["Clothes NotSoiledNotOncePants"] = "306",
        ["Clothes P40ArmorCorps"] = "556",
        ["Clothes P40Boots"] = "558",
        ["Clothes P40Helmet"] = "555",
        ["Clothes P40PowerExoskeleton"] = "557",
        ["Clothes P45ArmorCorps"] = "824",
        ["Clothes P45Boots"] = "826",
        ["Clothes P45Helmet"] = "823",
        ["Clothes P45Powerexoskeleton"] = "825",
        ["Clothes PantswithBelt"] = "740",
        ["Clothes PixelizedCamouflageTrousers"] = "794",
        ["Clothes RegularBackpack"] = "170",
        ["Clothes ReinforcedJeans"] = "213",
        ["Clothes ReinforcedTshirt"] = "212",
        ["Clothes SantaBoots"] = "868",
        ["Clothes SantaPants"] = "867",
        ["Clothes SantasBulletproofVest"] = "866",
        ["Clothes SantasHat"] = "770",
        ["Clothes ScalereinforcedBoots"] = "222",
        ["Clothes SheepskinMoccasins"] = "773",
        ["Clothes ShelterBoots"] = "836",
        ["Clothes ShelterJacket"] = "834",
        ["Clothes ShelterPants"] = "835",
        ["Clothes ShootingBoots"] = "311",
        ["Clothes SleevelessShirtWithBodyArmorVest"] = "797",
        ["Clothes Sneakers"] = "174",
        ["Clothes SpecialForcesBodyArmor"] = "232",
        ["Clothes SpecialForcesBoots"] = "234",
        ["Clothes SpecialForcesHelmet"] = "231",
        ["Clothes SpecialForcesPants"] = "233",
        ["Clothes StinkyBoots"] = "299",
        ["Clothes Sweatpants"] = "743",
        ["Clothes T Shirt"] = "175",
        ["Clothes TacticalBackpack"] = "172",
        ["Clothes TacticalBaseballCap"] = "795",
        ["Clothes TacticalReglan"] = "793",
        ["Clothes TacticalTrousersWithKneePads"] = "798",
        ["Clothes ThoracicTireArmor"] = "208",
        ["Clothes TirereinforcedBoots"] = "210",
        ["Clothes TirereinforcedPants"] = "209",
        ["Clothes TorturePants"] = "302",
        ["Clothes TrekkingBoots"] = "796",
        ["Clothes WastelandBoots"] = "811",
        ["Clothes WastelandJacket"] = "809",
        ["Clothes WastelandPants"] = "810",
        ["Clothes WhiteSlipons"] = "744",
        ["Clothes ZipHoodiewithGloves"] = "739",
        ["Clothes ZipSweatJacket"] = "742",
    
    
    },
    
    
    ["🍽️ Food Items"] = {
    
        ["Food Bananas"] = "0",
        ["Food Beer"] = "14",
        ["Food CannedFish"] = "10",
        ["Food CannedMeat"] = "38",
        ["Food Chocolate"] = "35",
        ["Food Cocoa"] = "39",
        ["Food Coconut"] = "3",
        ["Food CoconutMilk"] = "8",
        ["Food CookedFish"] = "20",
        ["Food CookedMeat"] = "273",
        ["Food CookedSweetPotato"] = "12",
        ["Food CornPorridge"] = "784",
        ["Food Cornbread"] = "17",
        ["Food Eggs"] = "15",
        ["Food Fish"] = "19",
        ["Food FishSoup"] = "785",
        ["Food FishSteak"] = "272",
        ["Food FriesforBorshch"] = "787",
        ["Food Grilledcorn"] = "319",
        ["Food Hominy"] = "783",
        ["Food Jerky"] = "5",
        ["Food MeatSteak"] = "6",
        ["Food OliveOil"] = "36",
        ["Food Omelet"] = "16",
        ["Food OrangeJuice"] = "13",
        ["Food Oranges"] = "1",
        ["Food PeachJam"] = "33",
        ["Food Pineapple"] = "2",
        ["Food PineappleJuice"] = "21",
        ["Food Pistachios"] = "32",
        ["Food PotRoast"] = "786",
        ["Food RawMeat"] = "4",
        ["Food RumBottle"] = "31",
        ["Food Sandwich"] = "18",
        ["Food SodaBottle"] = "9",
        ["Food SpecialRation"] = "30",
        ["Food Spice"] = "37",
        ["Food SpicySauce"] = "34",
        ["Food Stockfish"] = "322",
        ["Food SweetPotato"] = "11",
        ["Food Treat"] = "736",
        ["Food Trick"] = "737",
        ["Food UkrainianBorshch"] = "788",
        ["Food WaterBottle"] = "7",
    
    
    },
    
    
    ["🛋️ Furniture Items"] = {
    
        ["Furniture AntiqueCabinet"] = "473",
        ["Furniture ArmorsDeskTier2"] = "278",
        ["Furniture ArmorsDeskTier3"] = "279",
        ["Furniture ArmorsDeskTier4"] = "280",
        ["Furniture ArmorsDeskTier5"] = "281",
        ["Furniture Bed"] = "413",
        ["Furniture BigBox"] = "183",
        ["Furniture Bonfire"] = "185",
        ["Furniture BonfireWithA Barrel"] = "186",
        ["Furniture BowedSofa"] = "470",
        ["Furniture Box"] = "181",
        ["Furniture CarpentryWorkbench"] = "206",
        ["Furniture Carpet"] = "199",
        ["Furniture Carpetweavingmachine"] = "637",
        ["Furniture ChristmasDecor"] = "769",
        ["Furniture ChristmasFireplace"] = "768",
        ["Furniture ChristmasSleigh"] = "861",
        ["Furniture ChristmasTree"] = "767",
        ["Furniture CoconutChandelier"] = "476",
        ["Furniture DangerAlert"] = "203",
        ["Furniture DeskforUpgrades"] = "441",
        ["Furniture Distiller"] = "751",
        ["Furniture FishingNets"] = "193",
        ["Furniture FishingRod"] = "192",
        ["Furniture FishingSpider"] = "780",
        ["Furniture FlowerinaPotSmall"] = "477",
        ["Furniture Garden"] = "191",
        ["Furniture GingerbreadDecor"] = "862",
        ["Furniture HalloweenDecor"] = "724",
        ["Furniture HalloweenScarecrow"] = "725",
        ["Furniture HalloweenTombstone"] = "726",
        ["Furniture HandMill"] = "194",
        ["Furniture HomemadeConcreteMixer"] = "197",
        ["Furniture HomemadeSecurityAlarm"] = "204",
        ["Furniture ImprovedMeltingPlant"] = "276",
        ["Furniture Juicer"] = "190",
        ["Furniture Kitchensinkcupboard"] = "621",
        ["Furniture KitchensinkcupboardElite"] = "625",
        ["Furniture KitchensinkcupboardJeannette"] = "631",
        ["Furniture KitchensinkcupboardLoft"] = "623",
        ["Furniture KitchensinkcupboardProvence"] = "627",
        ["Furniture KitchensinkcupboardValencia"] = "629",
        ["Furniture Kitchenstovecupboard"] = "622",
        ["Furniture KitchenstovecupboardElite"] = "626",
        ["Furniture KitchenstovecupboardJeannette"] = "632",
        ["Furniture KitchenstovecupboardLoft"] = "624",
        ["Furniture KitchenstovecupboardProvence"] = "628",
        ["Furniture KitchenstovecupboardValencia"] = "630",
        ["Furniture Lintfreerugmat"] = "642",
        ["Furniture MakeshiftArmorStand"] = "461",
        ["Furniture MakeshiftCabinet"] = "460",
        ["Furniture MeatDryer"] = "189",
        ["Furniture MedicalTable"] = "277",
        ["Furniture MeltingPlant"] = "275",
        ["Furniture MiddleBox"] = "182",
        ["Furniture ModificatonTable"] = "563",
        ["Furniture Patternedrug"] = "640",
        ["Furniture PowerGenerator"] = "474",
        ["Furniture Rack"] = "689",
        ["Furniture SewingTable"] = "188",
        ["Furniture ShabbyArmchair"] = "471",
        ["Furniture ShornrugSoho"] = "645",
        ["Furniture SignalJammer"] = "750",
        ["Furniture SimpleWeaponStack"] = "462",
        ["Furniture SkeletonwithJackolanterns"] = "723",
        ["Furniture SkinDryer"] = "187",
        ["Furniture Smithy"] = "274",
        ["Furniture Stakes"] = "198",
        ["Furniture StandingTorch"] = "459",
        ["Furniture SteelWaypoint"] = "472",
        ["Furniture StoneWorkbench"] = "196",
        ["Furniture Stove"] = "782",
        ["Furniture Stripedrug"] = "641",
        ["Furniture TableforParsingTier2"] = "286",
        ["Furniture TableforParsingTier3"] = "287",
        ["Furniture TableforParsingTier4"] = "288",
        ["Furniture TableforParsingTier5"] = "289",
        ["Furniture UniversalAssemblyWorkbench"] = "688",
        ["Furniture UniversalRepairTable"] = "819",
        ["Furniture Vintagerug"] = "643",
        ["Furniture Vintagerugwithpattern"] = "644",
        ["Furniture WaterCollector"] = "184",
        ["Furniture Watermill"] = "781",
        ["Furniture WeaponsMeleeDeskTier2"] = "282",
        ["Furniture WeaponsMeleeDeskTier3"] = "283",
        ["Furniture WeaponsMeleeDeskTier4"] = "284",
        ["Furniture WeaponsMeleeDeskTier5"] = "285",
        ["Furniture WeaponsShootingDeskTier2"] = "290",
        ["Furniture WeaponsShootingDeskTier3"] = "316",
        ["Furniture WeaponsShootingDeskTier4"] = "317",
        ["Furniture WeaponsShootingDeskTier5"] = "318",
        ["Furniture Wickerrug"] = "638",
        ["Furniture Windmill"] = "195",
        ["Furniture Woolrug"] = "639",
        ["Furniture WornoutCarpet"] = "475",
        ["Furniture ZombieTrap"] = "205",
        ["FurnitureCompleted ATV"] = "646",
        ["FurnitureCompleted Bretonsofa"] = "606",
        ["FurnitureCompleted Chair"] = "600",
        ["FurnitureCompleted CornersofaBreton"] = "605",
        ["FurnitureCompleted CornersofaEden"] = "607",
        ["FurnitureCompleted CornersofaProvence"] = "609",
        ["FurnitureCompleted CornersofaRelax"] = "603",
        ["FurnitureCompleted CornersofaScotty"] = "601",
        ["FurnitureCompleted Edensofa"] = "608",
        ["FurnitureCompleted GreenFridge"] = "612",
        ["FurnitureCompleted Provencesofa"] = "610",
        ["FurnitureCompleted RedFridge"] = "613",
        ["FurnitureCompleted Relaxsofa"] = "604",
        ["FurnitureCompleted RoundTable"] = "599",
        ["FurnitureCompleted Scottysofa"] = "602",
        ["FurnitureCompleted YellowFridge"] = "611",
        
    
    
    },
    
    
    ["⛑️ Heal Items"] = {
    
        ["Heal Acidinaglassjar"] = "411",
        ["Heal Antcocktail"] = "402",
        ["Heal Antibiotics40"] = "428",
        ["Heal Bandages"] = "23",
        ["Heal Batcocktail"] = "404",
        ["Heal BiogelObservers"] = "701",
        ["Heal Biostimulator"] = "24",
        ["Heal Bloodbag"] = "396",
        ["Heal Boiledwater"] = "406",
        ["Heal BuffJet"] = "429",
        ["Heal Buffout"] = "431",
        ["Heal Bufftats"] = "430",
        ["Heal Crocodilecocktail"] = "398",
        ["Heal DisinfectantBandages"] = "442",
        ["Heal DriedRedgrassflowers"] = "408",
        ["Heal Driedants"] = "401",
        ["Heal Driedbat"] = "403",
        ["Heal Driedluminiscentshrooms"] = "410",
        ["Heal Driedpoisonousmoss"] = "409",
        ["Heal Driedthistle"] = "407",
        ["Heal EnduranceCocktail"] = "434",
        ["Heal EnergyDrink"] = "486",
        ["Heal EnergySuperDrink"] = "487",
        ["Heal FirstAidKit"] = "22",
        ["Heal HardEnduranceCocktail"] = "435",
        ["Heal HardSpeedCocktail"] = "433",
        ["Heal HerbalAntibiotic30"] = "427",
        ["Heal HerbalBuffout"] = "420",
        ["Heal HerbalPainkiller20"] = "426",
        ["Heal HerbalStimulant"] = "419",
        ["Heal Hippofat"] = "399",
        ["Heal Hyperstimulator"] = "26",
        ["Heal Immunostimulant"] = "25",
        ["Heal InstituteEnergyDrink"] = "489",
        ["Heal Jet"] = "423",
        ["Heal LuminiscentBloodBag"] = "425",
        ["Heal MedicinefromtheInstitute"] = "424",
        ["Heal MixZ1515"] = "436",
        ["Heal Neurostimulator"] = "27",
        ["Heal PainkillerSyringe"] = "29",
        ["Heal Psycho"] = "437",
        ["Heal Psychotats"] = "438",
        ["Heal Reanimator"] = "28",
        ["Heal Sanitizer"] = "412",
        ["Heal SnakeCocktail"] = "418",
        ["Heal Snakeskin"] = "400",
        ["Heal SpeedCocktail"] = "432",
        ["Heal Stimulant"] = "439",
        ["Heal SuperStimulant"] = "440",
        ["Heal SuperiorBiogelObservers"] = "702",
        ["Heal SuperiorSuperObserversBiogel"] = "816",
        ["Heal TND"] = "490",
        ["Heal WormwoodAtisepticBandaid"] = "456",
        ["Heal WormwoodSanitizer"] = "455",
        ["Heal YamsEnergySuperDrink"] = "488",
        ["Heal Yamscocktail"] = "397",
        ["Heal Ycell"] = "422",
    
    
    },
    
    ["🔨 Modifiers Items"] = {
    
        ["Modifiers AimT1"] = "589",
        ["Modifiers AimT2"] = "590",
        ["Modifiers AimT3"] = "591",
        ["Modifiers AimT4"] = "592",
        ["Modifiers AimT5"] = "593",
        ["Modifiers ButtT1"] = "574",
        ["Modifiers ButtT2"] = "575",
        ["Modifiers ButtT3"] = "576",
        ["Modifiers ButtT4"] = "577",
        ["Modifiers ButtT5"] = "578",
        ["Modifiers EnlargedMagazineT1"] = "584",
        ["Modifiers EnlargedMagazineT2"] = "585",
        ["Modifiers EnlargedMagazineT3"] = "586",
        ["Modifiers EnlargedMagazineT4"] = "587",
        ["Modifiers EnlargedMagazineT5"] = "588",
        ["Modifiers LongBarrelT1"] = "579",
        ["Modifiers LongBarrelT2"] = "580",
        ["Modifiers LongBarrelT3"] = "581",
        ["Modifiers LongBarrelT4"] = "582",
        ["Modifiers LongBarrelT5"] = "583",
        ["Modifiers MufflerT1"] = "569",
        ["Modifiers MufflerT2"] = "570",
        ["Modifiers MufflerT3"] = "571",
        ["Modifiers MufflerT4"] = "572",
        ["Modifiers MufflerT5"] = "573",
        ["Modifiers ReflexSightT1"] = "564",
        ["Modifiers ReflexSightT2"] = "565",
        ["Modifiers ReflexSightT3"] = "566",
        ["Modifiers ReflexSightT4"] = "567",
        ["Modifiers ReflexSightT5"] = "568",
        ["Modifiers TargetdesignatorT1"] = "594",
        ["Modifiers TargetdesignatorT2"] = "595",
        ["Modifiers TargetdesignatorT3"] = "596",
        ["Modifiers TargetdesignatorT4"] = "597",
        ["Modifiers TargetdesignatorT5"] = "598",
    
    },
    
    ["🪵 Resource Items"] = {
    
        ["ATV ElectricPowerSteering"] = "760",
        ["ATV Engine"] = "95",
        ["ATV GasTank"] = "258",
        ["ATV Parts"] = "759",
        ["ATV Wheel"] = "88",
        ["Alcohol"] = "405",
        ["Aluminum"] = "529",
        ["AluminumIngot"] = "502",
        ["AluminumPlate"] = "503",
        ["Ammonia"] = "321",
        ["AnimalBones"] = "83",
        ["AnimalHide"] = "60",
        ["AntiradiationHeadProtectionBlueprint"] = "762",
        ["AntiradiationProtectiveBootsBlueprint"] = "765",
        ["AntiradiationProtectiveJacketBlueprint"] = "763",
        ["AntiradiationProtectivePantsBlueprint"] = "764",
        ["ArenaCap"] = "844",
        ["ArenaCredits"] = "817",
        ["ArmBarrel"] = "251",
        ["ArmorRepairKit"] = "293",
        ["Artifact"] = "446",
        ["AssaultBlasterBlueprint"] = "700",
        ["B Ti3AuAlloyArmorPlate"] = "504",
        ["Bamboo"] = "45",
        ["BankerPicture"] = "341",
        ["BasicBaseArmor"] = "264",
        ["BasicMeleeWeaponBase"] = "267",
        ["Batteries"] = "532",
        ["Bearing"] = "91",
        ["Biofuels"] = "752",
        ["BlueprintSteeldoganchor"] = "485",
        ["BoatBlueprint"] = "533",
        ["BoatEngine"] = "90",
        ["BoatSteeringWheel"] = "495",
        ["Boatgastank"] = "494",
        ["Bolts"] = "85",
        ["BottlewiththebloodoftheHighCadaver"] = "483",
        ["Butt"] = "247",
        ["C4"] = "820",
        ["CadaverTooth"] = "332",
        ["Canofgreenpaint"] = "619",
        ["Canofgreypaint"] = "618",
        ["Canofredpaint"] = "616",
        ["Canofwhitepaint"] = "617",
        ["Cap"] = "348",
        ["Carpetyarn"] = "620",
        ["CausticMixture"] = "448",
        ["CerberussEar"] = "790",
        ["Charcoal"] = "66",
        ["Cigars"] = "330",
        ["Clay"] = "46",
        ["ClaysandMortar"] = "64",
        ["Cloth"] = "55",
        ["Coal"] = "492",
        ["CocoaBeans"] = "40",
        ["CopperBar"] = "74",
        ["CopperOre"] = "53",
        ["CopperPlate"] = "75",
        ["Corn"] = "44",
        ["CornFlour"] = "59",
        ["CornSeeds"] = "43",
        ["Credit"] = "458",
        ["CrocodileHide"] = "62",
        ["CrocodileLeather"] = "63",
        ["CrocodileTooth"] = "257",
        ["Crystal"] = "501",
        ["CuneaticDisk"] = "450",
        ["DenseFabric"] = "56",
        ["DevilsBrew"] = "443",
        ["DistillerBlueprint"] = "749",
        ["DogCollar"] = "343",
        ["DriedShrooms"] = "421",
        ["DuctTape"] = "87",
        ["EM Grenade"] = "869",
        ["ElectricHammerBlueprint"] = "673",
        ["ElectricHammerT2Blueprint"] = "674",
        ["ElectricHammerT3Blueprint"] = "675",
        ["ElectricHammerT4Blueprint"] = "676",
        ["ElectricHammerT5Blueprint"] = "677",
        ["ElectronicParts"] = "81",
        ["Energy"] = "779",
        ["EnginePart"] = "97",
        ["Ethanol"] = "93",
        ["ExplosiveMix"] = "447",
        ["FashionMagazine"] = "342",
        ["FireSwordBlueprint"] = "668",
        ["FireSwordT2Blueprint"] = "669",
        ["FireSwordT3Blueprint"] = "670",
        ["FireSwordT4Blueprint"] = "671",
        ["FireSwordT5Blueprint"] = "672",
        ["FishBait"] = "295",
        ["Fishnet"] = "58",
        ["Flashlight"] = "96",
        ["FlaskofDubiousLiquid"] = "444",
        ["Floralupholsteryfabric"] = "615",
        ["GasCanister"] = "84",
        ["GiftInA BlueBox"] = "864",
        ["GiftInA RedBox"] = "863",
        ["GlassShards"] = "255",
        ["Gold"] = "270",
        ["GoldBar"] = "335",
        ["GoldCup"] = "509",
        ["GoldJewelry"] = "814",
        ["GoldPlate"] = "512",
        ["GoldSacrificialJewelry"] = "507",
        ["Gunlock"] = "243",
        ["Hardwood"] = "49",
        ["HardwoodPlank"] = "67",
        ["Inhaler"] = "815",
        ["IronBar"] = "71",
        ["IronOre"] = "52",
        ["IronPlate"] = "72",
        ["JollyRoger"] = "334",
        ["KeyCard"] = "336",
        ["Leather"] = "61",
        ["Limestone"] = "812",
        ["Lipstick"] = "339",
        ["LocalMap"] = "329",
        ["MacrophaseG Lmeter"] = "482",
        ["MaskoftheLastOracle"] = "454",
        ["MechanicalHarpoonBlueprint"] = "678",
        ["MechanicalHarpoonT2Blueprint"] = "679",
        ["MechanicalHarpoonT3Blueprint"] = "680",
        ["MechanicalHarpoonT4Blueprint"] = "681",
        ["MechanicalHarpoonT5Blueprint"] = "682",
        ["Medications"] = "331",
        ["MetalBarrel"] = "82",
        ["MetalContainer"] = "445",
        ["Microcircuit"] = "89",
        ["Mirror"] = "338",
        ["Money"] = "340",
        ["Nails"] = "73",
        ["NaturalRawGemCrystal"] = "500",
        ["Note"] = "337",
        ["Notes"] = "320",
        ["OilBarrel"] = "260",
        ["OldPirateMap"] = "804",
        ["P40ArmorCorpsBlueprint"] = "560",
        ["P40BootsBlueprint"] = "562",
        ["P40HelmetBlueprint"] = "559",
        ["P40PowerExoskeletonBlueprint"] = "561",
        ["Paleocontactee"] = "451",
        ["PieceofCadaverFlesh"] = "333",
        ["PlaneTickets"] = "346",
        ["PlasticWreckage"] = "256",
        ["Plexiglass"] = "493",
        ["PowerGeneratorBlueprint"] = "761",
        ["PropellerSeaplane"] = "262",
        ["Quicklime"] = "813",
        ["Radio"] = "326",
        ["RareChip"] = "327",
        ["ReinforcedATV Spring"] = "758",
        ["ReinforcedArmorBase"] = "265",
        ["ReinforcedMeleeWeaponBase"] = "268",
        ["ReinforcedTransmissionFork"] = "757",
        ["Remains"] = "791",
        ["Rope"] = "57",
        ["RubberParts"] = "80",
        ["RustyArmBarrel"] = "252",
        ["RustyButt"] = "248",
        ["RustyGunlock"] = "244",
        ["RustyWeaponParts"] = "240",
        ["SacredCoveKey"] = "452",
        ["Sand"] = "47",
        ["Sandstone"] = "51",
        ["SandstoneBrick"] = "69",
        ["ScrapMetal"] = "70",
        ["ScrapsOfAnOldPirateMap"] = "803",
        ["SeaplaneFuelTank"] = "259",
        ["SensorMetalCollar"] = "345",
        ["SignalAmplifier"] = "263",
        ["SignalJammerBlueprint"] = "748",
        ["Silver"] = "530",
        ["SilverBar"] = "510",
        ["SilverCup"] = "531",
        ["SilverPlate"] = "516",
        ["SilverSacrificialJewelry"] = "508",
        ["SleepingMother"] = "453",
        ["SmallBlasterBlueprint"] = "554",
        ["Smartphone"] = "344",
        ["SpareParts"] = "328",
        ["SteelArmBarrel"] = "253",
        ["SteelArmorBase"] = "266",
        ["SteelArmorPlate"] = "506",
        ["SteelBar"] = "76",
        ["SteelButt"] = "249",
        ["SteelDogAnchor"] = "484",
        ["SteelGunlock"] = "245",
        ["SteelMeleeWeaponBase"] = "269",
        ["SteelPlate"] = "77",
        ["SteelWeaponParts"] = "241",
        ["SteeringWheelATV"] = "261",
        ["Stripedupholsteryfabric"] = "614",
        ["SweetPotatoFiber"] = "42",
        ["SweetPotatoStalk"] = "41",
        ["TND Blueprint"] = "491",
        ["TacticalBlasterBlueprint"] = "698",
        ["TemperedGlassBottle"] = "449",
        ["TitanBar"] = "78",
        ["TitanOre"] = "54",
        ["TitanPlate"] = "79",
        ["TitaniumArmBarrel"] = "254",
        ["TitaniumArmorBase"] = "347",
        ["TitaniumArmorPlate"] = "505",
        ["TitaniumButt"] = "250",
        ["TitaniumGunlock"] = "246",
        ["TitaniumWeaponParts"] = "242",
        ["ToyBear"] = "789",
        ["Transistor"] = "94",
        ["TwohandedAxBlueprint"] = "683",
        ["TwohandedAxT2Blueprint"] = "684",
        ["TwohandedAxT3Blueprint"] = "685",
        ["TwohandedAxT4Blueprint"] = "686",
        ["TwohandedAxT5Blueprint"] = "687",
        ["UniversalMultitool"] = "98",
        ["ValuableWood"] = "50",
        ["ValuableWoodPlank"] = "68",
        ["WeaponParts"] = "239",
        ["WeaponRepairKit"] = "294",
        ["Wiring"] = "92",
        ["WomanTshirt"] = "806",
        ["WomensShorts"] = "807",
        ["Wood"] = "48",
        ["WoodPlank"] = "65",
        ["Wrench"] = "86",
        ["XpBoosters"] = "271",
    
    },
    
    ["🗑️ Other items"] = {
    
        ["AlarmClock"] = "373",
        ["AncientPottery"] = "514",
        ["AntifreezeBottle"] = "363",
        ["Ashtray"] = "389",
        ["BPS1StickersFree"] = "691",
        ["BPS1StickersPremium"] = "690",
        ["Beaker"] = "522",
        ["Binoculars"] = "377",
        ["BiometricScanner"] = "388",
        ["BloodiedBoot"] = "497",
        ["Blowtorch"] = "355",
        ["BluePlasticCanister"] = "367",
        ["Boothammer"] = "548",
        ["Breadbox"] = "546",
        ["Brokenkeyboard"] = "541",
        ["Brokenlaptop"] = "537",
        ["Brokenmonitor"] = "538",
        ["CapacitywithLiquidNitrogen"] = "390",
        ["CartridgeBox"] = "496",
        ["Chain"] = "292",
        ["ChemicalFlask"] = "382",
        ["Clamp"] = "376",
        ["CoffeeCan"] = "387",
        ["Coffeepot"] = "393",
        ["Compass"] = "378",
        ["CrackedMagnifyingGlass"] = "521",
        ["DeckofCards"] = "551",
        ["ElectroschemeoftheRobot"] = "364",
        ["EmptyBeerBottle"] = "369",
        ["EmptyBottle"] = "200",
        ["EmptyDrinkCan"] = "202",
        ["EmptyGreenBottle"] = "366",
        ["EmptyGreyBottle"] = "365",
        ["EmptySprayCan"] = "368",
        ["EmptyTinCan"] = "201",
        ["EmptyWhiskeyBottle"] = "370",
        ["FlashDrive"] = "380",
        ["GPS Navigator"] = "379",
        ["Glue"] = "550",
        ["Hacksaw"] = "385",
        ["Hairbrush"] = "518",
        ["Hose"] = "527",
        ["Hourglass"] = "528",
        ["ImprovedGuidanceChip"] = "362",
        ["JewelryofNoValue"] = "513",
        ["Key"] = "552",
        ["LaboratoryFunnel"] = "526",
        ["Luminodiode"] = "375",
        ["Magnet"] = "517",
        ["MaraudersCoordinatesPurchase"] = "766",
        ["MeasuringCup"] = "381",
        ["MedicalScissors"] = "350",
        ["Microscope"] = "351",
        ["MicrotubewithCap"] = "525",
        ["MilitaryMicrocircuit"] = "371",
        ["Oiler"] = "386",
        ["Oldharddrive"] = "542",
        ["Pan"] = "547",
        ["Pen"] = "384",
        ["Phone"] = "457",
        ["PieceOfMetalPipe"] = "291",
        ["PlasticPhotoFrame"] = "520",
        ["Pliers"] = "536",
        ["PoliceBadge"] = "391",
        ["Pot"] = "392",
        ["PowerfulMicroscope"] = "352",
        ["RatPoison"] = "349",
        ["Rebar"] = "539",
        ["RecordPlayer"] = "498",
        ["Report"] = "534",
        ["ReportCreationInstruction"] = "535",
        ["Robothead"] = "821",
        ["Scalpel"] = "359",
        ["Screwdriver"] = "354",
        ["ShardsofAncientUtensils"] = "515",
        ["SilverDish"] = "511",
        ["SilverPlug"] = "357",
        ["SilverPocketWatch"] = "358",
        ["Silvermedallion"] = "540",
        ["Silvertableknife"] = "545",
        ["Soap"] = "519",
        ["StrangeDevice"] = "845",
        ["TableFan"] = "353",
        ["Tableknife"] = "544",
        ["Tablespoon"] = "549",
        ["Tabletcard"] = "818",
        ["TapeCassette"] = "499",
        ["TestTube"] = "523",
        ["TestTubeRack"] = "524",
        ["Toaster"] = "361",
        ["Tray"] = "543",
        ["TurpentineBottle"] = "360",
        ["Tweezers"] = "383",
        ["Typewriter"] = "356",
        ["VoiceRecorder"] = "372",
        ["Wristwatch"] = "374",
    
    
    },
    
    ["⚔️ Weapons"] = {
        [" 45caliberSW Schofield"] = "858",
        [" AK47Deathbringer"] = "730",
        [" AK74"] = "151",
        [" AK74_"] = "831",
        [" AdvancedMachete"] = "140",
        [" AlienShockBaton"] = "706",
        [" AssaultBlaster"] = "699",
        [" AssaultRifle"] = "158",
        [" AtomicPulverizer"] = "746",
        [" Atomizer"] = "745",
        [" Ax"] = "139",
        [" AxPipe"] = "118",
        [" Bat"] = "132",
        [" BatWithChains"] = "138",
        [" BayonetKnife"] = "122",
        [" BigAlienShockBaton"] = "704",
        [" BoneAx"] = "117",
        [" BoneHammer"] = "116",
        [" BoneKnife"] = "119",
        [" ChristmasBat"] = "860",
        [" Colt"] = "829",
        [" Copperax"] = "463",
        [" Copperpickaxe"] = "464",
        [" Cudgel"] = "123",
        [" CudgelSteelFangs"] = "417",
        [" CudgelWithFangs"] = "120",
        [" Cutter"] = "133",
        [" Cutting"] = "150",
        [" Dagon"] = "325",
        [" DeadlyCudgel"] = "394",
        [" Disintegrator"] = "747",
        [" Doublebarrelshotgun"] = "843",
        [" ElectricHammer"] = "649",
        [" ElectricHammerT2"] = "656",
        [" ElectricHammerT3"] = "657",
        [" ElectricHammerT4"] = "658",
        [" ElectricHammerT5"] = "659",
        [" ElectricTomahawk"] = "141",
        [" EsculapianPistol"] = "323",
        [" FireAxe"] = "128",
        [" FirePick"] = "127",
        [" FireSword"] = "648",
        [" FireSwordT2"] = "652",
        [" FireSwordT3"] = "653",
        [" FireSwordT4"] = "654",
        [" FireSwordT5"] = "655",
        [" Frankenstein"] = "469",
        [" Galil"] = "166",
        [" GearAxe"] = "130",
        [" GhoulGun"] = "833",
        [" Glock17"] = "859",
        [" HalloweenDoubleBarrelShotgun"] = "856",
        [" HalloweenKnife"] = "735",
        [" HalloweenPistol"] = "727",
        [" HalloweenPunisher"] = "732",
        [" HalloweenWolfhound"] = "855",
        [" HomemadeAx"] = "135",
        [" HomemadeCrossbow"] = "146",
        [" HomemadeGun"] = "143",
        [" HomemadePistolMachineGun"] = "145",
        [" HomemadeRevolver"] = "142",
        [" HomemadeShotgun"] = "144",
        [" HomemadeSword"] = "137",
        [" HybridMachine"] = "159",
        [" ImprovedBlaster"] = "827",
        [" ImprovedSubmachineGun"] = "828",
        [" IronAx"] = "125",
        [" IronPickaxe"] = "124",
        [" JackolanternsPistol"] = "728",
        [" JacktheRippersKnife"] = "734",
        [" JasonsMachete"] = "733",
        [" JollierJack"] = "731",
        [" LargecaliberRifle"] = "168",
        [" LastJudgment"] = "131",
        [" LightMachineGun"] = "169",
        [" M16A2Christmas"] = "857",
        [" M4"] = "842",
        [" MP5Machine"] = "152",
        [" Mace"] = "134",
        [" Machete"] = "136",
        [" MachineGun"] = "165",
        [" Macuahuitl"] = "395",
        [" MechanicalHarpoon"] = "650",
        [" MechanicalHarpoonT2"] = "660",
        [" MechanicalHarpoonT3"] = "661",
        [" MechanicalHarpoonT4"] = "662",
        [" MechanicalHarpoonT5"] = "663",
        [" MediumAlienShockBaton"] = "705",
        [" Mount"] = "129",
        [" ObserverEnergyWeapons"] = "822",
        [" Pistol"] = "149",
        [" PoliceShotgun"] = "153",
        [" RareGun"] = "154",
        [" RareMachine"] = "167",
        [" RareRifle"] = "161",
        [" Revolver"] = "148",
        [" Ritualknife"] = "414",
        [" SVD"] = "157",
        [" SW Magnum"] = "830",
        [" ScarabGun"] = "324",
        [" Shovel"] = "126",
        [" SmallAlienShockBaton"] = "703",
        [" SmallBlaster"] = "553",
        [" SmugglingPistol"] = "147",
        [" SniperRifle"] = "163",
        [" SnowballGun"] = "778",
        [" Spear"] = "121",
        [" SpecialForcesPistol"] = "160",
        [" SpecialForcesShotgun"] = "156",
        [" SteelGun"] = "155",
        [" Steelax"] = "465",
        [" Steelax2"] = "478",
        [" Steelpickaxe"] = "466",
        [" Steelpickaxe2"] = "479",
        [" SubmachineGun"] = "164",
        [" TEC9"] = "832",
        [" TacticalBlaster"] = "697",
        [" TitaniumGun"] = "162",
        [" Titaniumax"] = "467",
        [" Titaniumax2"] = "480",
        [" Titaniumpickaxe"] = "468",
        [" Titaniumpickaxe2"] = "481",
        [" Tomahawk"] = "416",
        [" TwohandedAx"] = "651",
        [" TwohandedAxT2"] = "664",
        [" TwohandedAxT3"] = "665",
        [" TwohandedAxT4"] = "666",
        [" TwohandedAxT5"] = "667",
        [" Winchester1887"] = "854",
        [" Wingofdeath"] = "415",
        [" Wolfhound"] = "841",
    
    },
}  


ItemExplorer.gasoline_original_values = nil
ItemExplorer.gasoline_modified_count = 0
ItemExplorer.coin_addresses = nil
ItemExplorer.last_used_menu = nil



-- ========================================================
-- FUNGSI SEARCH ITEM (BARU)
-- ========================================================
function ItemExplorer.search_items()
    -- Input keyword
    local search_prompt = gg.prompt({
        "🔍 Search item by name:",
        "📝 (Type part of item name)"
    }, {"", "Case insensitive search"}, {"text", "checkbox"})
    
    if not search_prompt or search_prompt[1] == "" then
        return nil
    end
    
    local keyword = search_prompt[1]
    local case_insensitive = search_prompt[2]
    
    -- Kumpulkan semua item yang match
    local search_results = {}
    
    for category_name, subcategories in pairs(ItemExplorer.item_data) do
        if type(subcategories) == "table" then
            for subcategory_name, items in pairs(subcategories) do
                if type(items) == "table" then
                    -- Ada subkategori
                    for item_name, item_value in pairs(items) do
                        local search_name = case_insensitive and item_name:lower() or item_name
                        local search_keyword = case_insensitive and keyword:lower() or keyword
                        
                        if search_name:find(search_keyword, 1, true) then
                            table.insert(search_results, {
                                display_name = item_name,
                                value = item_value,
                                category = category_name,
                                subcategory = subcategory_name,
                                full_path = category_name .. " → " .. subcategory_name .. " → " .. item_name
                            })
                        end
                    end
                else
                    -- Tidak ada subkategori (item langsung)
                    local item_name = subcategory_name
                    local item_value = items
                    local search_name = case_insensitive and item_name:lower() or item_name
                    local search_keyword = case_insensitive and keyword:lower() or keyword
                    
                    if search_name:find(search_keyword, 1, true) then
                        table.insert(search_results, {
                            display_name = item_name,
                            value = item_value,
                            category = category_name,
                            subcategory = nil,
                            full_path = category_name .. " → " .. item_name
                        })
                    end
                end
            end
        end
    end
    
    -- Sort results
    table.sort(search_results, function(a, b)
        return a.display_name < b.display_name
    end)
    
    -- Tampilkan hasil
    if #search_results == 0 then
        gg.alert("❌ No items found for: '" .. keyword .. "'")
        return nil
    end
    
    -- Buat list pilihan
    local choices = {}
    for _, item in ipairs(search_results) do
        table.insert(choices, item.display_name)
    end
    
    local choice = gg.choice(choices, nil, 
        "🔍 SEARCH RESULTS (" .. #search_results .. " items found)")
    
    if choice then
        return search_results[choice]
    end
    
    return nil
end

-- ========================================================
-- UPDATE AUTO SWAP FUNCTION - VERSI DENGAN SEARCH
-- ========================================================
function ItemExplorer.auto_swap_item_with_subcategories()
    if ItemExplorer.last_used_menu ~= "auto_swap" then
        gg.clearResults()
        ItemExplorer.last_used_menu = "auto_swap"
    end
    
    local count = gg.getResultCount()
    
    if count == 1 then
        local result = gg.getResults(1)
        local addr = result[1].address
        
        -- PILIH KATEGORI TERLEBIH DAHULU
        local categories = {}
        for cat, _ in pairs(ItemExplorer.item_data) do
            table.insert(categories, cat)
        end
        table.sort(categories)
        
        -- TAMBAH OPTION "🔍 SEARCH ITEM" DI AWAL
        table.insert(categories, 1, "🔍 SEARCH ITEM")
        
        local cat_choice = gg.choice(categories, nil, "🔄 SELECT CATEGORY")
        
        if not cat_choice then
            return
        end
        
        -- JIKA PILIH SEARCH
        if cat_choice == 1 then
            local selected_item = ItemExplorer.search_items()
            
            if selected_item then
                -- Langsung swap item yang ditemukan
                local qty_prompt = gg.prompt({
                    "Enter quantity for " .. selected_item.display_name .. ":"
                }, {"9999"}, {"number"})
                
                if qty_prompt then
                    gg.setVisible(false)
                    gg.setValues({
                        {address = addr - 4, flags = gg.TYPE_DWORD, value = selected_item.value},
                        {address = addr, flags = gg.TYPE_DWORD, value = tonumber(qty_prompt[1]) or 9999}
                    })
                    gg.toast("✅ Changed to: " .. selected_item.display_name)
                end
            end
            
            return  -- Kembali ke menu
        end
        
        -- JIKA PILIH KATEGORI BIASA
        local selected_category = categories[cat_choice]
        local subcategories_data = ItemExplorer.item_data[selected_category]
        
        -- Cek apakah ada subkategori
        local has_subcategories = false
        if type(subcategories_data) == "table" then
            for _, value in pairs(subcategories_data) do
                if type(value) == "table" then
                    has_subcategories = true
                    break
                end
            end
        end
        
        if has_subcategories then
            -- Tampilkan subkategori
            local subcats = {}
            for subcat_name, _ in pairs(subcategories_data) do
                table.insert(subcats, subcat_name)
            end
            table.sort(subcats)
            
            local subcat_choice = gg.choice(subcats, nil, selected_category .. " → SUBCATEGORIES")
            
            if not subcat_choice then
                return
            end
            
            -- Pilih subkategori spesifik
            local selected_subcat = subcats[subcat_choice]
            local items_data = subcategories_data[selected_subcat]
            
            if type(items_data) == "table" then
                local items_list = {}
                for item_name, item_value in pairs(items_data) do
                    table.insert(items_list, {
                        display_name = item_name,
                        value = item_value,
                        category = selected_category,
                        subcategory = selected_subcat,
                        full_path = selected_category .. " → " .. selected_subcat .. " → " .. item_name
                    })
                end
                
                table.sort(items_list, function(a, b) 
                    return a.display_name < b.display_name
                end)
                
                -- Hanya tampilkan nama (tanpa ID)
                local item_choices = {}
                for _, item in ipairs(items_list) do
                    table.insert(item_choices, item.display_name)
                end
                
                local item_choice = gg.choice(item_choices, nil, 
                    selected_category .. " → " .. selected_subcat)
                
                if item_choice then
                    local selected_item = items_list[item_choice]
                    local qty_prompt = gg.prompt({
                        "Enter new quantity for " .. selected_item.display_name .. ":"
                    }, {"9999"}, {"number"})
                    
                    if qty_prompt then
                        gg.setVisible(false)
                        gg.setValues({
                            {address = addr - 4, flags = gg.TYPE_DWORD, value = selected_item.value},
                            {address = addr, flags = gg.TYPE_DWORD, value = tonumber(qty_prompt[1]) or 9999}
                        })
                        gg.toast("✅ Changed to: " .. selected_item.display_name)
                    end
                end
            end
        else
            -- Tidak ada subkategori, langsung tampilkan item
            local items_list = {}
            for item_name, item_value in pairs(subcategories_data) do
                table.insert(items_list, {
                    display_name = item_name,
                    value = item_value,
                    category = selected_category,
                    subcategory = nil,
                    full_path = selected_category .. " → " .. item_name
                })
            end
            
            table.sort(items_list, function(a, b) 
                return a.display_name < b.display_name
            end)
            
            -- Hanya tampilkan nama (tanpa ID)
            local item_choices = {}
            for _, item in ipairs(items_list) do
                table.insert(item_choices, item.display_name)
            end
            
            local item_choice = gg.choice(item_choices, nil, "🔄 " .. selected_category)
            
            if item_choice then
                local selected_item = items_list[item_choice]
                local qty_prompt = gg.prompt({
                    "Enter new quantity for " .. selected_item.display_name .. ":"
                }, {"9999"}, {"number"})
                
                if qty_prompt then
                    gg.setVisible(false)
                    gg.setValues({
                        {address = addr - 4, flags = gg.TYPE_DWORD, value = selected_item.value},
                        {address = addr, flags = gg.TYPE_DWORD, value = tonumber(qty_prompt[1]) or 9999}
                    })
                    gg.toast("✅ Changed to: " .. selected_item.display_name)
                end
            end
        end
        
        return
    end

    -- Jika belum ada hasil, cari dulu
    local prompt_label = (count == 0 and "🔄 Enter quantity to search:" or "🔄 Refine ("..count.." results):")
    local prompt = gg.prompt({prompt_label}, {""}, {"number"})
    
    if prompt and prompt[1] ~= "" then
        gg.setVisible(false)
        if count == 0 then
            gg.clearResults()
            gg.setRanges(gg.REGION_ANONYMOUS)
            gg.searchNumber(prompt[1], gg.TYPE_DWORD)
        else
            gg.refineNumber(prompt[1], gg.TYPE_DWORD)
        end
        gg.toast("🔄 Found: " .. gg.getResultCount())
    end
end







-- ========================================================
-- EDIT QUANTITY FUNCTION
-- ========================================================

function ItemExplorer.edit_quantity()
    if ItemExplorer.last_used_menu ~= "edit_quantity" then
        gg.clearResults()
        ItemExplorer.last_used_menu = "edit_quantity"
    end
    
    local count = gg.getResultCount()
    
    if count == 1 then
        local result = gg.getResults(1)
        local addr = result[1].address
        local current_val = gg.getValues({{address = addr, flags = gg.TYPE_DWORD}})[1].value
        
        local qty_prompt = gg.prompt({
            "Edit value:"
        }, {tostring(current_val)}, {"number"})
        
        if qty_prompt then
            gg.setVisible(false)
            gg.setValues({{address = addr, value = tonumber(qty_prompt[1]) or current_val, flags = gg.TYPE_DWORD}})
            gg.toast("✅ Quantity changed to: " .. qty_prompt[1])
        end
        return
    end

    local prompt_label = (count == 0 and "🔢 Enter value to search:" or "🔢 Refine ("..count.." results):")
    local prompt = gg.prompt({prompt_label}, {""}, {"number"})
    
    if prompt and prompt[1] ~= "" then
        gg.setVisible(false)
        if count == 0 then
            gg.clearResults()
            gg.setRanges(gg.REGION_ANONYMOUS)
            gg.searchNumber(prompt[1], gg.TYPE_DWORD)
        else
            gg.refineNumber(prompt[1], gg.TYPE_DWORD)
        end
        gg.toast("🔢 Found: " .. gg.getResultCount())
    end
end





-- ========================================================
-- RESET SEARCH FUNCTION
-- ========================================================

function ItemExplorer.reset_search()
    gg.clearResults()
    ItemExplorer.last_used_menu = nil
    gg.toast("🧹 Search results cleared!")
end


-- ========================================================
-- FUNGSI UNTUK MENGHITUNG TOTAL ITEM
-- ========================================================

function ItemExplorer.get_total_items_count()
    local total_count = 0
    
    for category_name, subcategories in pairs(ItemExplorer.item_data) do
        if type(subcategories) == "table" then
            for subcategory_name, items in pairs(subcategories) do
                if type(items) == "table" then
                    for _ in pairs(items) do
                        total_count = total_count + 1
                    end
                else
                    total_count = total_count + 1
                end
            end
        end
    end
    
    return total_count
end

-- ========================================================
-- UPDATE FUNGSI GET_MENU_STATUS UNTUK MENAMPILKAN TOTAL ITEM
-- ========================================================

function ItemExplorer.get_menu_status()
    local count = gg.getResultCount()
    local total_items = ItemExplorer.get_total_items_count()
    local status = ""
    
    if count > 0 then
        if ItemExplorer.last_used_menu == "auto_swap" then
            status = "🔄 AUTO SWAP: " .. count .. " results"
        elseif ItemExplorer.last_used_menu == "edit_quantity" then
            status = "🔢 EDIT QTY: " .. count .. " results"
        elseif ItemExplorer.last_used_menu == "coin_scanner" then
            status = "💰 COINS: " .. count .. " results"
        else
            status = "🔍 " .. count .. " results"
        end
    else
        status = "🔍 No active search"
    end
    
    if ItemExplorer.gasoline_modified_count > 0 then
        status = status .. " | ⛽(" .. ItemExplorer.gasoline_modified_count .. ")"
    end
    
    -- Tambahkan total item database
    status = status .. " \n📦 Total " .. total_items .. " items Database"
    
    
    return status
end


-- ========================================================
-- FUNGSI UNTUK MELIHAT LIST ITEM SAJA (TANPA ID)
-- ========================================================

function ItemExplorer.show_item_list_only()
    -- PILIH KATEGORI TERLEBIH DAHULU
    local categories = {}
    for cat, _ in pairs(ItemExplorer.item_data) do
        table.insert(categories, cat)
    end
    table.sort(categories)
    
    local cat_choice = gg.choice(categories, nil, "📋 VIEW ITEM LIST - SELECT CATEGORY")
    
    if not cat_choice then
        return
    end
    
    local selected_category = categories[cat_choice]
    local subcategories_data = ItemExplorer.item_data[selected_category]
    
    -- Cek apakah ada subkategori
    local has_subcategories = false
    if type(subcategories_data) == "table" then
        for _, value in pairs(subcategories_data) do
            if type(value) == "table" then
                has_subcategories = true
                break
            end
        end
    end
    
    if has_subcategories then
        -- Tampilkan subkategori
        local subcats = {}
        for subcat_name, _ in pairs(subcategories_data) do
            table.insert(subcats, subcat_name)
        end
        table.sort(subcats)
        
        local subcat_choice = gg.choice(subcats, nil, selected_category .. " → SUBCATEGORIES")
        
        if not subcat_choice then
            return
        end
        
        -- Pilih subkategori spesifik
        local selected_subcat = subcats[subcat_choice]
        local items_data = subcategories_data[selected_subcat]
        
        if type(items_data) == "table" then
            local items_list = {}
            for item_name, item_value in pairs(items_data) do
                table.insert(items_list, {
                    display_name = item_name,
                    value = item_value,
                    category = selected_category,
                    subcategory = selected_subcat
                })
            end
            
            table.sort(items_list, function(a, b) 
                return a.display_name < b.display_name
            end)
            
            -- Buat string untuk menampilkan semua item (TANPA ID)
            local item_text = "📋 ITEM LIST: " .. selected_category .. " → " .. selected_subcat .. "\n"
            item_text = item_text .. "━━━━━━━━━━━━━━━━━━━━━━\n"
            
            for i, item in ipairs(items_list) do
                item_text = item_text .. "• " .. item.display_name .. "\n"
            end
            
            item_text = item_text .. "\n━━━━━━━━━━━━━━━━━━━━━━\n"
            item_text = item_text .. "Total: " .. #items_list .. " items"
            
            gg.alert(item_text)
        end
    else
        -- Tidak ada subkategori, langsung tampilkan item
        local items_list = {}
        for item_name, item_value in pairs(subcategories_data) do
            table.insert(items_list, {
                display_name = item_name,
                value = item_value,
                category = selected_category,
                subcategory = nil
            })
        end
        
        table.sort(items_list, function(a, b) 
            return a.display_name < b.display_name
        end)
        
        -- Buat string untuk menampilkan semua item (TANPA ID)
        local item_text = "📋 ITEM LIST: " .. selected_category .. "\n"
        item_text = item_text .. "━━━━━━━━━━━━━━━━━━━━━━\n"
        
        for i, item in ipairs(items_list) do
            item_text = item_text .. "• " .. item.display_name .. "\n"
        end
        
        item_text = item_text .. "\n━━━━━━━━━━━━━━━━━━━━━━\n"
        item_text = item_text .. "Total: " .. #items_list .. " items"
        
        gg.alert(item_text)
    end
end


----------------------------------------------------
-- CHECK ARCH
----------------------------------------------------
local TI = gg.getTargetInfo()
if not TI or not TI.x64 then
    gg.alert("❌ ARM64 ONLY")
    os.exit()
end



----------------------------------------------------
-- UPDATE STATE / CACHE (TAMBAH UNLIMITED GOLD)
----------------------------------------------------
STATE = {
    NO_DAMAGE = false,
    SURVIVAL  = false,
    NO_WEAPON_DURABILITY = false,
    NO_ARMOR_DURABILITY = false,
    FREE_CRAFT = false,
    FREE_BUILD = false,
    FREE_UPGRADE = false,
    UNLIMITED_GOLD = false  -- TAMBAH INI
}

CACHE = {
    NO_DAMAGE = {},
    HUNGER = {},
    WATER  = {},
    WEAPON_DURA = {},
    ARMOR_DURA = {},
    FREE_CRAFT = {},
    FREE_BUILD = {},
    FREE_UPGRADE = {},
    UNLIMITED_GOLD = {}  -- TAMBAH INI
}

----------------------------------------------------
-- UPDATE METHOD INFO (TAMBAH FREE BUILD METHODS)
----------------------------------------------------
METHOD = {
    DAMAGE = {
        CLASS = "PlayerMainCharacterController",
        NAME  = "TakeDamage",
        ADDR  = {}
    },
    HUNGER = {
        CLASS = "GameManager",
        NAME  = "get_hunger",
        ADDR  = {}
    },
    WATER = {
        CLASS = "GameManager",
        NAME  = "get_water",
        ADDR  = {}
    },
    WEAPON_DURA = {
        CLASS = "PlayerMainCharacterController",
        NAME  = "ChangeDurabilityWeapon",
        ADDR  = {}
    },
    ARMOR_DURA = {
        CLASS = "PlayerMainCharacterController",
        NAME  = "ReduceArmorDurabilityOnHit",
        ADDR  = {}
    },
    -- FREE CRAFT METHODS
    CAN_CRAFT = {
        CLASS = "CraftingWindowStandard",
        NAME  = "CanCraft",
        ADDR  = {}
    },
    CAN_REMOVE_REQUIRED_ITEMS = {
        CLASS = "CraftingWindowStandard", 
        NAME  = "CanRemoveRequiredItems",
        ADDR  = {}
    },
    -- FREE BUILD METHODS (DARI BuildingAssistant)
    IS_REQUIRED_INVENTORY_ENOUGH = {
        CLASS = "BuildingAssistant",
        NAME  = "IsRequiredInventoryEnough",
        ADDR  = {}
    },
    CAN_PLACE_BUILDING = {
        CLASS = "BuildingAssistant",
        NAME  = "IsBuildingPermitted",  -- Method penting untuk cek build
        ADDR  = {}
    },
    WRITE_OFF_REQUIRED_INVENTORY = {
        CLASS = "BuildingAssistant",
        NAME  = "WriteOffRequeredInventory",  -- Method untuk konsumsi bahan
        ADDR  = {}
    },
    -- FREE UPGRADE METHODS (TERPISAH!)
     -- FREE UPGRADE METHODS (BuildingModel)
    IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE = {
        CLASS = "BuildingModel",
        NAME  = "IsRequiredInventoryEnough",  -- SAMA NAMA, BEDA CLASS!
        ADDR  = {}
    },
    GET_NEXT_LEVEL_BLUEPRINT = {
        CLASS = "BuildingModel", 
        NAME  = "GetNextLevelBuildingBleprint",  -- Method untuk cek upgrade available
        ADDR  = {}
    },
    IS_CAN_BUILDING_ON_PLACE = {
        CLASS = "BuildingModel",
        NAME  = "IsCanBuildingOnPlace",  -- Untuk validasi placement (mungkin untuk upgrade)
        ADDR  = {}
    },
      -- UNLIMITED GOLD METHOD
    GOLD = {
        CLASS = "GameManager",
        NAME  = "get_gold",
        ADDR  = {}
    }
    

}


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
-- TOGGLE NO DAMAGE
----------------------------------------------------
function toggle_no_damage()
    if STATE.NO_DAMAGE then
        sv(CACHE.NO_DAMAGE)
        CACHE.NO_DAMAGE = {}
        STATE.NO_DAMAGE = false
        gg.toast("🔴 NO DAMAGE OFF")
        return
    end

    if #METHOD.DAMAGE.ADDR == 0 then
        gg.toast("🔍 please wait...")
        METHOD.DAMAGE.ADDR = findMethod(
            METHOD.DAMAGE.CLASS,
            METHOD.DAMAGE.NAME
        )

        if #METHOD.DAMAGE.ADDR == 0 then
            gg.alert("❌ TakeDamage not found\nMasuk map & kena damage dulu")
            return
        end
    end

    local patch = {}
    CACHE.NO_DAMAGE = {}

    for _, a in ipairs(METHOD.DAMAGE.ADDR) do
        table.insert(CACHE.NO_DAMAGE, {address=a, flags=gg.TYPE_DWORD, value=gv(a, gg.TYPE_DWORD)})
        table.insert(CACHE.NO_DAMAGE, {address=a+4, flags=gg.TYPE_DWORD, value=gv(a+4, gg.TYPE_DWORD)})

        table.insert(patch, {address=a,   flags=gg.TYPE_DWORD, value="h000080D2"}) -- mov w0,#0
        table.insert(patch, {address=a+4, flags=gg.TYPE_DWORD, value="hC0035FD6"}) -- ret
    end

    sv(patch)
    STATE.NO_DAMAGE = true
    gg.toast("🟢 NO DAMAGE ON")
end

----------------------------------------------------
-- TOGGLE SURVIVAL (NO HUNGER / THIRST - 100%)
----------------------------------------------------
function toggle_survival()
    -- ================= OFF =================
    if STATE.SURVIVAL then
        if #CACHE.HUNGER > 0 then sv(CACHE.HUNGER) end
        if #CACHE.WATER  > 0 then sv(CACHE.WATER)  end

        CACHE.HUNGER = {}
        CACHE.WATER  = {}
        STATE.SURVIVAL = false

        gg.toast("🔴 SURVIVAL OFF")
        return
    end

    -- ================= FIND METHOD =================
    if #METHOD.HUNGER.ADDR == 0 or #METHOD.WATER.ADDR == 0 then
        gg.toast("🔍 Finding hunger & water...")

        METHOD.HUNGER.ADDR = findMethod(
            METHOD.HUNGER.CLASS,
            METHOD.HUNGER.NAME
        )
        METHOD.WATER.ADDR = findMethod(
            METHOD.WATER.CLASS,
            METHOD.WATER.NAME
        )

        if #METHOD.HUNGER.ADDR == 0 or #METHOD.WATER.ADDR == 0 then
            gg.alert(
                "❌ get_hunger / get_water not found\n\n" ..
                "need update"
            )
            return
        end
    end

    -- ================= PATCH =================
    CACHE.HUNGER = {}
    CACHE.WATER  = {}
    local patch = {}

    -- ---------- HUNGER (return 100.0f) ----------
    for _, a in ipairs(METHOD.HUNGER.ADDR) do
        -- cache original (4 instruksi)
        for i = 0, 12, 4 do
            table.insert(CACHE.HUNGER, {
                address = a + i,
                flags   = gg.TYPE_DWORD,
                value   = gv(a + i, gg.TYPE_DWORD)
            })
        end

        -- patch
        table.insert(patch, { address = a,     flags = gg.TYPE_DWORD, value = "h4000001C" }) -- ldr s0,#8
        table.insert(patch, { address = a + 4, flags = gg.TYPE_DWORD, value = "hC0035FD6" }) -- ret
        table.insert(patch, { address = a + 8, flags = gg.TYPE_DWORD, value = "h0000C842" }) -- 100.0f
        table.insert(patch, { address = a +12, flags = gg.TYPE_DWORD, value = "h00000000" }) -- padding
    end

    -- ---------- WATER (return 100.0f) ----------
    for _, a in ipairs(METHOD.WATER.ADDR) do
        -- cache original (4 instruksi)
        for i = 0, 12, 4 do
            table.insert(CACHE.WATER, {
                address = a + i,
                flags   = gg.TYPE_DWORD,
                value   = gv(a + i, gg.TYPE_DWORD)
            })
        end

        -- patch
        table.insert(patch, { address = a,     flags = gg.TYPE_DWORD, value = "h4000001C" }) -- ldr s0,#8
        table.insert(patch, { address = a + 4, flags = gg.TYPE_DWORD, value = "hC0035FD6" }) -- ret
        table.insert(patch, { address = a + 8, flags = gg.TYPE_DWORD, value = "h0000C842" }) -- 100.0f
        table.insert(patch, { address = a +12, flags = gg.TYPE_DWORD, value = "h00000000" }) -- padding
    end

    -- apply
    sv(patch)
    STATE.SURVIVAL = true
    gg.toast("🟢 SURVIVAL ON (HUNGER & WATER 100%)")
end


----------------------------------------------------
-- TOGGLE NO WEAPON DURABILITY (RENAME DARI SEBELUMNYA)
----------------------------------------------------
function toggle_no_weapon_durability()
    if STATE.NO_WEAPON_DURABILITY then
        if #CACHE.WEAPON_DURA > 0 then
            sv(CACHE.WEAPON_DURA)
            CACHE.WEAPON_DURA = {}
            STATE.NO_WEAPON_DURABILITY = false
            gg.toast("🔴 NO WEAPON DURABILITY OFF")
        end
        return
    end

    -- FIND METHOD IF NOT FOUND
    if #METHOD.WEAPON_DURA.ADDR == 0 then
        gg.toast("🔍 please wait...")
        METHOD.WEAPON_DURA.ADDR = findMethod(
            METHOD.WEAPON_DURA.CLASS,
            METHOD.WEAPON_DURA.NAME
        )

        if #METHOD.WEAPON_DURA.ADDR == 0 then
            gg.alert("❌ not found")
            return
        end
    end

    -- PATCH METHOD
    CACHE.WEAPON_DURA = {}
    local patch = {}

    for _, a in ipairs(METHOD.WEAPON_DURA.ADDR) do
        table.insert(CACHE.WEAPON_DURA, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = gv(a, gg.TYPE_DWORD)
        })
        table.insert(CACHE.WEAPON_DURA, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = gv(a + 4, gg.TYPE_DWORD)
        })

        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = "hC0035FD6"  -- ret
        })
        table.insert(patch, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = "h1F2003D5"  -- nop
        })
    end

    sv(patch)
    STATE.NO_WEAPON_DURABILITY = true
    gg.toast("🟢 NO WEAPON DURABILITY ON")
end

----------------------------------------------------
-- TOGGLE NO ARMOR DURABILITY (VERSI BARU!)
----------------------------------------------------
function toggle_no_armor_durability()
    if STATE.NO_ARMOR_DURABILITY then
        -- RESTORE
        if CACHE.ARMOR_DURA and #CACHE.ARMOR_DURA > 0 then
            sv(CACHE.ARMOR_DURA)
            CACHE.ARMOR_DURA = {}
            STATE.NO_ARMOR_DURABILITY = false
            gg.toast("🔴 NO ARMOR DURABILITY OFF")
        end
        return
    end
    
    -- FIND METHOD
    if #METHOD.ARMOR_DURA.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.ARMOR_DURA.ADDR = findMethod(
            METHOD.ARMOR_DURA.CLASS,
            METHOD.ARMOR_DURA.NAME
        )
        
        if #METHOD.ARMOR_DURA.ADDR == 0 then
            gg.alert("❌  not found")
            return
        end
    end
    
    -- PATCH METHOD
    CACHE.ARMOR_DURA = {}
    local patch = {}
    
    for _, a in ipairs(METHOD.ARMOR_DURA.ADDR) do
        -- Cache original
        table.insert(CACHE.ARMOR_DURA, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = gv(a, gg.TYPE_DWORD)
        })
        table.insert(CACHE.ARMOR_DURA, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = gv(a + 4, gg.TYPE_DWORD)
        })
        
        -- Patch: ret (method tidak melakukan apa-apa)
        table.insert(patch, {
            address = a,
            flags = gg.TYPE_DWORD,
            value = "hC0035FD6"  -- ret
        })
        table.insert(patch, {
            address = a + 4,
            flags = gg.TYPE_DWORD,
            value = "h1F2003D5"  -- nop
        })
    end
    
    sv(patch)
    STATE.NO_ARMOR_DURABILITY = true
    gg.toast("🟢 NO ARMOR DURABILITY ON")
end





----------------------------------------------
-- ----------------------------------------------------
-- TOGGLE FREE CRAFT (HANYA 2 METHOD)
----------------------------------------------------
function toggle_free_craft()
    if STATE.FREE_CRAFT then
        -- RESTORE semua patch
        local restored = false
        
        if CACHE.FREE_CRAFT then
            -- Restore CanCraft
            if CACHE.FREE_CRAFT.CAN_CRAFT and #CACHE.FREE_CRAFT.CAN_CRAFT > 0 then
                sv(CACHE.FREE_CRAFT.CAN_CRAFT)
                CACHE.FREE_CRAFT.CAN_CRAFT = {}
                restored = true
            end
            
            -- Restore CanRemoveRequiredItems
            if CACHE.FREE_CRAFT.CAN_REMOVE_REQUIRED_ITEMS and #CACHE.FREE_CRAFT.CAN_REMOVE_REQUIRED_ITEMS > 0 then
                sv(CACHE.FREE_CRAFT.CAN_REMOVE_REQUIRED_ITEMS)
                CACHE.FREE_CRAFT.CAN_REMOVE_REQUIRED_ITEMS = {}
                restored = true
            end
        end
        
        STATE.FREE_CRAFT = false
        if restored then
            gg.toast("🔴 FREE CRAFT OFF (2 methods restored)")
        else
            gg.toast("🔴 FREE CRAFT OFF")
        end
        return
    end
    
    -- FIND AND PATCH HANYA 2 METHOD
    local methodsToPatch = {
        {key = "CAN_CRAFT", name = "CanCraft"},
        {key = "CAN_REMOVE_REQUIRED_ITEMS", name = "CanRemoveRequiredItems"}
    }
    
    local successCount = 0
    local foundCount = 0
    
    -- Inisialisasi cache
    CACHE.FREE_CRAFT = {}
    
    for _, methodInfo in ipairs(methodsToPatch) do
        local method = METHOD[methodInfo.key]
        
        -- Cari method jika belum ditemukan
        if #method.ADDR == 0 then
            gg.toast("🔍 Finding...")
            method.ADDR = findMethod(method.CLASS, method.NAME)
            
            if #method.ADDR == 0 then
                gg.toast("⚠️ " .. methodInfo.name .. " not found")
            else
                foundCount = foundCount + 1
                gg.toast("✅ Found " .. methodInfo.name)
            end
        else
            foundCount = foundCount + 1
        end
        
        -- Patch jika ditemukan
        if #method.ADDR > 0 then
            CACHE.FREE_CRAFT[methodInfo.key] = {}
            local patch = {}
            
            for _, addr in ipairs(method.ADDR) do
                -- Cache original
                table.insert(CACHE.FREE_CRAFT[methodInfo.key], {
                    address = addr,
                    flags = gg.TYPE_DWORD,
                    value = gv(addr, gg.TYPE_DWORD)
                })
                table.insert(CACHE.FREE_CRAFT[methodInfo.key], {
                    address = addr + 4,
                    flags = gg.TYPE_DWORD,
                    value = gv(addr + 4, gg.TYPE_DWORD)
                })
                
                -- Patch: mov w0, #1; ret (selalu return true)
                table.insert(patch, {
                    address = addr,
                    flags = gg.TYPE_DWORD,
                    value = "h20008052"  -- mov w0, #1
                })
                table.insert(patch, {
                    address = addr + 4,
                    flags = gg.TYPE_DWORD,
                    value = "hC0035FD6"  -- ret
                })
            end
            
            if #patch > 0 then
                sv(patch)
                successCount = successCount + 1
                gg.toast("✅ " .. methodInfo.name .. " patched")
            end
        end
    end
    
    if successCount > 0 then
        STATE.FREE_CRAFT = true
        
        if successCount == 2 then
            gg.toast("🟢 FREE CRAFT ON (2/2 methods)")
            
            
        else
            gg.toast("🟢 FREE CRAFT ON (" .. successCount .. "/2 methods)")
            
        end
    else
        gg.alert(
            "❌ FREE CRAFT FAILED\n\n" ..
            "Try enabling again"
        )
    end
end



----------------------------------------------------
-- TOGGLE FREE BUILD (BUILDING MODE)
----------------------------------------------------
function toggle_free_build()
    if STATE.FREE_BUILD then
        -- RESTORE semua patch building
        local restored = false
        
        -- Restore IsRequiredInventoryEnough
        if CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH and #CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH > 0 then
            sv(CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH)
            CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH = {}
            restored = true
        end
        
        -- Restore IsBuildingPermitted (jika ada)
        if CACHE.FREE_BUILD.CAN_PLACE_BUILDING and #CACHE.FREE_BUILD.CAN_PLACE_BUILDING > 0 then
            sv(CACHE.FREE_BUILD.CAN_PLACE_BUILDING)
            CACHE.FREE_BUILD.CAN_PLACE_BUILDING = {}
            restored = true
        end
        
        -- Restore WriteOffRequeredInventory (jika ada)
        if CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY and #CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY > 0 then
            sv(CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY)
            CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY = {}
            restored = true
        end
        
        STATE.FREE_BUILD = false
        if restored then
            gg.toast("🔴 FREE BUILD OFF")
        else
            gg.toast("🔴 FREE BUILD OFF (no patches)")
        end
        return
    end
    
    -- FIND AND PATCH BUILDING METHODS
    local successCount = 0
    local foundCount = 0
    
    -- Inisialisasi cache
    CACHE.FREE_BUILD = {}
    
    -- ================= METHOD 1: IsRequiredInventoryEnough =================
    -- Method ini cek apakah bahan cukup untuk building
    if #METHOD.IS_REQUIRED_INVENTORY_ENOUGH.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.IS_REQUIRED_INVENTORY_ENOUGH.ADDR = findMethod(
            METHOD.IS_REQUIRED_INVENTORY_ENOUGH.CLASS,
            METHOD.IS_REQUIRED_INVENTORY_ENOUGH.NAME
        )
    end
    
    if #METHOD.IS_REQUIRED_INVENTORY_ENOUGH.ADDR > 0 then
        CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH = {}
        local patch = {}
        
        for _, addr in ipairs(METHOD.IS_REQUIRED_INVENTORY_ENOUGH.ADDR) do
            -- Cache original
            table.insert(CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = gv(addr, gg.TYPE_DWORD)
            })
            table.insert(CACHE.FREE_BUILD.IS_REQUIRED_INVENTORY_ENOUGH, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = gv(addr + 4, gg.TYPE_DWORD)
            })
            
            -- Patch: mov w0, #1; ret (selalu return true)
            table.insert(patch, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = "h20008052"  -- mov w0, #1
            })
            table.insert(patch, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = "hC0035FD6"  -- ret
            })
        end
        
        if #patch > 0 then
            sv(patch)
            successCount = successCount + 1
            foundCount = foundCount + #METHOD.IS_REQUIRED_INVENTORY_ENOUGH.ADDR
            gg.toast("✅ patched")
        end
    end
    
    
    
    
    
------  -- ================= METHOD 2: IsBuildingPermitted =================
    -- Method ini cek apakah building boleh ditempatkan
    if #METHOD.CAN_PLACE_BUILDING.ADDR == 0 then
        gg.toast("🔍 Finding..")
        METHOD.CAN_PLACE_BUILDING.ADDR = findMethod(
            METHOD.CAN_PLACE_BUILDING.CLASS,
            METHOD.CAN_PLACE_BUILDING.NAME
        )
    end
    
    if #METHOD.CAN_PLACE_BUILDING.ADDR > 0 then
        CACHE.FREE_BUILD.CAN_PLACE_BUILDING = {}
        local patch = {}
        
        for _, addr in ipairs(METHOD.CAN_PLACE_BUILDING.ADDR) do
            -- Cache original
            table.insert(CACHE.FREE_BUILD.CAN_PLACE_BUILDING, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = gv(addr, gg.TYPE_DWORD)
            })
            table.insert(CACHE.FREE_BUILD.CAN_PLACE_BUILDING, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = gv(addr + 4, gg.TYPE_DWORD)
            })
            
            -- Patch: mov w0, #1; ret (selalu return true)
            table.insert(patch, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = "h20008052"  -- mov w0, #1
            })
            table.insert(patch, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = "hC0035FD6"  -- ret
            })
        end
        
        if #patch > 0 then
            sv(patch)
            successCount = successCount + 1
            foundCount = foundCount + #METHOD.CAN_PLACE_BUILDING.ADDR
            gg.toast("✅ patched")
        end
    end
    
    -- ================= METHOD 3: WriteOffRequeredInventory =================
    -- Method ini untuk konsumsi bahan (optional - bisa skip)
    if #METHOD.WRITE_OFF_REQUIRED_INVENTORY.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.WRITE_OFF_REQUIRED_INVENTORY.ADDR = findMethod(
            METHOD.WRITE_OFF_REQUIRED_INVENTORY.CLASS,
            METHOD.WRITE_OFF_REQUIRED_INVENTORY.NAME
        )
    end
    
    if #METHOD.WRITE_OFF_REQUIRED_INVENTORY.ADDR > 0 then
        CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY = {}
        local patch = {}
        
        for _, addr in ipairs(METHOD.WRITE_OFF_REQUIRED_INVENTORY.ADDR) do
            -- Cache original
            table.insert(CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = gv(addr, gg.TYPE_DWORD)
            })
            table.insert(CACHE.FREE_BUILD.WRITE_OFF_REQUIRED_INVENTORY, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = gv(addr + 4, gg.TYPE_DWORD)
            })
            
            -- Patch: ret saja (method tidak melakukan apa-apa)
            table.insert(patch, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = "hC0035FD6"  -- ret
            })
            table.insert(patch, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = "h1F2003D5"  -- nop
            })
        end
        
        if #patch > 0 then
            sv(patch)
            successCount = successCount + 1
            foundCount = foundCount + #METHOD.WRITE_OFF_REQUIRED_INVENTORY.ADDR
            gg.toast("✅ patched")
        end
    end
    
    if successCount > 0 then
        STATE.FREE_BUILD = true
        
        if successCount >= 2 then
            gg.toast("🟢 FREE BUILD ON (" .. successCount .. " methods)")
            
            
        else
            gg.toast("🟢 FREE BUILD ON (" .. successCount .. " methods)")
            
        end
    else
        gg.alert(
            "❌ FREE BUILD FAILED\n\n" ..
            " must be in build mode"
        )
    end
end


----------------------------------------------------
-- TOGGLE FREE UPGRADE (VERSI BARU DENGAN BuildingModel)
----------------------------------------------------
function toggle_free_upgrade()
    if STATE.FREE_UPGRADE then
        -- RESTORE
        local restored = false
        
        if CACHE.FREE_UPGRADE then
            if CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE and #CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE > 0 then
                sv(CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE)
                CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE = {}
                restored = true
            end
            
            if CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT and #CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT > 0 then
                sv(CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT)
                CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT = {}
                restored = true
            end
        end
        
        STATE.FREE_UPGRADE = false
        if restored then
            gg.toast("🔴 FREE UPGRADE OFF")
        else
            gg.toast("🔴 FREE UPGRADE OFF")
        end
        return
    end
    
    -- CARI METHOD BuildingModel UNTUK UPGRADE
    local successCount = 0
    local foundMethods = {}
    
    -- Inisialisasi cache
    CACHE.FREE_UPGRADE = {}
    
    -- ================= METHOD 1: IsRequiredInventoryEnough (BuildingModel) =================
    -- INI YANG PENTING! Sama nama dengan di BuildingAssistant, tapi beda class!
    if #METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.ADDR = findMethod(
            METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.CLASS,
            METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.NAME
        )
        
        if #METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.ADDR == 0 then
            gg.toast("⚠️ not found")
        else
            gg.toast("✅ done")
        end
    end
    
    if #METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.ADDR > 0 then
        CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE = {}
        local patch = {}
        
        for _, addr in ipairs(METHOD.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE.ADDR) do
            -- Cache original
            table.insert(CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = gv(addr, gg.TYPE_DWORD)
            })
            table.insert(CACHE.FREE_UPGRADE.IS_REQUIRED_INVENTORY_ENOUGH_UPGRADE, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = gv(addr + 4, gg.TYPE_DWORD)
            })
            
            -- Patch: mov w0, #1; ret (selalu return true)
            table.insert(patch, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = "h20008052"  -- mov w0, #1
            })
            table.insert(patch, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = "hC0035FD6"  -- ret
            })
        end
        
        if #patch > 0 then
            sv(patch)
            successCount = successCount + 1
            table.insert(foundMethods, "IsRequiredInventoryEnough")
            gg.toast("✅ done")
        end
    end
    
    -- ================= METHOD 2: GetNextLevelBuildingBleprint =================
    -- Method untuk mendapatkan blueprint upgrade selanjutnya
    if #METHOD.GET_NEXT_LEVEL_BLUEPRINT.ADDR == 0 then
        gg.toast("🔍 Finding...")
        METHOD.GET_NEXT_LEVEL_BLUEPRINT.ADDR = findMethod(
            METHOD.GET_NEXT_LEVEL_BLUEPRINT.CLASS,
            METHOD.GET_NEXT_LEVEL_BLUEPRINT.NAME
        )
        
        if #METHOD.GET_NEXT_LEVEL_BLUEPRINT.ADDR == 0 then
            gg.toast("⚠️  not found")
        else
            gg.toast("✅ Found")
        end
    end
    
    if #METHOD.GET_NEXT_LEVEL_BLUEPRINT.ADDR > 0 then
        CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT = {}
        local patch = {}
        
        for _, addr in ipairs(METHOD.GET_NEXT_LEVEL_BLUEPRINT.ADDR) do
            -- Cache original
            table.insert(CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT, {
                address = addr,
                flags = gg.TYPE_DWORD,
                value = gv(addr, gg.TYPE_DWORD)
            })
            table.insert(CACHE.FREE_UPGRADE.GET_NEXT_LEVEL_BLUEPRINT, {
                address = addr + 4,
                flags = gg.TYPE_DWORD,
                value = gv(addr + 4, gg.TYPE_DWORD)
            })
            
            -- Patch: ret valid object (tidak null)
            -- Ini kompleks, kita skip dulu atau buat return blueprint valid
            -- Untuk sementara kita bypass dengan return blueprint asli
        end
        
        if #patch > 0 then
            sv(patch)
            successCount = successCount + 1
            table.insert(foundMethods, "GetNextLevelBuildingBluprint")
            gg.toast("✅ Upgrade blueprint always available")
        end
    end
    
    if successCount > 0 then
        STATE.FREE_UPGRADE = true
        
        local methodList = ""
        for i, method in ipairs(foundMethods) do
            if i > 1 then methodList = methodList .. ", " end
            methodList = methodList .. method
        end
        
        gg.toast("🟢 FREE UPGRADE ON (" .. #foundMethods .. " methods)")
        
        
    else
        -- COBA CARI ALTERNATIF
        gg.alert(
            "❌ FREE UPGRADE FAILED\n\n" ..
           
            "need update"
        )
    end
end


----------------------------------------------------
-- TOGGLE UNLIMITED GOLD (FIXED 9,999,999 GOLD)
----------------------------------------------------
function toggle_unlimited_gold()
    if STATE.UNLIMITED_GOLD then
        -- RESTORE original
        if CACHE.UNLIMITED_GOLD and #CACHE.UNLIMITED_GOLD > 0 then
            sv(CACHE.UNLIMITED_GOLD)
            CACHE.UNLIMITED_GOLD = {}
            STATE.UNLIMITED_GOLD = false
            gg.toast("🔴 UNLIMITED GOLD OFF")
        end
        return
    end
    
    -- FIND METHOD
    if #METHOD.GOLD.ADDR == 0 then
        gg.toast("🔍 Finding gold method...")
        METHOD.GOLD.ADDR = findMethod(
            METHOD.GOLD.CLASS,
            METHOD.GOLD.NAME
        )
        
        if #METHOD.GOLD.ADDR == 0 then
            -- Coba cari alternatif method names
            local alt_methods = {
                "get_money",
                "get_currency",
                "GetGold",
                "GetMoney",
                "get_Money",
                "getCoins"
            }
            
            for _, alt_name in ipairs(alt_methods) do
                gg.toast("🔍 Trying: " .. alt_name)
                METHOD.GOLD.ADDR = findMethod(METHOD.GOLD.CLASS, alt_name)
                if #METHOD.GOLD.ADDR > 0 then
                    gg.toast("✅ Found: " .. alt_name)
                    break
                end
            end
            
            if #METHOD.GOLD.ADDR == 0 then
                gg.alert("❌ Gold method not found!\n\n" ..
                        "Please:\n" ..
                        "1. Open shop/inventory\n" ..
                        "2. Check your gold in game\n" ..
                        "3. Try again")
                return
            end
        end
    end
    
    -- PATCH METHOD untuk selalu return 9,999,999
    CACHE.UNLIMITED_GOLD = {}
    local patch = {}
    
    for _, addr in ipairs(METHOD.GOLD.ADDR) do
        -- Cache original (4 instructions)
        for i = 0, 12, 4 do
            table.insert(CACHE.UNLIMITED_GOLD, {
                address = addr + i,
                flags = gg.TYPE_DWORD,
                value = gv(addr + i, gg.TYPE_DWORD)
            })
        end
        
        -- PATCH dengan hex langsung
        -- ldr s0, #8 ; ret ; 9,999,999.0f ; padding
        table.insert(patch, { 
            address = addr,     
            flags = gg.TYPE_DWORD, 
            value = "h4000001C"   -- ldr s0, #8
        })
        table.insert(patch, { 
            address = addr + 4, 
            flags = gg.TYPE_DWORD, 
            value = "hC0035FD6"   -- ret
        })
        table.insert(patch, { 
            address = addr + 8, 
            flags = gg.TYPE_DWORD, 
            value = "h00009647"   -- 9,999,999.0f (FIXED)
        })
        table.insert(patch, { 
            address = addr + 12, 
            flags = gg.TYPE_DWORD, 
            value = "h00000000"   -- padding
        })
    end
    
    -- APPLY PATCH
    sv(patch)
    STATE.UNLIMITED_GOLD = true
    
    -- Tampilkan toast dan alert
    gg.toast("💰 UNLIMITED GOLD ON")
    
    -- Alert info
    
end

----------------------------------------------------
-- FUNGSI PEMBANTU (DATE & COUNTER)
----------------------------------------------------
local function get_date()
    return os.date("%d/%m/%Y") 
end

local function count_active_mods()
    local count = 0
    -- Pastikan tabel STATE sudah didefinisikan di atas script ini
    for _, active in pairs(STATE) do
        if active == true then
            count = count + 1
        end
    end
    return count
end

----------------------------------------------------
-- WELCOME SCREEN (INFO SCRIPT)
----------------------------------------------------
function welcome_screen()
    gg.alert(
        "═════════════════════════════\n" ..
        " DRABOY Dead God land survival tools V1\n" ..
        "═════════════════════════════\n\n" ..
        "📅 DATE     : " .. get_date() .. "\n" ..
        "⚙️ VERSION  : 1.0 (BETA)\n\n" ..
        "────────────────────────\n"
       
        
    )
end

-----------------------------------------------------
-- SUBMENU MOD
----------------------------------------------------
function submenu_mod()
    local function status(state)
        return state and " [ON] ✅" or " [OFF] 🔴"
    end

    local m = gg.choice({
        "🛡️ GOD MODE" .. status(STATE.NO_DAMAGE),
        "⚔️ INFINITE WEAPON DURABILITY" .. status(STATE.NO_WEAPON_DURABILITY),
        "👕 INFINITE ARMOR DURABILITY" .. status(STATE.NO_ARMOR_DURABILITY),
        "🍖 NO STARVING & THIRSTY" .. status(STATE.SURVIVAL),
        "🛠️ Free Craft" .. status(STATE.FREE_CRAFT),
        "🏗️ Free Build Base" .. status(STATE.FREE_BUILD),
        "⬆️ Free Upgrade Base" .. status(STATE.FREE_UPGRADE),
        "💰 Unlimited Gold" .. status(STATE.UNLIMITED_GOLD),  -- BARU
        "⬅️ Back"
    }, nil, "🛠️ MOD FEATURES LIST\n" .. count_active_mods() .. " Active | " .. get_date())

    if m == nil or m == 9 then 
        return -- Kembali ke pemanggil (show_menu)
    end

    -- Eksekusi fungsi toggle
    if m == 1 then toggle_no_damage()
    elseif m == 2 then toggle_no_weapon_durability()
    elseif m == 3 then toggle_no_armor_durability()
    elseif m == 4 then toggle_survival()
    elseif m == 5 then toggle_free_craft()
    elseif m == 6 then toggle_free_build()
    elseif m == 7 then toggle_free_upgrade()
    elseif m == 8 then toggle_unlimited_gold()  -- BARU
    end
    
    return submenu_mod() -- Refresh submenu
end





----------------------------------------------------
-- MAIN MENU
----------------------------------------------------
function show_menu()
    local activeCount = count_active_mods()
    -- Pastikan ItemExplorer.get_menu_status() tidak mengembalikan nil
    local menu_status = ItemExplorer.get_menu_status() or "Status: Ready"
    
    local main = gg.choice({
        "🔄  AUTO SWAP ITEM INBOX", -- 1
        "📋  VIEW ALL ITEM LIST",    -- 2
        "📝  EDIT QUANTITY ITEM",    -- 3
        "🧹  RESET SEARCH",          -- 4
        "🚀 MENU MOD [" .. activeCount .. "/8 ACTIVE]", -- 5
        "ℹ️ INFO SCRIPT",            -- 6
        "❌ EXIT"                    -- 7
    }, nil, 
   "🔥 Draboy Dead God Land Tools V1\n" .. menu_status .. "\n📅 " .. get_date() .. "")

    if main == nil then return end
    
    -- PERBAIKAN: Gunakan variabel 'main', bukan 'menu'
    if main == 1 then 
        ItemExplorer.auto_swap_item_with_subcategories()
    elseif main == 2 then 
        ItemExplorer.show_item_list_only()
    elseif main == 3 then 
        ItemExplorer.edit_quantity()
    elseif main == 4 then 
        ItemExplorer.reset_search()
    elseif main == 5 then 
        submenu_mod()
    elseif main == 6 then 
        welcome_screen()
    elseif main == 7 then 
        os.exit() 
    end
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

    local msg = "✅ SYSTEM READY TO USE\n"
             .. "────────────────────────\n"
             .. "👤 Author   : DraboyGaming\n"
             .. "🎮 Game     : Dead God Land Survival\n"
             .. "⚙️ Status   : ARM64 / Optimized\n"
             .. "────────────────────────\n"
             .. "📺 YouTube  : @DraboyGaming\n"
             .. "🙏 Support me by Subscribing!"

    local sel = gg.alert(msg, "🚀 START SYSTEM", "❌ EXIT")
    
    if sel ~= 1 then 
        gg.toast("👋 Script Closed")
        os.exit() 
    end

    -- 1. Munculkan Welcome Screen
    welcome_screen()

    -- 2. LANGSUNG MUNCULKAN MENU (Tanpa klik ikon)
    show_menu()
    
    -- 3. LOOP UTAMA (Untuk penggunaan selanjutnya via ikon GG)
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            show_menu()
        end
        gg.sleep(100)
    end
end

-- Jalankan inisialisasi
initialize()
