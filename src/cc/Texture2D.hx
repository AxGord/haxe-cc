package cc;

@:enum abstract PixelFormat(Int) {
	var RGB565 = 0;
	var RGB5A1 = 0;
	var RGBA4444 = 0;
	var RGB888 = 0;
	var RGBA8888 = 0;
	var A8 = 0;
	var I8 = 0;
	var AI88 = 0;
}
@:enum abstract Texture2dWrapMode(Int) {
	var REPEAT = 0;
	var CLAMP_TO_EDGE = 0;
	var MIRRORED_REPEAT = 0;
}
@:enum abstract Filter(Int) {
	var LINEAR = 0;
	var NEAREST = 0;
}
