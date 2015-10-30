package scenes;

class Game extends Scene {

	public static var reinitCounter:Int=0;
	private var paleta:Paleta;
	private var bola:Bola;
	private var bloques:Array<Bloque>;

	public function new(sm:SceneManager){
		super(sm);
		paleta = new Paleta();
		bola = new Bola(paleta);
		bola.x = 140;
		bola.y = 33;

		bloques = new Array<Bloque>();

		var back:Boton = new Boton("VOLVER",20,0xFFFF00,volver);
		back.x=40;
		back.y=10;

		for(i in 0 ... 40) {
			var b:Bloque = new Bloque();
			bloques.push(b);
			this.addChild(b);
		}

		this.addChild(bola);
		this.addChild(paleta);
		this.addChild(back);
	}

	function volver(){
		sm.switchScene('menu');
	}

	override public function updateLogic(){
		super.updateLogic();

		if(reinitCounter>0){
			reinitCounter--;
			if(reinitCounter==0) reiniciar();
			return;
		}

		bola.updateLogic();
		paleta.updateLogic();

		for(b in bloques){
			if(!b.roto) bola.verificarColision(b);
		}

	}

	override public function initialize(){
		reiniciar();

		var bX:Int = 0;
		var bY:Int = 0;
		for(b in bloques){
			b.reset();
			b.x = 85+bX*(b.width+2);
			b.y = 100+bY*(b.height+2);
			bX++;
			if(bX>=8){
				bX=0;
				bY++;
			}
		}

	}

	function reiniciar(){
		bola.x=400;
		bola.y=50;
		bola.vX=2.4;
		bola.vY=2.8;
		paleta.x=Main.SCENE_WIDTH/2;
	}

}