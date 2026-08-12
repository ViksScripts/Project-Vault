-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

local t1 = {
	ServiceId = 27854,
	PlatoSecret = "21136944-5c14-46b9-af31-4f0998818cc0",
	MainScriptURL = "https://raw.githubusercontent.com/madundung863-a11y/BroodHub/refs/heads/main/Op%20mm2%20script",
	HubName = "BROODSCRIPT HUB",
	TelegramURL = "https://t.me/broodhubnews",
	TelegramLabel = "HUB NEWS",
	KeyFileName = "BroodScriptKey_MM2.txt",
}

local function v2(p1, p2)
	local n1 = 0
	local n2 = 1

	while p1 ~= 0 or p2 ~= 0 do
		n1 = n1 + (p1 % 2 + p2 % 2) % 2 * n2

		local v119 = p1 / 2

		p1 = math.floor(v119)

		local v120 = p2 / 2

		p2 = math.floor(v120)
		n2 = n2 * 2
	end

	return n1 % 4294967296
end

local u3 = v2

local function u4(p3, p4, p5, ...)
	if not p4 then
		if not p3 then
			return 0
		end

		return p3 % 4294967296
	end

	local v124 = p3 % 4294967296
	local v125 = p4 % 4294967296
	local v126 = u3(v124, v125)

	if p5 then
		v126 = u4(v126, p5, ...)
	end

	return v126
end

local u5 = v2

local function u6(p6, p7, p8, ...)
	if not p7 then
		if not p6 then
			return 4294967295
		end

		return p6 % 4294967296
	end

	local v130 = p6 % 4294967296
	local v131 = p7 % 4294967296
	local v132 = (v130 + v131 - u5(v130, v131)) / 2

	if p8 then
		v132 = u6(v132, p8, ...)
	end

	return v132
end
local function u7(p9, p10)
	if not (p10 < 0) then
		local v137 = p9 % 4294967296 / 2 ^ p10

		return (math.floor(v137))
	end

	return lshift(p9, -p10)
end
local function v8(p11, p12)
	if not (p12 > 31) and not (p12 < -31) then
		return u7(p11 % 4294967296, p12)
	end

	return 0
end
local t2 = {
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
	3329325298,
}
local u12 = u4
local u13 = u6
local u14 = v8

