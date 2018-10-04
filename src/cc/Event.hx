package cc;

import cc.Cc;

@:native("Event.EventCustom") extern class EventCustom extends Event {
	public function new(type:String, bubbles:Bool):Void;
	public var detail : Dynamic;
	public function setUserData(data:Dynamic):Void;
	public function getUserData():Dynamic;
	public function getEventName():String;
}
@:native("Event.EventMouse") extern class EventMouse extends Event {
	public function setScrollData(scrollX:Float, scrollY:Float):Void;
	public function getScrollX():Float;
	public function getScrollY():Float;
	public function setLocation(x:Float, y:Float):Void;
	public function getLocation():Vec2;
	public function getLocationInView():Vec2;
	public function getPreviousLocation():Vec2;
	public function getDelta():Vec2;
	public function getDeltaX():Float;
	public function getDeltaY():Float;
	public function setButton(button:Float):Void;
	public function getButton():Float;
	public function getLocationX():Float;
	public function getLocationY():Float;
	static public var DOWN : Float;
	static public var UP : Float;
	static public var MOVE : Float;
	static public var SCROLL : Float;
	static public var BUTTON_LEFT : Float;
	static public var BUTTON_RIGHT : Float;
	static public var BUTTON_MIDDLE : Float;
	static public var BUTTON_4 : Float;
	static public var BUTTON_5 : Float;
	static public var BUTTON_6 : Float;
	static public var BUTTON_7 : Float;
	static public var BUTTON_8 : Float;
}
@:native("Event.EventTouch") extern class EventTouch extends Event {
	public function new(touchArr:Array<Dynamic>, bubbles:Bool):Void;
	public var touch : Touch;
	public function getEventCode():Float;
	public function getTouches():Array<Dynamic>;
	public function setLocation(x:Float, y:Float):Void;
	public function getLocation():Vec2;
	public function getLocationInView():Vec2;
	public function getPreviousLocation():Vec2;
	public function getStartLocation():Vec2;
	public function getID():Float;
	public function getDelta():Vec2;
	public function getDeltaX():Float;
	public function getDeltaY():Float;
	public function getLocationX():Float;
	public function getLocationY():Float;
}
@:native("Event.EventAcceleration") extern class EventAcceleration extends Event {

}
@:native("Event.EventKeyboard") extern class EventKeyboard extends Event {
	public var keyCode : Float;
}
