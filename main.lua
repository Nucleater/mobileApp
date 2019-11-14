-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

_W=display.viewableContentWidth
_H=display.viewableContentHeight

local background = display.newRect(140,180,_W,_H)
background:setFillColor(255,255,255)

local font="HelveticaNeue";

local status = display.newText("Press to Play",0,0,font,20);
status:setTextColor(0,0,0);
status.x=_W*0.5;
status.y=100;
status.status="waiting"

local soundFile = audio.loadSound("02 - Necropolis.mp3");

function status:tap(e)
	if(self.status=="waiting") then
		audio.play(soundFile,{
			channel=1,
			loops=2,
			fadein=500,
			onComplete=function(e)
				audio.dispose(e.handle);
				e.handle=nil;
				
				self.status="playing";
				self.text="Sound unloaded";
			end
		});
		
		self.status="playing";
		self.text="Playing";
	elseif(self.status=="playing") then
		audio.pause(1);
		self.status="paused";
		self.text="Paused";
	elseif(self.status=="paused") then
		audio.resume(1);
		self.status="playing";
		self.text="Playing";
	end
end

status:addEventListener("tap",status);