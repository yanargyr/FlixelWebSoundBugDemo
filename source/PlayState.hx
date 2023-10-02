package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var text = new flixel.text.FlxText(0, 0, 0, "There is no sound. If you hit the +/-/0 keys, it will start playing, and if you pause/unpause, all is good
			If you refresh and just pause/unpause, the music will start paying but with at least 2 channels", 8);
		text.screenCenter();
		add(text);
		Music.playLoop(Music.TRACK_1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
