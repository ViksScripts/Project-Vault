-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

local t1 = {}
local t2 = {
	[1] = nil
}
pcall(function()
    t2[1] = identifyexecutor()
end)
if t2[1] then
    t1[3] = t2[1] == "Xeno"
    t1[1] = t1[3]

    if not t1[3] then
        t1[1] = t2[1] == "JJSploit x Xeno"
    end

    if t1[1] then
        game:GetService("Players").LocalPlayer:Kick("This executor has a really low sUNC score. Because of this, Radeon Hub does not support it. A good working alternative is Solara.")
    else
        t1[2] = t2[1]

        if t1[2] == "Swift" then
            game:GetService("Players").LocalPlayer:Kick("Following a new update, Swift has some bugs that prevent Radeon Hub from working. Unfortunately, Swift's frequent disregard towards their community leaves us unsure when a fix may be finalised. Please use Solara.")
        end
    end
else
    game:GetService("Players").LocalPlayer:Kick("Failed to Identify Executor? Is this a new executor? DM realrade0n to get it approved.")
end
t2[2] = 4294967296
t2[3] = t2[2] - 1
t2[4] = function(p1, p2)
    local n1 = 1
    local n2 = 0

    while p1 ~= 0 or p2 ~= 0 do
        n2 += (p1 % 2 + p2 % 2) % 2 * n1
        p1 = math.floor(p1 / 2)
        p2 = math.floor(p2 / 2)
        n1 *= 2
    end

    return n2 % t2[2]
end
t2[5] = nil
t2[5] = function(p3, p4, p5, ...)
    if p4 then
        local v43 = p3 % t2[2]
        local v44 = t2[4](v43, p4 % t2[2])

        if p5 then
            v44 = t2[5](v44, p5, ...)
        end

        return v44
    end

    if p3 then
        return p3 % t2[2]
    end

    return 0
end
t2[6] = nil
t2[6] = function(p6, p7, p8, ...)
    if p7 then
        local v48 = p6 % t2[2]
        local v49 = p7 % t2[2]
        local v50 = (v48 + v49 - t2[4](v48, v49)) / 2

        if p8 then
            v50 = t2[6](v50, p8, ...)
        end

        return v50
    end

    if p6 then
        return p6 % t2[2]
    end

    return t2[3]
end
t2[7] = function(p9)
    return t2[3] - p9
end
t2[8] = nil
t2[8] = function(p10, p11)
    if p11 < 0 then
        return lshift(p10, -p11)
    end

    return math.floor(p10 % 4294967296 / 2 ^ p11)
end
t2[9] = function(p12, p13)
    if p13 > 31 or p13 < -31 then
        return 0
    end

    return t2[8](p12 % t2[2], p13)
end
t2[10] = nil
t2[10] = function(p14, p15)
    if p15 < 0 then
        return t2[9](p14, -p15)
    end

    return p14 * 2 ^ p15 % 4294967296
end
t2[11] = function(p16, p17)
    local v56 = p16 % t2[2]
    local v57 = p17 % 32
    local v58 = t2[6](v56, 2 ^ v57 - 1)

    return t2[9](v56, v57) + t2[10](v58, 32 - v57)
end
t2[12] = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298
}
t2[13] = function(p18)
    return string.gsub(p18, ".", function(p19)
        return string.format("%02x", string.byte(p19))
    end)
end
t2[14] = function(p20, p21)
    local s1 = ""

    for _ = 1, p21 do
        local _string = string
        local v67 = p20 % 256

        s1 = _string.char(v67) .. s1
        p20 = (p20 - v67) / 256
    end

    return s1
end
t2[15] = function(p22, p23)
    local n3 = 0

    for i = p23, p23 + 3 do
        n3 = n3 * 256 + string.byte(p22, i)
    end

    return n3
