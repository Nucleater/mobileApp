local composer = require( "composer" )
local scene = composer.newScene()

local soundFile = audio.loadSound("jackass.ogg");

function scene:create( event )
	local sceneGroup = self.view
	local background = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	sceneGroup:insert(background)
	local x=true

	
	local opt = display.newText( " Opcje" , 290,50, native.systemFontBold, 30)
	opt:setFillColor( 1, 1, 1 )
	sceneGroup:insert( opt )
	
	local volumeOff = display.newText( "Wylacz/Wlacz dzwiek" , 290,130, native.systemFontBold, 20)
	volumeOff:setFillColor( 1, 1, 1 )
	sceneGroup:insert( volumeOff )
	
	local volumeMax = display.newText( "Ton sredni" , 290,170, native.systemFontBold, 20)
	volumeMax:setFillColor( 1, 1, 1 )
	sceneGroup:insert( volumeMax )
	
	local volumeMin= display.newText( "Ton niski" , 290,210, native.systemFontBold, 20)
	volumeMax:setFillColor( 1, 1, 1 )
	sceneGroup:insert( volumeMin )
	
	
	local menuButton = display.newText ("Do Menu", 295 , 285, native.systemFontBold, 30)
	menuButton:setTextColor( 1, 1, 2 )
	sceneGroup:insert( menuButton )
	
	local function gotoMainmenu(event)
	    	if event.phase == "ended" then 
	    		composer.gotoScene( "menu", "fade", 500 )
	    	end
	end
	
	local function MM(event)
	    	if event.phase == "ended" then 
	    		audio.setVolume(0.5)
	    	end
	end
	
	local function Quiet(event)
	    	if event.phase == "ended" then 
	    		audio.setVolume(0.25)
	    	end
	end
		
	local function turnOff(event)
	    	if event.phase == "ended" then 
				if(x==true) then
					audio.stop()
					
					x=false
				else if(x==false) then
					audio.play(soundFile, {channel=1,loops=-1})
					x=true
	    	end
	    end
	end
	end


	menuButton:addEventListener( "touch", gotoMainmenu )
	volumeOff:addEventListener( "touch", turnOff )
	volumeMax:addEventListener( "touch", MM )
	volumeMin:addEventListener( "touch", Quiet )
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene	