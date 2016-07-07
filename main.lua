-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code her
local physics = require("physics")
local  widget = require("widget")
local  widget = require("widget")
local terror = audio.loadSound( 'cdr/terror.wav' )
audio.play(terror,{channel=1,loop=100})
local level = 0
local inc = 0

local door1pressed ,key1picked, door2pressed, key2picked,door3pressed,key3picked,door4pressed,key4picked
 = false,false,false,false,false,false,false,false	

physics.start()
local genroom= display.newImage("cdr/gen_room.png",150,630)
local sunset= display.newImage("cdr/sunset.png",150,230)
local window1 = display.newImage("cdr/window1.png",152,267)
local heart = display.newImage("cdr/heart.png",160,280)
local magnify = display.newImage("cdr/magnify.png",160,280)
local bird = display.newImage("cdr/bird.png",160,280)
local table = display.newImage("cdr/table.png",50,620)
local box = display.newImage("cdr/box.png",260,250)
local key = display.newImage("cdr/key.png",260,137)
local keytext  = display.newImage("cdr/keytext.png",110,1050)
local missingtext = display.newImage("cdr/missingtext.png",125,1050)
local findtext = display.newImage("cdr/findittext.png",125,1050)
local hmmmtext = display.newImage("cdr/hmmmtext.png",125,1050)
local getouttext = display.newImage("cdr/getouttext.png",125,600)
local codekeytext = display.newImage("cdr/codekeytext.png",125,1050)
local numbtext = display.newImage("cdr/numbtext.png",257,215)
local yeartext = display.newImage("cdr/yeartext.png",120,620)
local hammer = display.newImage("cdr/gun.png",262,285)
sunset.alpha=1
local key1,door1,door2,prodoor1,human,circle,circle1,circle2,circle0

local function init()
	if level == 0 then
		human.isVisible = false
		window1.isVisible = false
		heart.isVisible = false
		magnify.isVisible = false
		bird.isVisible = false
		circle.isVisible = false
		circle0.isVisible = true
		circle1.isVisible = false
		circle2.isVisible = false
		table.isVisible = false
		key1.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		prodoor1.isVisible = false
		key.isVisible = false
		keytext.isVisible = false
		findtext.isVisible = false
		hmmmtext.isVisible = false
		getouttext.isVisible = false
		codekeytext.isVisible = false
		numbtext.isVisible = false
		yeartext.isVisible = false
		hammer.isVisible = false
		sunset.alpha = 1
		box.isVisible = false
	elseif level == 1 then
		human.isVisible = true
		window1.isVisible = true
		heart.isVisible = false
		magnify.isVisible = false
		bird.isVisible = false
		circle.isVisible = false
		circle0.isVisible = false
		circle1.isVisible = false
		circle2.isVisible = false
		table.isVisible = true
		key1.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		prodoor1.isVisible = false
		key.isVisible = false
		keytext.isVisible = false
		findtext.isVisible = false
		hmmmtext.isVisible = false
 		getouttext.isVisible = true
		codekeytext.isVisible = false
		numbtext.isVisible = false
		yeartext.isVisible = false
		hammer.isVisible = false
		sunset.alpha = 0
		box.isVisible = true
	elseif level == 2 then	
		prodoor1.isVisible = false
 		keytext.isVisible = false
 		missingtext.isVisible = false
 		table.isVisible = false
 		window1.isVisible = false
		heart.isVisible =true
		magnify.isVisible = false
		bird.isVisible = false
		circle.isVisible = false
		circle0.isVisible = false
		circle1.isVisible = false
		circle2.isVisible = false
 		getouttext.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		findtext.isVisible = false
		hmmmtext.isVisible = false
		numbtext.isVisible = false
		codekeytext.isVisible = false
		yeartext.isVisible = false
		hammer.isVisible = false
		sunset.alpha = 0
		box.isVisible = true
	elseif level == 3 then
		prodoor1.isVisible = false
 		keytext.isVisible = false
 		missingtext.isVisible = false
 		table.isVisible = true
 		window1.isVisible = false
		heart.isVisible =false
		magnify.isVisible = true
		bird.isVisible = false
		circle.isVisible = false
		circle0.isVisible = false
		circle1.isVisible = false
		circle2.isVisible = false
 		getouttext.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		findtext.isVisible = false
		hmmmtext.isVisible = false
		numbtext.isVisible = true
		codekeytext.isVisible = false
		yeartext.isVisible = false
		hammer.isVisible = false
		sunset.alpha = 0
		box.isVisible = true
	elseif level == 4 then
		prodoor1.isVisible = false
 		keytext.isVisible = false
 		missingtext.isVisible = false
 		table.isVisible = false
 		window1.isVisible = false
		bird.isVisible = true
		circle.isVisible = false
		circle0.isVisible = false
		circle1.isVisible = false
		circle2.isVisible = false
 		getouttext.isVisible = false
		codekeytext.isVisible = false
		yeartext.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		findtext.isVisible = false
		hmmmtext.isVisible = false
		numbtext.isVisible = true
		hammer.isVisible = true
		sunset.alpha = 0
		box.isVisible = true
	end
