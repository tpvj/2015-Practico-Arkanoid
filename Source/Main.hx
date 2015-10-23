package;


import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.Assets;

class Main extends Sprite {
	
	public static var SCENE_WIDTH:Int = 600;
	public static var SCENE_HEIGHT:Int = 400;

	public static var reinitCounter:Int=0;
	private var paleta:Paleta;
	private var fondo:Sprite;
	private var bola:Bola;

	public function new () {
		
		super ();

		fondo = new Sprite();
		fondo.graphics.beginFill(0x000000);
		fondo.graphics.drawRect(0,0,SCENE_WIDTH,SCENE_HEIGHT);
		fondo.graphics.endFill();

		paleta = new Paleta();
		bola = new Bola(paleta);
		bola.x = 140;
		bola.y = 33;


		this.addChild(fondo);
		this.addChild(bola);
		this.addChild(paleta);

		this.stage.addEventListener(Event.ENTER_FRAME, updateLogic);
		InputManager.init();
		SoundManager.init();
		SoundManager.loadSound('hit');
		SoundManager.loadSound('game-over');
	}


	function updateLogic(_){

		if(reinitCounter>0){
			reinitCounter--;
			if(reinitCounter==0) reiniciar();
			return;
		}

		bola.updateLogic();
		paleta.updateLogic();

	}

	function reiniciar(){
		bola.x=400;
		bola.y=50;
		bola.vX=2.4;
		bola.vY=2.8;
		paleta.x=SCENE_WIDTH/2;
	}
	
}