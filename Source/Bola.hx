package ;

class Bola extends GameElement {

	public var vX:Float;
	public var vY:Float;

	private var paleta:Paleta;

	public function new(p:Paleta){
		super();
		this.loadBitmap('ballFace',0.05);
		vX = 2.4;
		vY = 3.1;
		paleta = p;
	}

	override public function updateLogic(){

		if(this.x>=Main.SCENE_WIDTH-15){
			vX*=-1; //= -2.4;
			SoundManager.play('hit');
		}
		
		if(this.x<=0+15) {
			SoundManager.play('hit');
			vX*=-1;// 2.4;
		}

		if(vY!=0 && this.y>=Main.SCENE_HEIGHT-15){
			SoundManager.play('game-over');
			vY=vX=0;
			Main.reinitCounter = 120;
		}

		if(this.y<=0+15){
			vY*=-1; // = 2;
			SoundManager.play('hit');
		}

		if(this.checkCollision(paleta)){
			//vY*=-1;
			vY=-1*Math.abs(vY);
			SoundManager.play('hit');
		}

		this.x+=vX;
		this.y+=vY;

		if(this.x>Main.SCENE_WIDTH-15) this.x=Main.SCENE_WIDTH-15;
		if(this.y>Main.SCENE_HEIGHT-15) this.y=Main.SCENE_HEIGHT-15;

	}

}