end

local function door2ButtonEvent( event )
	if key4picked ==true and door4pressed == true then
		circle2.isVisible = false
		door1.isVisible = false
		door2.isVisible = false
		prodoor1.isVisible = true
	else
		hmmmtext.isVisible = true
		door2.isVisible = false
		key.isVisible = false
		door4pressed = true
		door1.isVisible = true
		circle2.isVisible = true
		codekeytext.isVisible = true
	end
end

local function door1ButtonEvent( event )
	if level == 1 then 
		if key1picked == true and door1pressed == true  then	
			door1.isVisible = false
		else
			door1pressed = true
			keytext.isVisible = true
		end
	elseif level == 2 then
		if door2pressed == true then
			missingtext.isVisible= true
			circle.isVisible = true
		else
			door2pressed = true
		end
	elseif level == 3 then
		if door3pressed == true then
			circle1.isVisible = true
			findtext.isVisible = true
		else
			door3pressed = true
		end
	end
end

local function circleButtonEvent( event )
	key2picked = true	
	local l2= require("l2")
	local  flag = l2.check()
	genroom.x = 150
	genroom.y = 630
	circle:removeSelf()
	numbtext.isVisible = true
end

local function circle1ButtonEvent( event )
	key3picked = true	
	circle1:removeSelf()
	hammer.isVisible = true
end

local function circle2ButtonEvent( event )
	key4picked = true
	numbtext.isVisible = false
	circle2.isVisible = false
	yeartext.isVisible = true
end

local function key1ButtonEvent( event )
	key.isVisible = true
	key1.isVisible = false
	key1picked = true
end

local function prodoor1Event( event )
	
	level = level + 1

	if level == 5 then
		hmmmtext.isVisible = false
		transition.fadeOut(genroom,{time=800})
		transition.fadeOut(key1,{time=800})
		transition.fadeOut(hammer,{time=800})
		transition.fadeOut(yeartext,{time=800})
		transition.fadeOut(prodoor1,{time=800})
		transition.fadeOut(key,{time=800})
		transition.fadeOut(box,{time=800})
		human.isVisible = false
		sunset.alpha = 100
		circle0.isVisible = true
		
		 
	else
		init()
	 	
	 	key1picked = false
	 	door1pressed = false

	 	inc = 0
		
		genroom.alpha = 0
		genroom.x=150
		genroom.y=630
		human.x=80
		human.y=200
		transition.to(genroom,{time=1000,alpha = 1})
	end
end 

local function circle0ButtonEvent( event )
	level = 0
	init()
	prodoor1Event()
end

circle = widget.newButton(
    {
        width = 139,
        height = 139,
        defaultFile = "cdr/round.png",
        overFile = "cdr/round.png",
        onEvent = circleButtonEvent
    }
)

circle0 = widget.newButton(
    {
        width = 139,
        height = 139,
        defaultFile = "cdr/play.png",
        overFile = "cdr/play.png",
        onRelease = circle0ButtonEvent
    }
)

circle1 = widget.newButton(
    {
        width = 49,
        height = 32,
        defaultFile = "cdr/gun.png",
        overFile = "cdr/gun.png",
        onRelease = circle1ButtonEvent
    }
)

circle2 = widget.newButton(
    {
        width = 139,
        height = 139,
        defaultFile = "cdr/circle.png",
        overFile = "cdr/circle.png",
        onEvent = circle2ButtonEvent
    }
)

key1 = widget.newButton(
    {
        width = 34,
        height = 54,
        defaultFile = "cdr/key.png",
        overFile = "cdr/key.png",
        onEvent = key1ButtonEvent
    }
)

