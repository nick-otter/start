#!/bin/bash

# Export start.scpt file as an application
osacompile -o /Applications/start.app start.scpt

# Add start application as a login item
osascript -e 'tell application "System Events" to make login item at end with properties {name: "Installing Start which will open applications for you at login", path:"/Applications/start.app", hidden:false}'    
