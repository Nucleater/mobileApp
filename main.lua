-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
withScrn = display.contentWidth
heightScrn = display.contentHeight
topScrn = display.screenOriginY
leftScrn = display.screenOriginX
-- defintion of the background
backgroundfill = display.newRect(leftScrn, topScrn, withScrn, heightScrn)
-- only the splash screen has a white background
backgroundfill:setFillColor(255,255,255)
 
 
local options=
	{
		text="Sponsorowane przez PŁ",
		x=163,
		y=395,
		font=native.systemFontBold,
		fontSize=25
}
 
local storyboard = require ("storyboard")
storyboard.purgeOnSceneChange = true
 
local splash = display.newImage ("polibuda.png")
splash.x = centerX
splash.y = centerY

local function loadText()
	
	local myText = display.newText( options )
	myText:setTextColor( 255, 0, 0 )
end
 
local function endSplash ()
 
	splash:removeSelf()
	splash = nil
 
	-- set default background color for the game
	gradient = graphics.newGradient(
 	{ 80, 211, 255 },
  	{80, 100, 180 },
  	"up" )
  	
	storyboard.gotoScene ( "menu", { effect = "zoomOutIn"} )
end 

timer.performWithDelay(2000,loadText,1) 
timer.performWithDelay(5000, endSplash)