package ;
import openfl.Assets;

class Paleta extends GameElement {

	private var propulsorL:Animation;
	private var propulsorR:Animation;

	public function new(){
		super();
		this.loadBitmap('paleta',2.6);
		x = Main.SCENE_WIDTH /2;
		y = Main.SCENE_HEIGHT - 60;
		propulsorL = new Animation(Assets.getBitmapData('assets/images/boosterL.png'),1,7);
		propulsorL.x=-77;
		propulsorL.y=propulsorL.height/-2;
		propulsorR = new Animation(Assets.getBitmapData('assets/images/boosterR.png'),1,7);
		propulsorR.x=40;
		propulsorR.y=propulsorR.height/-2;

		this.addChild(propulsorL);
		this.addChild(propulsorR);

		//powerUp = new Bitmap(Assets.getBitmapData('assets/images/powerup.png'));
		//paleta.addChild(powerUp);
		//powerUp.x=100;
		//powerUp.rotation+=10;
	}

	override public function updateLogic(time:Float){
		propulsorL.visible = false;
		propulsorR.visible = false;

		if(InputManager.derecha) {
			x += 3*time*60;
			propulsorL.updateLogic(time);
			propulsorL.visible = true;
		}
		if(InputManager.izquierda) {
			x -= 3*time*60;
			propulsorR.updateLogic(time);
			propulsorR.visible = true;
		}
	}


}