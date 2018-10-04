package cc;

@:enum abstract HorizontalAlign(Int) {
	var LEFT = 0;
	var CENTER = 0;
	var RIGHT = 0;
}
@:enum abstract VerticalAlign(Int) {
	var TOP = 0;
	var CENTER = 0;
	var BOTTOM = 0;
}
@:enum abstract Overflow(Int) {
	var NONE = 0;
	var CLAMP = 0;
	var SHRINK = 0;
	var RESIZE_HEIGHT = 0;
}
@:enum abstract LabelType(Int) {
	var TTF = 0;
	var BMFont = 0;
	var SystemFont = 0;
}
