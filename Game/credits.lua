local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
	local background = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	sceneGroup:insert(background)
	
	
	local appDesc = display.newText( " Twórcy gry" , 290,50, native.systemFontBold, 30)
	appDesc:setFillColor( 1, 1, 1 )
	sceneGroup:insert( appDesc )
	
	creditTxt2 = display.newText(" Tomasz Gromadko     github.com/2emo4u" , 269,120, native.systemFontBold, 20)
	creditTxt2:setFillColor( 1, 1, 1 )
	sceneGroup:insert(creditTxt2)
	
	
	creditTxt3 = display.newText(" Artur Badura               github.com/Nucleator" , 277, 140, native.systemFontBold, 20)
	creditTxt3:setFillColor( 1, 1, 1 )
	sceneGroup:insert(creditTxt3)
	
	creditTxt4 = display.newText(" Sponsored by Politechnika Lodzka" , 235, 200, native.systemFontBold, 20)
	creditTxt4:setFillColor( 1, 1, 1 )
	sceneGroup:insert(creditTxt4)
	
	local menuButton = display.newText ("Powrót", 270 , 285, native.systemFontBold, 30)
	menuButton:setTextColor( 1, 1, 2 )
	sceneGroup:insert( menuButton )
	
	local function gotoMainmenu(event)
	    	if event.phase == "ended" then 
	    		composer.gotoScene( "menu", "fade", 500 )
	    	end
	    end

	menuButton:addEventListener( "touch", gotoMainmenu )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene	
	