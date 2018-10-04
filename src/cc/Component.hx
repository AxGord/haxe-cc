package cc;

import cc.Cc;

@:native("Component.EventHandler") extern class EventHandler {
	public var target : Node;
	public var component : String;
	public var handler : String;
	public var customEventData : String;
	static public function emitEvents(events:Array<Component.EventHandler>, params:haxe.extern.Rest<Dynamic>):Void;
	public function emit(params:Array<Dynamic>):Void;
}
