package cc;

import cc.Cc;

@:native("Collider.Box") extern class Box {
	public var offset : Vec2;
	public var size : Size;
}
@:native("Collider.Circle") extern class Circle {
	public var offset : Vec2;
	public var radius : Float;
}
@:native("Collider.Polygon") extern class Polygon {
	public var offset : Vec2;
	public var points : Array<Vec2>;
}

interface IBox {
	public var offset : Vec2;
	public var size : Size;
}
interface ICircle {
	public var offset : Vec2;
	public var radius : Float;
}

interface IPolygon {
	public var offset : Vec2;
	public var points : Array<Vec2>;
}