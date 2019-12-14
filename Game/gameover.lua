local composer = require( "composer" )
composer.loadScene("game")
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local tile = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	tile.anchorX = 0
	tile.anchorY = 0
	tile.x = 0 + display.screenOriginX 
	tile.y = 0 + display.screenOriginY
	sceneGroup:insert(tile)
	
	local opt = display.newText( "Koniec Gry :(" , 290,80, native.systemFontBold, 40)
	opt:setFillColor( 1, 1, 1 )
	sceneGroup:insert( opt )
	
	local menuButton = display.newText ("Do Menu", 285 , 270, native.systemFontBold, 40)
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