package;


import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.Assets;
import scenes.*;

class Main extends Sprite {
	
	public static var SCENE_WIDTH:Int = 600;
	public static var SCENE_HEIGHT:Int = 400;

	private var sm:SceneManager;
	private var fondo:Sprite;

	public function new () {
		
		super ();

		fondo = new Sprite();
		fondo.graphics.beginFill(0x000000);
		fondo.graphics.drawRect(0,0,SCENE_WIDTH,SCENE_HEIGHT);
		fondo.graphics.endFill();

		this.addChild(fondo);
		this.stage.addEventListener(Event.ENTER_FRAME, updateLogic);

		sm = new SceneManager();
		sm.loadScene('menu',new Menu(sm));
		sm.loadScene('game',new Game(sm));

		InputManager.init();
		SoundManager.init();
		SoundManager.loadSound('hit');
		SoundManager.loadSound('game-over');

		sm.switchScene('menu');
	}


	function updateLogic(_){
		sm.updateLogic();
	}

	
}