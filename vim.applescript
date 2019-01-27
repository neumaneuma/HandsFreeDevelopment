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
        keystroke "i"
        delay 0.01

        repeat num times
            key code dirKeyCode using {shift down, option down}
            delay 0.01
        end repeat

        key code 51
    end tell
end darknessHelper

on golfHelper(num, dirKeyCode)
    tell application "System Events"
        repeat num times
            key code dirKeyCode using {option down}
            delay .01
        end repeat
    end tell
end golfHelper

on deodorantHelper(numLines, val)
    set readjustPositionCounter to (numLines - 1)
    tell application "System Events"
        keystroke val
        repeat readjustPositionCounter times
            key code 126
        end repeat
    end tell
end deodorantHelper

on parseNum(num)
    if num is "one" then
        return "1"
    else if num is "to" or num is "too" or num is "two" then
        return "2"
   else if num is "three" then
        return "3"
    else if num is "four" or num is "for" then
        return "4"
    else if num is "five" then
        return "5"
    else if num is "six" or num is "sex" then
        return "6"
    else if num is "seven" or num is "southern" then
        return "7"
    else if num is "eight" or num is "it" then
        return "8"
    else if num is "nine" then
        return "9"
    else
        return num
    end if
end parseNum

on run {input, parameters}
	display dialog "Enter VIM command" default answer ""
	set cmd to (text returned of result)
	
	set cmd to changeCaseOfText(cmd, "lower")
	set cmd to splitText(cmd, space)
	set noun to item 1 of cmd
	
    activate application "Visual Studio Code"
    tell application "System Events" to key code 53
    delay .01

	if noun is "taco" then
        set num to item 2 of cmd
        set num to parseNum(num)
        set val to num & "gg"
		tell application "System Events" to keystroke val
    else if noun is "boost" then
        set val to "GG"
		tell application "System Events" to keystroke val
    else if noun is "delta" then
        set num to item 2 of cmd
        set num to parseNum(num)
        set val to "d" & num & "d"
		tell application "System Events" to keystroke val
    else if noun is "yellow" then
        set num to item 2 of cmd
        set num to parseNum(num)
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
    else if noun is "deodorant" then
        set direction to item 2 of cmd
        set numLines to item 3 of cmd
        set numLines to parseNum(numLines)

        if direction is "left" then
            set val to numLines & "<<"
            set numLines to numLines as number
            deodorantHelper(numLines, val)
        else
            set val to numLines & ">>"
            set numLines to numLines as number
            deodorantHelper(numLines, val)
        end if
    else if noun is "darkness" then
        set direction to item 2 of cmd
        set num to item 3 of cmd
        set num to parseNum(num) as number

        if direction is "left" then
            darknessHelper(num, 123)
        else
            darknessHelper(num, 124)
        end if
    else if noun is "golf" then
        set direction to item 2 of cmd
        set num to item 3 of cmd
        set num to parseNum(num) as number

        if direction is "left" then
            golfHelper(num, 123)
        else
            golfHelper(num, 124)
        end if
    else if noun is "arrow" then
        set num to item 2 of cmd
        set num to parseNum(num) as number
        tell application "System Events"
            repeat num times
                key code 125
                delay .01
            end repeat
        
            key code 76
        end tell
    else
        display dialog "Unknown: " & cmd
	end if
	
	return input
end run