package cc;

@:enum abstract KeyboardReturnType(Int) {
	var DEFAULT = 0;
	var DONE = 0;
	var SEND = 0;
	var SEARCH = 0;
	var GO = 0;
	var NEXT = 0;
}
@:enum abstract InputMode(Int) {
	var ANY = 0;
	var EMAIL_ADDR = 0;
	var NUMERIC = 0;
	var PHONE_NUMBER = 0;
	var URL = 0;
	var DECIMAL = 0;
	var SINGLE_LINE = 0;
}
@:enum abstract InputFlag(Int) {
	var PASSWORD = 0;
	var SENSITIVE = 0;
	var INITIAL_CAPS_WORD = 0;
	var INITIAL_CAPS_SENTENCE = 0;
	var INITIAL_CAPS_ALL_CHARACTERS = 0;
	var DEFAULT = 0;
}
