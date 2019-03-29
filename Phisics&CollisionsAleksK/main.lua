-- Title: PhysicsAndCollisions
-- Name: Aleksander Kucy
-- Course: ICS2O/3C
------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start the physics
physics.start()
-------------------------------------------------------------
--Objects
-------------------------------------------------------------
--ground
local ground = display.newImage("Images/ground.png", 0, 0)

	ground.x = display.contentWidth/2
	ground.y = display.contentHeight/1

	ground.width = display.contentWidth

	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
------------------------------------------------------------------------
local ground2 = display.newImage("Images/ground.png", 0, 0)

	ground2.x = display.contentWidth/2
	ground2.y = display.contentHeight/100

	ground2.width = display.contentWidth

	physics.addBody(ground2, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------

local beam2 = display.newImage("Images/beam.png", 0, 0)

	beam2.x = display.contentCenterX/0.6
	beam2.y = display.contentCenterY*1.65

	beam2.width = display.contentWidth/2
	beam2.height = display.contentHeight/10

	beam2:scale(512, 0.5)

	beam2:rotate (-45)

	beam2:toBack()

	physics.addBody(beam2, "static", {density=1.0, friction=0.5, bounce=0.3})

------------------------------------------------------------------------
local beam = display.newImage("Images/beam.png", 0, 0)

	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	beam.width = display.contentWidth/2
	beam.height = display.contentHeight/10

	beam:scale(512, 0.5)

	beam:rotate (45)

	beam:toBack()

	physics.addBody(beam, "static", {density=1.0, friction=0.5, bounce=0.3})

-----------------------------------------------------------------

local bkg = display.newImage("Images/bkg.png", 0, 0)
	
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg:scale(2, 2)

	bkg:toBack()

----------------------------------------------------------------------
--Functions
----------------------------------------------------------------------

local function firstBall()
	local ball1 = display.newImage("Images/super_ball.png", 0, 100)

	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

---------------------------------------------------------------------
local function secondBall()
	local ball2 = display.newImage("Images/super_ball.png", 0, 100)

	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=1.5, radius=12.5})

	ball2:scale(0.5, 0.5)
end
---------------------------------------------------------------------
local function thirdBall()
	local ball3 = display.newImage("Images/super_ball.png", 0, 100)

	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.6, radius=50})

	ball3:scale(2, 2)
end
---------------------------------------------------------------------
local function fourthBall()
	local ball4 = display.newImage("Images/super_ball.png", 0, 150)

	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.9, radius=75})

	ball4:scale(3, 3)
end
---------------------------------------------------------------------
--Timer Delays
---------------------------------------------------------------------

timer.performWithDelay( 0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(1500, fourthBall)