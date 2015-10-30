package scenes;

import motion.Actuate;

class Menu extends Scene {

	private var jugarBtn:Boton;
	private var salirBtn:Boton;
	private var ayudaBtn:Boton;

	public function new(sm:SceneManager){
		super(sm);

		jugarBtn = new Boton("JUGAR!",20,0xFFFFFF,comenzar);
		salirBtn = new Boton("SALIR!",20,0xFFFFFF,salir);
		ayudaBtn = new Boton("AYUDA :(",20,0xFFFFFF,ayuda);

		this.addChild(jugarBtn);
		this.addChild(ayudaBtn);
		this.addChild(salirBtn);

		jugarBtn.x=100;
		jugarBtn.y=100;

		ayudaBtn.x=100;
		ayudaBtn.y=200;

		salirBtn.x=100;
		salirBtn.y=300;
	}

	override public function initialize(){
		jugarBtn.x=-100;
		salirBtn.x=-100;
		ayudaBtn.x=-100;
		jugarBtn.alpha=0;
		salirBtn.alpha=0;
		ayudaBtn.alpha=0;
		motion.Actuate.tween(jugarBtn,1.2,{x:300,alpha:1}).onComplete(function(){
			motion.Actuate.tween(jugarBtn,0.6,{scaleX:1.5,scaleY:1.5}).onComplete(function(){
				motion.Actuate.tween(jugarBtn,0.6,{scaleX:1,scaleY:1});
			});
		});
		motion.Actuate.tween(salirBtn,1.2,{x:300,alpha:1});		
		motion.Actuate.tween(ayudaBtn,1.2,{x:300,alpha:1});		
	}

	function comenzar(){
		sm.switchScene('game');
	}
	
	function salir(){
		Sys.exit(0);
	}

	function ayuda(){
		sm.switchScene('ayuda');
	}

}