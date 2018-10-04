package cc;

@:enum abstract Type(Int) {
	var SIMPLE = 0;
	var SLICED = 0;
}
@:enum abstract FillType(Int) {
	var HORIZONTAL = 0;
	var VERTICAL = 0;
	var RADIAL = 0;
}
@:enum abstract SpriteSizeMode(Int) {
	var CUSTOM = 0;
	var TRIMMED = 0;
	var RAW = 0;
	var NORMAL = 0;
	var GRAY = 0;
}
