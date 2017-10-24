-- Inspired by charlietran https://gist.github.com/charlietran/43639b0f4e0a01c7c20df8f1929b76f2

-- This creates a shim Application that will enable you to open files from the Finder in vim using iTerm

-- To use this script: 
-- 1. Open Automator and create a new Application
-- 2. Add the "Run Applescript" action
-- 3. Paste this script into the Run Applescript section
-- 4. Save the application as TerminalVim.app in your Applications folder
-- 5. In the Finder, right click on a file and select "Open With". In that window you can set TerminalVim as a default

on run {input, parameters}
	tell application "iTerm"
    activate
		create window with default profile
		tell front window
			tell current session
				write text ("nvim " & quote & POSIX path of input & quote)
			end tell
		end tell
	end tell
end run
