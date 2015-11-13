package;


import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.Assets;
import scenes.*;
import openfl.Lib;

class Main extends Sprite {
	
	public static var SCENE_WIDTH:Int = 600;
	public static var SCENE_HEIGHT:Int = 400;

	private var sm:SceneManager;
	private var fondo:Background;
	private var lastTime:Float;

	public function new () {
		
		super ();

		var game = new Game(sm);
		fondo = new Background(game.paleta);
		this.addChild(fondo);

		this.stage.addEventListener(Event.ENTER_FRAME, updateLogic);
		this.stage.addEventListener(Event.RESIZE, resize);

		sm = new SceneManager(this);
		sm.loadScene('menu',new Menu(sm));
		sm.loadScene('game',game);

		InputManager.init();
		SoundManager.init();
		SoundManager.loadSound('hit');
		SoundManager.loadSound('game-over');

		sm.switchScene('menu');
		lastTime = Sys.time();
	}

	function resize(_){
		var sX:Float = stage.stageWidth/SCENE_WIDTH;
		var sY:Float = stage.stageHeight/SCENE_HEIGHT;
		var s:Float = Math.min(sX,sY);
		this.scaleX = this.scaleY = s;
		Lib.current.stage.color = 0x00AAAA;
		this.x = (stage.stageWidth - (SCENE_WIDTH*s))/2;
		this.y = (stage.stageHeight - (SCENE_HEIGHT*s))/2;
	}


	function updateLogic(_){
		var time = Sys.time();
		var speed:Float = 0.7;
		var deltaTime = (time-lastTime)*speed;
		sm.updateLogic(deltaTime);
		fondo.updateLogic(deltaTime);
		lastTime = time;
	}

	
}