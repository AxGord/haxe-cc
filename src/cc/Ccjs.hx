package cc;

@:native("Cc.js.Array") extern class Array {
	static public function removeAt(array:Array<Dynamic>, index:Float):Void;
	static public function fastRemoveAt(array:Array<Dynamic>, index:Float):Void;
	static public function remove(array:Array<Dynamic>, value:Dynamic):Bool;
	static public function fastRemove(array:Array<Dynamic>, value:Float):Void;
	static public function verifyType(array:Array<Dynamic>, type:haxe.Constraints.Function):Bool;
	static public function removeArray(array:Array<Dynamic>, minusArr:Array<Dynamic>):Void;
	static public function appendObjectsAt(array:Array<Dynamic>, addObjs:Array<Dynamic>, index:Float):Array<Dynamic>;
	static public function indexOf(searchElement:Dynamic, ?fromIndex:Float):Float;
	static public function contains(array:Array<Dynamic>, value:Dynamic):Bool;
	static public function copy(array:Array<Dynamic>):Array<Dynamic>;
}
@:native("Cc.js.Pool") extern class Pool {
	@:overload(function(size:Float):Void { })
	public function new(cleanupFunc:Dynamic -> Void, size:Float):Void;
	public function get(params:haxe.extern.Rest<Dynamic>):Dynamic;
	public var count : Float;
	public function _get():Dynamic;
	public function put():Void;
	public function resize():Void;
}
@:native("Cc.js.Cc.jsTopLevel") extern class Cc_jsTopLevel {
	static function isNumber(obj:Dynamic):Bool;
	static function isString(obj:Dynamic):Bool;
	static function addon(obj:Dynamic, sourceObj:haxe.extern.Rest<Dynamic>):Dynamic;
	static function mixin(obj:Dynamic, sourceObj:haxe.extern.Rest<Dynamic>):Dynamic;
	static function extend(cls:haxe.Constraints.Function, base:haxe.Constraints.Function):haxe.Constraints.Function;
	static function getSuper(ctor:haxe.Constraints.Function):haxe.Constraints.Function;
	static function isChildClassOf(subclass:haxe.Constraints.Function, superclass:haxe.Constraints.Function):Bool;
	static function clear(obj:Dynamic):Void;
	static function getPropertyDescriptor(obj:Dynamic, name:String):Dynamic;
	static function value(obj:Dynamic, prop:String, value:Dynamic, ?writable:Bool, ?enumerable:Bool):Void;
	static function getset(obj:Dynamic, prop:String, getter:haxe.Constraints.Function, ?setter:haxe.Constraints.Function, ?enumerable:Bool):Void;
	static function get(obj:Dynamic, prop:String, getter:haxe.Constraints.Function, ?enumerable:Bool, ?configurable:Bool):Void;
	static function set(obj:Dynamic, prop:String, setter:haxe.Constraints.Function, ?enumerable:Bool, ?configurable:Bool):Void;
	static function getClassName(objOrCtor:haxe.extern.EitherType<Dynamic, haxe.Constraints.Function>):String;
	static function setClassName(className:String, constructor:haxe.Constraints.Function):Void;
	static function unregisterClass(constructor:haxe.extern.Rest<haxe.Constraints.Function>):Void;
	static function getClassByName(classname:String):haxe.Constraints.Function;
	static function obsolete(obj:Dynamic, obsoleted:String, newExpr:String, ?writable:Bool):Void;
	static function obsoletes(obj:Dynamic, objName:Dynamic, props:Dynamic, ?writable:Bool):Void;
	static function formatStr(msg:haxe.extern.EitherType<String, Dynamic>, subst:haxe.extern.Rest<Dynamic>):String;
	static function createMap(?forceDictMode:Bool):Dynamic;
}
