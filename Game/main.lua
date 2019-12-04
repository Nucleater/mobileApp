-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

 
local options=
	{
		text="Sponsorowane przez PŁ",
		x=800,
		y=800,
		font=native.systemFontBold,
		fontSize=15
}

 
local splash=display.newImageRect( "Images/spplash.jpg", display.contentWidth, display.contentHeight)
splash.x = display.contentWidth / 2
splash.y = display.contentHeight / 2

local myText=nil

local function loadText()	
	myText = display.newText( options )
	myText:setTextColor( 240, 0, 0 )
end

 
local function endSplash ()
	splash:removeSelf()
	splash = nil
	myText:removeSelf()
	composer.gotoScene( "menu", "fade", 1000 )
end 

timer.performWithDelay(1000,loadText) 
timer.performWithDelay(2000,endSplash)
