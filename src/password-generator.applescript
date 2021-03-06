global upperChars, lowerChars, nums

-- Constants
set upperChars to "ABCDEFGHJKLMNPQRSTUVWXYZ"
set lowerChars to "abcdefghijkmnopqrstuvwxyz"
set nums to "0123456789"

-- Main
displayAlert()

-- Display Alert
on displayAlert()
	set generatedPassword to generatePassword()
	set the clipboard to generatedPassword
	set question to display alert "New password copied to clipboard" message generatedPassword buttons {"Another Password", "Thanks"} default button 2
	set answer to button returned of question
	
	if answer is equal to "Another Password" then
		displayAlert()
	end if
end displayAlert

-- Password Generator
on generatePassword()
	set charList to {}
	set shuffledCharList to {}
	-- Ensure all char types
	repeat with index from 1 to 18
		if index is less than 12 then
			set charList to charList & some item of lowerChars
		else if index is less than 16 then
			set charList to charList & some item of upperChars
		else
			set charList to charList & some item of nums
		end if
	end repeat
	-- Shuffle into new list
	repeat 18 times
		-- Get a random index
		set randIndex to random number from 1 to (count charList)
		-- Pluck out item at random index
		set pluckedChar to item randIndex of charList
		set shuffledCharList to shuffledCharList & pluckedChar
		-- New charList excluding item at random index
		set reducedCharList to {}
		repeat with index from 1 to (count charList)
			if index is not equal to randIndex then
				set reducedCharList to reducedCharList & item index of charList
			end if
		end repeat
		set charList to reducedCharList
	end repeat
	-- Return dashed password string
	set str to shuffledCharList as text
	return text 1 thru 6 of str & "-" & text 7 thru 12 of str & "-" & text 13 thru 18 of str
end generatePassword
