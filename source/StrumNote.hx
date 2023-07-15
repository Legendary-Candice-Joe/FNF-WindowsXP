package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;

using StringTools;

class StrumNote extends FlxSprite
{
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;
	
	//public var primaryBind:FlxKey;
	//public var secondrBind:FlxKey;

	public function new(x:Float, y:Float, leData:Int) {
		noteData = leData;
		//primaryBind = PlayState.possibleBinds[leData];
		//secondrBind = PlayState.possibleBinds[leData + 4];
		
		super(x, y);
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) 
				playAnim('static');
		}

		super.update(elapsed);
	}

	public inline function playAnim(anim:String, ?force:Bool = false) {
		animation.play(anim, force);
		centerOffsets();
		centerOrigin ();
		//if (animation.curAnim.name == 'confirm') centerOrigin();
	}
}
