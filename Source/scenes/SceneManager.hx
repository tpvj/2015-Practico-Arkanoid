package scenes;

import openfl.display.Sprite;

class SceneManager {

	private var scenes : Map <String, Scene> = null;
	private var currentScene : Scene = null;	
	private var main:Sprite;

	public function new(main:Sprite){
		this.main = main;
		scenes = new Map<String,Scene>();
	}

	public function loadScene(name:String,s:Scene){
		scenes.set(name,s);
	}

	public function switchScene(name:String){

		if(!scenes.exists(name)){
			trace("La escena: "+name+" no existe!!!");
			return;
		}

		if(currentScene!=null){
			main.removeChild(currentScene);
		}

		var scene = scenes.get(name);
		main.addChild(scene);
		currentScene = scene;
		currentScene.initialize();
	}

	public function updateLogic(time:Float){
		if(currentScene!=null) currentScene.updateLogic(time);
	}

}