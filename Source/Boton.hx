package ;


import openfl.text.TextField;
import openfl.text.TextFormat;

class Boton extends GameElement {

//	private var onClick:Void->Void;

	public function new(texto:String,size:Int,color:Int,onClick:Void->Void){
		super();

		var tf:TextFormat=new TextFormat("Arial",size,color);

		var textField:TextField = new TextField();
		textField.text = texto;
		textField.setTextFormat(tf);
		textField.selectable = false;

		this.addChild(textField);
		this.addEventListener(openfl.events.MouseEvent.CLICK,function(_){ onClick(); });
		textField.x = textField.textWidth / -2;
		textField.y = textField.textHeight / -2;
	}

}