local function u15(p13, p14, p15)
	local t3 = {}

	for i = 1, 16 do
		local v180 = i
		local v181 = p14 + (i - 1) * 4
		local n3 = 0

		for j = v181, v181 + 3 do
			n3 = n3 * 256 + string.byte(p13, j)
		end

		t3[v180] = n3
	end

	for i = 17, 64 do
		local v185 = i
		local v186 = t3[i - 15]
		local v187 = u12
		local v188 = v186 % 4294967296
		local v189 = 7
		local v190 = u13(v188, 127)
		local v193

		if true then
			local v191 = v188 % 4294967296

			if true then
				local v192 = v191 % 4294967296 / 128
				v193 = math.floor(v192)
			else
				v193 = lshift(v191, -7)
			end
		else
			v193 = 0
		end

		local v194

		if not (v189 < 0) then
			v194 = v190 * 2 ^ v189 % 4294967296
		else
			local v195 = -v189

			if not (v195 > 31) and not (v195 < -31) then
				local v196 = v190 % 4294967296

				if not (v195 < 0) then
					local v197 = v196 % 4294967296 / 2 ^ v195

					v194 = math.floor(v197)
				else
					v194 = lshift(v196, -v195)
				end
			else
				v194 = 0
			end
		end

		local v198 = v193 + v194
		local v199 = v186 % 4294967296
		local v200 = 18
		local v201 = u13(v199, 262143)
		local v204

		if true then
			local v202 = v199 % 4294967296

			if true then
				local v203 = v202 % 4294967296 / 262144
				v204 = math.floor(v203)
			else
				v204 = lshift(v202, -18)
			end
		else
			v204 = 0
		end

		local v205

		if not (v200 < 0) then
			v205 = v201 * 2 ^ v200 % 4294967296
		else
			local v206 = -v200

			if not (v206 > 31) and not (v206 < -31) then
				local v207 = v201 % 4294967296

				if not (v206 < 0) then
					local v208 = v207 % 4294967296 / 2 ^ v206

					v205 = math.floor(v208)
				else
					v205 = lshift(v207, -v206)
				end
			else
				v205 = 0
			end
		end

		local v209 = v187(v198, v204 + v205, u14(v186, 3))
		local v210 = t3[v185 - 2]
		local v211 = t3[v185 - 16] + v209 + t3[v185 - 7]
		local v212 = u12
		local v213 = v210 % 4294967296
		local v214 = 17
		local v215 = u13(v213, 131071)
		local v218

		if true then
			local v216 = v213 % 4294967296

			if true then
				local v217 = v216 % 4294967296 / 131072
				v218 = math.floor(v217)
			else
				v218 = lshift(v216, -17)
			end
		else
			v218 = 0
		end

		local v219

		if not (v214 < 0) then
			v219 = v215 * 2 ^ v214 % 4294967296
		else
			local v220 = -v214

			if not (v220 > 31) and not (v220 < -31) then
				local v221 = v215 % 4294967296

				if not (v220 < 0) then
					local v222 = v221 % 4294967296 / 2 ^ v220

					v219 = math.floor(v222)
				else
					v219 = lshift(v221, -v220)
				end
			else
				v219 = 0
			end
		end

		local v223 = v218 + v219
		local v224 = v210 % 4294967296
		local v225 = 19
		local v226 = u13(v224, 524287)
		local v229

		if true then
			local v227 = v224 % 4294967296

			if true then
				local v228 = v227 % 4294967296 / 524288
				v229 = math.floor(v228)
			else
				v229 = lshift(v227, -19)
			end
		else
			v229 = 0
		end

		local v230

		if not (v225 < 0) then
			v230 = v226 * 2 ^ v225 % 4294967296
		else
			local v231 = -v225

			if not (v231 > 31) and not (v231 < -31) then
				local v232 = v226 % 4294967296

				if not (v231 < 0) then
					local v233 = v232 % 4294967296 / 2 ^ v231

					v230 = math.floor(v233)
				else
					v230 = lshift(v232, -v231)
				end
			else
				v230 = 0
			end
		end

		t3[v185] = (v211 + v212(v223, v229 + v230, u14(v210, 10))) % 4294967296
	end

	local v234 = p15[1]
	local v235 = p15[2]
	local v236 = p15[3]
	local v237 = p15[4]
	local v238 = p15[5]
	local v239 = p15[6]
	local v240 = p15[7]
	local v241 = p15[8]

	for i = 1, 64 do
		local v243 = i
		local v244 = u12
		local v245 = v234 % 4294967296
		local v246 = 2
		local v247 = u13(v245, 3)
		local v250

		if true then
			local v248 = v245 % 4294967296

			if true then
				local v249 = v248 % 4294967296 / 4
				v250 = math.floor(v249)
			else
				v250 = lshift(v248, -2)
			end
		else
			v250 = 0
		end

		local v251

		if not (v246 < 0) then
			v251 = v247 * 2 ^ v246 % 4294967296
		else
			local v252 = -v246

			if not (v252 > 31) and not (v252 < -31) then
				local v253 = v247 % 4294967296

				if not (v252 < 0) then
					local v254 = v253 % 4294967296 / 2 ^ v252

					v251 = math.floor(v254)
				else
					v251 = lshift(v253, -v252)
				end
			else
				v251 = 0
			end
		end

		local v255 = v250 + v251
		local v256 = v234 % 4294967296
		local v257 = 13
		local v258 = u13(v256, 8191)
		local v261

		if true then
			local v259 = v256 % 4294967296

			if true then
				local v260 = v259 % 4294967296 / 8192
				v261 = math.floor(v260)
			else
				v261 = lshift(v259, -13)
			end
		else
			v261 = 0
		end

		local v262

		if not (v257 < 0) then
			v262 = v258 * 2 ^ v257 % 4294967296
		else
			local v263 = -v257

			if not (v263 > 31) and not (v263 < -31) then
				local v264 = v258 % 4294967296

				if not (v263 < 0) then
					local v265 = v264 % 4294967296 / 2 ^ v263

					v262 = math.floor(v265)
				else
					v262 = lshift(v264, -v263)
				end
			else
				v262 = 0
			end
		end

		local v266 = v261 + v262
		local v267 = v234 % 4294967296
		local v268 = 22
		local v269 = u13(v267, 4194303)
		local v272

		if true then
			local v270 = v267 % 4294967296

			if true then
				local v271 = v270 % 4294967296 / 4194304
				v272 = math.floor(v271)
			else
				v272 = lshift(v270, -22)
			end
		else
			v272 = 0
		end

		local v273

		if not (v268 < 0) then
			v273 = v269 * 2 ^ v268 % 4294967296
		else
			local v274 = -v268

			if not (v274 > 31) and not (v274 < -31) then
				local v275 = v269 % 4294967296

				if not (v274 < 0) then
					local v276 = v275 % 4294967296 / 2 ^ v274

					v273 = math.floor(v276)
				else
					v273 = lshift(v275, -v274)
				end
			else
				v273 = 0
			end
		end

		local v277 = (v244(v255, v266, v272 + v273) + u12(u13(v234, v235), u13(v234, v236), u13(v235, v236))) % 4294967296
		local v278 = u12
		local v279 = v238 % 4294967296
		local v280 = 6
		local v281 = u13(v279, 63)
		local v284

		if true then
			local v282 = v279 % 4294967296

			if true then
				local v283 = v282 % 4294967296 / 64
				v284 = math.floor(v283)
			else
				v284 = lshift(v282, -6)
			end
		else
			v284 = 0
		end

		local v285

		if not (v280 < 0) then
			v285 = v281 * 2 ^ v280 % 4294967296
		else
			local v286 = -v280

			if not (v286 > 31) and not (v286 < -31) then
				local v287 = v281 % 4294967296

				if not (v286 < 0) then
					local v288 = v287 % 4294967296 / 2 ^ v286

					v285 = math.floor(v288)
				else
					v285 = lshift(v287, -v286)
				end
			else
				v285 = 0
			end
		end

		local v289 = v284 + v285
		local v290 = v238 % 4294967296
		local v291 = 11
		local v292 = u13(v290, 2047)
		local v295

		if true then
			local v293 = v290 % 4294967296

			if true then
				local v294 = v293 % 4294967296 / 2048
				v295 = math.floor(v294)
			else
				v295 = lshift(v293, -11)
			end
		else
			v295 = 0
		end

		local v296

		if not (v291 < 0) then
			v296 = v292 * 2 ^ v291 % 4294967296
		else
			local v297 = -v291

			if not (v297 > 31) and not (v297 < -31) then
				local v298 = v292 % 4294967296

				if not (v297 < 0) then
					local v299 = v298 % 4294967296 / 2 ^ v297

					v296 = math.floor(v299)
				else
					v296 = lshift(v298, -v297)
				end
			else
				v296 = 0
			end
		end

		local v300 = v295 + v296
		local v301 = v238 % 4294967296
		local v302 = 25
		local v303 = u13(v301, 33554431)
		local v306

		if true then
			local v304 = v301 % 4294967296

			if true then
				local v305 = v304 % 4294967296 / 33554432
				v306 = math.floor(v305)
			else
				v306 = lshift(v304, -25)
			end
		else
			v306 = 0
		end

		local v307

		if not (v302 < 0) then
			v307 = v303 * 2 ^ v302 % 4294967296
		else
			local v308 = -v302

			if not (v308 > 31) and not (v308 < -31) then
				local v309 = v303 % 4294967296

				if not (v308 < 0) then
					local v310 = v309 % 4294967296 / 2 ^ v308

					v307 = math.floor(v310)
				else
					v307 = lshift(v309, -v308)
				end
			else
				v307 = 0
			end
		end

		local v311 = v278(v289, v300, v306 + v307)
		local v312 = u12(u13(v238, v239), u13(v239, v240))
		local v313 = (v241 + v311 + v312 + t2[v243] + t3[v243]) % 4294967296

		v241 = v240
		v240 = v239
		v239 = v238
		v238 = (v237 + v313) % 4294967296
		v237 = v236
		v236 = v235
		v235 = v234
		v234 = (v313 + v277) % 4294967296
	end

	p15[1] = (p15[1] + v234) % 4294967296
	p15[2] = (p15[2] + v235) % 4294967296
	p15[3] = (p15[3] + v236) % 4294967296
	p15[4] = (p15[4] + v237) % 4294967296
	p15[5] = (p15[5] + v238) % 4294967296
	p15[6] = (p15[6] + v239) % 4294967296
	p15[7] = (p15[7] + v240) % 4294967296
	p15[8] = (p15[8] + v241) % 4294967296
end
local function u16(p16)
	return string.gsub(p16, ".", function(p17)
		return string.format("%02x", string.byte(p17))
	end)
end
local function v17(p18)
	local v315 = nil
	local v316 = #p18
	local _ = (v316 + 9) % 64
	local v318 = 8 * v316
	local s1 = ""

	for _ = 1, 8 do
		local v321 = v318 % 256

		v318 = (v318 - (string.char(v321) .. s1)) / 256
	end

	local _ = p18 .. "\128" .. string.rep("\000", v315) .. s1
	local v323 = #p18 % 64 == 0

	assert(v323)

	local t4 = {
		1779033703,
		3144134277,
		1013904242,
		2773480762,
		1359893119,
		2600822924,
		528734635,
		1541459225,
	}

	for i = 1, #p18, 64 do
		u15(p18, i, t4)
	end
	local v327 = t4[1]
	local v329 = v327 % 256
	local v330 = (v327 - (string.char(v329) .. "")) / 256
	local v331 = v330 % 256
	local v332 = (v330 - (string.char(v331) .. "")) / 256
	local v333 = v332 % 256
	local v334 = (v332 - (string.char(v333) .. "")) / 256
	local v335 = v334 % 256
	local _ = (v334 - (string.char(v335) .. "")) / 256
	local v337 = t4[2]
	local v339 = v337 % 256
	local v340 = (v337 - (string.char(v339) .. "")) / 256
	local v341 = v340 % 256
	local v342 = (v340 - (string.char(v341) .. "")) / 256
	local v343 = v342 % 256
	local v344 = (v342 - (string.char(v343) .. "")) / 256
	local v345 = v344 % 256
	local _ = (v344 - (string.char(v345) .. "")) / 256
	local v347 = t4[3]
	local v349 = v347 % 256
	local v350 = (v347 - (string.char(v349) .. "")) / 256
	local v351 = v350 % 256
	local v352 = (v350 - (string.char(v351) .. "")) / 256
	local v353 = v352 % 256
	local v354 = (v352 - (string.char(v353) .. "")) / 256
	local v355 = v354 % 256
	local _ = (v354 - (string.char(v355) .. "")) / 256
	local v357 = t4[4]
	local v359 = v357 % 256
	local v360 = (v357 - (string.char(v359) .. "")) / 256
	local v361 = v360 % 256
	local v362 = (v360 - (string.char(v361) .. "")) / 256
	local v363 = v362 % 256
	local v364 = (v362 - (string.char(v363) .. "")) / 256
	local v365 = v364 % 256
	local _ = (v364 - (string.char(v365) .. "")) / 256
	local v367 = t4[5]
	local v369 = v367 % 256
	local v370 = (v367 - (string.char(v369) .. "")) / 256
	local v371 = v370 % 256
	local v372 = (v370 - (string.char(v371) .. "")) / 256
	local v373 = v372 % 256
	local v374 = (v372 - (string.char(v373) .. "")) / 256
	local v375 = v374 % 256
	local _ = (v374 - (string.char(v375) .. "")) / 256
	local v377 = t4[6]
	local v379 = v377 % 256
	local v380 = (v377 - (string.char(v379) .. "")) / 256
	local v381 = v380 % 256
	local v382 = (v380 - (string.char(v381) .. "")) / 256
	local v383 = v382 % 256
	local v384 = (v382 - (string.char(v383) .. "")) / 256
	local v385 = v384 % 256
	local _ = (v384 - (string.char(v385) .. "")) / 256
	local v387 = t4[7]
	local v389 = v387 % 256
	local v390 = (v387 - (string.char(v389) .. "")) / 256
	local v391 = v390 % 256
	local v392 = (v390 - (string.char(v391) .. "")) / 256
	local v393 = v392 % 256
	local v394 = (v392 - (string.char(v393) .. "")) / 256
	local v395 = v394 % 256
	local _ = (v394 - (string.char(v395) .. "")) / 256
	local v397 = t4[8]
	local v399 = v397 % 256
	local v400 = (v397 - (string.char(v399) .. "")) / 256
	local v401 = v400 % 256
	local v402 = (v400 - (string.char(v401) .. "")) / 256
	local v403 = v402 % 256
	local v404 = (v402 - (string.char(v403) .. "")) / 256
	local v405 = v404 % 256
	local _ = (v404 - (string.char(v405) .. "")) / 256

	return u16("")
