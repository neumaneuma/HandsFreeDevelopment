
on run {input, parameters}
	
	activate application "Visual Studio Code"
	tell application "System Events"
		key code 53
		keystroke "gg"
	end tell
	
	display dialog "Choose number:" buttons {"One", "Two", "Three"} default button 1
	
	repeat 2 times
		tell application "System Events" to keystroke "dw"
	end repeat
	
	return input
end run