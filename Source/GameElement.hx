package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class GameElement extends Sprite {

	public var alive:Bool;
	private var bmp:Bitmap=null;

	public function new(){
		super();
		alive = true;
	}

	public function loadBitmap(name:String, scale:Float){
		if(bmp!=null) this.removeChild(bmp);
		bmp = new Bitmap(Assets.getBitmapData('assets/images/'+name+'.png'));
		this.addChild(bmp);
		bmp.scaleX = bmp.scaleY = scale;
		bmp.x = bmp.width/-2;
		bmp.y = bmp.height/-2;
	}

	public function checkCollision(obj:Sprite):Bool{
		if(this.y+this.height/2 < obj.y-obj.height/2) return false;
		if(this.y-this.height/2 > obj.y+obj.height/2) return false;

		if(this.x+this.width/2 < obj.x-obj.width/2) return false;
		if(this.x-this.width/2 > obj.x+obj.width/2) return false;

		return true;
	}

	public function updateLogic(time:Float){

	}

}