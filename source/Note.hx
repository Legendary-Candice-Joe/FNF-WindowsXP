package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flash.display.BitmapData;

using StringTools;

class Note extends FlxSprite
{
	public var strumTime:Float = 0;

	public var mustPress:Bool = false;
	public var noteData:Int = 0;
	public var canBeHit:Bool = false;
	public var tooLate:Bool = false;
	public var wasGoodHit:Bool = false;
	public var ignoreNote:Bool = false;
	public var prevNote:Note;

	public var sustainLength:Float = 0;
	public var isSustainNote:Bool = false;
	public var noteType(default, set):Int = 0;

	public var eventName:String = '';
	public var eventVal1:String = '';
	public var eventVal2:String = '';

	//public var colorSwap:ColorSwap;
	//public var inEditor:Bool = false;
	public var isEnd:Bool = false;

	public static var swagWidth:Float = 160 * 0.7;
	/*public static var PURP_NOTE:Int = 0;
	public static var GREEN_NOTE:Int = 2;
	public static var BLUE_NOTE:Int = 1;
	public static var RED_NOTE:Int = 3;*/
	public static var nCol:Array<String> = ['purple', 'blue', 'green', 'red'];

	private function set_noteType(value:Int):Int {
		if(noteData > -1 && noteType != value) {
			switch(value) {
				case 3: //Hurt note
					reloadNote('HURT');
			}
			noteType = value;
		}
		return value;
	}

	var isPixel:Bool = false;
	public function new(strumTime:Float, fData:Int, ?prevNote:Note, ?sustainNote:Bool = false/*, ?inEditor:Bool = false*/)
	{
		super();

		if (prevNote == null)
			prevNote = this;

		this.prevNote = prevNote;
		this.noteData = fData % 4;
		isSustainNote = sustainNote;
		//this.inEditor = inEditor;

		x += (ClientPrefs.middleScroll ? PlayState.STRUM_X_MIDDLESCROLL : PlayState.STRUM_X) + 50;
		// MAKE SURE ITS DEFINITELY OFF SCREEN?
		y -= 2000;
		this.strumTime = strumTime;
		if(!ChartingState.noteEditor) this.strumTime += ClientPrefs.noteOffset;

		var daStage:String = PlayState.curStage;

		switch (daStage)
		{
			case 'school' | 'schoolEvil':
				if (isSustainNote)
				{
					loadGraphic(Paths.image('weeb/pixelUI/NOTE_assetsENDS'));
					width = width / 4;
					height = height / 2;
					loadGraphic(Paths.image('weeb/pixelUI/NOTE_assetsENDS'), true, Math.floor(width), Math.floor(height));
				} else {
					loadGraphic(Paths.image('weeb/pixelUI/NOTE_assets'));
					width = width / 4;
					height = height / 5;
					loadGraphic(Paths.image('weeb/pixelUI/NOTE_assets'), true, Math.floor(width), Math.floor(height));
				}
				loadPixelNoteAnims();

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				isPixel = true;

			default:
				frames = Paths.getSparrowAtlas('NOTE_assets');
				loadNoteAnims();
				antialiasing = ClientPrefs.globalAntialiasing;
		}

		if(noteData > -1) {
			x += swagWidth * noteData;
			if(!isSustainNote) { //Doing this 'if' check to fix the warnings on Senpai songs
				var animToPlay:String = nCol[noteData];
				animation.play(animToPlay + 'Scroll');
			}
		}

		// trace(prevNote);

		if (isSustainNote && prevNote != null)
		{
			alpha = 0.6;
			if(ClientPrefs.downScroll) flipY = true;

			x += width / 2;
			animation.play(nCol[noteData] + 'holdend');
			isEnd = true;

			updateHitbox();

			x -= width / 2;

			if (PlayState.curStage.startsWith('school'))
				x += 30;

			if (prevNote.isSustainNote)
			{
				prevNote.animation.play(nCol[noteData] + 'hold');
				prevNote.isEnd = false;
				prevNote.scale.y *= Conductor.stepCrochet / 100 * 1.5 * PlayState.SONG.speed;
				prevNote.updateHitbox();
				// prevNote.setGraphicSize();
			}
		}

		if(!isPixel && noteData > -1) reloadNote();
	}

	function reloadNote(?prefix:String = '', ?suffix:String = '') {
		var skin:String = PlayState.SONG.arrowSkin;
		if(skin == null || skin.length < 1) {
			skin = 'NOTE_assets';
		}

		var animName:String = null;
		if(animation.curAnim != null) {
			animName = animation.curAnim.name;
		}

		var blahblah:String = prefix + skin + suffix;
		if(isPixel) {
			if(isSustainNote) {
				loadGraphic(Paths.image('weeb/pixelUI/' + blahblah + 'ENDS'));
				width = width / 4;
				height = height / 2;
				loadGraphic(Paths.image('weeb/pixelUI/' + blahblah + 'ENDS'), true, Math.floor(width), Math.floor(height));
			} else {
				loadGraphic(Paths.image('weeb/pixelUI/' + blahblah));
				width = width / 4;
				height = height / 5;
				loadGraphic(Paths.image('weeb/pixelUI/' + blahblah), true, Math.floor(width), Math.floor(height));
			}
			loadPixelNoteAnims();
		} else {
			frames = Paths.getSparrowAtlas(blahblah);
			loadNoteAnims();
		}
		animation.play(animName, true);

		if(ChartingState.noteEditor) {
			setGraphicSize(ChartingState.GRID_SIZE, ChartingState.GRID_SIZE);
			updateHitbox();
		}
	}

	function loadNoteAnims() {
		if (isSustainNote){
			animation.addByPrefix(nCol[noteData] + 'holdend', nCol[noteData] + ' hold end');
			animation.addByPrefix(nCol[noteData] + 'hold'   , nCol[noteData] + ' hold piece');
		} else
			animation.addByPrefix(nCol[noteData] + 'Scroll', nCol[noteData] + '0');

		setGraphicSize(Std.int(width * 0.7));
		updateHitbox();
	}

	function loadPixelNoteAnims() {
		if (isSustainNote) {
			// THIS IS DUMB.
			animation.add('purpleholdend', [4]);
			animation.add('greenholdend',  [2 + 4]);
			animation.add('redholdend',    [3 + 4]);
			animation.add('blueholdend',   [1 + 4]);

			animation.add('purplehold', [0]);
			animation.add('greenhold',  [2]);
			animation.add('redhold',    [3]);
			animation.add('bluehold',   [1]);
		} else {
			animation.add('greenScroll',  [2 + 4]);
			animation.add('redScroll',    [3 + 4]);
			animation.add('blueScroll',   [1 + 4]);
			animation.add('purpleScroll', [4]);
		}
	}

	/*override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (mustPress)
		{
			// The * 0.5 is so that it's easier to hit them too late, instead of too early
			if (strumTime > Conductor.songPosition - Conductor.safeZoneOffset
				&& strumTime < Conductor.songPosition + (Conductor.safeZoneOffset * 0.5))
				canBeHit = true;
			else
				canBeHit = false;

			if (strumTime < Conductor.songPosition - Conductor.safeZoneOffset && !wasGoodHit)
				tooLate = true;
		}
		else
		{
			canBeHit = false;

			if (strumTime <= Conductor.songPosition)
				wasGoodHit = true;
		}

		if (tooLate)
		{
			if (alpha > 0.3)
				alpha = 0.3;
		}
	}*/
}
