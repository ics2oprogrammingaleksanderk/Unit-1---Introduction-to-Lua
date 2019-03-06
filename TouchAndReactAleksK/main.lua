-- Title: TouchAndReact
-- Name: Aleks Kucy
-- Course: ICS2O/3C
-- This program does something when i click on the button



-- set background color 
display.setDefault ("background", 0.3, 0, 1)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

--create blue button
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

--create red button
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create the txt obj
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject.isVisible = false

-- create a local function for the blue button\

local function BlueButtonListner(touch)
	if (touch.phase == "began") then 
		blueButton = false
		redButton = true
		textObject = true
	end

	if (touch.phase == "ended") then
		blueButton = true
		redButton = false
		textObject = false
	end
end

--add the listener to object
blueButton:addEventListener("touch", BlueButtonListner)