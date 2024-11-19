function Main()
    Menu = gg.choice({ 
"Gravity Menu",
"Coordinate Menu",
"Character Menu",
"Weapon Menu",
"Other Menu",
"Treasure Chest Menu",
"Global Menu",
"Yokorowa Menu",
"Description",
"Exit"
    }, nil, '製作者:@MumbleDebug')
    if Menu == 1 then grav() end
    if Menu == 2 then Current() end
    if Menu == 3 then movement() end
    if Menu == 4 then weapons() end
    if Menu == 5 then Misc1() end
    if Menu == 6 then ChestMenu() end
    if Menu == 7 then gameZen() end
    if Menu == 8 then yokorowa() end
    if Menu == 9 then q() end
    if Menu == 10 then os.exit() end
    YUNI = -1
end
function q()
    gg.alert("Weapon reflections may be unstable. Sometimes, zero-gravity might not activate. Also, the map may occasionally glitch. Additionally, weapon modifications need to be toggled on and off for each match to work.")
    gg.alert("scarletとhahaha殺すぞ！！WWWWWWWWWWWWWWWWWWW")
end

function ChestMenu()      
    siubo = gg.multiChoice({
        "chest battle royal infinity",
        "All Treasure Chest Switch",
    }, nil, 'made by MumbleDebug')
    
    if siubo == nil then return end  
    
    if siubo[1] then ChestMenu0() end
    if siubo[2] then ChestMenu1() end
    YUNI = -1
end

