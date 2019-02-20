-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program  displays a colored rectangle with a different border color.
-- It calculates the rectangles area and displays it on the screen.
-- Then I added the code to draw a circle of a given radius that is coloured and a different colour border. 
--I used the radius to calculate the area and display it on the ipad.


-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

-- set the background color of my screen.
display.setDefault ("background", 0/255, 0/255, 255/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half width and height of screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

--anchor the rectangle in the top left corner of the ipad.
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

--set the bolor of the rectangle
myRectangle:setFillColor(1, 1, 1)

--set the color of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area of a rectangle
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write it on screen.
areaText = display.newText("The area of this rectangle with a width of \n" ..
widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

--anchor the text.
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

--set the color of newtext
areaText:setTextColor (0, 1, 0)