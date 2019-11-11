-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn


-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end
-- 'onRelease' event listener for optionsBtn
local function onOptionsBtnRelease()

	composer.gotoScene( "level1", "fade", 500 )
	return true
end

local function onCreditsBtnRelease()

	composer.gotoScene("credits","fade",500)
	return true
end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "logo.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="Play Now",
		lavelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=154, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 125
	
	local optionsBtn = widget.newButton{
	label = "Optons",
	lavelColor = {default={255}, over={128} },
	default="button.png",
	over="button-over.png",
	width=154, height=40,
	onRelease = onOptionsBtnRelease
	}
	optionsBtn.x = display.contentCenterX
	optionsBtn.y = display.contentHeight - 90
	
	local creditsBtn = widget.newButton{
	label = "Credits",
	lavelColor = {default={255}, over={128} },
	default="button.png",
	over="button-over.png",
	width=154, height=40,
	onRelease = onCreditsBtnRelease
	}
	creditsBtn.x = display.contentCenterX
	creditsBtn.y = display.contentHeight - 60
	
	local exitBtn = widget.newButton{
	label = "Exit",
	lavelColor = {default={255}, over={128} },
	default="button.png",
	over="button-over.png",
	width=154, height=40
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
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
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