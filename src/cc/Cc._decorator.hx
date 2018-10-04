package cc;

@:native("Cc._decorator.Cc._decoratorTopLevel") extern class Cc._decoratorTopLevel {
	static function ccclass(?name:String):haxe.Constraints.Function;
	static function ccclass(?_class:haxe.Constraints.Function):Void;
	static function property(_target:Dynamic, _key:Dynamic, ?_desc:Dynamic):Void;
	static function executeInEditMode():haxe.Constraints.Function;
	static function executeInEditMode(_class:haxe.Constraints.Function):Void;
	static function requireComponent(requiredComponent:Dynamic):haxe.Constraints.Function;
	static function menu(path:String):haxe.Constraints.Function;
	static function executionOrder(order:Float):haxe.Constraints.Function;
	static function disallowMultiple():haxe.Constraints.Function;
	static function disallowMultiple(_class:haxe.Constraints.Function):Void;
	static function playOnFocus():haxe.Constraints.Function;
	static function playOnFocus(_class:haxe.Constraints.Function):Void;
	static function inspector(path:String):haxe.Constraints.Function;
	static function help(path:String):haxe.Constraints.Function;
	static function mixins(ctor:haxe.Constraints.Function, rest:haxe.extern.Rest<haxe.Constraints.Function>):haxe.Constraints.Function;
}
