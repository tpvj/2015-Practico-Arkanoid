package;

import openfl.media.Sound;
import openfl.Assets;


class SoundManager {

	public static var muted:Bool = false;

	private static var sounds:Map<String,Sound>;

	public static function init(){
		sounds = new Map<String,Sound>();
	}

	public static function loadSound(name:String){
		var audio:Sound = Assets.getSound('assets/audio/'+name+'.ogg',true);
		sounds.set(name,audio);
	}

	public static function play(name:String) {
		if(muted) return;
		if(!sounds.exists(name)) {
			trace("EL AUDIO: "+name+" NO EXISTE!");
			return;
		}
		sounds.get(name).play();
	}

}