package cc;

@:native("Pipeline.Downloader") extern class Downloader {
	public function new(extMap:Dynamic):Void;
	public function addHandlers(extMap:Dynamic):Void;
	public function loadSubpackage(name:String, ?completeCallback:Error -> Void):Void;
}
@:native("Pipeline.Loader") extern class Loader {
	public function new(extMap:Dynamic):Void;
	public function addHandlers(extMap:Dynamic):Void;
}
