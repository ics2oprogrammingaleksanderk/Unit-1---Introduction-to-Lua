-- Title: WhackAMole
-- Name: Aleksander Kucy
-- Course: ICS2O/3C

display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------
-- local variables and display objects
-----------------------------------------------------------------------

--Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)
	
	bkg:setFillColor(153/255, 255/255, 1)

	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

--Create the mole
local mole = display.newImage( "Images/mole.png", 0, 0 )

	-- setting position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	mole:scale(0.334, 0.334)
	mole.isVisible = false


-- create a pont tracker
local points = 0
local pointsText = display.newText("Points = ".. points, display.contentWidth/2, 30, nil, 60)
pointsText:setTextColor(255/255, 0/255, 255/255)

-----------------------------------------------------------------------------
--Functions
-----------------------------------------------------------------------------

function PopUp()

	-- random x and y spawn for the mole
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	mole.isVisible = true
	timer.performWithDelay( 500, Hide )
end


function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end


function Hide()
	mole.isVisble = false
	PopUpDelay()
end

function GameStart()
	PopUpDelay()
end

function Whacked ( event )

	if (event.phase == "began") then
		points = points + 1
		pointsText.text = "Points = ".. points
		Hide()
	end
end


-----------------------------------------------------------------------------
--event listeners
-----------------------------------------------------------------------------

mole:addEventListener ( "touch", Whacked )

-----------------------------------------------------------------------------
-- Start the game
-----------------------------------------------------------------------------

GameStart()