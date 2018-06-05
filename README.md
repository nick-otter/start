# start
```
      ___                         ___           ___
     /\__\                       /\  \         /\  \
    /:/ _/_         ___         /::\  \       /::\  \         ___
   /:/ /\  \       /\__\       /:/\:\  \     /:/\:\__\       /\__\
  /:/ /::\  \     /:/  /      /:/ /::\  \   /:/ /:/  /      /:/  /
 /:/_/:/\:\__\   /:/__/      /:/_/:/\:\__\ /:/_/:/__/___   /:/__/
 \:\/:/ /:/  /  /::\  \      \:\/:/  \/__/ \:\/:::::/  /  /::\  \
  \::/ /:/  /  /:/\:\  \      \::/__/       \::/~~/~~~~  /:/\:\  \
   \/_/:/  /   \/__\:\  \      \:\  \        \:\~~\      \/__\:\  \
     /:/  /         \:\__\      \:\__\        \:\__\          \:\__\
     \/__/           \/__/       \/__/         \/__/           \/__/
```

Some simple AppleScript that opens applications automatically at login.


## Install file

install_start.sh

```
#!/bin/bash

# Export start.scpt file as an application
osacompile -o /Applications/start.app start.scpt

# Add start application as a login item
osascript -e 'tell application "System Events" to make login item at end with properties {name: "Installing Start which will open applications for you at login", path:"/Applications/start.app", hidden:false}'
```

## Script file

start.scpt

```
on fullScreen()
	-- when called, runs keystroke commands for Full Screen mode
	tell application "System Events"
		keystroke "f" using {command down, control down}
	end tell
end fullScreen


on openApplication(applicationName)
	-- when called with one argument, calls activate on argument
	tell application applicationName to activate
end openApplication


set applicationList to {"Slack", "Google Chrome", "IntelliJ IDEA", "iTerm"}


repeat with theItem in applicationList
	-- calls openApplication with each item in applicationList
	openApplication(theItem)
end repeat
```

## Installation
* ```$ git clone git@github.com:nick-otter/start.git```
* ```$ cd start```
* ```$ bash install_start.sh```

## Acknowledgements 
[How To Run AppleScripts at Login](http://www.creativecongo.com/mac-tips-how-to-run-applescripts-at-login/)
