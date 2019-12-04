local composer = require( "composer" )
local scene = composer.newScene()

local score = 0

function scene:create( event )
	local sceneGroup = self.view
	local tile = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	tile.anchorX = 0
	tile.anchorY = 0
	tile.x = 0 + display.screenOriginX 
	tile.y = 0 + display.screenOriginY
	sceneGroup:insert(tile)
	
	local myText = display.newText("Wynik: ", 240, 2, native.systemFont, 20 )
	local myText1 = display.newText(score, 280, 2, native.systemFont, 20 )
	myText:setFillColor( 1, 1, 1 )

	local menuButton = display.newText ("Do Menu", 100 , 200, native.systemFontBold, 30)

	local function click(event)
	    	if event.phase == "ended" then 
	    		score=score+10
    	end
	end
	

	menuButton:addEventListener( "touch", click )

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene