package ;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;

class Background extends GameElement {

	var bg1:Sprite;
	var bg2:Sprite;
	var bg3:Sprite;

	var paleta:Paleta;

	public function new(p:Paleta){
		super();

		paleta = p;
		graphics.beginFill(0);
		graphics.drawRect(0,0,Main.SCENE_WIDTH,Main.SCENE_HEIGHT);
		graphics.endFill();

		bg1=new Sprite();
		bg2=new Sprite();
		bg3=new Sprite();

		bg1.addChild(new Bitmap(Assets.getBitmapData('assets/images/background4.jpg')));
		bg2.addChild(new Bitmap(Assets.getBitmapData('assets/images/background5.png')));
		bg3.addChild(new Bitmap(Assets.getBitmapData('assets/images/background6.png')));

		bg1.width = Main.SCENE_WIDTH;
		bg1.height = Main.SCENE_HEIGHT;

		this.addChild(bg1);
		this.addChild(bg2);
		this.addChild(bg3);
	}

	override public function updateLogic(){
		bg2.x=paleta.x/30;
		bg3.x=paleta.x/10;
	}

}