end

local u18 = nil
local t5 = {
	["\\"] = "\\",
	['"'] = '"',
	["\b"] = "b",
	["\f"] = "f",
	["\n"] = "n",
	["\r"] = "r",
	["\t"] = "t",
}
local t6 = {
	["/"] = "/",
}

for k, v in pairs(t5) do
	t6[v] = k
end

local u23 = t5

local function u24(p19)
	return "\\" .. (u23[p19] or string.format("u%04x", p19:byte()))
end

local t9 = {
	["nil"] = function(_)
		return "null"
	end,
	table = function(p21, p22)
		local t7 = {}
		local v412 = p22 or {}

		if v412[p21] then
			error("circular reference")
		end

		v412[p21] = true

		if rawget(p21, 1) == nil and next(p21) ~= nil then
			for k, v in pairs(p21) do
				if type(k) ~= "string" then
					error("invalid table: mixed or invalid key types")
				end

				local v415 = u18(k, v412) .. ":" .. u18(v, v412)

				table.insert(t7, v415)
			end

			v412[p21] = nil

			return "{" .. table.concat(t7, ",") .. "}"
		end

		local n4 = 0

		for k in pairs(p21) do
			if type(k) ~= "number" then
				error("invalid table: mixed or invalid key types")
			end

			n4 = n4 + 1
		end

		if n4 ~= #p21 then
			error("invalid table: sparse array")
		end

		for _, v in ipairs(p21) do
			local v420 = (function(...)
				local t8 = { ... }

				t8.n = select("#", ...)

				return t8
			end)(u18(v, v412))

			table.insert(t7, unpack(v420, 1, v420.n))
		end

		v412[p21] = nil

		return "[" .. table.concat(t7, ",") .. "]"
	end,
	string = function(p23)
		return '"' .. p23:gsub('[%z\001-\031\\"]', u24) .. '"'
	end,
	number = function(p24)
		if p24 ~= p24 or p24 <= -1e999 or p24 >= 1e999 then
			error("unexpected number value '" .. tostring(p24) .. "'")
		end

		return string.format("%.14g", p24)
	end,
	boolean = tostring,
}

