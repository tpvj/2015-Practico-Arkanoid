package scenes;


class SceneManager {

	private var scenes : Map <String, Scene> = null;
	private var currentScene : Scene = null;	

	public function new(){
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
			openfl.Lib.current.stage.removeChild(currentScene);
		}

		var scene = scenes.get(name);
		openfl.Lib.current.stage.addChild(scene);
		currentScene = scene;
		currentScene.initialize();
	}

	public function updateLogic(){
		if(currentScene!=null) currentScene.updateLogic();
	}

}