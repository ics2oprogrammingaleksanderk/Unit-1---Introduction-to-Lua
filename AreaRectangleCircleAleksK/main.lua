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
areaText.y = 350

--set the color of newtext
areaText:setTextColor (0, 1, 0)

----------------------------------------------------------------------------------------------
-- create my local variables
local areaText2
local textSize2 = 50
local myCircle
local Radius = 110
local areaOfCircle
local PI = 3.14

--draw the rectangle that is half width and height of screen size.
myCircle = display.newCircle(0, 0, Radius)

--anchor the rectangle in the top left corner of the ipad.
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 780
myCircle.y = 0

-- set the width of the border
myCircle.strokeWidth = 20

--set the bolor of the rectangle
myCircle:setFillColor(1, 1, 1)

--set the color of the border
myCircle:setStrokeColor(0, 0, 0)

-- calculate the area of a rectangle
areaOfCircle = PI * Radius * Radius

-- write it on screen.
areaText2 = display.newText("The area of this circle with a radius of \n" ..
Radius .. " is " ..
areaOfCircle .. " pixels².", 0, 0, Arial, textSize2)

--anchor the text.
areaText2.anchorX = 0
areaText2.anchorY = 0
areaText2.x = 20
areaText2.y = 230

--set the color of newtext
areaText2:setTextColor (0, 1, 0)

