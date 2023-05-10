package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Boyfriend extends Character
{
	public var startedDeath:Bool = false;

	public function new(x:Float, y:Float, ?char:String = 'bf')
	{
		super(x, y, char, true);
	}

	override function update(elapsed:Float)
	{
		if (!debugMode && animation.curAnim != null)
		{
			if (animType > 0)
				holdTimer += elapsed;
			else
				holdTimer = 0;

			if (animType == 2 && animation.curAnim.finished && !debugMode)
				playAnim('idle', 0, true, false, 10);

			if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished && startedDeath)
				playAnim('deathLoop', 0);
		}

		super.update(elapsed);
	}
}
