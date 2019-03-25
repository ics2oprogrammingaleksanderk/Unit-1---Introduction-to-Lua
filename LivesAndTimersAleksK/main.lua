-- Title: LivesAndTimers
-- Name: Aleksander Kucy
-- Course: ICS2O
----------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets a background color
display.setDefault("background", 50/255, 50/255, 200/255)

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
local totalSeconds = 5
local secondsLeft = 10
local clockText
local countDownTimer
local lives = 4
local heart1
local heart2
local heart3
local heart4
-------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------

local function UpdateTime()
	-- number of second decremented
	secondsLeft = secondsLeft - 1

	--displays the number of seconds left
	clockText.text = secondsLeft ..""

	if (secondsLeft == 0) then
		--resets the seconds
		secondsLeft = totalSeconds
		lives = lives - 1

		--if no lives left left play a sound and a u lose sound
		if (lives == 3) then
			heart4.isVisible = false
		elseif (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart3.isVisible = false
        elseif (lives == 0) then
			heart3.isVisible = false
		end
	AskQuestion()
	end	
end

local function StartTimer()
	countDownTimer = timer.performWithDelay(100, UpdateTime, 0)
end

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
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 7 / 8

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 7 / 8
heart2.y = display.contentHeight * 7 / 8

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 7 / 8
heart3.y = display.contentHeight * 7 / 8

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 7 / 8
heart4.y = display.contentHeight * 7 / 8

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