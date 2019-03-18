-- Title: NumericTextFields
-- Name: Alesk K
-- Course: ICS2O/3C
-- This program...
------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets a background color
display.setDefault("background", 45/255, 61/255, 255/255)

---------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericfield
local randomnumber1
local randomnumber2
local useranswer
local correctanswer
local incorrectobject

-------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------

local function AskQuestion()
	--generate two random number between a max and min
	randomnumber1 = math.random(10, 20)
	randomnumber2 = math.random(10, 20)

	correctanswer = randomnumber1 + randomnumber2

	--create question in text object
	questionObject.text = randomnumber1 .. "+" .. randomnumber2 .. "="

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

		--if users asnwer is correct
		if (useranswer == correctanswer) then
			correctObject.isVisible = true
			incorrectobject.isVisible = false
			timer.performWithDelay(2000, HideCorrect) 
		end
		if (useranswer ~= correctanswer) then
			incorrectobject.isVisible = true
			correctObject.isVisible = false
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
questionObject:setTextColor (0.1, 1, 0.5)

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
numericfield.inputType = "number"

--add a listener
numericfield:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------

--call the function to ask
AskQuestion()