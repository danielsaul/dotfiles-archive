on run {input, parameters}
	try
		set filename to quoted form of POSIX path of item 1 of input
		set cmd to "clear;cd `dirname " & filename & "`;nvim " & filename
		tell application "iTerm"
			activate
			create window with default profile
			tell current session of current window
				write text cmd
			end tell
		end tell
	end try
end run
