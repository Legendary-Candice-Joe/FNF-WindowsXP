package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BackgroundGirls extends FlxSprite
{
	public inline static function numberArray(max:Int, min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
			dumbArray.push(i);
			
		return dumbArray;
	}
	
	public function new(x:Float, y:Float)
	{
		super(x, y);

		// BG fangirls dissuaded
		frames = Paths.getSparrowAtlas('weeb/bgFreaks');

		animation.addByIndices('danceLeft', 'BG girls group', numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG girls group', numberArray(30, 15), "", 24, false);

		animation.play('danceLeft');
	}

	var danceDir:Bool = false;

	public function getScared():Void
	{
		animation.addByIndices('danceLeft', 'BG fangirls dissuaded', numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG fangirls dissuaded', numberArray(30, 15), "", 24, false);
		dance();
	}

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}
