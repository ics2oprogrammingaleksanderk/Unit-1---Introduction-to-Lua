-- Title: MovingImages
-- Name: Aleks K
-- Course: ICS2O/3C
-- This program has 2 images that move across the screen in different directions. 
--One is fades out and the other fades in. there is also a background image.
--I added another object that moves in a different direction.


-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect ("Images/background.png", 2048, 1536)

local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

local whack = audio.loadSound( "Sounds/whack.mp3")
local whackSoundChannel

-- set the image transparent
beetleship.alpha = 0

-- set the initial x,y 
beetleship.x = 0
beetleship.y = display.contentHeight/3


--Function move ship
--Input: this function accepts an event listener
--Output: none
--Description: add scroll speed
local function MoveBeetleShip(event)
	-- add the scroll speed
	beetleship.x = beetleship.x + scrollSpeed
	-- change fading the ship
	beetleship.alpha = beetleship.alpha + 0.01
	beetleship:rotate(11)
	beetleship:scale(1.002, 1.002)

end

--Moveship will be called over and over
Runtime:addEventListener("enterFrame", MoveBeetleShip)
whackSoundChannel = audio.play(whack)

----------------------------------------------------------------------------------------------

local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

local scrollSpeed2 = -4 

local spinSpeed = 3

--change the direction
rocketship:scale(-1, 1)

-- set the image visable
rocketship.alpha = 1

-- set the initial x,y 
rocketship.x = 1024
rocketship.y = display.contentHeight*3/4


--Function move ship
--Input: this function accepts an event listener
--Output: none
--Description: add scroll speed
local function MoveRocketShip(event)
	-- add the scroll speed
	rocketship.x = rocketship.x + scrollSpeed2
	-- change fading the ship
	rocketship.alpha = rocketship.alpha - 0.002
	rocketship:rotate(10)
	rocketship:scale(1.01^-1, 1.01^-1)

end

--Moveship will be called over and over
Runtime:addEventListener("enterFrame", MoveRocketShip)