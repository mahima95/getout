--
-- Abstract: JungleScene sample project
-- Demonstrates sprite sheet animations, with different frame rates
--
-- Version: 1.0
--
-- Sample code is MIT licensed, see https://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

-- Plants are from http://blender-archi.tuxfamily.org/Greenhouse
-- and are subject to creative commons license, http://creativecommons.org/licenses/by/3.0/
--
--	Supports Graphics 2.0
---------------------------------------------------------------------------------------

local M= {}

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

-- Define reference points locations anchor ponts
local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5

display.setStatusBar( display.HiddenStatusBar )

-- The sky as background
local sky = display.newImage( "sky.jpg", centerX, centerY )

local baseline = 250

-- a bunch of foliage
local tree = {}
tree[1] = display.newImage( "Palm-arecaceae.png" )
tree[1].xScale = 0.7; tree[1].yScale = 0.7
tree[1].anchorY = BOTTOM_REF
tree[1].x = 20; tree[1].y = baseline
tree[1].dx = 0.1
tree[2] = display.newImage( "Greenhouse-Palm-jubaea01.png" )
tree[2].xScale = 0.6; tree[2].yScale = 0.6
tree[2].anchorY = BOTTOM_REF
tree[2].x = 120; tree[2].y = baseline
tree[2].dx = 0.2
tree[3] = display.newImage( "Greenhouse-Palm-cycas01.png" )
tree[3].xScale = 0.8; tree[3].yScale = 0.8
tree[3].anchorY = BOTTOM_REF
tree[3].x = 200; tree[3].y = baseline
tree[3].dx = 0.3
tree[4] = display.newImage( "Ginger.png" )
tree[4].xScale = 0.7; tree[4].yScale = 0.7
tree[4].anchorY = BOTTOM_REF
tree[4].x = baseline; tree[4].y = baseline
tree[4].dx = 0.4
tree[5] = display.newImage( "Greenhouse-Palm-acai01.png" )
tree[5].xScale = 0.8; tree[5].yScale = 0.8
tree[5].anchorY = BOTTOM_REF
tree[5].x = 300; tree[5].y = baseline
tree[5].dx = 0.5
tree[6] = display.newImage( "Dracena.png" )
tree[6].xScale = 0.4; tree[5].yScale = 0.4
tree[6].anchorY = BOTTOM_REF
tree[6].x = 320; tree[6].y = baseline
tree[6].dx = 0.6
tree[7] = display.newImage( "Banana.png" )
tree[7].xScale = 0.4; tree[7].yScale = 0.4
tree[7].anchorY = BOTTOM_REF
tree[7].x = 380; tree[7].y = baseline
tree[7].dx = 0.7
tree[8] = display.newImage( "Bamboo-rgba.png" )
tree[8].xScale = 0.8; tree[8].yScale = 0.8
tree[8].anchorY = BOTTOM_REF
tree[8].x = 420; tree[8].y = baseline
tree[8].dx = 0.8

-- an image sheet with a cat

local sheet1 = graphics.newImageSheet( "m1.png", { width=88, height=175, numFrames=2 } )




-- play 8 frames every 1000 ms
local instance1 = display.newSprite( sheet1, { name="m1", start=1, count=2, time=1000 } )
instance1.x = display.contentWidth / 4 -40
instance1.y = baseline - 40
instance1.xScale = 1
instance1.yScale = 1
instance1:play()

-- A sprite sheet with a green dude
local sheet2 = graphics.newImageSheet( "m2.png", { width=172, height=118, numFrames=2 } )

-- play 15 frames every 500 ms
local instance2 = display.newSprite( sheet2, { name="m2", start=1, count=2, time=500 } )
instance2.x = 3 * display.contentWidth / 4 + 30
instance2.y = baseline - 65
instance2:play()


-- Grass
-- This is doubled so we can slide it
-- When one of the grass images slides offscreen, we move it all the way to the right of the next one.
local grass = display.newImage( "grass.png" )
grass.anchorX = LEFT_REF
grass.x = 0
grass.y = baseline - 20
local grass2 = display.newImage( "grass.png" )
grass2.anchorX = LEFT_REF
grass2.x = 480
grass2.y = baseline - 20

-- solid ground, doesn't need to move
local ground = display.newRect( 0, baseline, 480, 90 )
ground:setFillColor( 0x31/255, 0x5a/255, 0x18/255 )
ground.anchorX = LEFT_REF
ground.anchorY = TOP_REF

-- A per-frame event to move the elements
local tPrevious = system.getTimer()
local function move(event)
	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( 0.2 * tDelta )

	grass.x = grass.x - xOffset
	grass2.x = grass2.x - xOffset

	if (grass.x + grass.contentWidth) < 0 then
		grass:translate( 480 * 2, 0)
	end
	if (grass2.x + grass2.contentWidth) < 0 then
		grass2:translate( 480 * 2, 0)
	end

	local i
	for i = 1, #tree, 1 do
		tree[i].x = tree[i].x - tree[i].dx * tDelta * 0.2
		if (tree[i].x + tree[i].contentWidth) < 0 then
			tree[i]:translate( 480 + tree[i].contentWidth * 2, 0 )
		end
	end
end


function M.listener1()
 	Rct=display.newRect(0,0,5000,5000)
	Rct:setFillColor(black,black,black)
end



-- Start everything moving

local function listener( event )
   Runtime:removeEventListener( "enterFrame", move )
   --sheet1.alpha=0
   local gun=display.newImage("humanwithgun.png")
   gun.x=display.contentWidth / 4 -17
   gun.y=baseline - 62
   
  local bullet=display.newImage("bullet.png")
  bullet.x=display.contentWidth / 4 -17;
  bullet.y=baseline - 62
  transition.to( bullet, { time=1500, x=410, y=210 ,onComplete=M.listener1} )
   
   
   
   
end

timer.performWithDelay( 5000, listener )


 Runtime:addEventListener( "enterFrame", move )

--timer.performWithDelay(5000, listener [, iterations] )

return M






