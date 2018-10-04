package cc;

@:enum abstract EventType(Int) {
	var SCROLL_TO_TOP = 0;
	var SCROLL_TO_BOTTOM = 0;
	var SCROLL_TO_LEFT = 0;
	var SCROLL_TO_RIGHT = 0;
	var SCROLLING = 0;
	var BOUNCE_TOP = 0;
	var BOUNCE_BOTTOM = 0;
	var BOUNCE_LEFT = 0;
	var BOUNCE_RIGHT = 0;
	var SCROLL_ENDED = 0;
	var TOUCH_UP = 0;
	var AUTOSCROLL_ENDED_WITH_THRESHOLD = 0;
	var SCROLL_BEGAN = 0;
}