function u18(p25, p26)
	local v431 = type(p25)
	local v432 = t9[v431]

	if not v432 then
		error("unexpected type '" .. v431 .. "'")

		return
	end

	return v432(p25, p26)
end

local u26 = nil

local function v27(...)
	local t10 = {}

	for i = 1, select("#", ...) do
		t10[select(i, ...)] = true
	end

	return t10
end

local v28 = v27(" ", "\t", "\r", "\n")
local v29 = v27(" ", "\t", "\r", "\n", "]", "}", ",")
local v30 = v27("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local v31 = v27("true", "false", "null")
local t11 = {
	["true"] = true,
	["false"] = false,
	null = nil,
}

local function v33(p27, p28, p29, p30)
	for i = p28, #p27 do
		if p30 ~= p29[p27:sub(i, i)] then
			return i
		end
	end

	return #p27 + 1
end
local function v34(p31, p32, p33)
	local n5 = 1
	local n6 = 1

	for i = 1, p32 - 1 do
		n6 = n6 + 1

		if p31:sub(i, i) == "\n" then
			n5 = n5 + 1
			n6 = 1
		end
	end

	error(string.format("%s at line %d col %d", p33, n5, n6))
end
local function u35(p34)
	local floor = math.floor

	if not (p34 <= 127) then
		if not (p34 <= 2047) then
			if not (p34 <= 65535) then
				if not (p34 <= 1114111) then
					error(string.format("invalid unicode codepoint '%x'", p34))

					return
				end

				local v451 = floor(p34 / 262144) + 240
				local v452 = floor(p34 % 262144 / 4096) + 128
				local v453 = floor(p34 % 4096 / 64) + 128
				local v454 = p34 % 64 + 128

				return (string.char(v451, v452, v453, v454))
			end

			local v455 = floor(p34 / 4096) + 224
			local v456 = floor(p34 % 4096 / 64) + 128
			local v457 = p34 % 64 + 128

			return (string.char(v455, v456, v457))
		end

		local v458 = floor(p34 / 64) + 192
		local v459 = p34 % 64 + 128

		return (string.char(v458, v459))
	end

	return (string.char(p34))
end

local u36 = v34

local function u37(p35)
	local v461 = p35:sub(1, 4)
	local num = tonumber(v461, 16)
	local v463 = p35:sub(7, 10)
	local num2 = tonumber(v463, 16)

	if not num2 then
		return u35(num)
	end

	return u35((num - 55296) * 1024 + num2 - 56320 + 65536)
end

local u38 = v30
local u39 = v33
local u40 = v29
local u41 = v34

local function v42(p36, p37)
	local v478 = u39(p36, p37, u40)
	local v479 = p36:sub(p37, v478 - 1)
	local num = tonumber(v479)

	if not num then
		u41(p36, p37, "invalid number '" .. v479 .. "'")
	end

	return num, v478
end

local u43 = v33
local u44 = v29
local u45 = v31
local u46 = v34
local u47 = t11

local function v48(p38, p39)
	local v483 = u43(p38, p39, u44)
	local v484 = p38:sub(p39, v483 - 1)

	if not u45[v484] then
		u46(p38, p39, "invalid literal '" .. v484 .. "'")
	end

	return u47[v484], v483
end

local u49 = v33
local u50 = v28
local u51 = v34
local u52 = v33
local u53 = v28
local u54 = v34
local t14 = {
	['"'] = function(p40, p41)
		local s10 = ""
		local v468 = p41 + 1
		local v469 = v468

		while v468 <= #p40 do
			local v470 = p40:byte(v468)

			if not (v470 < 32) then
				if v470 ~= 92 then
					if v470 == 34 then
						local _ = s10 .. p40:sub(v469, v468 - 1)

						return s10, v468 + 1
					end
				else
					local _ = s10 .. p40:sub(v469, v468 - 1)

					v468 = v468 + 1

					local v473 = p40:sub(v468, v468)

					if v473 ~= "u" then
						if not u38[v473] then
							u36(p40, v468 - 1, "invalid escape char '" .. v473 .. "' in string")
						end

						local _ = s10 .. t6[v473]
					else
						local v475 = p40:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", v468 + 1)
							or (p40:match("^%x%x%x%x", v468 + 1) or u36(p40, v468 - 1, "invalid unicode escape in string"))

						v468 = v468 + #(s10 .. u37(v475))
					end

					v469 = v468 + 1
				end
			else
				u36(p40, v468, "control character in string")
			end

			v468 = v468 + 1
		end

		u36(p40, p41, "expected closing quote for string")
	end,
	["0"] = v42,
	["1"] = v42,
	["2"] = v42,
	["3"] = v42,
	["4"] = v42,
	["5"] = v42,
	["6"] = v42,
	["7"] = v42,
	["8"] = v42,
	["9"] = v42,
	["-"] = v42,
	t = v48,
	f = v48,
	n = v48,
	["["] = function(p42, p43)
		local t12 = {}
		local n7 = 1
		local v489 = p43 + 1
		local v490 = nil

		while true do
			v490 = u49(p42, v489, u50, true)

			if p42:sub(v490, v490) == "]" then
				break
			end

			local v491, v492 = u26(p42, v490)

			t12[n7] = v491
			n7 = n7 + 1

			local v493 = u49(p42, v492, u50, true)
			local v494 = p42:sub(v493, v493)

			v489 = v493 + 1

			if v494 == "]" then
				return t12, v489
			end

			if v494 ~= "," then
				u51(p42, v489, "expected ']' or ','")
			end
		end

		v489 = v490 + 1

		return t12, v489
	end,
	["{"] = function(p44, p45)
		local t13 = {}
		local v498 = p45 + 1
		local v499 = nil

		while true do
			v499 = u52(p44, v498, u53, true)

			if p44:sub(v499, v499) == "}" then
				break
			end

			if p44:sub(v499, v499) ~= '"' then
				u54(p44, v499, "expected string for key")
			end

			local v500, v501 = u26(p44, v499)
			local v502 = u52(p44, v501, u53, true)

			if p44:sub(v502, v502) ~= ":" then
				u54(p44, v502, "expected ':' after key")
			end

			local v503 = u52(p44, v502 + 1, u53, true)
			local v504, v505 = u26(p44, v503)

			t13[v500] = v504

			local v506 = u52(p44, v505, u53, true)
			local v507 = p44:sub(v506, v506)

			v498 = v506 + 1

			if v507 == "}" then
				return t13, v498
			end

			if v507 ~= "," then
				u54(p44, v498, "expected '}' or ','")
			end
		end

		v498 = v499 + 1

		return t13, v498
	end,
}
local u56 = v34

function u26(p46, p47)
	local v510 = p46:sub(p47, p47)
	local v511 = t14[v510]

	if not v511 then
		u56(p46, p47, "unexpected character '" .. v510 .. "'")

		return
	end

	return v511(p46, p47)
end

local u57 = v33
local u58 = v28
local u59 = v34

local function v60(p48)
	if type(p48) ~= "string" then
		error("expected argument of type string, got " .. type(p48))
	end

	local v513, v514 = u26(p48, (u57(p48, 1, u58, true)))
	local v515 = u57(p48, v514, u58, true)

	if v515 <= #p48 then
		u59(p48, v515, "trailing garbage")
	end

	return v513
end
local function v61(p49)
	local v518 = request or (http_request or (syn_request or http and http.request))

	if v518 then
		local _pcall = pcall
		local u520 = v518
		local v521, v522 = pcall(function()
			return u520(p49)
		end)

		if not v521 or not v522 then
			return nil, "Connection Error"
		end

		return v522
	end

	return nil, "HTTP requests not supported"
end

local v62 = setclipboard or (toclipboard or function() end)
local char = string.char
local _tostring = tostring
local time = os.time
local random = math.random
local floor = math.floor
local v68 = gethwid or function()
	return game:GetService("RbxAnalyticsService"):GetClientId()
end
local s11 = ""
local n8 = 0

local function u71()
	local s12 = ""
	local n9 = 1
	local n10 = 16
	local n11 = 1
	local v529 = nil

	if false then
		if true then
			return ""
		end
	elseif not (n9 <= n10) then
		return ""
	end

	repeat
		while true do
			local v527 = random() * 26
			local v528 = floor(v527) + 97

			v529 = (s12 .. char(v528)) + n11

			if n11 > 0 then
				break
			end

			if not (n10 <= v529) then
				return s12
			end
		end
	until not (v529 <= n10)

	return s12
end

local u72 = v61
local u73 = t1
local u74 = v17
local u75 = v68
local u76 = v60

local function u77()
	if not (n8 + 600 < time()) then
		return true, s11
	end
	local t15 = {
		Url = "https://api.platoboost.app/public/start",
		Method = "POST",
	}
	local t16 = {
		service = u73.ServiceId,
		identifier = u74(u75()),
	}

	t15.Body = u18(t16)
	t15.Headers = {
		["Content-Type"] = "application/json",
	}

	local v533, v534 = u72(t15)

	if v533 and v533.StatusCode == 200 then
		local v535 = u76(v533.Body)

		if v535.success then
			s11 = v535.data.url
			n8 = time()

			return true, s11
		end
	end

	return false, v534 or "Server Unreachable"
end

local u78 = v17
local u79 = v68
local u80 = v61
local u81 = t1
local u82 = v60

local function v83(p50)
	local v537 = u71()
	local t17 = {
		identifier = u78(u79()),
		key = p50,
		nonce = v537,
	}
	local t18 = {}
	local ServiceId = u81.ServiceId

	t18.Url = "https://api.platoboost.app" .. "/public/redeem/" .. _tostring(ServiceId)
	t18.Method = "POST"
	t18.Body = u18(t17)
	t18.Headers = {
		["Content-Type"] = "application/json",
	}

	local v542, v543 = u80(t18)

	if not v542 or v542.StatusCode ~= 200 then
		return false, v543 or "Server Error"
	end

	local v544 = u82(v542.Body)

	if not v544.success or not v544.data.valid then
		return false, v544.message or "Invalid Key"
	end

	if v544.data.hash ~= u78("true" .. "-" .. v537 .. "-" .. u81.PlatoSecret) then
		return false, "Integrity Check Failed"
	end

	if writefile then
		writefile(u81.KeyFileName, p50)
	end

	return true, "Success"
end
local LocalPlayer = game:GetService("Players").LocalPlayer
local CoreGui = game:GetService("CoreGui")
local _pcall = pcall
local u88 = CoreGui
local v89 = pcall(function()
	return u88
end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")

if v89:FindFirstChild("BroodScript_Loader_MM2") then
	v89.BroodScript_Loader_MM2:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", v89)

ScreenGui.Name = "BroodScript_Loader_MM2"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)

Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", Frame).Thickness = 1.5
Instance.new("UIStroke", Frame).Color = Color3.fromRGB(60, 60, 60)

local TextLabel = Instance.new("TextLabel", Frame)

TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.Position = UDim2.new(0, 0, 0, 10)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = t1.HubName
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 16

local TextButton = Instance.new("TextButton", Frame)

TextButton.Size = UDim2.new(0.85, 0, 0, 30)
TextButton.Position = UDim2.new(0.075, 0, 0, 45)
TextButton.Text = t1.TelegramLabel
TextButton.Font = Enum.Font.GothamBold
TextButton.TextSize = 12
TextButton.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
TextButton.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)