door1 = widget.newButton(
    {
        width = 124,
        height = 181,
        defaultFile = "cdr/door.png",
        overFile = "cdr/door.png",
        onEvent = door1ButtonEvent
    }
)

door2 = widget.newButton(
    {
        width = 137,
        height = 213,
        defaultFile = "cdr/door2.png",
        overFile = "cdr/door2.png",
        onRelease = door2ButtonEvent
    }
)

prodoor1 = widget.newButton(
    {
        width = 124,
        height = 181,
        defaultFile = "cdr/proceeddoor.png",
        overFile = "cdr/proceeddoor.png",
        onRelease = prodoor1Event
    }
)

human= display.newImage("cdr/human.png",80,140)


init()
genroom:scale(1,1)

hmmmtext.rotation = 90
genroom.rotation = 90
human.rotation = 90
window1.rotation = 90
heart.rotation = 90
magnify.rotation = 90
bird.rotation = 90
circle.rotation = 90
circle0.rotation = 90
circle1.rotation = 90
circle2.rotation = 90
table.rotation= 90
key1.rotation = 270
door1.rotation = 90
door2.rotation = 90
prodoor1.rotation = 90
box.rotation = 90
key.rotation = 90
keytext.rotation = 90
getouttext.rotation = 90
missingtext.rotation = 90
yeartext.rotation = 90
findtext.rotation = 90
sunset.rotation = 90
numbtext.rotation = 90
hammer.rotation = 90

function onTouch(event)
	if(event.phase == "ended") then

		if event.y>425 and genroom.y>=0 then
			inc = inc - 1	
		elseif event.y<20  and genroom.y<630 then
			inc = inc + 1		 	
	 	end

		genroom.y = 630 + 400*inc

		print("level = ",level)
		if level == 0 then
			circle.x = 95
			circle.y = 220 + 400*inc
		elseif level == 1 then
			window1.y = 267 + 400*inc
		 	table.y = 620 + 400*inc
			key1.y = 620 + 400*inc
			key1.x = 110
			if key1picked == true and door1pressed == true  then	
				prodoor1.y = 1195 +400*inc
				prodoor1.x = 105
				door1.isVisible = false
				prodoor1.isVisible = true
			else
				door1.isVisible = true
			end
			door1.y = 1195 +400*inc
			door1.x = 105
			keytext.y = 1000 + 400*inc
			getouttext.y = 600 + 400*inc
			if key1picked == false and door1pressed == true then
				key1.isVisible = true
			else
				key1.isVisible = false
			end
		elseif level == 2 then
			heart.y = 280 + 400*inc
			circle.x = 95
			circle.y = 620 + 400*inc
			door1.isVisible = true
			door1.y = 1195 +400*inc
			door1.x = 105
			missingtext.y = 1000 + 400*inc
			if key2picked == true and door2pressed == true then
				prodoor1.y = 1195 +400*inc
				prodoor1.x = 105
				door1.isVisible = false
				prodoor1.isVisible =true
			end
		elseif level == 3 then
			magnify.y = 280 + 400*inc
			table.y = 620 + 400*inc
			circle1.x = 95
			circle1.y = 620 + 400*inc
			door1.isVisible = true
			door1.y = 1195 +400*inc
			door1.x = 105
			findtext.y = 1000 + 400*inc
			if key3picked == true and door3pressed == true then
				prodoor1.y = 1195 +400*inc
				prodoor1.x = 105
				door1.isVisible = false
				prodoor1.isVisible =true
			end
		elseif level == 4 then
			bird.y = 280 + 400*inc
			circle2.x = 95
			circle2.y = 620 + 400*inc
			door2.y = 1195 +400*inc
			door2.x = 105
			yeartext.y = 620 + 400*inc
			if door4pressed == true then
				door2.isVisible =false
				key.isVisible= false

				hmmmtext.isVisible = true
				hmmmtext.y = 1000 + 400*inc
				if key4picked == true then
					prodoor1.y = 1195 +400*inc
					prodoor1.x = 105
					prodoor1.isVisible =true
				else
					door1.y = 1195 +400*inc
					door1.x = 105
					door1.isVisible = true
				end
			else
				door2.isVisible = true
			end
		end
	else
		transition.to(human, {x=80, y=event.y})
	end
end

Runtime:addEventListener("touch", onTouch)


