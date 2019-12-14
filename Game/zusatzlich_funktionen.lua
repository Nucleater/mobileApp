local function rightAnswer(event)
	    	if event.phase == "ended" then 
	    		score = score + 10
				question = question+1
				counter.text=score
				counter1.text=question
				task.text="Ile lat ma Franek?"
				answerA.text="8 lat"
				answerB.text="9 lat"
				answerC.text="10 lat"
	    	end
	end
	
	local function wrongAnswer(event)
		if event.phase == "ended" then 
	    		composer.gotoScene( "menu", "fade", 1000 )
	    	end
	end