end
t2[16] = function(p24, p25)
    local v75 = 64 - (p25 + 9) % 64
    local v76 = t2[14](8 * p25, 8)
    local v77 = p24 .. "\128" .. string.rep("\000", v75) .. v76

    assert(#v77 % 64 == 0)

    return v77
end
t2[17] = function(p26)
    p26[1] = 1779033703
    p26[2] = 3144134277
    p26[3] = 1013904242
    p26[4] = 2773480762
    p26[5] = 1359893119
    p26[6] = 2600822924
    p26[7] = 528734635
    p26[8] = 1541459225

    return p26
end
t2[18] = function(p27, p28, p29)
    local t3 = {}

    for i = 1, 16 do
        t3[i] = t2[15](p27, p28 + (i - 1) * 4)
    end

    for i = 17, 64 do
        local v84 = t3[i - 15]
        local v85 = t2[5](t2[11](v84, 7), t2[11](v84, 18), t2[9](v84, 3))
        local v86 = t3[i - 2]

        t3[i] = (t3[i - 16] + v85 + t3[i - 7] + t2[5](t2[11](v86, 17), t2[11](v86, 19), t2[9](v86, 10))) % t2[2]
    end

    local v87 = p29[1]
    local v88 = p29[2]
    local v89 = p29[3]
    local v90 = p29[4]
    local v91 = p29[5]
    local v92 = p29[6]
    local v93 = p29[7]
    local v94 = p29[8]

    for i = 1, 64 do
        local v96 = (t2[5](t2[11](v87, 2), t2[11](v87, 13), t2[11](v87, 22)) + t2[5](t2[6](v87, v88), t2[6](v87, v89), t2[6](v88, v89))) % t2[2]
        local v97 = t2[5](t2[11](v91, 6), t2[11](v91, 11), t2[11](v91, 25))
        local v98 = t2[5](t2[6](v91, v92), t2[6](t2[7](v91), v93))
        local v99 = t2[12][i]
        local v100 = t3[i]
        local v101 = (v94 + v97 + v98 + v99 + v100) % t2[2]

        v94 = v93
        v93 = v92
        v92 = v91
        v91 = (v90 + v101) % t2[2]

        local v102 = (v101 + v96) % t2[2]

        v90 = v89
        v89 = v88
        v88 = v87
        v87 = v102
    end

    p29[1] = (p29[1] + v87) % t2[2]
    p29[2] = (p29[2] + v88) % t2[2]
    p29[3] = (p29[3] + v89) % t2[2]
    p29[4] = (p29[4] + v90) % t2[2]
    p29[5] = (p29[5] + v91) % t2[2]
    p29[6] = (p29[6] + v92) % t2[2]
    p29[7] = (p29[7] + v93) % t2[2]
    p29[8] = (p29[8] + v94) % t2[2]
end
t2[19] = nil
t2[20] = {
	["\\"] = "\\",
	["\""] = "\"",
	["\b"] = "b",
	["\f"] = "f",
	["\n"] = "n",
	["\r"] = "r",
	["\t"] = "t"
}
t2[21] = {
	["/"] = "/"
}
for k, v in pairs(t2[20]) do
    t2[21][v] = k
end
t2[22] = nil
t2[22] = function(p30)
    local v122 = t2[20][p30]

    if not v122 then
        v122 = string.format("u%04x", p30:byte())
    end

    return "\\" .. v122
end
t2[23] = {
	["nil"] = function(_)
    return "null"
end,
	table = function(p32, p33)
    local t4 = {}

    if not p33 then
        p33 = {}
    end

    if p33[p32] then
        error("circular reference")
    end

    p33[p32] = true

    if rawget(p32, 1) ~= nil or next(p32) == nil then
        local n4 = 0
        for v132 in pairs(p32) do

            if type(v132) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end

            n4 += 1
        end
        if n4 ~= #p32 then
            error("invalid table: sparse array")
        end
        for _, v in ipairs(p32) do
            table.insert(t4, t2[19](v, p33))
        end
        p33[p32] = nil

        return "[" .. table.concat(t4, ",") .. "]"
    end

    for k, v in pairs(p32) do
        local v137 = k

        if type(v137) ~= "string" then
            error("invalid table: mixed or invalid key types")
        end

        table.insert(t4, t2[19](v137, p33) .. ":" .. t2[19](v, p33))
    end

    p33[p32] = nil

    return "{" .. table.concat(t4, ",") .. "}"
end,
	string = function(p34)
    return "\"" .. p34:gsub("[%z\001-\031\\\"]", t2[22]) .. "\""
end,
	number = function(p35)
    local v124 = p35 ~= p35

    if not v124 then
        v124 = p35 <= -1e999

        if not v124 then
            v124 = p35 >= 1e999
        end
    end

    if v124 then
        error("unexpected number value '" .. tostring(p35) .. "'")
    end

    return string.format("%.14g", p35)
end,
	boolean = tostring
}
t2[19] = function(p36, p37)
    local v141 = type(p36)
    local v142 = t2[23][v141]

    if v142 then
        return v142(p36, p37)
    end

    error("unexpected type '" .. v141 .. "'")
end
t2[24] = nil
local function v5(...)
    local t5 = {}

    for i = 1, select("#", ...) do
        t5[select(i, ...)] = true
    end

    return t5
end
t2[25] = v5(" ", "\t", "\r", "\n")
t2[26] = v5(" ", "\t", "\r", "\n", "]", "}", ",")
t2[27] = v5("\\", "/", "\"", "b", "f", "n", "r", "t", "u")
t2[28] = v5("true", "false", "null")
t2[29] = {
	["true"] = true,
	["false"] = false,
	null = nil
}
t2[30] = function(p38, p39, p40, p41)
    for i = p39, #p38 do
        local v151 = i

        if p41 ~= p40[p38:sub(v151, v151)] then
            return v151
        end
    end

    return #p38 + 1
end
local function v6(p42, p43, p44)
    local n5 = 1
    local n6 = 1

    for i = 1, p43 - 1 do
        n6 += 1

        if p42:sub(i, i) == "\n" then
            n5 += 1
            n6 = 1
        end
    end

    error(string.format("%s at line %d col %d", p44, n5, n6))
end
local function v7(p45, p46)
    local v160 = t2[30](p45, p46, t2[26])
    local v161 = p45:sub(p46, v160 - 1)

    if not t2[28][v161] then
        v6(p45, p46, "invalid literal '" .. v161 .. "'")
    end

    return t2[29][v161], v160
end
local function v8(p47)
    local floor = math.floor

    if p47 <= 127 then
        return string.char(p47)
    end

    if p47 <= 2047 then
        return string.char(floor(p47 / 64) + 192, p47 % 64 + 128)
    end

    if p47 <= 65535 then
        return string.char(floor(p47 / 4096) + 224, floor(p47 % 4096 / 64) + 128, p47 % 64 + 128)
    end

    if p47 <= 1114111 then
        return string.char(floor(p47 / 262144) + 240, floor(p47 % 262144 / 4096) + 128, floor(p47 % 4096 / 64) + 128, p47 % 64 + 128)
    end

    error(string.format("invalid unicode codepoint '%x'", p47))
end
local function v9(p48, p49)
    local v180 = t2[30](p48, p49, t2[26])
    local v181 = p48:sub(p49, v180 - 1)
    local num = tonumber(v181)

    if not num then
        v6(p48, p49, "invalid number '" .. v181 .. "'")
    end

    return num, v180
end
t2[31] = function(p50)
    local num = tonumber(p50:sub(1, 4), 16)
    local num2 = tonumber(p50:sub(7, 10), 16)

    if num2 then
        return v8((num - 55296) * 1024 + num2 - 56320 + 65536)
    end

    return v8(num)
end
t2[32] = {
	["\""] = function(p51, p52)
    local s2 = ""
    local v200 = p52 + 1
    local v201 = v200

    while v200 <= #p51 do
        local v202 = p51:byte(v200)

        if v202 < 32 then
            v6(p51, v200, "control character in string")
        elseif v202 == 92 then
            local v203 = s2 .. p51:sub(v201, v200 - 1)

            v200 += 1

            local v204 = p51:sub(v200, v200)

            if v204 == "u" then
                local v205 = p51:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", v200 + 1)

                if not v205 then
                    v205 = p51:match("^%x%x%x%x", v200 + 1)

                    if not v205 then
                        v205 = v6(p51, v200 - 1, "invalid unicode escape in string")
                    end
                end

                s2 = v203 .. t2[31](v205)
                v200 += #v205
            else
                if not t2[27][v204] then
                    v6(p51, v200 - 1, "invalid escape char '" .. v204 .. "' in string")
                end

                s2 = v203 .. t2[21][v204]
            end

            v201 = v200 + 1
        elseif v202 == 34 then
            return s2 .. p51:sub(v201, v200 - 1), v200 + 1
        end

        v200 += 1
    end

    v6(p51, p52, "expected closing quote for string")
end,
	["0"] = v9,
	["1"] = v9,
	["2"] = v9,
	["3"] = v9,
	["4"] = v9,
	["5"] = v9,
	["6"] = v9,
	["7"] = v9,
	["8"] = v9,
	["9"] = v9,
	["-"] = v9,
	t = v7,
	f = v7,
	n = v7,
	["["] = function(p53, p54)
    local t6 = {}
    local n7 = 1
    local v168 = p54 + 1
    local v169
    while true do
        v169 = t2[30](p53, v168, t2[25], true)

        if p53:sub(v169, v169) == "]" then
            break
        end

        local v170, v171 = t2[24](p53, v169)

        t6[n7] = v170
        n7 += 1

        local v172 = t2[25]
        local v173 = t2[30](p53, v171, v172, true)
        local v174 = p53:sub(v173, v173)

        v168 = v173 + 1

        if v174 == "]" then
            return t6, v168
        end

        if v174 ~= "," then
            v6(p53, v168, "expected ']' or ','")
        end
    end
    v168 = v169 + 1

    return t6, v168
end,
	["{"] = function(p55, p56)
    local t7 = {}
    local v186 = p56 + 1
    local v187
    while true do
        v187 = t2[30](p55, v186, t2[25], true)

        if p55:sub(v187, v187) == "}" then
            break
        end

        if p55:sub(v187, v187) ~= "\"" then
            v6(p55, v187, "expected string for key")
        end

        local v188, v189 = t2[24](p55, v187)
        local v190 = t2[30](p55, v189, t2[25], true)

        if p55:sub(v190, v190) ~= ":" then
            v6(p55, v190, "expected ':' after key")
        end

        local v191 = t2[30](p55, v190 + 1, t2[25], true)
        local v192, v193 = t2[24](p55, v191)

        t7[v188] = v192

        local v194 = t2[25]
        local v195 = t2[30](p55, v193, v194, true)
        local v196 = p55:sub(v195, v195)

        v186 = v195 + 1

        if v196 == "}" then
            return t7, v186
        end

        if v196 ~= "," then
            v6(p55, v186, "expected '}' or ','")
        end
    end

    return t7, v187 + 1
end
}
t2[24] = function(p57, p58)
    local v212 = p57:sub(p58, p58)
    local v213 = t2[32][v212]

    if v213 then
        return v213(p57, p58)
    end

    v6(p57, p58, "unexpected character '" .. v212 .. "'")
end
t2[33] = function(p59)
    return t2[19](p59)
end
t2[34] = function(p60)
    if type(p60) ~= "string" then
        error("expected argument of type string, got " .. type(p60))
    end

    local v207, v208 = t2[24](p60, t2[30](p60, 1, t2[25], true))
    local v209 = t2[30](p60, v208, t2[25], true)

    if v209 <= #p60 then
        v6(p60, v209, "trailing garbage")
    end

    return v207
end
t2[35] = function(p61)
    local v104 = t2[16](p61, #p61)
    local v105 = t2[17]({})

    for i = 1, #v104, 64 do
        t2[18](v104, i, v105)
    end

    local v107 = t2[13]
    local v108 = v105[1]
    local v109 = t2[14](v108, 4)
    local v110 = v105[2]
    local v111 = t2[14](v110, 4)
    local v112 = v105[3]
    local v113 = t2[14](v112, 4)
    local v114 = v105[4]
    local v115 = t2[14](v114, 4)
    local v116 = v105[5]
    local v117 = t2[14](v116, 4)
    local v118 = v105[6]
    local v119 = t2[14](v118, 4)
    local v120 = v105[7]

    return v107(v109 .. v111 .. v113 .. v115 .. v117 .. v119 .. t2[14](v120, 4) .. t2[14](v105[8], 4))
end
t2[36] = 3297
t2[37] = tostring("093c7244-770d-4428-aeb7-57ea52248a4e")
t2[38] = true
t2[39] = function(_)
end
game:IsLoaded()
repeat
    task.wait(1)
    t1[7] = game:IsLoaded()
until t1[7]
t2[40] = false
local v10 = setclipboard or toclipboard
local _request = request
if not _request then
    _request = http_request or syn_request
end
local char = string.char
local _tostring = tostring
local sub = string.sub
local time = os.time
local random = math.random
local floor = math.floor
local v18 = gethwid or function()
    return game:GetService("Players").LocalPlayer.UserId
end
t2[41] = v10
t2[42] = _request
t2[43] = char
t2[44] = _tostring
t2[45] = sub
t2[46] = time
t2[47] = random
t2[48] = floor
t2[49] = v18
t2[50] = ""
t2[51] = 0
t2[52] = "https://api.platoboost.app"
local v19 = t2[42]({
	Url = t2[52] .. "/public/connectivity",
	Method = "GET"
})
if v19.StatusCode ~= 200 or v19.StatusCode ~= 429 then
    t2[52] = "https://api.platoboost.net"
end
function cacheLink()
    if t2[51] + 600 < t2[46]() then
        local v215 = t2[42]
        local v216 = t2[52] .. "/public/start"
        local v217 = t2[33]
        local v218 = t2[36]
        local v219 = t2[49]
        local v220 = t2[35](v219())
        local v221 = v217({
			service = v218,
			identifier = v220
		})
        local t8 = {
			["Content-Type"] = "application/json"
		}
        local v223 = v215({
			Url = v216,
			Method = "POST",
			Body = v221,
			Headers = t8
		})

        if v223.StatusCode == 200 then
            local v224 = t2[34](v223.Body)

            if v224.success == true then
                t2[50] = v224.data.url
                t2[46]()

                return true, t2[50]
            end

            t2[39](v224.message)

            return false, v224.message
        end

        if v223.StatusCode == 429 then
            t2[39]("you are being rate limited, please wait 20 seconds and try again.")

            return false, "you are being rate limited, please wait 20 seconds and try again."
        end

        t2[39]("Failed to cache link.")

        return false, "Failed to cache link."
    end

    return true, t2[50]
end
cacheLink()
t2[53] = function()
    local s3 = ""

    for _ = 1, 16 do
        s3 ..= t2[43](t2[48](t2[47]() * 26) + 97)
    end

    return s3
end
for _ = 1, 5 do
    t1[6] = t2[53]()
    task.wait(0.2)
    t1[5] = t2[53]()

    if t1[5] == t1[6] then
        t2[39]("platoboost nonce error.")
        error("platoboost nonce error.")
    end
end
t2[54] = function()
    local v227, v228 = cacheLink()

    if v227 then
        t2[41](v228)
    end
end
local function v21(p63)
    local v230 = t2[53]()
    local v231 = t2[52] .. "/public/redeem/" .. t2[44](t2[36])
    local t9 = {
		identifier = t2[35](t2[49]()),
		key = p63
	}

    if t2[38] then
        t9.nonce = v230
    end

    local v233 = t2[42]
    local v234 = t2[33](t9)
    local t10 = {
		["Content-Type"] = "application/json"
	}
    local v236 = v233({
		Url = v231,
		Method = "POST",
		Body = v234,
		Headers = t10
	})

    if v236.StatusCode == 200 then
        local v237 = t2[34](v236.Body)

        if v237.success == true then
            if v237.data.valid == true then
                if t2[38] then
                    if v237.data.hash == t2[35]("true" .. "-" .. v230 .. "-" .. t2[37]) then
                        return true
                    end

                    t2[39]("failed to verify integrity.")

                    return false
                end

                return true
            end

            t2[39]("key is invalid.")

            return false
        end

        if t2[45](v237.message, 1, 27) == "unique constraint violation" then
            t2[39]("you already have an active key, please wait for it to expire before redeeming it.")

            return false
        end

        t2[39](v237.message)

        return false
    end

    if v236.StatusCode == 429 then
        t2[39]("you are being rate limited, please wait 20 seconds and try again.")

        return false
    end

    t2[39]("server returned an invalid status code, please try again later.")

    return false
end
local function v22(p64)
    if t2[40] == true then
        t2[39]("a request is already being sent, please slow down.")

        return false
    end

    local v239 = t2[53]()
    local v240 = t2[52] .. "/public/whitelist/" .. t2[44](t2[36]) .. "?identifier=" .. t2[35](t2[49]()) .. "&key=" .. p64

    if t2[38] then
        v240 ..= "&nonce=" .. v239
    end

    local v241 = t2[42]({
		Url = v240,
		Method = "GET"
	})

    if v241.StatusCode == 200 then
        local v242 = t2[34](v241.Body)

        if v242.success == true then
            if v242.data.valid == true then
                if t2[38] then
                    if v242.data.hash == t2[35]("true" .. "-" .. v239 .. "-" .. t2[37]) then
                        return true
                    end

                    t2[39]("failed to verify integrity.")

                    return false
                end

                return true
            end

            if t2[45](p64, 1, 4) == "KEY_" then
                return v21(p64)
            end

            t2[39]("key is invalid.")

            return false
        end

        t2[39](v242.message)

        return false
    end

    if v241.StatusCode == 429 then
        t2[39]("you are being rate limited, please wait 20 seconds and try again.")

        return false
    end

    t2[39]("server returned an invalid status code, please try again later.")

    return false
end
t1[6] = isfolder("RadeonFolder")
if not t1[6] then
    makefolder("RadeonFolder")
end
t1[6] = isfile("RadeonFolder/key.txt")
if not t1[6] then
    writefile("RadeonFolder/key.txt", "")
end
t2[55] = nil
t1[6] = function()
    if game.GameId == 142553158 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/main/AssassinFreeExploit"))()

        return true
    end

    if game.GameId == 66654135 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/MM2FreeExploit"))()

        return true
    end

    if game.GameId == 4348829796 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/MVSDFreeScript"))()

        return true
    end

    if game.GameId == 5750914919 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/FischFreeExploit"))()

        return true
    end

    if game.PlaceId == 1269042450 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/AssassinXFreeExploit"))()

        return true
    end

    if game.GameId == 111958650 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/ArsenalFreeExploit"))()

        return true
    end

    if game.GameId == 4931927012 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/BasketballLegendsFreeExploit"))()

        return true
    end

    if game.GameId == 7436755782 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/GrowAGarden"))()

        return true
    end

    if game.GameId == 7219654364 then
        t2[55] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RadeonScripts/RadeonHub/refs/heads/main/DuelsMVS"))()

        return true
    end

    return false
end
t2[55] = nil
t2[56] = t1[6]
t2[57] = game:GetService("MarketplaceService")
local ok, result = pcall(function()
    return t2[57]:GetProductInfo(game.PlaceId)
end)
t1[5] = ok
t1[4] = result
game:GetService("HttpService")
t2[58] = "https://super-fortnight-ucw5.onrender.com/send"
local v25 = tostring(t1[4].Name) or "Failed To Fetch Game!"
t2[59] = nil
pcall(function()
    t2[59] = identifyexecutor()
end)
function SendMessageEMBED(_, p66)
    local HttpService = game:GetService("HttpService")
    local t11 = {
		["Content-Type"] = "application/json"
	}
    local UserId = game:GetService("Players").LocalPlayer.UserId
    local title = p66.title
    local description = p66.description
    local color = p66.color
    local fields = p66.fields
    local json = HttpService:JSONEncode({
		userId = UserId,
		embeds = {{
			title = title,
			description = description,
			color = color,
			fields = fields
		}}
	})

    request({
		Url = t2[58],
		Method = "POST",
		Headers = t11,
		Body = json
	})
end
if isfile("RadeonFolder/execs.txt") then
    new_content = tostring(tonumber((readfile("RadeonFolder/execs.txt"))) + 1)
    delfile("RadeonFolder/execs.txt")
    writefile("RadeonFolder/execs.txt", (tostring(new_content)))
else
    writefile("RadeonFolder/execs.txt", "1")
end
local v26 = readfile("RadeonFolder/execs.txt")
local str = tostring("nil")
local t12 = {
	name = "Executor:",
	value = "```" .. str .. "```"
}
local str2 = tostring(v26)
local t13 = {
	name = "Executions:",
	value = "```" .. str2 .. "```"
}
local v31 = "```" .. tostring(v25) .. "```"
local t14 = {
	name = "Game:",
	value = v31
}
local t15 = {
	title = "New Execution",
	description = "",
	color = 16711680,
	fields = {
		t12,
		t13,
		t14
	}
}
SendMessageEMBED(url, t15)
function IdentifyKey()
    if not isfile("RadeonFolder/key.txt") then
        writefile("RadeonFolder/key.txt", "")
    end

    local v258 = readfile("RadeonFolder/key.txt")

    if v22(v258) then
        t2[56]()
    end
end
IdentifyKey()
if not t2[55] then
    (function()
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local Frame2 = Instance.new("Frame")
        local Frame3 = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Parent = Frame3
        UIStroke.ApplyStrokeMode = "Contextual"
        UIStroke.Color = Color3.fromRGB(127, 34, 240)
        UIStroke.LineJoinMode = "Round"
        UIStroke.Thickness = 2
        UIStroke.Transparency = 0
        UIStroke.Archivable = true
        UIStroke.Enabled = true
        Instance.new("UICorner")
        local ImageButton = Instance.new("ImageButton")
        local UICorner = Instance.new("UICorner")
        local Frame4 = Instance.new("Frame")
        local UICorner2 = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
        local UIGradient = Instance.new("UIGradient")
        local UICorner3 = Instance.new("UICorner")
        local UIGradient2 = Instance.new("UIGradient")
        local Frame5 = Instance.new("Frame")
        local ImageLabel = Instance.new("ImageLabel")
        local ImageLabel2 = Instance.new("ImageLabel")
        local ImageLabel3 = Instance.new("ImageLabel")
        local UIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
        local Frame6 = Instance.new("Frame")
        local UIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
        local TextLabel2 = Instance.new("TextLabel")
        local ImageButton2 = Instance.new("ImageButton")
        local UICorner4 = Instance.new("UICorner")
        local ImageButton3 = Instance.new("ImageButton")
        local UICorner5 = Instance.new("UICorner")
        local TextLabel3 = Instance.new("TextLabel")
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        local UIAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")
        local TextButton = Instance.new("TextButton")
        local UICorner6 = Instance.new("UICorner")
        local UITextSizeConstraint2 = Instance.new("UITextSizeConstraint")
        local TextButton2 = Instance.new("TextButton")
        local UICorner7 = Instance.new("UICorner")
        local UITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
        local TextButton3 = Instance.new("TextButton")
        local UICorner8 = Instance.new("UICorner")
        local UITextSizeConstraint4 = Instance.new("UITextSizeConstraint")
        local ImageButton4 = Instance.new("ImageButton")
        local UICorner9 = Instance.new("UICorner")
        local ImageButton5 = Instance.new("ImageButton")
        local UICorner10 = Instance.new("UICorner")
        local TextBox = Instance.new("TextBox")
        local UICorner11 = Instance.new("UICorner")
        local UITextSizeConstraint5 = Instance.new("UITextSizeConstraint")
        local Frame7 = Instance.new("Frame")
        local Frame8 = Instance.new("Frame")
        local Frame9 = Instance.new("Frame")
        local UICorner12 = Instance.new("UICorner")
        local UIGradient3 = Instance.new("UIGradient")
        local Frame10 = Instance.new("Frame")
        local UIAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint")
        local ImageButton6 = Instance.new("ImageButton")
        local UICorner13 = Instance.new("UICorner")
        local TextLabel4 = Instance.new("TextLabel")
        local TextLabel5 = Instance.new("TextLabel")
        local UITextSizeConstraint6 = Instance.new("UITextSizeConstraint")
        local ImageLabel4 = Instance.new("ImageLabel")
        local UIAspectRatioConstraint7 = Instance.new("UIAspectRatioConstraint")
        local ImageLabel5 = Instance.new("ImageLabel")
        local ImageLabel6 = Instance.new("ImageLabel")
        local UIAspectRatioConstraint8 = Instance.new("UIAspectRatioConstraint")
        local Frame11 = Instance.new("Frame")
        local Frame12 = Instance.new("Frame")
        local Frame13 = Instance.new("Frame")
        local UIGradient4 = Instance.new("UIGradient")
        local UICorner14 = Instance.new("UICorner")
        local ImageLabel7 = Instance.new("ImageLabel")
        local ImageLabel8 = Instance.new("ImageLabel")
        local ImageLabel9 = Instance.new("ImageLabel")
        local UIAspectRatioConstraint9 = Instance.new("UIAspectRatioConstraint")
        local Frame14 = Instance.new("Frame")
        local UIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
        local TextLabel6 = Instance.new("TextLabel")
        local UIAspectRatioConstraint11 = Instance.new("UIAspectRatioConstraint")
        ScreenGui.Name = "RadeonKey"
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Frame.Name = "Canvas"
        Frame.Parent = ScreenGui
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.Size = UDim2.new(0.8, 0, 0.8, 0)
        Frame2.Name = "Container"
        Frame2.Parent = Frame
        Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame2.BackgroundColor3 = Color3.fromRGB(255, 6, 213)
        Frame2.BackgroundTransparency = 1
        Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame2.BorderSizePixel = 0
        Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame2.Size = UDim2.new(0.557291687, 0, 0.650147378, 0)
        Frame3.Name = "MainFrame"
        Frame3.Parent = Frame2
        Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame3.BorderSizePixel = 0
        Frame3.Position = UDim2.new(0.484112144, 0, 0.541095912, 0)
        Frame3.Size = UDim2.new(0.970956922, 0, 0.918138623, 0)
        ImageButton.Name = "Close"
        ImageButton.Parent = Frame3
        ImageButton.Active = false
        ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 67, 67)
        ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton.BorderSizePixel = 0
        ImageButton.Position = UDim2.new(1, 0, 0, 0)
        ImageButton.Selectable = false
        ImageButton.Size = UDim2.new(0.0723240077, 0, 0.11210762, 0)
        UICorner.CornerRadius = UDim.new(1, 0)
        UICorner.Parent = ImageButton
        Frame4.Name = "Inner"
        Frame4.Parent = ImageButton
        Frame4.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame4.BorderSizePixel = 0
        Frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame4.Size = UDim2.new(0.754999995, 0, 0.754999995, 0)
        UICorner2.CornerRadius = UDim.new(1, 0)
        UICorner2.Parent = Frame4
        TextLabel.Name = "Text"
        TextLabel.Parent = Frame4
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel.Size = UDim2.new(1.16556287, 0, 0.65342164, 0)
        TextLabel.Font = Enum.Font.FredokaOne
        TextLabel.Text = "X"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true
        UIAspectRatioConstraint.Parent = Frame4
        UIAspectRatioConstraint2.Parent = ImageButton
        UIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(171, 68, 65)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(181, 98, 95))
		})
        UIGradient.Rotation = -90
        UIGradient.Parent = ImageButton
        UICorner3.CornerRadius = UDim.new(0.0299999993, 0)
        UICorner3.Parent = Frame3
        UIGradient2.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))
		})
        UIGradient2.Rotation = -90
        UIGradient2.Parent = Frame3
        Frame5.Name = "Divider"
        Frame5.Parent = Frame3
        Frame5.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame5.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame5.BorderSizePixel = 0
        Frame5.Position = UDim2.new(0.503000021, 0, 0.837000012, 0)
        Frame5.Size = UDim2.new(0.938283503, 0, 0.00448430516, 0)
        ImageLabel.Name = "Fade"
        ImageLabel.Parent = Frame3
        ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0.271477222, 0, 0.572961032, 0)
        ImageLabel.Size = UDim2.new(0.540019274, 0, 0.521674156, 0)
        ImageLabel.ImageColor3 = Color3.fromRGB(20, 20, 20)
        ImageLabel2.Parent = ImageLabel
        ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel2.BackgroundTransparency = 1
        ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel2.BorderSizePixel = 0
        ImageLabel2.Position = UDim2.new(0.533457458, 0, -0.804165304, 0)
        ImageLabel2.Size = UDim2.new(0.773134291, 0, 1.24055934, 0)
        ImageLabel2.Image = "http://www.roblox.com/asset/?id=76835744887792"
        ImageLabel3.Name = "Texture"
        ImageLabel3.Parent = Frame3
        ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel3.BackgroundTransparency = 1
        ImageLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel3.BorderSizePixel = 0
        ImageLabel3.Position = UDim2.new(0.5, 0, 0.840807199, 0)
        ImageLabel3.Size = UDim2.new(0.996142566, 0, 0.316890895, 0)
        ImageLabel3.ZIndex = 0
        ImageLabel3.Image = "rbxassetid://14841461336"
        ImageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
        UIAspectRatioConstraint3.Parent = ImageLabel3
        UIAspectRatioConstraint3.AspectRatio = 4.873
        Frame6.Name = "Text"
        Frame6.Parent = Frame3
        Frame6.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame6.BackgroundColor3 = Color3.fromRGB(0, 255, 183)
        Frame6.BackgroundTransparency = 1
        Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame6.BorderSizePixel = 0
        Frame6.Position = UDim2.new(0.644648015, 0, 0.921524644, 0)
        Frame6.Size = UDim2.new(0.646094441, 0, 0.0896860957, 0)
        UIAspectRatioConstraint4.Parent = Frame6
        UIAspectRatioConstraint4.AspectRatio = 11.167
        TextLabel2.Name = "Text"
        TextLabel2.Parent = Frame6
        TextLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel2.BackgroundTransparency = 1
        TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel2.BorderSizePixel = 0
        TextLabel2.Position = UDim2.new(0.271514088, 0, -0.122639552, 0)
        TextLabel2.Size = UDim2.new(0.541312337, 0, 0.709165871, 0)
        TextLabel2.Font = Enum.Font.FredokaOne
        TextLabel2.Text = "Developed By Radeon Hub"
        TextLabel2.TextColor3 = Color3.fromRGB(113, 113, 113)
        TextLabel2.TextScaled = true
        TextLabel2.TextSize = 14
        TextLabel2.TextWrapped = true
        TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
        ImageButton2.Parent = Frame6
        ImageButton2.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        ImageButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton2.BorderSizePixel = 0
        ImageButton2.Position = UDim2.new(-0.138342932, 0, -2.7752068, 0)
        ImageButton2.Size = UDim2.new(0.273616999, 0, 1.08347154, 0)
        ImageButton2.ScaleType = Enum.ScaleType.Fit
        UICorner4.CornerRadius = UDim.new(0, 30)
        UICorner4.Parent = ImageButton2
        ImageButton3.Parent = Frame6
        ImageButton3.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        ImageButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton3.BorderSizePixel = 0
        ImageButton3.Position = UDim2.new(0.408961624, 0, -2.7752068, 0)
        ImageButton3.Size = UDim2.new(0.273616999, 0, 1.08347154, 0)
        ImageButton3.ScaleType = Enum.ScaleType.Fit
        UICorner5.CornerRadius = UDim.new(0, 30)
        UICorner5.Parent = ImageButton3
        TextLabel3.Name = "Text"
        TextLabel3.Parent = Frame3
        TextLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel3.BackgroundTransparency = 1
        TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel3.BorderSizePixel = 0
        TextLabel3.Position = UDim2.new(0.502972662, 0, 0.91368711, 0)
        TextLabel3.Size = UDim2.new(0.159827232, 0, 0.0691486374, 0)
        TextLabel3.Font = Enum.Font.FredokaOne
        TextLabel3.Text = "UI by Festive"
        TextLabel3.TextColor3 = Color3.fromRGB(113, 113, 113)
        TextLabel3.TextScaled = true
        TextLabel3.TextSize = 20
        TextLabel3.TextWrapped = true
        UITextSizeConstraint.Parent = TextLabel3
        UITextSizeConstraint.MaxTextSize = 32
        UIAspectRatioConstraint5.Parent = Frame2
        UIAspectRatioConstraint5.AspectRatio = 1.466
        TextButton.Name = "GetKey"
        TextButton.Parent = Frame2
        TextButton.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton.BorderSizePixel = 0
        TextButton.Position = UDim2.new(0.224703535, 0, 0.54126811, 0)
        TextButton.Size = UDim2.new(0.245907247, 0, 0.0892176777, 0)
        TextButton.Font = Enum.Font.FredokaOne
        TextButton.Text = "Get Key"
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextScaled = true
        TextButton.TextSize = 32
        TextButton.TextWrapped = true
        UICorner6.CornerRadius = UDim.new(0, 30)
        UICorner6.Parent = TextButton
        UITextSizeConstraint2.Parent = TextButton
        UITextSizeConstraint2.MaxTextSize = 32
        TextButton2.Name = "Check"
        TextButton2.Parent = Frame2
        TextButton2.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton2.BorderSizePixel = 0
        TextButton2.Position = UDim2.new(0.493561059, 0, 0.54126811, 0)
        TextButton2.Size = UDim2.new(0.245907247, 0, 0.0892176777, 0)
        TextButton2.Font = Enum.Font.FredokaOne
        TextButton2.Text = "Check Key"
        TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton2.TextScaled = true
        TextButton2.TextSize = 32
        TextButton2.TextWrapped = true
        UICorner7.CornerRadius = UDim.new(0, 30)
        UICorner7.Parent = TextButton2
        UITextSizeConstraint3.Parent = TextButton2
        UITextSizeConstraint3.MaxTextSize = 32
        TextButton3.Name = "Help"
        TextButton3.Parent = Frame2
        TextButton3.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton3.BorderSizePixel = 0
        TextButton3.Position = UDim2.new(0.402536064, 0, 0.659176171, 0)
        TextButton3.Size = UDim2.new(0.160691857, 0, 0.0892176777, 0)
        TextButton3.Font = Enum.Font.FredokaOne
        TextButton3.Text = "Help"
        TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton3.TextScaled = true
        TextButton3.TextSize = 32
        TextButton3.TextWrapped = true
        UICorner8.CornerRadius = UDim.new(0, 30)
        UICorner8.Parent = TextButton3
        UITextSizeConstraint4.Parent = TextButton3
        UITextSizeConstraint4.MaxTextSize = 32
        ImageButton4.Name = "Discord"
        ImageButton4.Parent = Frame2
        ImageButton4.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        ImageButton4.BackgroundTransparency = 1
        ImageButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton4.BorderSizePixel = 0
        ImageButton4.Position = UDim2.new(0.241511256, 0, 0.67320627, 0)
        ImageButton4.Size = UDim2.new(0.135127246, 0, 0.0660210773, 0)
        ImageButton4.Image = "http://www.roblox.com/asset/?id=745197400"
        ImageButton4.ImageTransparency = 0.02
        ImageButton4.ScaleType = Enum.ScaleType.Fit
        UICorner9.CornerRadius = UDim.new(0, 30)
        UICorner9.Parent = ImageButton4
        ImageButton5.Name = "Youtube"
        ImageButton5.Parent = Frame2
        ImageButton5.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        ImageButton5.BackgroundTransparency = 1
        ImageButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton5.BorderSizePixel = 0
        ImageButton5.Position = UDim2.new(0.57210964, 0, 0.652422905, 0)
        ImageButton5.Size = UDim2.new(0.162216246, 0, 0.099923797, 0)
        ImageButton5.Image = "http://www.roblox.com/asset/?id=14767357680"
        ImageButton5.ImageTransparency = 0.02
        ImageButton5.ScaleType = Enum.ScaleType.Fit
        UICorner10.CornerRadius = UDim.new(0, 30)
        UICorner10.Parent = ImageButton5
        TextBox.Name = "KeyInput"
        TextBox.Parent = Frame2
        TextBox.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextBox.BorderSizePixel = 0
        TextBox.Position = UDim2.new(0.224858671, 0, 0.42760843, 0)
        TextBox.Size = UDim2.new(0.514944375, 0, 0.0892176777, 0)
        TextBox.Font = Enum.Font.FredokaOne
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.PlaceholderText = "Enter Key"
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextScaled = true
        TextBox.TextSize = 38
        TextBox.TextWrapped = true
        UICorner11.CornerRadius = UDim.new(0, 30)
        UICorner11.Parent = TextBox
        UITextSizeConstraint5.Parent = TextBox
        UITextSizeConstraint5.MaxTextSize = 38
        Frame7.Name = "ScreenNotification"
        Frame7.Parent = ScreenGui
        Frame7.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame7.BackgroundTransparency = 1
        Frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame7.BorderSizePixel = 0
        Frame7.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame7.Size = UDim2.new(1, 0, 1, 0)
        Frame7.Visible = false
        Frame8.Name = "NContainer"
        Frame8.Parent = Frame7
        Frame8.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame8.BackgroundColor3 = Color3.fromRGB(255, 6, 213)
        Frame8.BackgroundTransparency = 1
        Frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame8.BorderSizePixel = 0
        Frame8.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame8.Size = UDim2.new(0.557291687, 0, 0.650147378, 0)
        Frame9.Name = "NMainFrame"
        Frame9.Parent = Frame8
        Frame9.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame9.BorderSizePixel = 0
        Frame9.Position = UDim2.new(0.480979443, 0, -0.0429708473, 0)
        Frame9.Size = UDim2.new(0.486019731, 0, 0.400192618, 0)
        UICorner12.CornerRadius = UDim.new(0.0299999993, 0)
        UICorner12.Parent = Frame9
        UIGradient3.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))
		})
        UIGradient3.Rotation = -90
        UIGradient3.Parent = Frame9
        Frame10.Name = "Text"
        Frame10.Parent = Frame9
        Frame10.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame10.BackgroundColor3 = Color3.fromRGB(0, 255, 183)
        Frame10.BackgroundTransparency = 1
        Frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame10.BorderSizePixel = 0
        Frame10.Position = UDim2.new(0.644648015, 0, 0.921524644, 0)
        Frame10.Size = UDim2.new(0.646094441, 0, 0.0896860957, 0)
        UIAspectRatioConstraint6.Parent = Frame10
        UIAspectRatioConstraint6.AspectRatio = 11.167
        ImageButton6.Name = "CloseScreen"
        ImageButton6.Parent = Frame10
        ImageButton6.BackgroundColor3 = Color3.fromRGB(127, 34, 239)
        ImageButton6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageButton6.BorderSizePixel = 0
        ImageButton6.Position = UDim2.new(-0.645, 0, -0.417451888, 0)
        ImageButton6.Size = UDim2.new(1.772, 0, 1.77846885, 0)
        ImageButton6.ScaleType = Enum.ScaleType.Fit
        UICorner13.CornerRadius = UDim.new(0, 30)
        UICorner13.Parent = ImageButton6
        TextLabel4.Name = "Text"
        TextLabel4.Parent = Frame10
        TextLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel4.BackgroundTransparency = 1
        TextLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel4.BorderSizePixel = 0
        TextLabel4.Position = UDim2.new(0.24822776, 0, -3.66316342, 0)
        TextLabel4.Size = UDim2.new(1.66775072, 0, 4.47679567, 0)
        TextLabel4.Font = Enum.Font.FredokaOne
        TextLabel4.Text = "Press 'Get Key' To Copy Key Link To Clipboard. Key Refreshes Every 72 Hours."
        TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel4.TextScaled = true
        TextLabel4.TextSize = 14
        TextLabel4.TextWrapped = true
        TextLabel4.ZIndex = 999
        TextLabel5.Name = "Text"
        TextLabel5.Parent = Frame9
        TextLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel5.BackgroundTransparency = 1
        TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel5.BorderSizePixel = 0
        TextLabel5.Position = UDim2.new(0.498826087, 0, 0.905544519, 0)
        TextLabel5.Size = UDim2.new(1.00234795, 0, 0.186402828, 0)
        TextLabel5.Font = Enum.Font.FredokaOne
        TextLabel5.Text = "OK"
        TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel5.TextScaled = true
        TextLabel5.TextSize = 20
        TextLabel5.TextWrapped = true
        UITextSizeConstraint6.Parent = TextLabel5
        UITextSizeConstraint6.MaxTextSize = 32
        ImageLabel4.Name = "Texture"
        ImageLabel4.Parent = Frame9
        ImageLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel4.BackgroundTransparency = 1
        ImageLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel4.BorderSizePixel = 0
        ImageLabel4.Position = UDim2.new(0.5, 0, 0.840807199, 0)
        ImageLabel4.Size = UDim2.new(0.996142566, 0, 0.316890895, 0)
        ImageLabel4.ZIndex = 0
        ImageLabel4.Image = "rbxassetid://14841461336"
        ImageLabel4.ImageColor3 = Color3.fromRGB(0, 0, 0)
        UIAspectRatioConstraint7.Parent = ImageLabel4
        UIAspectRatioConstraint7.AspectRatio = 4.873
        ImageLabel5.Name = "Fade"
        ImageLabel5.Parent = Frame9
        ImageLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel5.BackgroundTransparency = 1
        ImageLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel5.BorderSizePixel = 0
        ImageLabel5.Position = UDim2.new(0.271477222, 0, 0.572961032, 0)
        ImageLabel5.Size = UDim2.new(0.540019274, 0, 0.521674156, 0)
        ImageLabel5.ImageColor3 = Color3.fromRGB(20, 20, 20)
        ImageLabel6.Parent = ImageLabel5
        ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel6.BackgroundTransparency = 1
        ImageLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel6.BorderSizePixel = 0
        ImageLabel6.Position = UDim2.new(0.533457458, 0, -0.804165304, 0)
        ImageLabel6.Size = UDim2.new(0.773134291, 0, 1.24055934, 0)
        ImageLabel6.Image = "http://www.roblox.com/asset/?id=76835744887792"
        UIAspectRatioConstraint8.Parent = Frame8
        UIAspectRatioConstraint8.AspectRatio = 1.466
        Frame11.ZIndex = 999
        Frame11.Name = "DiscreteNotification"
        Frame11.Parent = ScreenGui
        Frame11.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame11.BackgroundTransparency = 1
        Frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame11.BorderSizePixel = 0
        Frame11.Position = UDim2.new(0.6, 0, 0.525, 0)
        Frame11.Size = UDim2.new(0.8, 0, 1, 0)
        Frame11.Visible = false
        Frame12.ZIndex = 999
        Frame12.Name = "NContainer"
        Frame12.Parent = Frame11
        Frame12.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame12.BackgroundColor3 = Color3.fromRGB(255, 6, 213)
        Frame12.BackgroundTransparency = 1
        Frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame12.BorderSizePixel = 0
        Frame12.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame12.Size = UDim2.new(0.557291687, 0, 0.650147378, 0)
        Frame13.ZIndex = 999
        Frame13.Name = "NMainFrame"
        Frame13.Parent = Frame12
        Frame13.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame13.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame13.BorderSizePixel = 0
        Frame13.Position = UDim2.new(1.18262494, 0, 1.11506081, 0)
        Frame13.Size = UDim2.new(0.349999994, 0, 0.25, 0)
        UIGradient4.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))
		})
        UIGradient4.Rotation = -90
        UIGradient4.Parent = Frame13
        UICorner14.CornerRadius = UDim.new(0.0299999993, 0)
        UICorner14.Parent = Frame13
        ImageLabel7.ZIndex = 999
        ImageLabel7.Name = "Fade"
        ImageLabel7.Parent = Frame13
        ImageLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel7.BackgroundTransparency = 1
        ImageLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel7.BorderSizePixel = 0
        ImageLabel7.Position = UDim2.new(0.271477222, 0, 0.572961032, 0)
        ImageLabel7.Size = UDim2.new(0.540019274, 0, 0.521674156, 0)
        ImageLabel7.ImageColor3 = Color3.fromRGB(20, 20, 20)
        ImageLabel8.ZIndex = 999
        ImageLabel8.Parent = ImageLabel7
        ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel8.BackgroundTransparency = 1
        ImageLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel8.BorderSizePixel = 0
        ImageLabel8.Position = UDim2.new(0.533457458, 0, -0.804165304, 0)
        ImageLabel8.Size = UDim2.new(0.773134291, 0, 1.24055934, 0)
        ImageLabel8.Image = "http://www.roblox.com/asset/?id=76835744887792"
        ImageLabel9.ZIndex = 999
        ImageLabel9.Name = "Texture"
        ImageLabel9.Parent = Frame13
        ImageLabel9.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel9.BackgroundTransparency = 1
        ImageLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ImageLabel9.BorderSizePixel = 0
        ImageLabel9.Position = UDim2.new(0.5, 0, 0.840807199, 0)
        ImageLabel9.Size = UDim2.new(0.996142566, 0, 0.316890895, 0)
        ImageLabel9.ZIndex = 0
        ImageLabel9.Image = "rbxassetid://14841461336"
        ImageLabel9.ImageColor3 = Color3.fromRGB(0, 0, 0)
        UIAspectRatioConstraint9.Parent = ImageLabel9
        UIAspectRatioConstraint9.AspectRatio = 4.873
        Frame14.ZIndex = 999
        Frame14.Name = "Text"
        Frame14.Parent = Frame13
        Frame14.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame14.BackgroundColor3 = Color3.fromRGB(0, 255, 183)
        Frame14.BackgroundTransparency = 1
        Frame14.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame14.BorderSizePixel = 0
        Frame14.Position = UDim2.new(0.644648015, 0, 0.921524644, 0)
        Frame14.Size = UDim2.new(0.646094441, 0, 0.0896860957, 0)
        UIAspectRatioConstraint10.Parent = Frame14
        UIAspectRatioConstraint10.AspectRatio = 11.167
        TextLabel6.ZIndex = 999
        TextLabel6.Name = "Content"
        TextLabel6.Parent = Frame14
        TextLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel6.BackgroundTransparency = 1
        TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel6.BorderSizePixel = 0
        TextLabel6.Position = UDim2.new(0.20976615, 0, -2.63605857, 0)
        TextLabel6.Size = UDim2.new(1.92253566, 0, 6.69481993, 0)
        TextLabel6.Font = Enum.Font.FredokaOne
        TextLabel6.Text = ""
        TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel6.TextScaled = true
        TextLabel6.TextSize = 14
        TextLabel6.TextWrapped = true
        UIAspectRatioConstraint11.Parent = Frame12
        UIAspectRatioConstraint11.AspectRatio = 1.466
        UICorner13.Parent = TextBox
        UICorner13.CornerRadius = UDim.new(0, 30)
        UITextSizeConstraint5.Parent = TextBox
        UITextSizeConstraint5.MaxTextSize = 38
        local UICorner15 = Instance.new("UICorner")
        UICorner15.CornerRadius = UDim.new(0, 8)
        UICorner15.Parent = Frame13
        local function v336(p67, p68)
            if Frame11.Visible then
                Frame11.Visible = false
            end

            TextLabel6.Text = p67
            Frame11.Visible = true
            wait(p68)
            Frame11.Visible = false
        end
        if lastKnownFramePosition then
            Frame.Position = lastKnownFramePosition
        end
        spawn(function()
            while wait(30) do
                if Frame7.Visible then
                    Frame7.Visible = false
                end

                Frame7.Visible = true
                TextLabel4.Text = "Tired of the Key System? Radeon Hub offers weekly/permanent keys for under $5. DM realrade0n on Discord to learn more."

                local v350 = false
                local v351 = true

                ImageButton6.MouseButton1Click:Connect(function()
                    Frame7.Visible = false

                    if v350 or v351 then
                        TextLabel4.Text = "Press 'Get Key' To Copy Key Link To Clipboard. Key Refreshes Every 48 Hours."
                    end
                end)
            end
        end)
        local TweenService = game:GetService("TweenService")
        TextButton2.MouseButton1Click:Connect(function()
            local TextBoxText = TextBox.Text

            if v22(TextBoxText) then
                TweenService:Create(TextButton2, TweenInfo.new(), {
					BackgroundColor3 = Color3.fromRGB(0, 255, 0)
				}):Play()
                pcall(function()
                    delfile("RadeonFolder/key.txt")
                end)
                writefile("RadeonFolder/key.txt", TextBoxText)
                v336("Correct: Loading Radeon Hub...", 3)
                ScreenGui:Destroy()

                if not t2[56]() then
                    game:GetService("Players").LocalPlayer:Kick("This game is unsupported. Join the Radeon Hub Discord for the supported games list.")

                    return
                end
            else
                TweenService:Create(TextButton2, TweenInfo.new(0.2), {
					BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				}):Play()
                wait(0.2)
                TweenService:Create(TextButton2, TweenInfo.new(0.2), {
					BackgroundColor3 = Color3.fromRGB(127, 34, 239)
				}):Play()
            end
        end)
        TextButton.MouseButton1Click:Connect(function()
            t2[54]()
            if Frame7.Visible then
                Frame7.Visible = false
            end
            Frame7.Visible = true
            TextLabel4.Text = "Key Link copied to your clipboard. Paste this into a search engine to retrieve your key. Retrieval takes 1-2 mins max."
            local v353 = true
            local v354
            ImageButton6.MouseButton1Click:Connect(function()
                Frame7.Visible = false

                if v353 or v354 then
                    TextLabel4.Text = "Press 'Get Key' To Copy Key Link To Clipboard. Key Refreshes Every 48 Hours."
                end
            end)
        end)
        ImageButton4.MouseButton1Click:Connect(function()
            setclipboard("https://discord.gg/EcT4TQByrd")

            local _syn = syn

            if _syn then
                _syn = syn.request
            end

            if not _syn then
                local _http = http

                if _http then
                    _http = http.request
                end

                _syn = _http or http_request
            end

            local HttpService = game:GetService("HttpService")

            if _syn then
                local t16 = {
					["Content-Type"] = "application/json",
					Origin = "https://discord.com"
				}
                local guid = HttpService:GenerateGUID(false)
                local JSONEncode = HttpService.JSONEncode
                local t17 = {
					code = "EcT4TQByrd"
				}
                local v362 = JSONEncode(HttpService, {
					cmd = "INVITE_BROWSER",
					nonce = guid,
					args = t17
				})

                _syn({
					Url = "http://127.0.0.1:6463/rpc?v=1",
					Method = "POST",
					Headers = t16,
					Body = v362
				})
            else
                warn("Radeon Hub: Discord Join Failed.")
            end

            v336("Prompted Discord Join. Server Invite Also Copied To Clipboard.", 5)
        end)
        ImageButton5.MouseButton1Click:Connect(function()
            setclipboard("https://www.youtube.com/@RadeonScripts")
            v336("Youtube Channel Link Copied To Clipboard.", 3)
        end)
        ImageButton.MouseButton1Click:Connect(function()
            GUIDestroyed = true
            wait()
            ScreenGui:Destroy()
        end)
        TextButton3.MouseButton1Click:Connect(function()
            if Frame7.Visible then
                Frame7.Visible = false
            end
            Frame7.Visible = true
            local v363 = false
            local v364
            ImageButton6.MouseButton1Click:Connect(function()
                Frame7.Visible = false

                if v363 or v364 then
                    TextLabel4.Text = "Press 'Get Key' To Copy Key Link To Clipboard. Key Refreshes Every 48 Hours."
                end
            end)
        end)
        local UserInputService = game:GetService("UserInputService")
        local u339 = false
        local u340
        local inputPosition
        local FramePosition
        Frame3.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                u339 = true
                inputPosition = input.Position
                FramePosition = Frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        lastKnownFramePosition = Frame.Position
                        u339 = false
                    end
                end)
            end
        end)
        Frame3.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                u340 = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == u340 and u339 then
                local v368 = input.Position - inputPosition

                Frame.Position = UDim2.new(FramePosition.X.Scale, FramePosition.X.Offset + v368.X, FramePosition.Y.Scale, FramePosition.Y.Offset + v368.Y)
            end
        end)
        local TweenService2 = game:GetService("TweenService")
        local function v344(p69)
            local color3 = Color3.fromRGB(0, 145, 255)
            local p69BackgroundColor3 = p69.BackgroundColor3
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService2:Create(p69, tweenInfo, {
				BackgroundColor3 = color3
			})
            local tween2 = TweenService2:Create(p69, tweenInfo, {
				BackgroundColor3 = p69BackgroundColor3
			})

            p69.MouseEnter:Connect(function()
                tween:Play()
            end)
            p69.MouseLeave:Connect(function()
                tween2:Play()
            end)
        end
        v344(TextButton2)
        v344(ImageButton2)
        v344(TextButton)
        v344(ImageButton3)
        v344(TextButton3)
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if readfile("RadeonFolder/key.txt") ~= foundKey and not GUIDestroyed then
                (nil)()
            end
        end)
    end)()
end
