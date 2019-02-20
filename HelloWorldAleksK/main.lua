-- Title: HelloWorld
-- Name: Aleksander Kucy
-- Course: ICS2O/3C
-- This program displays Hello, world on the iPad simulator and "Hellooooooo!" to the command terminal.


-- print "Hello, World" to the command terminal
print ("Hello, World")


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- sets background color
display.setDefault("background", 123/255, 0255, 255/255)


-- create a local varaible
local textObject


--displays a text on screen at position x = 512 y = 374
-- a deafult font style and a size of 50
textObject = display.newText("Hi, how are you?", 512, 378, nil, 70)


-- sets the color of the text
textObject:setTextColor(255/255, 0/255, 0/255)

-- create a local varaible
local textObject2

--displays a text on screen at position x = 512 y = 700
-- a deafult font style and a size of 30
textObject2 = display.newText("By:Aleks Kucy", 512, 610, nil, 40)


-- sets the color of the text
textObject2:setTextColor(255/255, 71/255, 60/255)