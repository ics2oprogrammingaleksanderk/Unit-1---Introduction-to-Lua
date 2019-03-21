-- Title: MathFun
-- Name: Alesk K
-- Course: ICS2O/3C
-- This program...
------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets a background color
display.setDefault("background", 7/255, 200/255, 50/255)

---------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectobject
local numericfield
local randomnumber1
local randomnumber2
local useranswer
local correctanswer
local randomOperator
local correctSound = audio.loadSound( "sounds/correctSound.mp3")
local correctSoundChannel
local wrongSound = audio.loadSound( "sounds/wrongSound.mp3")
local wrongSoundChannel
-------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------
local function roundToFirstDecimal( tmpcorrectanswer )
	print ("tmpcorrectanswer = " .. tmpcorrectanswer)
    return math.round( tmpcorrectanswer * 10 ) * 0.1
end

local function AskQuestion()
	
	randomOperator = math.random(1, 4)

	-- ************* FOR TESTING DELETE AFTER
	randomOperator = 4

	--generate two random number between a max and min
	randomnumber1 = math.random(6, 10)
	randomnumber2 = math.random(1, 6)
 	
	

	if (randomOperator == 1) then
		correctanswer = randomnumber1 + randomnumber2
		--create question in text object
		questionObject.text = randomnumber1 .. " + " .. randomnumber2 .. " = "			
	elseif (randomOperator == 2) then
		correctanswer = randomnumber1 - randomnumber2
		questionObject.text = randomnumber1 .. " - " .. randomnumber2 .. " = "
		
	elseif (randomOperator == 3) then
		correctanswer = randomnumber1 * randomnumber2

		questionObject.text = randomnumber1 .. " * " .. randomnumber2 .. " = "

		
	elseif (randomOperator == 4) then
			correctanswer = randomnumber1 / randomnumber2
			print ("correctanswer before rounding = " .. correctanswer)
			correctanswer = roundToFirstDecimal(correctanswer)
			print ("correctanswer after rounding = " .. correctanswer)
			questionObject.text = randomnumber1 .. " / " .. randomnumber2 .. " = "
			
			
	end
end	





local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function Hideincorrect()
	incorrectobject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )
	-- usernbegins editing the "numericfield"
	if (event.phase =="began") then

	elseif (event.phase == "submitted") then

		--when the enter key is pressed set user input to user answer 
		useranswer = tonumber(event.target.text)
		print("useranswer = " .. useranswer)

		--if users asnwer is correct
		if (useranswer == correctanswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect) 
		else
			incorrectobject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(2000, Hideincorrect)
		end

		--clear text field
		event.target.text = ""
	end
end

-----------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------

--displays a question
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (0, 0.5, 0.5)

--create the correct text object
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentWidth*2/3, nil, 50)
correctObject:setTextColor(1, 1, 0)
correctObject.isVisible = false

--create the incorrect text object 
incorrectobject = display.newText( "Incorrect!", display.contentWidth/2, display.contentWidth*2/3, nil, 50)
incorrectobject:setTextColor(1, 1, 0)
incorrectobject.isVisible = false

-- create numeric field
numericfield = native.newTextField( display.contentWidth*0.7, display.contentHeight/2, 200, 80)
numericfield.inputType = "default"

--add a listener
numericfield:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------

--call the function to ask
AskQuestion()