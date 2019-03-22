-- Title: TouchAndDrag
-- Name: Aleks Kucy
-- Course: ICS2O/3C
-- This program that has two images on the screen when
-- I click and drag on each image it moves with my finger
--------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local YellowGirl = display.newImageRect("Images/YellowGirl.png", 150, 150)
local YellowGirlWidth = YellowGirl.width
local YellowGirlHeight = YellowGirl.height

local blueGirl = display.newImageRect("Images/BlueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedblueGirl = false
local alreadyTouchedYellowGirl = false
local alreadyTouchedstar = false

-- set the initial position of the blue girl
blueGirl.x = 300
blueGirl.y = 200

YellowGirl.x = 400
YellowGirl.y = 500

star.x = 600
star.y = 600

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true	
		end
	end

	if  ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x 
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false	
		alreadyTouchedYellowGirl = false	
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

--------------------------------------------------------

-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when Yellow girl is touched, move her
local function YellowGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedYellowGirl = true	
		end
	end

	if  ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		YellowGirl.x = touch.x 
		YellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false	
		alreadyTouchedYellowGirl = false	
	end
end

-- add the respective listeners to each object
YellowGirl:addEventListener("touch", YellowGirlListener)
--------------------------------------------------------------------------
-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when Yellow girl is touched, move her
local function starListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedYellowGirl == false) then
			alreadyTouchedstar = true	
		end
	end

	if  ( (touch.phase == "moved") and (alreadyTouchedstar == true) ) then
		star.x = touch.x 
		star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false	
		alreadyTouchedYellowGirl = false
		alreadyTouchedstar = false	
	end
end

-- add the respective listeners to each object
star:addEventListener("touch", starListener)

