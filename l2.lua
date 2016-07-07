local M={}



local sh=display.stageHeight
local sw=display.stageWidth
--local genrom= display.newImage("cdr/gen_room.png",150,630)
local circle1,img,clockText

--local backgroundMusic = audio.loadStream( "backgroundMusic.m4a" )


--sh=sh+20


local array = {{1,0,3}, {0,3,2}, {2,1,0}}
local count ={{0,0,0}, {0,0,0}, {0,0,0}}

local widget=require("widget")
--[[local function circle2ButtonEvent(event)

img.isVisible=false
Rect.isVisible=false
-- transistion.to(genroom,{x=150,y=430})
 end
]]
local Rect= display.newRect(0,0,3*sw,3*sh)
Rect:setFillColor(black,black,black)

local secondsLeft = 30   -- 1/2 minute * 60 seconds

local clockText = display.newText("00:30", display.contentCenterX, 120, native.systemFontBold, 30)
clockText.x=sw-50
clockText.y=40
clockText:setFillColor( 1,1,1)


clockText.rotation=90
seconds=-1
minutes=-1






function M.check()
local c=0
local flag=false
for i=1,3 do
  for j=1,3 do
    if(count[i][j]%4==array[i][j]) then
      c=c+1
    else
      break
    end
  end
end
--print("count======",c)
      if c==9 then
        --local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, fadein=5000 } )
         img=display.newImage("cdr/justmarried.png")
		img.rotation=90
        img.x=sw/2
        img.y=sh/2
        clockText:removeSelf()
		
		
		flag=true
		local codegen=display.newImage("cdr/codegen1.png")
		codegen.rotation=90
		codegen.x=240
		codegen.y=240
		transition.fadeOut(codegen,{time=2800})
		
		img.alpha=0
		Rect.alpha=0
		img1.alpha=0
		img2.alpha=0
		img3.alpha=0
		img4.alpha=0
		img5.alpha=0
		img6.alpha=0
		img7.alpha=0
		img8.alpha=0
		img9.alpha=0
		
		
		
		return true
		

        end

        for y = 1, 3 do
        for x = 1, 3 do
         print(count[y][x])
        end
        end


 return flag     

end
display.setDefault("background", 0.2, 0.2, 0.4 )

-- Keep track of time in seconds


local function updateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- time is tracked in seconds.  We need to convert it to minutes and seconds
	minutes = math.floor( secondsLeft / 60 )
	seconds = secondsLeft % 60

	-- make it a string using string format.
	local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
	clockText.text = timeDisplay
end

local function change()

img1.alpha=0
img2.alpha=0
img3.alpha=0
img4.alpha=0
img5.alpha=0
img6.alpha=0
img7.alpha=0
img8.alpha=0
img9.alpha=0
Rect.alpha=0
clockText.alpha=0

end

-- run them timer
local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
local changeScreen = timer.performWithDelay( 30000, change, secondsLeft )






img1 = display.newImage( "cdr/justmarried1.png")
img1.x=sw/2-100
img1.y=sh/2-100


img2 = display.newImage( "cdr/justmarried2.png")
img2.fill.effect = "filter.bulge"
img2.fill.effect.intensity = 1
img2.x=sw/2
img2.y=sh/2-100


img3 = display.newImage( "cdr/justmarried3.png")
img3.fill.effect = "filter.bulge"
img3.fill.effect.intensity = 1
img3.x=sw/2+100
img3.y=sh/2-100


img4 = display.newImage( "cdr/justmarried4.png")
img4.fill.effect = "filter.bulge"
img4.fill.effect.intensity = 1
img4.x=sw/2-100
img4.y=sh/2


img5 = display.newImage( "cdr/justmarried5.png")
img5.fill.effect = "filter.bulge"
img5.fill.effect.intensity = 1
img5.x=sw/2
img5.y=sh/2


img6 = display.newImage( "cdr/justmarried6.png")
img6.fill.effect = "filter.bulge"
img6.fill.effect.intensity = 1
img6.x=sw/2+100
img6.y=sh/2


img7 = display.newImage( "cdr/justmarried7.png")
img7.fill.effect = "filter.bulge"
img7.fill.effect.intensity = 1
img7.x=sw/2-100
img7.y=sh/2+100


img8 = display.newImage( "cdr/justmarried8.png")
img8.fill.effect = "filter.bulge"
img8.fill.effect.intensity = 1
img8.x=sw/2
img8.y=sh/2+100


img9 = display.newImage( "cdr/justmarried9.png")
img9.fill.effect = "filter.bulge"
img9.fill.effect.intensity = 1
img9.x=sw/2+100
img9.y=sh/2+100




local function imgRotate1()
img1:rotate(90)
count[1][1]=count[1][1]+1
M.check()
end

local function imgRotate2()
img2:rotate(90)
count[1][2]=count[1][2]+1
M.check()
end

local function imgRotate3()
img3:rotate(90)
count[1][3]=count[1][3]+1
M.check()
end

local function imgRotate4()
img4:rotate(90)
count[2][1]=count[2][1]+1
M.check()
end

local function imgRotate5()
img5:rotate(90)
count[2][2]=count[2][2]+1
M.check()
end

local function imgRotate6()
img6:rotate(90)
count[2][3]=count[2][3]+1
M.check()
end

local function imgRotate7()
img7:rotate(90)
count[3][1]=count[3][1]+1
M.check()
end

local function imgRotate8()
img8:rotate(90)
count[3][2]=count[3][2]+1
M.check()
end

local function imgRotate9()
img9:rotate(90)
count[3][3]=count[3][3]+1
M.check()
end



img1:addEventListener("tap", imgRotate1)
img2:addEventListener("tap", imgRotate2)
img3:addEventListener("tap", imgRotate3)
img4:addEventListener("tap", imgRotate4)
img5:addEventListener("tap", imgRotate5)
img6:addEventListener("tap", imgRotate6)
img7:addEventListener("tap", imgRotate7)
img8:addEventListener("tap", imgRotate8)
img9:addEventListener("tap", imgRotate9)

return M
