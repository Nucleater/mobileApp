local composer = require( "composer" )
local scene = composer.newScene()

Antwort=nil

MAX_QUESTION = 10

local paint = {
    type = "image",
    filename = "Images/question.png"
}

local gradient = {
    type="gradient",
    color1={ 1, 1, 1 }, color2={ 0.8, 0.8, 0.8 }, direction="down"
}

question=1
score=0


function scene:create( event )
	local sceneGroup = self.view
	local tile = display.newImageRect( "Images/ui.jpg", display.actualContentWidth, display.actualContentHeight )
	tile.anchorX = 0
	tile.anchorY = 0
	tile.x = 0 + display.screenOriginX 
	tile.y = 0 + display.screenOriginY
	sceneGroup:insert(tile)
	
-----------------Licznik pytan i wyniku---------------------------------------------------------------		
	
	local myText = display.newText("Wynik: ", 490,30,native.systemFont, 20 )
	sceneGroup:insert(myText)
	local counter = display.newText(score, 530, 30, native.systemFont, 20 )
	counter:setFillColor( 1, 1, 1 )
	sceneGroup:insert(counter)
	
	local quest = display.newText("Pytanie: ", 80,30,native.systemFont, 20 )
	sceneGroup:insert(quest)
	local counter1 = display.newText(question, 120, 30, native.systemFont, 20 )
	counter1:setFillColor( 1, 1, 1 )
	sceneGroup:insert(counter1)

----------------- Ramka pytania i tresc---------------------------------------------------------------	
	local rect = display.newRect( 300, 90, 450, 50 )
	rect:setFillColor(gradient)
	rect.stroke=paint
	rect.strokeWidth = 6
	
	local task = display.newText("Jaki jest najstarszy wydział PŁ?", 280,90,native.systemFont, 20 )
	task:setFillColor(0, 0, 0)
	sceneGroup:insert(rect)
	sceneGroup:insert(task)
	
----------------- Odpowiedzi---------------------------------------------------------------	
	
	local rectA = display.newRect( 300, 170, 450, 30 )
	rectA:setFillColor(gradient)
	rectA.stroke=paint
	rectA.strokeWidth = 6
	sceneGroup:insert(rectA)
	
	local answerA = display.newText("A. Wydział FTIMS?", 280,170,native.systemFont, 20 )
	answerA:setFillColor(0, 0, 0)
	sceneGroup:insert(answerA)
	
	local rectB = display.newRect( 300, 220, 450, 30 )
	rectB:setFillColor(gradient)
	rectB.stroke=paint
	rectB.strokeWidth = 6
	sceneGroup:insert(rectB)
	
	local answerB = display.newText("B. Wydział WEEIA", 280,220,native.systemFont, 20 )
	answerB:setFillColor(0, 0, 0)
	sceneGroup:insert(answerB)
	
	
	local rectC = display.newRect( 300, 270, 450, 30 )
	rectC:setFillColor(gradient)
	rectC.stroke=paint
	rectC.strokeWidth = 6
	sceneGroup:insert(rectC)
	
	local answerC = display.newText("C. Wydział Chemiczny", 280,270,native.systemFont, 20 )
	answerC:setFillColor(0, 0, 0)
	sceneGroup:insert(answerC)
	
	Antwort=answerA
	
	local function setAnswer(object)
		Antwort=object
	end
	
	local function nextQuestion()
					score = score + 10
					question = question+1
					counter.text=score
					counter1.text=question
					task.text="Ile lat ma Franek?"
					answerA.text="8 lat"
					answerB.text="9 lat"
					answerC.text="10 lat"
	end
	
	local function nextQuestion2()
					score = score + 10
					question = question+1
					counter.text=score
					counter1.text=question
					task.text="Ile lat ma a?"
					answerA.text="8 lat"
					answerB.text="9 lat"
					answerC.text="10 lat"
	end
	
	local function tempc(event)
		if event.phase == "ended" then 
	    		if(event.target==Antwort) and (question==1) then 
						timer.performWithDelay(1000,nextQuestion) 
						setAnswer(answerB)
				else if(event.target==Antwort) and (question==2) then 
						timer.performWithDelay(1000,nextQuestion2) 
						setAnswer(answerB)		
				else if(event.target~=Antwort) then
						score=0
						question=0
						params = {scoreToPass = score}
						composer.gotoScene( "gameover", "fade", 1000 )
				end
			end
	    end
	end
end
	
	answerA:addEventListener("touch",tempc)
	answerB:addEventListener("touch",tempc)
	answerC:addEventListener("touch",tempc)	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	if answerB then
		answerC=nil
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene