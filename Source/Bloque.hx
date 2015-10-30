package ;


class Bloque extends GameElement {

	public var roto(default,null):Bool;

	public function new(){
		super();
		roto = false;
	}

	public function reset(){
		roto = false;
		this.loadBitmap('blue-block',4);
	}

	public function kill(){
		roto = true;
		this.loadBitmap('broken-blue-block',4);		
		SoundManager.play('hit');
	}
}