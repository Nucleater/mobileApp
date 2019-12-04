-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local status = "playing"
local composer = require( "composer" )
local scene = composer.newScene()
-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn
local soundFile = audio.loadSound("jackass.ogg");


-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "game", "fade", 500 )
	
	return true	-- indicates successful touch
end
-- 'onRelease' event listener for optionsBtn
local function onOptionsBtnRelease()

	composer.gotoScene( "option", "fade", 500 )
	return true
end

local function onCreditsBtnRelease()

	composer.gotoScene("credits","fade",500)
	return true
end

local function ExitBtnRelease()
	native.requestExit()
end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "Images/logo1.png", 200, 130 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100
	
	audio.play(soundFile, {channel=1,loops=-1})
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="Graj",
		lavelColor = { default={255}, over={128} },
		default="Images/button.png",
		over="Images/button-over.png",
		width=200, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 125
	
	local optionsBtn = widget.newButton{
	label = "Opcje",
	lavelColor = {default={255}, over={128} },
	default="Images/button.png",
	over="Images/button-over.png",
	width=200, height=40,
	onRelease = onOptionsBtnRelease
	}
	optionsBtn.x = display.contentCenterX
	optionsBtn.y = display.contentHeight - 90
	
	local creditsBtn = widget.newButton{
	label = "O twórcach",
	lavelColor = {default={255}, over={128} },
	default="Images/button.png",
	over="Images/button-over.png",
	width=200, height=40,
	onRelease = onCreditsBtnRelease
	}
	creditsBtn.x = display.contentCenterX
	creditsBtn.y = display.contentHeight - 60
	
	local exitBtn = widget.newButton{
	label = "Wyjście",
	lavelColor = {default={255}, over={128} },
	default="Images/button.png",
	over="Images/button-over.png",
	width=200, height=40
	}
	exitBtn.x = display.contentCenterX
	exitBtn.y = display.contentHeight - 30
	
	local function closeapp()
         native.requestExit()
end

function exitBtn:tap( event )
     timer.performWithDelay(1000,closeapp)
end    

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
	sceneGroup:insert(optionsBtn)
	sceneGroup:insert(creditsBtn)
	sceneGroup:insert(exitBtn)
	exitBtn:addEventListener("tap",exitBtn)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view

	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
	
	if optionsBtn then
	optionsBtn:removeSelf()
	optionsBtn = nil
	end	
	
	if creditsBtn then
	creditsBtn:removeSelf()
	exitBtn:removeSelf()
	exitBtn = nil
	creditsBtn = nil
	end	
	
	if exitBtn then
	exitBtn:removeSelf()
	exitBtn = nil
	end

end
	

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene