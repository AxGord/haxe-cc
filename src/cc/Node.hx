package cc;

@:enum abstract _LocalDirtyFlag(Int) {
	var POSITION = 0;
	var SCALE = 0;
	var ROTATION = 0;
	var SKEW = 0;
	var RT = 0;
	var ALL = 0;
}
@:native("Node.EventType") extern class EventType {
	static public var TOUCH_START : String;
	static public var TOUCH_MOVE : String;
	static public var TOUCH_END : String;
	static public var TOUCH_CANCEL : String;
	static public var MOUSE_DOWN : String;
	static public var MOUSE_MOVE : String;
	static public var MOUSE_ENTER : String;
	static public var MOUSE_LEAVE : String;
	static public var MOUSE_UP : String;
	static public var MOUSE_WHEEL : String;
	static public var POSITION_CHANGED : String;
	static public var ROTATION_CHANGED : String;
	static public var SCALE_CHANGED : String;
	static public var SIZE_CHANGED : String;
	static public var ANCHOR_CHANGED : String;
	static public var CHILD_ADDED : String;
	static public var CHILD_REMOVED : String;
	static public var CHILD_REORDER : String;
	static public var GROUP_CHANGED : String;
}
