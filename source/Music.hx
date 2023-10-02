package;

import flixel.FlxG;
import haxe.ds.StringMap;

/**
 * ...
 * @author ...
 */
class Music
{
	// You can also repro with this track, although it doesn't sound as bad, and it think the stacking issue goes away after some pause/resume tries
	// private static var BG_TRACK_1 = "assets/music/testTrack.ogg";
	// Adding the actual track I was using, in case there is someething wrong with the file size or export setting etc
	private static var BG_TRACK_1 = "assets/music/track1.ogg";

	private static var musicLibrary:StringMap<Dynamic>;

	public static inline var TRACK_1:String = "music_track_1";

	private static var music_volume:Float = 0.5;

	private static var lastPlayedTrack:String;

	public static function initTracks():Void
	{
		musicLibrary = new StringMap<Dynamic>();
		musicLibrary.set(TRACK_1, BG_TRACK_1);
	}

	/*
		Play given track in a loop
	 */
	public static function playLoop(track_id:String):Void
	{
		try
		{
			var track:Dynamic = musicLibrary.get(track_id);
			if (track != null)
			{
				trace("Playing bg track [" + track_id + "] at vol:" + getVol() + " in LOOP");
				FlxG.sound.playMusic(track, music_volume);
				lastPlayedTrack = track_id;
			}
		}
		catch (err:Dynamic) {}
	}

	public static function getVol():Float
	{
		return music_volume;
	}

	public static function setVol(newVol:Float)
	{
		if (newVol < 0 || newVol > 1)
		{
			throw "music volume range is [0-1]";
		}
		var prevVolume:Float = FlxG.sound.music.volume;

		music_volume = newVol;
		FlxG.sound.music.volume = music_volume;

		if (newVol == 0)
		{
			FlxG.sound.music.pause();
		}
		else if (prevVolume == 0 && newVol > 0)
		{
			FlxG.sound.music.resume();
		}

		trace("New Music volume = " + music_volume);
	}
}
