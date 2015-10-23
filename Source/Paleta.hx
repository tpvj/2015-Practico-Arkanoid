package ;

class Paleta extends GameElement {

	public function new(){
		super();
		this.loadBitmap('paleta',2.6);
		x = Main.SCENE_WIDTH /2;
		y = Main.SCENE_HEIGHT - 60;


		//powerUp = new Bitmap(Assets.getBitmapData('assets/images/powerup.png'));
		//paleta.addChild(powerUp);
		//powerUp.x=100;
		//powerUp.rotation+=10;
	}

	override public function updateLogic(){
		if(InputManager.derecha) x += 3;
		if(InputManager.izquierda) x -= 3;		
	}


}