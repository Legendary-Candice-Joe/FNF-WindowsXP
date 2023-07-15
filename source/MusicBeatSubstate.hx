package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.FlxSubState;

class MusicBeatSubstate extends FlxSubState
{
	public function new()
	{
		super();
	}

	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;
	private var controls(get, never):Controls;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override function update(elapsed:Float)
	{
		//everyStep();
		var oldStep:Int = curStep;

		updateCurStep();

		if (oldStep != curStep && curStep > 0)
			stepHit();


		super.update(elapsed);
	}

	var lastChange:BPMChangeEvent = {
		stepTime: 0,
		songTime: 0,
		bpm: 0
	}
	private function updateCurStep():Void
	{
		curStep = lastChange.stepTime + Math.floor((Conductor.songPosition - lastChange.songTime) / Conductor.stepCrochet);
	}

	public function stepHit():Void
	{
		if (curStep % 4 == 0){
			curBeat = Math.floor(curStep / 4);
			beatHit();
		}
	}

	public function beatHit():Void
	{
		//do literally nothing dumbass
		for (i in 0...Conductor.bpmChangeMap.length)
		{
			if (Conductor.songPosition > Conductor.bpmChangeMap[i].songTime)
				lastChange = Conductor.bpmChangeMap[i];
		}
	}
}
