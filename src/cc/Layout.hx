package cc;

@:enum abstract LayoutType(Int) {
	var NONE = 0;
	var HORIZONTAL = 0;
	var VERTICAL = 0;
	var GRID = 0;
}
@:enum abstract ResizeMode(Int) {
	var NONE = 0;
	var CONTAINER = 0;
	var CHILDREN = 0;
}
@:enum abstract AxisDirection(Int) {
	var HORIZONTAL = 0;
	var VERTICAL = 0;
}
@:enum abstract VerticalDirection(Int) {
	var BOTTOM_TO_TOP = 0;
	var TOP_TO_BOTTOM = 0;
}
@:enum abstract HorizontalDirection(Int) {
	var LEFT_TO_RIGHT = 0;
	var RIGHT_TO_LEFT = 0;
}
