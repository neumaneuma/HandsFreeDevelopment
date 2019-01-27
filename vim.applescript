on changeCaseOfText(theText, theCaseToSwitchTo)
	if theCaseToSwitchTo contains "lower" then
		set theComparisonCharacters to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		set theSourceCharacters to "abcdefghijklmnopqrstuvwxyz"
	else if theCaseToSwitchTo contains "upper" then
		set theComparisonCharacters to "abcdefghijklmnopqrstuvwxyz"
		set theSourceCharacters to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	else
		return theText
	end if
	set theAlteredText to ""
	repeat with aCharacter in theText
		set theOffset to offset of aCharacter in theComparisonCharacters
		if theOffset is not 0 then
			set theAlteredText to (theAlteredText & character theOffset of theSourceCharacters) as string
		else
			set theAlteredText to (theAlteredText & aCharacter) as string
		end if
	end repeat
	return theAlteredText
end changeCaseOfText

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

on darknessHelper(num, dirKeyCode)
    tell application "System Events"
        key code 53
        keystroke "i"

        delay 0.01
        repeat num times
            key code dirKeyCode using {shift down, option down}
            delay 0.01
        end repeat

        key code 51
    end tell
end darknessHelper

on run {input, parameters}
	display dialog "Enter VIM command" default answer ""
	set cmd to (text returned of result)
	
	set cmd to changeCaseOfText(cmd, "lower")
	set cmd to splitText(cmd, space)
	set noun to item 1 of cmd
	
    activate application "Visual Studio Code"

	if noun is "taco" then
        set num to item 2 of cmd
        set val to num & "gg"
		tell application "System Events" to keystroke val
    else if noun is "boost" then
        set val to "GG"
		tell application "System Events" to keystroke val
    else if noun is "delta" then
        set num to item 2 of cmd
        set val to "d" & num & "d"
		tell application "System Events" to keystroke val
    else if noun is "yankee" then
        set num to item 2 of cmd
        set val to "y" & num & "y"
		tell application "System Events" to keystroke val
    else if noun is "alpha" then
        set val to "a"
		tell application "System Events" to keystroke val
    else if noun is "india" then
        set val to "i"
		tell application "System Events" to keystroke val
    else if noun is "oscar" then
        set val to "o"
		tell application "System Events" to keystroke val
    else if noun is "replace" then
        set val to "r"
		tell application "System Events" to keystroke val
    else if noun is "papa" then
        set val to "p"
		tell application "System Events" to keystroke val
    else if noun is "repeat" then
        set val to "."
		tell application "System Events" to keystroke val
    else if noun is "romeo" then
        set num to item 2 of cmd
        set val to num & ">>"
		tell application "System Events" to key code 53
		tell application "System Events" to keystroke val
    else if noun is "lima" then
        set num to item 2 of cmd
        set val to num & "<<"
		tell application "System Events" to key code 53
		tell application "System Events" to keystroke val
    else if noun is "darkness" then
        set direction to item 2 of cmd
        set direction to changeCaseOfText(cmd, "lower")

        set num to item 3 of cmd as number
        if direction is "left" then
            darknessHelper(num, 123)
        else
            darknessHelper(num, 124)            
        end if
    else if noun is "go" then
		tell application "System Events" to key code 53

        set direction to item 2 of cmd
        set direction to changeCaseOfText(cmd, "lower")

        set num to item 3 of cmd
        repeat num times
            if direction is "left" then
                tell application "System Events" to key code 123 using {option down} 
            else
                tell application "System Events" to key code 124 using {option down} 
            end if
        end repeat
    else if noun is "arrow" then
        delay 8
        set num to item 2 of cmd as number
        tell application "System Events"
            repeat num times
                key code 125
                delay .01
            end repeat
        
            key code 76
        end tell
        
	end if
	
	return input
end run