local MouseButton1Click = TextButton.MouseButton1Click
local u95 = v62
local u96 = t1

MouseButton1Click:Connect(function()
	u95(u96.TelegramURL)
end)

local TextBox = Instance.new("TextBox", Frame)

TextBox.Size = UDim2.new(0.85, 0, 0, 32)
TextBox.Position = UDim2.new(0.075, 0, 0, 85)
TextBox.PlaceholderText = "Enter key..."
TextBox.Font = Enum.Font.GothamSemibold
TextBox.TextSize = 13
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 5)

local TextButton2 = Instance.new("TextButton", Frame)

TextButton2.Size = UDim2.new(0.4, 0, 0, 32)
TextButton2.Position = UDim2.new(0.075, 0, 0, 125)
TextButton2.Text = "VERIFY"
TextButton2.Font = Enum.Font.GothamBold
TextButton2.TextSize = 13
TextButton2.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
TextButton2.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 5)

local TextButton3 = Instance.new("TextButton", Frame)

TextButton3.Size = UDim2.new(0.4, 0, 0, 32)
TextButton3.Position = UDim2.new(0.525, 0, 0, 125)
TextButton3.Text = "GET KEY"
TextButton3.Font = Enum.Font.GothamBold
TextButton3.TextSize = 13
TextButton3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextButton3.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 5)

