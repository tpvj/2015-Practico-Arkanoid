package ;

import openfl.events.KeyboardEvent;


class InputManager {

	public static var derecha:Bool=false;
	public static var izquierda:Bool=false;

	public static function init(){
		openfl.Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		openfl.Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);		
	}	

	private static function keyUp(e:KeyboardEvent){
		if(e.keyCode==39) derecha=false;//paleta.x+=10;
		if(e.keyCode==37) izquierda=false;//paleta.x-=10;
	}

	private static function keyDown(e:KeyboardEvent){
		if(e.keyCode==39) derecha=true;//paleta.x+=10;
		if(e.keyCode==37) izquierda=true;//paleta.x-=10;
	}



}