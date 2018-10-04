package cc;

@:enum abstract EventType(Int) {
	var PLAYING = 0;
	var PAUSED = 0;
	var STOPPED = 0;
	var COMPLETED = 0;
	var META_LOADED = 0;
	var CLICKED = 0;
	var READY_TO_PLAY = 0;
}
@:enum abstract ResourceType(Int) {
	var REMOTE = 0;
	var LOCAL = 0;
}
