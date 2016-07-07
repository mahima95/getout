-- Whack A Worm Game
-- Developed by Carlos Yanez


-- Import MovieClip

local movieclip = require('movieclip')

-- Graphics

-- [Background]

local bg = display.newImage('gameBg.png')




-- [Score]

local score

-- [Worms]

local w1
local w2
local w3
local w4
local w5
local w6
local w7
local w8

local worms
local lastWorm = {}

-- Load Sound

local hit = audio.loadSound('hit.wav')

-- Variables

local timerSource
local currentWorms = 0
local wormsHit = 0
local totalWorms = 10

-- Functions

local Main = {}
local startButtonListeners = {}
local showCredits = {}
local hideCredits = {}
local showGameView = {}
local prepareWorms = {}
local startTimer = {}
local showWorm = {}
local popOut = {}
local wormHit = {}
local alert = {}

-- Main Function

function Main()
	score = display.newText('0' .. '/' .. totalWorms, 58, 6, native.systemFontBold, 16)
	score:setTextColor(238, 238, 238)
	prepareWorms()
end


function prepareWorms()
	w1 = display.newImage('worm.png', 80.5, 11)
	w2 = display.newImage('worm.png', 198.5, 51)
	w3 = display.newImage('worm.png', 338.5, 34)
	w4 = display.newImage('worm.png', 70.5, 110)
	w5 = display.newImage('worm.png', 225.5, 136)
	w6 = display.newImage('worm.png', 376.5, 96)
	w7 = display.newImage('worm.png', 142.5, 211)
	w8 = display.newImage('worm.png', 356.5, 186)
	
	worms = display.newGroup(w1, w2, w3, w4, w5, w6, w7, w8)
	
	for i = 1, worms.numChildren do
		worms[i]:addEventListener('tap', wormHit)
		worms[i].isVisible = false
	end
	
	startTimer()
end

function startTimer()
	timerSource = timer.performWithDelay(1400, showWorm, 0)
end

function showWorm(e)
	if(currentWorms == totalWorms) then
		alert()
	else
		lastWorm.isVisible = false
		local randomHole = math.floor(math.random() * 8) + 1
		
		lastWorm = worms[randomHole]
		lastWorm:setReferencePoint(display.BottomCenterReferencePoint)
		lastWorm.yScale = 0.1
		lastWorm.isVisible = true
		
		Runtime:addEventListener('enterFrame', popOut)
		
		currentWorms = currentWorms + 1
	end
end

function popOut(e)
	lastWorm.yScale = lastWorm.yScale + 0.2
	
	if(lastWorm.yScale >= 1) then
		Runtime:removeEventListener('enterFrame', popOut)
	end
end

function wormHit:tap(e)
	audio.play(hit)
	wormsHit = wormsHit + 1
	score.text = wormsHit .. '/' .. totalWorms
	lastWorm.isVisible = false
end

function alert()
	timer.cancel(timerSource)
	lastWorm.isVisible = false
	
	local alert = display.newImage('alertBg.png')
	alert:setReferencePoint(display.CenterReferencePoint)
	alert.x = display.contentCenterX
	alert.y = display.contentCenterY
	transition.from(alert, {time = 300, xScale = 0.3, yScale = 0.3})
	
	local score = display.newText(wormsHit .. '/' .. totalWorms, 220, 190, native.systemFontBold, 20)
	score:setTextColor(204, 152, 102)
	
	transition.fadeOut(alert,{time=800})
	transition.fadeOut(bg,{time=800})
	transition.fadeOut(score,{time=800})
	transition.fadeOut(wormsHit,{time=800})
	transition.fadeOut(totalWorms,{time=800})
	
	
end

Main()