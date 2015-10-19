package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.media.Sound;
import openfl.Assets;

class Main extends Sprite {
	
	private var SCENE_WIDTH:Int = 600;
	private var SCENE_HEIGHT:Int = 400;

	private var reinitCounter:Int=0;
	private var paleta:Sprite;
	private var fondo:Sprite;
	private var bola:Sprite;
	private var derecha:Bool=false;
	private var izquierda:Bool=false;

	var vX:Float;
	var vY:Float;

	private var audio1:Sound;
	private var audio2:Sound;
	private var audio3:Sound;

	public function new () {
		
		super ();

		audio1 = Assets.getSound('assets/audio/hit.ogg',true);
		audio2 = Assets.getSound('assets/audio/game-over.ogg',true);
		
		bola = new Sprite();
		bola.graphics.beginFill(0xFF0000);
		bola.graphics.drawCircle(0,0,15);
		bola.graphics.endFill();

		fondo = new Sprite();
		fondo.graphics.beginFill(0x000000);
		fondo.graphics.drawRect(0,0,SCENE_WIDTH,SCENE_HEIGHT);
		fondo.graphics.endFill();

		paleta = new Sprite();
		paleta.graphics.beginFill(0x00FF00);
		paleta.graphics.drawRect(-60,-10,120,20);
		paleta.graphics.endFill();

		this.addChild(fondo);
		this.addChild(bola);
		this.addChild(paleta);
		
		bola.x=140;
		bola.y=33;

		paleta.x = SCENE_WIDTH /2;
		paleta.y = SCENE_HEIGHT - 60;

		vX = 2.4;
		vY = 3.1;

		this.stage.addEventListener(Event.ENTER_FRAME, updateLogic);
		this.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		this.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
	}

	function keyUp(e:KeyboardEvent){
		trace("HOLA MUNDO");
		trace(e);
		if(e.keyCode==39) derecha=false;//paleta.x+=10;
		if(e.keyCode==37) izquierda=false;//paleta.x-=10;
	}

	function keyDown(e:KeyboardEvent){
		trace(e);
		if(e.keyCode==39) derecha=true;//paleta.x+=10;
		if(e.keyCode==37) izquierda=true;//paleta.x-=10;
	}


	function updateLogic(_){

		if(reinitCounter>0){
			reinitCounter--;
			if(reinitCounter==0) reiniciar();
			return;
		}

		if(bola.x>=SCENE_WIDTH-15){
			vX*=-1; //= -2.4;
			audio1.play();
		}
		
		if(bola.x<=0+15) {
			audio1.play();
			vX*=-1;// 2.4;
		}

		if(vY!=0 && bola.y>=SCENE_HEIGHT-15){
			audio2.play();
			vY=vX=0;
			reinitCounter = 120;
			//haxe.Timer.delay(reiniciar,4000);
		}

		if(bola.y<=0+15){
			vY*=-1; // = 2;
			audio1.play();
		}

		if(colision(bola,paleta)){
			//vY*=-1;
			vY=-1*Math.abs(vY);
			audio1.play();
		}

		bola.x+=vX;
		bola.y+=vY;

		if(bola.x>SCENE_WIDTH-15) bola.x=SCENE_WIDTH-15;
		if(bola.y>SCENE_HEIGHT-15) bola.y=SCENE_HEIGHT-15;

		if(derecha) paleta.x += 3;
		if(izquierda) paleta.x -= 3;

	}

	function reiniciar(){
		bola.x=400;
		bola.y=50;
		vX=2.4;
		vY=2.8;
		paleta.x=SCENE_WIDTH/2;
	}
	
	function colision(obj1:Sprite,obj2:Sprite):Bool{
		if(obj1.y+obj1.height/2 < obj2.y-obj2.height/2) return false;
		if(obj1.y-obj1.height/2 > obj2.y+obj2.height/2) return false;

		if(obj1.x+obj1.width/2 < obj2.x-obj2.width/2) return false;
		if(obj1.x-obj1.width/2 > obj2.x+obj2.width/2) return false;

		return true;
	}
	
}