local TextLabel2 = Instance.new("TextLabel", Frame)

TextLabel2.Size = UDim2.new(0.85, 0, 0, 20)
TextLabel2.Position = UDim2.new(0.075, 0, 0, 165)
TextLabel2.BackgroundTransparency = 1
TextLabel2.TextColor3 = Color3.fromRGB(150, 150, 150)
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.TextSize = 11

local MouseButton1Click2 = TextButton2.MouseButton1Click
local u102 = TextLabel2
local u103 = v83
local u104 = ScreenGui
local u105 = t1

MouseButton1Click2:Connect(function()
	local TextBoxText = TextBox.Text

	if TextBoxText ~= "" then
		u102.Text = "Verifying..."

		local v548, v549 = u103(TextBoxText)

		if not v548 then
			u102.Text = v549 or "Invalid key!"

			return
		end

		u102.Text = "Success!"
		u104:Destroy()

		local ServiceId = u105.ServiceId
		local v551 = "BS_" .. tostring(ServiceId) .. "_" .. string.reverse("troodScoorB")

		_G[v551] = true
		loadstring(game:HttpGet(u105.MainScriptURL))()

		return
	end

	u102.Text = "Enter a key!"
end)

local MouseButton1Click3 = TextButton3.MouseButton1Click
local u107 = TextLabel2
local u108 = v62

MouseButton1Click3:Connect(function()
	u107.Text = "Getting Link..."

	local v552, v553 = u77()

	if not v552 then
		u107.Text = "Error!"

		return
	end

	u108(v553)
	u107.Text = "Link Copied!"
end)

local _isfile = isfile

if isfile then
	_isfile = isfile(t1.KeyFileName)

	if _isfile then
		_isfile = readfile(t1.KeyFileName)

		if _isfile ~= "" then
			TextLabel2.Text = "Found saved key..."

			local spawn = task.spawn
			local u111 = v83
			local u112 = ScreenGui
			local u113 = t1
			local u114 = TextLabel2

			spawn(function()
				local v554, _ = u111(_isfile)

				if not v554 then
					u114.Text = "Saved key expired"

					return
				end

				u112:Destroy()

				local ServiceId = u113.ServiceId
				local v557 = "BS_" .. tostring(ServiceId) .. "_" .. string.reverse("troodScoorB")

				_G[v557] = true
				loadstring(game:HttpGet(u113.MainScriptURL))()
			end)
		end
	end
end