function ChestMenu0()
        gg.clearResults()
        gg.searchNumber("974476953466275488", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local r = gg.getResults(3000)
        local dizh1 = {}
        local dizh2 = 1
        for i = 1, #r do
            dizh1[dizh2] = {}
            dizh1[dizh2].address = r[i].address + 0x20
            dizh1[dizh2].flags = gg.TYPE_FLOAT
            dizh1[dizh2].value = 0.001
            dizh2 = dizh2 + 1
        end
        gg.setValues(dizh1)
    end
 

function ChestMenu1()
    gg.clearResults()
    gg.searchNumber("h9F89BF5E 9F9F891E", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.searchNumber("-97", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)
    local dizh1 = {}
    local dizh2 = 1
    for i = 1, #r do
      dizh1[dizh2] = {}
      dizh1[dizh2].address = r[i].address + 0x78
      dizh1[dizh2].flags = gg.TYPE_DWORD
      dizh1[dizh2].value = 1
      dizh2 = dizh2 + 4
      i = i + 1
    end 
    gg.setValues(dizh1)
end    
 

function grav()
    siubo = gg.multiChoice({
"Zero Gravity ON",
"Zero Gravity OFF",
"Disable Animation"
    }, nil, 'PlayinEscapePro')
    
    if siubo == nil then return end  
    
    if siubo[1] then iszerogravity() end
    if siubo[2] then unzerogravity() end
    if siubo[3] then opt() end
    YUNI = -1
end


function opt()
    gg.clearResults()
    gg.searchNumber("h0000803FABAAAA3E8FC2F53C", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("h0000803FABAAAA3E00000000", gg.TYPE_BYTE)
    gg.processResume()
    gg.toast("Optimization Successful")
    gg.clearResults()
    end

function iszerogravity()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("C1E00000h", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local revert = gg.getResults(1000)
    
    if #revert > 0 then
        gg.editAll("BA921000h",gg.TYPE_QWORD)
        gg.processResume()
        gg.toast("Zero Gravity ON")
    else
        gg.toast("No results found")
    end
    
    gg.clearResults()
end

function unzerogravity()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("BA921000h", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local revert = gg.getResults(1000) 
    if #revert > 0 then
        gg.editAll("C1E00000h", gg.TYPE_QWORD)
        gg.processResume()
        gg.toast("Zero Gravity OFF")
    else
        gg.toast("No results found")
    end
    
    gg.clearResults()
end
function dizh1()
        gg.setRanges(gg.REGION_C_DATA)
        gg.searchNumber("h9A99993E", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
        
        local revert = gg.getResults(100)
        
        if #revert > 0 then
            gg.editAll("h003C1C46003C1C46", gg.TYPE_BYTE)
            gg.processResume()
            gg.toast("Infinite Jump ON")
        else
            gg.toast("No results found")
        end
        
        gg.clearResults()
    end

    function Current()
        siubo = gg.multiChoice({
"Display Current Coordinates",
"TP to White Team's Front",
"TP to Red Team's Front",
"Custom Teleport"
        }, nil, 'PlayinEscapePro')
        
        if siubo == nil then return end  
        
        if siubo[1] then NowON() end
        if siubo[2] then whitebaseTP() end
        if siubo[3] then redbaseTP() end
        if siubo[4] then customTP() end
        YUNI = -1
    end


function NowON()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    results = gg.getResults(100)

    if #results > 0 then
        local lastResult = results[#results]  

        local a = {
            { address = lastResult.address - 12, flags = gg.TYPE_FLOAT },  
            { address = lastResult.address - 8, flags = gg.TYPE_FLOAT },   
            { address = lastResult.address - 4, flags = gg.TYPE_FLOAT }    
        }

        local values = gg.getValues(a)

        local xCoord = math.floor(values[1].value)
        local yCoord = math.floor(values[2].value)
        local zCoord = math.floor(values[3].value)

        local message = "Last Result's Coordinates:\nX: " .. xCoord .. "\nY: " .. yCoord .. "\nZ: " .. zCoord .. ""
        gg.alert(message)
    else
        gg.toast("No results found")
    end
end

function whitebaseTP()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(gg.getResultCount())

    if #results > 0 then
        local a = {}
        local n = 1
        for i = 1, #results do
            a[n] = { address = results[i].address - 12, flags = gg.TYPE_FLOAT, value = 127.361992 } 
            n = n + 1
            a[n] = { address = results[i].address - 8, flags = gg.TYPE_FLOAT, value = 1.21 } 
            n = n + 1
            a[n] = { address = results[i].address - 4, flags = gg.TYPE_FLOAT, value = -119.180000 } 
            n = n + 1
        end 
        gg.setValues(a)
        gg.toast("Coordinate Movement Successful")
    else
        gg.toast("No results found")
    end
end
function redbaseTP()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(gg.getResultCount())

    if #results > 0 then
        local a = {}
        local n = 1
        for i = 1, #results do
            a[n] = { address = results[i].address - 12, flags = gg.TYPE_FLOAT, value = -127.361992 } 
            n = n + 1
            a[n] = { address = results[i].address - 8, flags = gg.TYPE_FLOAT, value = 1.21 } 
            n = n + 1
            a[n] = { address = results[i].address - 4, flags = gg.TYPE_FLOAT, value = -119.180000 } 
            n = n + 1
        end 
        gg.setValues(a)
        gg.toast("Coordinate Movement Successful")
    else
        gg.toast("No results found")
    end
end


function customTP()
    gg.clearResults()  -- Clear previous search results
    gg.setRanges(gg.REGION_ANONYMOUS)  -- Set search region to anonymous
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)  -- Search for the specific value
    local results = gg.getResults(gg.getResultCount())  -- Get search results

    if #results > 0 then  -- Check if any results were found
        local input = gg.prompt(
            {
                "Enter X coordinate (e.g., 6)",
                "Enter Y coordinate (e.g., 99)",
                "Enter Z coordinate (e.g., 6)"
            },
            {0, 0, 0},  -- Default input values
            {"number", "number", "number"}  -- Set input types to number
        )

        if input then  -- If user provided input
            local a = {}
            local n = 1
            for i = 1, #results do  -- Loop through all search results
                a[n] = { address = results[i].address - 12, flags = gg.TYPE_FLOAT, value = input[1] }  -- Set X coordinate
                n = n + 1
                a[n] = { address = results[i].address - 8, flags = gg.TYPE_FLOAT, value = input[2] }  -- Set Y coordinate
                n = n + 1
                a[n] = { address = results[i].address - 4, flags = gg.TYPE_FLOAT, value = input[3] }  -- Set Z coordinate
                n = n + 1
            end
            gg.setValues(a)  -- Apply the new coordinate values to the game
            gg.toast("Teleportation Successful")  -- Notify success
        else
            gg.toast("Coordinates not entered")  -- Notify failure if no input was provided
        end
    else
        gg.toast("No results found")  -- Notify if no search results were found
    end
end


function movement()
    siubo = gg.multiChoice({
"High Jump",
"High Speed",
"Infinite Jump",
"Water Jump",
"Battle Royale Invincibility",
"Yokorowa Invincibility"
    }, nil, 'PlayinEscapePro')
    
    if siubo == nil then return end  
    
    if siubo[1] then HighJump() end
    if siubo[2] then Highspeed() end
    if siubo[3] then airjump() end
    if siubo[4] then waterjump() end
    if siubo[5] then muteki() end
    if siubo[6] then yokorowamuteki() end
    YUNI = -1
end

function yokorowamuteki()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("h5802000001010000", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber("600", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)
    local a = {}
    local n = 1

    for i = 1, #r do
        a[n] = {
            address = r[i].address - 0x8,
            flags = gg.TYPE_DWORD,
            value = 999999,
            freeze = true
        }
        n = n + 1
    end

    gg.setValues(a)
    gg.addListItems(a)
    gg.toast("yokorowa Invincibility ON")
end


function waterjump()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1,121,193,960", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)
    local a = {}
    local n = 1
    
    for i = 1, #r do
      a[n] = {}
      a[n].address = r[i].address - 0xA8
      a[n].flags = gg.TYPE_DWORD
      a[n].value = 1
      a[n].freeze = true
      n = n + 1
    end 
    
    gg.setValues(a)
    gg.addListItems(a) 
  end


function HighJump()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("2047615188", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    local revert = gg.getResults(100)
    gg.editAll("2067728458", gg.TYPE_DWORD)
    gg.processResume()
    gg.toast("High Jump ON")
    gg.clearResults()
end

function Highspeed()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("6.874417363427344e+28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
    local revert = gg.getResults(100)
    if revert then
        gg.editAll("8.0000002e26", gg.TYPE_FLOAT)
        gg.toast("High Speed ON")
    else
        gg.toast("No results found")
    end
    gg.clearResults()
end

function muteki()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("h6400000001010000", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber("100", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)

    if r then
        local a = {}
        local n = 1
        for i = 1, #r do
            a[n] = { address = r[i].address - 0x8, flags = gg.TYPE_DWORD, value = 99999 }
            n = n + 1
        end 
        gg.toast("Invincibility ON")
        gg.setValues(a)
    else
        gg.toast("No results found")
    end
end

function airjump()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_DATA)
    gg.searchNumber("h9A99993E", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    
    local revert = gg.getResults(100)
    
    if #revert > 0 then
        gg.editAll("h003C1C46003C1C46", gg.TYPE_BYTE)
        gg.processResume()
        gg.toast("Infinite Jump ON")
    else
        gg.toast("No results found")
    end
    
    gg.clearResults()
end

function weapons()
        siubo = gg.multiChoice({
"Weapon Rapid Fire + Reflection",
"Weapon Modification OFF",
"Weapon Modification ON",
"Weapon Modification2 ON",
"Weapon Modification3 ON",
"Weapon Modification4 ON",
"Weapon Rapid Fire Normal Mode",
"SPAI Support Mode",
"Punch Only Rapid Fire"
        }, nil, 'PlayinEscapePro')
        
        if siubo == nil then return end  
        
        if siubo[1] then hanei() end
        if siubo[2] then modweaponOFF() end
        if siubo[3] then modweaponON() end
        if siubo[4] then modweaponON2() end
        if siubo[5] then modweaponON3() end
        if siubo[6] then modweaponON4() end
        if siubo[7] then rapitfireNomal() end
        if siubo[8] then rapitfirespai() end
        if siubo[9] then hikakin() end
        if siubo[10] then hujihujiON() end
        if siubo[11] then hujihujiOFF() end
        YUNI = -1
    end

--tstwettdwtdwtdtwdwt
    function OLDwON()
        local modifications = {
            {search = "5,498,138,235,623,002,013", edit = "4,341,835,367,419,304,782", toast = "グレネード改造"},
            {search = "6,558,252,613,970,925,570", edit = "6,339,221,200,358,174,732", toast = "ラケット改造"},
            {search = "h1CBFC976 18BFC976", edit = "h740F455E E21C455E", toast = "水鉄砲改造"},
            {search = "hD3811F66 DF811F66", edit = "h12540161 794D0161", toast = "リモボ改造"},
            {search = "hA9F77540 A7F77540", edit = "h64AB317D 12BC317D", toast = "火炎銃改造"},
            {search = "h70587542 7D587542", edit = "h64AB317D F0B8317D", toast = "シャボン銃改造"},
            {search = "h89B38241 83B38241", edit = "hA7E00A51 E6F50A51", toast = "インパルス改造"},
            {search = "h0EF0EF66 0CF0EF66", edit = "h0994097F EC93097F", toast = "人狼改造"},
            {search = "h21BA7D79 29BA7D79", edit = "h9416F973 8616F973", toast = "テレポート改造"},
            {search = "h1115BC71 1715BC71", edit = "h2DCD5D63 75D85D63", toast = "足止め改造"}
        }
    
        for _, mod in ipairs(modifications) do
            gg.clearResults()
            gg.setRanges(gg.REGION_ANONYMOUS)
            gg.searchNumber(mod.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
            local revert = gg.getResults(100)
            gg.editAll(mod.edit, gg.TYPE_QWORD)
            gg.processResume()
            gg.toast(mod.toast)
        end
    end

    

    function rapitfirespai()
        local patterns = {
            "h7E 93 93 6B",
            "hAE FF 78 3D",
            "h25 90 0D 6A",
            "hA4 CF FE 78",
            "h2C 3F 0B 63",
            "h69 F8 04 58",
            "1,515,282,994",
            "1,165,510,785",
            "h45 78 48 81"
        }
    
        for _, pattern in ipairs(patterns) do
            gg.clearResults()
            gg.setRanges(gg.REGION_ANONYMOUS)
            gg.searchNumber(pattern, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
            local r = gg.getResults(1000)
            local a = {}
            local n = 1
    
            for i = 1, #r do
                a[n] = { address = r[i].address - 20, flags = gg.TYPE_DWORD, value = 0 }
                n = n + 1
                a[n] = { address = r[i].address - 16, flags = gg.TYPE_DWORD, value = 0 }
                n = n + 1
                a[n] = { address = r[i].address + 32, flags = gg.TYPE_DWORD, value = 0 }
                n = n + 1
                a[n] = { address = r[i].address + 36, flags = gg.TYPE_DWORD, value = 0 }
                n = n + 1
    
                if pattern == "1,165,510,785" then
                    a[n] = { address = r[i].address - 10, flags = gg.TYPE_DWORD, value = 0 }
                    n = n + 1
                    a[n] = { address = r[i].address + 10, flags = gg.TYPE_DWORD, value = 0 }
                    n = n + 1
                    a[n] = { address = r[i].address - 24, flags = gg.TYPE_DWORD, value = 0 }
                    n = n + 1
                end
            end
    
            gg.setValues(a)
        end
    end



    function rapitfireNomal()
        local patterns = {
            "h10 AA 6E 67",
            "h65 88 73 6E",
            "h25 90 0D 6A",
            "h62 B9 C3 4A",
            "hDD 65 9A 4B",
            "h9F 1E 21 66",
            "hD8 F5 44 60",
            "hA4 CF FE 78",
            "h69 F8 04 58",
            "h3E AC B6 54",
            "h2C 3F 0B 63",
            "h50 6B E7 40"
        }
    
        for _, pattern in ipairs(patterns) do
            gg.clearResults()
            gg.setRanges(gg.REGION_ANONYMOUS)
            gg.searchNumber(pattern, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
            local results = gg.getResults(1000)
            local addresses = {}
    
            local offsets = {-0x44, -0x88, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24}
            for _, offset in ipairs(offsets) do
                for _, result in ipairs(results) do
                    table.insert(addresses, { address = result.address + offset, flags = gg.TYPE_DWORD, value = 0 })
                end
            end
    
            gg.setValues(addresses)
        end
    end
    

    
  function hanei()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    
    local searchValues = {
        { "1735305744", { -0x44, -0x88, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Punch" },
        { "1,031,339,950", { -0x44, -0x88, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "SAI Acquisition Device" },
        { "1476720745", { -0x44, -0x84, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "AI Warp" },
        { "1165510785", { -0x44, -0x84, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Bottle" },
        { "1088908112", { -0x44, -0x88, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Cannon" },
        { "1853065317", { -0x44, -0x84, -0xA0, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Grenade Type" },
        { "1254340962", { -0x44, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Werewolf Stick, Guard Weapon" },
        { "1515282994", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Meteor Shower" },
        { "1268409821", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Stun" },
        { "1779273765", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Fujifuji Restraint" },
        { "1713446559", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Water Gun Type" },
        { "2029965220", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Impulse" },
        { "1615132120", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Water Balloon" },
        { "1661681452", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Remobo" },
        { "1804833662", { -0x44, -0x80, -0x84, -0x14, -0x10, 0x10, 0x20, 0x24 }, "Remobo" },        
    }
--1661681452
    for _, searchInfo in ipairs(searchValues) do
        local numberToSearch = searchInfo[1]
        local offsets = searchInfo[2]
        local itemName = searchInfo[3]

        gg.searchNumber(numberToSearch, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        local setValues = {}

        for _, r in ipairs(results) do
            for _, offset in ipairs(offsets) do
                local entry = {}
                entry.address = r.address + offset 
                entry.flags = gg.TYPE_DWORD
                entry.value = 0
                table.insert(setValues, entry)
            end
        end

        if #setValues > 0 then
            gg.setValues(setValues)
            gg.toast(itemName .. " Has been modified or made capable of rapid fire.")
        end

        gg.clearResults()
    end
end



function modweaponON()
    local searches = {
        {search = "4788831073787533424", edit = "9021198316195654500"},--シャボン銃 => 拘束槍
        {search = "8754357937972820513", edit = "7594854902521026534"},--通常テレポート => 敵にTP
        {search = "4720532735758873481", edit = "7298342532273471438"},--インパルス => フジフジ
        {search = "4644890888415606697", edit = "4,459,991,644,336,622,497"},--火炎銃 => 桜
        {search = "7358743112637710803", edit = "5839750236390219943"},--リモボ => バリア
    }

    for i, v in ipairs(searches) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(v.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local revert = gg.getResults(100)
        gg.editAll(v.edit, gg.TYPE_QWORD)
        gg.processResume()
    end

    gg.clearResults()
end

function modweaponOFF()
    local searches = {
        {search = "7,037,678,785,175,149,466", edit = 4788831073787533424},
        {search = "8,714,128,229,137,304,946", edit = 8754357937972820513},
        {search = "4,348,150,287,900,851,118", edit = 4720532735758873481},
        {search = "4,779,651,813,845,810,188", edit = 4644890888415606697},
        {search = "6,830,252,227,170,004,540", edit = 7358743112637710803},
    }

    for i, v in ipairs(searches) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(v.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        
        local r = gg.getResults(1000)
        local a = {}
        for j = 1, #r do
            a[j] = {}
            a[j].address = r[j].address + 0x10
            a[j].flags = gg.TYPE_QWORD
            a[j].value = v.edit
        end
        gg.setValues(a)
    end

    gg.clearResults()
end

function modweaponON2()
    local searches = {
        {search = "4788831073787533424", edit = "5839750236390219943"},--シャボン銃 => 隕石
        {search = "8754357937972820513", edit = "5,004,125,161,477,251,134"},--通常テレポート => 前に爆発弾
        {search = "4720532735758873481", edit = "8,476,157,457,148,762,367"},--インパルス => 回復リモボ
        {search = "4644890888415606697", edit = "4,954,785,311,608,728,549"},--火炎銃 => 噴水
        {search = "7358743112637710803", edit = "9,163,269,138,526,399,660"},--リモボ => バリア
    }

    for i, v in ipairs(searches) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(v.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local revert = gg.getResults(100)
        gg.editAll(v.edit, gg.TYPE_QWORD)
        gg.processResume()
    end

    gg.clearResults()
end

function modweaponON3()
        local searches = {
        {search = "4788831073787533424", edit = "7,838,137,720,127,270,747"},--シャボン銃 => 風雷
        {search = "8754357937972820513", edit = "6,510,739,568,312,634,564"},--通常テレポート => 雷
        {search = "4720532735758873481", edit = "4342666112878783105"},--インパルス => 貫通周囲傷
        {search = "4644890888415606697", edit = "5,033,834,146,055,307,941"},--火炎銃 => プレゼントボックス
        {search = "7358743112637710803", edit = "7,176,040,636,956,964,274"},--リモボ => 炎の剣
    }

    for i, v in ipairs(searches) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(v.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local revert = gg.getResults(100)
        gg.editAll(v.edit, gg.TYPE_QWORD)
        gg.processResume()
    end

    gg.clearResults()
end

function modweaponON4()
        local searches = {
        {search = "4788831073787533424", edit = "7,928,489,937,836,941,428"},--シャボン銃 => 黒い剣
        {search = "8754357937972820513", edit = "8,879,989,390,722,209,993"},--通常テレポート => 威力50の近接回復
        {search = "4720532735758873481", edit = "5,187,252,516,797,863,244"},--インパルス => 35赤剣
        {search = "4644890888415606697", edit = "8,285,259,226,087,633,433"},--火炎銃 => ピッケル
        {search = "7358743112637710803", edit = "7,176,040,636,956,964,274"},--リモボ => 炎の剣
    }

    for i, v in ipairs(searches) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(v.search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local revert = gg.getResults(100)
        gg.editAll(v.edit, gg.TYPE_QWORD)
        gg.processResume()
    end

    gg.clearResults()
end



function hikakin()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("h10 AA 6E 67", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)
    local a = {}
    local n = 1
    for i = 1, #r do
      a[n] = {}
      a[n].address = r[i].address - 20
      a[n].flags = gg.TYPE_DWORD
      a[n].value = 0
      a[n + 1] = {}
      a[n + 1].address = r[i].address - 16
      a[n + 1].flags = gg.TYPE_DWORD
      a[n + 1].value = 0
      a[n + 2] = {}
      a[n + 2].address = r[i].address + 32
      a[n + 2].flags = gg.TYPE_DWORD
      a[n + 2].value = 0
      a[n + 3] = {}
      a[n + 3].address = r[i].address + 36
      a[n + 3].flags = gg.TYPE_DWORD
      a[n + 3].value = 0
      n = n + 4
      i = i + 1
    end 
    gg.setValues(a)
end 

function Misc1()
    siubo = gg.multiChoice({
"「OldModule」Trap Disable",
"TP Cooldown Disable",
"Close-range Restraint Cooldown Disable",
"Cooldown Disable Weapon Reflection",
"「Crashed」Punch => Guard Stick",
"「Crashed」Restraint Spear => Nyakkuru",
"「Crashed」Punch => Ice",
"「●」Green Restraint Disable",
"「●」TP Optimization",
"「●」Trap Disable",
"「Crashed」Remote Bomb Rapid Fire",
"「Crashed」Punch SPAI Optimization",
"「●」Barrier Rapid Fire Optimization",
"「●」Surrounding Damage Optimization",
"「●」Valts SAI Optimization",
"「●」Stair Optimization",
"「●」Rock Optimization",
"「●」Grenade Optimization",
"「●」Black Smoke Optimization",
"「●」mizu splash Optimization",
"「●」meteora Optimization",
"「●」Easter Karuro Optimization",
"「●」heal bom Optimization",
"「●」Masutif Optimization",
"「●」Rumina Optimization",
"「●」fire sword Optimization",
"「●」SPAIRocked rainy Optimization",
"「●」🎁 Optimization",
"「●」BlackSword Optimization",
"「●」威力50の近接攻撃 Optimization",
"「●」威力35の剣 Optimization",
"「●」ピッケル Optimization",
    }, nil, 'PlayinEscapePro')
    
    if siubo == nil then return end  
    
    if siubo[1] then trap() end
    if siubo[2] then tpcooltime() end
    if siubo[3] then hikakin() end
    if siubo[4] then modifyValues() end
    if siubo[5] then aa5() end
    if siubo[6] then aa6() end
    if siubo[7] then aa7() end
    if siubo[8] then aa9() end
    if siubo[9] then aa10() end
    if siubo[10] then aa11() end
    if siubo[11] then aa12() end
    if siubo[12] then aa13() end
    if siubo[13] then aa14() end
    if siubo[14] then rangesdamage() end
    if siubo[15] then vartu() end
    if siubo[16] then kaidan() end
    if siubo[17] then iwa() end
    if siubo[18] then guree() end
    if siubo[19] then k0kuen() end
    if siubo[20] then funsuiiku() end
    if siubo[21] then meteoraito() end
    if siubo[22] then karuroegg() end
    if siubo[23] then healbom() end
    if siubo[24] then healstar() end
    if siubo[25] then ruminaero() end
    if siubo[26] then firesword() end
    if siubo[27] then SAIRockedReiny() end
    if siubo[28] then presentBOX() end
    if siubo[29] then BlackSword() end
    if siubo[30] then Damege50Attack() end
    if siubo[31] then Damege35Sword() end
    if siubo[32] then Pickaxe() end
    YUNI = -1
end

function hikakin()
    local function setValuesByNumber(searchNumber)
        local a = {}
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(searchNumber, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        local n = 1

        for i = 1, #results do
            
            a[n] = {}
            a[n].address = results[i].address + 0x8
            a[n].flags = gg.TYPE_DWORD
            a[n].value = 0
            n = n + 1
            
            
            a[n] = {}
            a[n].address = results[i].address + 0xC
            a[n].flags = gg.TYPE_DWORD
            a[n].value = 0
            n = n + 1
        end
        
        gg.setValues(a)
    end
    local searchNumbers = {
        "1302831744",
        "1712520725",
        "1939385807"
    }
    for _, num in ipairs(searchNumbers) do
        setValuesByNumber(num)
    end
end


function tpcooltime()
    local a = {}
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1784006213", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)

    if r then
        local n = 1
        for i = 1, #r do
            a[n] = { address = r[i].address + 0x8, flags = gg.TYPE_DWORD, value = 0 }
            n = n + 1
            a[n] = { address = r[i].address + 0xC, flags = gg.TYPE_DWORD, value = 0 }
            n = n + 1
        end
        gg.setValues(a)
    else
        gg.toast("No results found")
    end
end

function trap()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("5.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local revert = gg.getResults(500)
    if #revert > 0 then
        gg.editAll("0",gg.TYPE_FLOAT)
        gg.processResume()
        gg.toast("Trap Disable ON")
    else
        gg.toast("No results found")
    end
    
    gg.clearResults()
end


function modifyValues()
    local valuesToModify = {
        "1254340962", "1515282994", "1779273765", 
        "1031339950", "1853065317", "1165510785", 
        "1735305744", "2029965220", "1713446559", 
        "1615132120", "1789885589"
    }

    for _, searchValue in ipairs(valuesToModify) do
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber(searchValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        
        local results = gg.getResults(1000)
        local modifiedResults = {}
        local index = 1
        
        for i = 1, #results do
            modifiedResults[index] = {
                address = results[i].address - 0x44,
                flags = gg.TYPE_DWORD,
                value = 0
            }
            index = index + 4
        end
        
        gg.setValues(modifiedResults)
    end
end


function aa5()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    
    gg.searchNumber("6339221200358174732", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results > 0 then
        local punchDistanceAddress = results[#results].address + 0x70
        gg.clearResults()
        
        gg.searchNumber("7566421188222735354", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local weaponResults = gg.getResults(100)
        
        if #weaponResults > 0 then
            local punchDistanceValue = gg.getValues({{ address = punchDistanceAddress, flags = gg.TYPE_DWORD }})[1].value
            
            local updateTable = {}
            for _, weapon in ipairs(weaponResults) do
                table.insert(updateTable, { address = weapon.address + 0x70, flags = gg.TYPE_DWORD, value = punchDistanceValue })
            end
            gg.setValues(updateTable)
            
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end

--5867736346376698970

function aa6()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()

    gg.searchNumber("6558252613970925570", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("9021198316195654500", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end

--7594854902521026534 TP

function aa9()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()

    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("7594854902521026534", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end

function aa10()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()

    gg.searchNumber("6558252613970925570", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5867736346376698970", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end
function aa7()
    if _G.punchDistanceSet then
        gg.alert("設定はすでに適用されています。")
        return
    end
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    
    gg.searchNumber("7118627438276014591", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results > 0 then
        local punchDistanceAddress = results[#results].address + 0x70
        gg.clearResults()
        
        gg.searchNumber("7566421188222735354", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local weaponResults = gg.getResults(100)
        
        if #weaponResults > 0 then
            local punchDistanceValue = gg.getValues({{ address = punchDistanceAddress, flags = gg.TYPE_QWORD }})[1].value
            
            local updateTable = {}
            for _, weapon in ipairs(weaponResults) do
                table.insert(updateTable, { address = weapon.address + 0x70, flags = gg.TYPE_QWORD, value = punchDistanceValue })
            end
            gg.setValues(updateTable)
            
            _G.punchDistanceSet = true
            gg.toast("設定が適用されました。")
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end


function aa8()
    if _G.punchDistanceSet then
        gg.toast("設定はすでに適用されています。")
        return
    end
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    
    gg.searchNumber("6286271834203446593", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results > 0 then
        local punchDistanceAddress = results[#results].address + 0x70
        gg.clearResults()
        
        gg.searchNumber("7566421188222735354", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local weaponResults = gg.getResults(100)
        
        if #weaponResults > 0 then
            local punchDistanceValue = gg.getValues({{ address = punchDistanceAddress, flags = gg.TYPE_QWORD }})[1].value
            
            local updateTable = {}
            for _, weapon in ipairs(weaponResults) do
                table.insert(updateTable, { address = weapon.address + 0x70, flags = gg.TYPE_QWORD, value = punchDistanceValue })
            end
            gg.setValues(updateTable)
            
            _G.punchDistanceSet = true
            gg.alert("設定が適用されました。")
        else
            gg.toast("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end

--7358743112637710803

function aa11()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("8517266019372461953", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8195448612344042769", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end

function aa12()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("4788831073787533424", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("7358743112637710803", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end
--7748511682603263836
function aa13()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("8559582678587391772", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        gg.clearResults()
        gg.searchNumber("7748511682603263836", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("パンチのIDが見つかりませんでした。")
    end
end
--4368176234348077357
function aa13()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("8559582678587391772", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("4368176234348077357", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
--5839750236390219943
function aa14()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5839750236390219943", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
--4342666112878783105周囲ダメージ
function rangesdamage()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("4342666112878783105", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
function vartu()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("6,792,867,371,528,032,116", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
--8447707215816312647
function kaidan()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8447707215816312647", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
function iwa()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8501659439655023370", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
--4926018526891516582
function guree()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("4926018526891516582", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end
--8517266019372461953
function k0kuen()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8517266019372461953", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function funsuiiku()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("4,954,785,311,608,728,549", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function meteoraito()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("9,163,269,138,526,399,660", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function karuroegg()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5,004,125,161,477,251,134", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function healbom()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8,476,157,457,148,762,367", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function SAIRockedReiny()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5,033,834,146,055,307,941", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function firesword()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("7,176,040,636,956,964,274", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function presentBOX()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5,033,834,146,055,307,941", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function ruminaero()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("4,829,556,005,237,297,178", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function healstar()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("9,083,280,715,559,099,614", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function BlackSword()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("7,928,489,937,836,941,428", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function Damege50Attack()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8,879,989,390,722,209,993", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function Damege35Sword()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("5,187,252,516,797,863,244", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function Pickaxe()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("7566421188222735354", gg.TYPE_QWORD)
    local results = gg.getResults(1)

    if #results > 0 then
        local punchDistance = results[1].address + 0x70
        local punchValue = gg.getValues({{ address = punchDistance, flags = gg.TYPE_QWORD }})[1].value
        
        gg.clearResults()
        gg.searchNumber("8,285,259,226,087,633,433", gg.TYPE_QWORD)
        local weaponResults = gg.getResults(100)

        if #weaponResults > 0 then
            for _, weapon in ipairs(weaponResults) do
                weapon.address = weapon.address + 0x70
                weapon.flags = gg.TYPE_QWORD
                weapon.value = punchValue
            end
            gg.setValues(weaponResults)
        else
            gg.alert("他の武器が見つかりませんでした。")
        end
    else
        gg.alert("a")
    end
end

function gameZen()
    siubo = gg.multiChoice({
"Custom Global Acceleration",
"Custom Punch Range Expansion"
    }, nil, 'PlayinEscapePro')
    
    if siubo == nil then return end  
    if siubo[1] then gamespeedsetvalue() end
    if siubo[2] then Punchrange() end
    YUNI = -1
end

function gamespeedsetvalue()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("4,369,572,502,446,528,266", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(100) 
    if r then
        local a = {}
        local n = 1
        local user_input = gg.prompt({"全体加速の値を設定"}, {0}, {"float"})
        if user_input == nil then
            gg.toast("キャンセルされました")
            return
        end
        local input_value = user_input[1]
        for i = 1, #r do
            a[n] = { address = r[i].address + 0xA0, flags = gg.TYPE_FLOAT, value = input_value }
            n = n + 1
        end
        gg.toast("全体加速: " .. input_value)
        gg.setValues(a)
    else
        gg.toast("No results found")
    end
end

function Punchrange()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("6,103,871,971,907,338,240", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(100) 
    if r then
        local a = {}
        local n = 1
        local user_input = gg.prompt({"パンチ範囲の値を設定"}, {0}, {"float"})
        if user_input == nil then
            gg.toast("scarletとhahaha死ね")
            return
        end
        local input_value = user_input[1]
        for i = 1, #r do
            a[n] = { address = r[i].address + 0xE4, flags = gg.TYPE_FLOAT, value = input_value }
            n = n + 1
        end
        gg.toast("パンチ範囲: " .. input_value)
        gg.setValues(a)
    else
        gg.toast("No results found")
    end
end


function yokorowa()      
    siubo = gg.multiChoice({
"Y Coordinate Fix ON for Yokorowa",
"Y Coordinate Fix OFF for Yokorowa",
"X Coordinate Fix ON for Yokorowa",
"X Coordinate Fix OFF for Yokorowa"
    }, nil, 'made by MumbleDebug')
    
    if siubo == nil then return end  
    
    if siubo[1] then YkoteiOn() end
    if siubo[2] then YkoteiOff() end
    if siubo[3] then XkoteiOn() end
    if siubo[4] then XkoteiOff() end
    YUNI = -1
end

local freeze_list_x = {}
local freeze_list_y = {}

function YkoteiOn()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(gg.getResultCount())

    if #results > 0 then
        freeze_list_y = {}
        for i = 1, #results do
            freeze_list_y[i] = {
                address = results[i].address - 8, 
                flags = gg.TYPE_FLOAT,
                value = 20,
                freeze = true
            }
        end
        gg.setValues(freeze_list_y)
        gg.addListItems(freeze_list_y)
        gg.toast("Y座標フリーズ ON")
    else
        gg.toast("No results found")
    end
end

function YkoteiOff()
    if #freeze_list_y > 0 then
        gg.removeListItems(freeze_list_y)
        gg.toast("Y座標フリーズ OFF")
    else
        gg.toast("フリーズする項目が見つかりません")
    end
end





function XkoteiOn()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.searchNumber("17170436", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(gg.getResultCount())

    if #results > 0 then
        freeze_list_x = {}
        for i = 1, #results do
            freeze_list_x[i] = {
                address = results[i].address - 12,
                flags = gg.TYPE_FLOAT,
                value = 0,
                freeze = true
            }
        end
        gg.setValues(freeze_list_x)
        gg.addListItems(freeze_list_x)
        gg.toast("X座標フリーズ ON")
    else
        gg.toast("No results found")
    end
end

function XkoteiOff()
    if #freeze_list_x > 0 then
        gg.removeListItems(freeze_list_x)
        gg.toast("X座標フリーズ OFF")
    else
        gg.toast("フリーズする項目が見つかりません")
    end
end



function by()
    os.exit()
end

while true do
    if gg.isVisible(true) then
        YUNI = 1
        gg.setVisible(false)
    end
    if YUNI == 1 then Main() end
end
