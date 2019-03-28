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

local beam = display.newImage("Images/beam.png", 0, 0)

	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	beam:scale(512, 0.5)

	beam:rotate (45)

	beam:toBack()

	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

local bkg = display.newImage("Images/bkg.png", 0, 0)
	
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg:scale(2, 2)

	bkg:toBack()