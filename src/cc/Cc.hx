package cc;

import cc.Event;
import cc.Sprite;
import cc.Mask;
import cc.Layout;
import cc.Label;
import cc.Collider;
import cc.Texture2D;
import cc.VideoPlayer;
import cc.AudioEngine;
import js.html.HtmlElement;
import js.html.ImageElement;
import js.html.CanvasElement;
import js.html.Element;
import js.html.DivElement;
import js.html.XMLHttpRequest;
import js.Error;
import js.html.Position;
import js.html.Uint8Array;

@:native("cc.Action") extern class Action {
	public function clone():Action;
	public function isDone():Bool;
	public function getTarget():Node;
	public function setTarget(target:Node):Void;
	public function getOriginalTarget():Node;
	public function getTag():Float;
	public function setTag(tag:Float):Void;
	static public var TAG_INVALID : Float;
}
@:native("cc.FiniteTimeAction") extern class FiniteTimeAction extends Action {
	public function getDuration():Float;
	public function setDuration(duration:Float):Void;
	public function reverse():Void;
}
@:native("cc.ActionInstant") extern class ActionInstant extends FiniteTimeAction {

}
@:native("cc.ActionInterval") extern class ActionInterval extends FiniteTimeAction {
	public function easing(easeObj:Dynamic):ActionInterval;
	public function repeat(times:Float):ActionInterval;
	public function repeatForever():ActionInterval;
}
@:native("cc.ActionManager") extern class ActionManager {
	public function addAction(action:Action, target:Node, paused:Bool):Void;
	public function removeAllActions():Void;
	public function removeAllActionsFromTarget(target:Node, forceDelete:Bool):Void;
	public function removeAction(action:Action):Void;
	public function removeActionByTag(tag:Float, target:Node):Void;
	public function getActionByTag(tag:Float, target:Node):Action;
	public function getNumberOfRunningActionsInTarget(target:Node):Float;
	public function pauseTarget(target:Node):Void;
	public function resumeTarget(target:Node):Void;
	public function pauseAllRunningActions():Array<Dynamic>;
	public function resumeTargets(targetsToResume:Array<Dynamic>):Void;
	public function pauseTargets(targetsToPause:Array<Dynamic>):Void;
	public function purgeSharedManager():Void;
	public function update(dt:Float):Void;
}
@:native("cc.AnimationClip") extern class AnimationClip extends Asset {
	public var duration : Float;
	public var sample : Float;
	public var speed : Float;
	public var wrapMode : WrapMode;
	public var curveData : Dynamic;
	public var events : Array<{ public var frame : Float; public var func : String; public var params : Array<String>; }>;
	static public function createWithSpriteFrames(spriteFrames:Array<Dynamic>, sample:Float):AnimationClip;
}
@:native("cc.AnimationState") extern class AnimationState extends Playable {
	public function new(clip:AnimationClip, ?name:String):Void;
	public var animator : Dynamic;//AnimationAnimator
	public var curves : Array<Dynamic>;
	public var delay : Float;
	public var repeatCount : Float;
	public var duration : Float;
	public var speed : Float;
	public var wrapMode : WrapMode;
	public var time : Float;
	public var clip : AnimationClip;
	public var name : String;
}
@:native("cc.Playable") extern class Playable {
	public var isPlaying : Bool;
	public var isPaused : Bool;
	public function play():Void;
	public function stop():Void;
	public function pause():Void;
	public function resume():Void;
	public function step():Void;
}
@:enum abstract WrapMode(Int) {
	var Default = 0;
	var Normal = 0;
	var Reverse = 0;
	var Loop = 0;
	var LoopReverse = 0;
	var PingPong = 0;
	var PingPongReverse = 0;
}
@:native("cc.AudioEngine") extern class AudioEngine {
	static public function play(clip:AudioClip, loop:Bool, volume:Float):Float;
	static public function setLoop(audioID:Float, loop:Bool):Void;
	static public function isLoop(audioID:Float):Bool;
	static public function setVolume(audioID:Float, volume:Float):Void;
	static public function getVolume(audioID:Float):Float;
	static public function setCurrentTime(audioID:Float, sec:Float):Bool;
	static public function getCurrentTime(audioID:Float):Float;
	static public function getDuration(audioID:Float):Float;
	static public function getState(audioID:Float):AudioState;
	static public function setFinishCallback(audioID:Float, callback:haxe.Constraints.Function):Void;
	static public function pause(audioID:Float):Void;
	static public function pauseAll():Void;
	static public function resume(audioID:Float):Void;
	static public function resumeAll():Void;
	static public function stop(audioID:Float):Void;
	static public function stopAll():Void;
	static public function setMaxAudioInstance(num:Float):Void;
	static public function getMaxAudioInstance():Float;
	static public function uncache(clip:AudioClip):Void;
	static public function uncacheAll():Void;
	static public function preload(filePath:String, ?callback:haxe.Constraints.Function):Void;
	static public function setMaxWebAudioSize(kb:Float):Void;
	static public function playMusic(clip:AudioClip, loop:Bool):Float;
	static public function stopMusic():Void;
	static public function pauseMusic():Void;
	static public function resumeMusic():Void;
	static public function getMusicVolume():Float;
	static public function setMusicVolume(volume:Float):Void;
	static public function isMusicPlaying():Bool;
	static public function playEffect(clip:AudioClip, loop:Bool):Float;
	static public function setEffectsVolume(volume:Float):Void;
	static public function getEffectsVolume():Float;
	static public function pauseEffect(audioID:Float):Void;
	static public function pauseAllEffects():Void;
	static public function resumeEffect(audioID:Float):Void;
	static public function resumeAllEffects():Void;
	static public function stopEffect(audioID:Float):Void;
	static public function stopAllEffects():Void;
}
@:native("cc.Director") extern class Director extends EventTarget {
	public function convertToGL(uiPoint:Vec2):Vec2;
	public function convertToUI(glPoint:Vec2):Vec2;
	public function end():Void;
	public function getWinSize():Size;
	public function getWinSizeInPixels():Size;
	public function pause():Void;
	public function runSceneImmediate(scene:Scene, ?onBeforeLoadScene:haxe.Constraints.Function, ?onLaunched:haxe.Constraints.Function):Void;
	public function loadScene(sceneName:String, ?onLaunched:haxe.Constraints.Function):Bool;
	public function preloadScene(sceneName:String, ?onProgress:Float -> Float -> Dynamic -> Void, ?onLoaded:Error -> Void):Void;
	public function resume():Void;
	public function setDepthTest(on:Bool):Void;
	public function setClearColor(clearColor:Color):Void;
	public function getScene():Scene;
	public function getAnimationInterval():Float;
	public function setAnimationInterval(value:Float):Void;
	public function getDeltaTime():Float;
	public function getTotalFrames():Float;
	public function isPaused():Bool;
	public function getScheduler():Scheduler;
	public function setScheduler(scheduler:Scheduler):Void;
	public function getActionManager():ActionManager;
	public function setActionManager(actionManager:ActionManager):Void;
	public function getCollisionManager():CollisionManager;
	public function getPhysicsManager():PhysicsManager;
	static public var EVENT_PROJECTION_CHANGED : String;
	static public var EVENT_BEFORE_SCENE_LOADING : String;
	static public var EVENT_BEFORE_SCENE_LAUNCH : String;
	static public var EVENT_AFTER_SCENE_LAUNCH : String;
	static public var EVENT_BEFORE_UPDATE : String;
	static public var EVENT_AFTER_UPDATE : String;
	static public var EVENT_BEFORE_VISIT : String;
	static public var EVENT_AFTER_VISIT : String;
	static public var EVENT_BEFORE_DRAW : String;
	static public var EVENT_AFTER_DRAW : String;
	static public var PROJECTION_2D : Float;
	static public var PROJECTION_3D : Float;
	static public var PROJECTION_CUSTOM : Float;
	static public var PROJECTION_DEFAULT : Float;
}
@:native("cc.Game") extern class Game extends EventTarget {
	static public var EVENT_HIDE : String;
	static public var EVENT_SHOW : String;
	static public var EVENT_GAME_INITED : String;
	static public var EVENT_ENGINE_INITED : String;
	static public var RENDER_TYPE_CANVAS : Float;
	static public var RENDER_TYPE_WEBGL : Float;
	static public var RENDER_TYPE_OPENGL : Float;
	static public var frame : Dynamic;
	static public var container : DivElement;
	static public var canvas : CanvasElement;
	static public var renderType : Float;
	static public var config : Dynamic;
	static public function onStart():Void;
	static public function setFrameRate(frameRate:Float):Void;
	static public function getFrameRate():Float;
	static public function step():Void;
	static public function pause():Void;
	static public function resume():Void;
	static public function isPaused():Bool;
	static public function restart():Void;
	static public function end():Void;
	static public function prepare(cb:haxe.Constraints.Function):Void;
	static public function run(config:Dynamic, onStart:haxe.Constraints.Function):Void;
	static public function addPersistRootNode(node:Node):Void;
	static public function removePersistRootNode(node:Node):Void;
	static public function isPersistRootNode(node:Node):Bool;
	static public var game : Game;
}
@:native("cc.Node") extern class Node extends _BaseNode {
	public var groupIndex : Float;
	public var group : String;
	public var position : Vec2;
	public var x : Float;
	public var y : Float;
	public var rotation : Float;
	public var rotationX : Float;
	public var rotationY : Float;
	public var scale : Float;
	public var scaleX : Float;
	public var scaleY : Float;
	public var skewX : Float;
	public var skewY : Float;
	public var opacity : Float;
	public var color : Color;
	public var anchorX : Float;
	public var anchorY : Float;
	public var width : Float;
	public var height : Float;
	public var zIndex : Float;
	public function new(?name:String):Void;
	public function pauseSystemEvents(recursive:Bool):Void;
	public function resumeSystemEvents(recursive:Bool):Void;
	public function runAction(action:Action):Action;
	public function pauseAllActions():Void;
	public function resumeAllActions():Void;
	public function stopAllActions():Void;
	public function stopAction(action:Action):Void;
	public function stopActionByTag(tag:Float):Void;
	public function getActionByTag(tag:Float):Action;
	public function getNumberOfRunningActions():Float;
	public function getPosition():Vec2;
	public function setPosition(newPosOrX:haxe.extern.EitherType<Vec2, Float>, ?y:Float):Void;
	public function getScale():Float;
	public function setScale(scaleX:haxe.extern.EitherType<Float, Vec2>, ?scaleY:Float):Void;
	public function setRotation(rotation:Float):Void;
	public function getRotation(rotation:Float):Void;
	public function getContentSize():Size;
	public function setContentSize(size:haxe.extern.EitherType<Size, Float>, ?height:Float):Void;
	public function getAnchorPoint():Vec2;
	public function setAnchorPoint(point:haxe.extern.EitherType<Vec2, Float>, ?y:Float):Void;
	public function lookAt(pos:Vec3, ?up:Vec3):Void;
	@:overload(function(out:vmath.Mat4):vmath.Mat4 { })
	public function getLocalMatrix(out:vmath.Mat4):vmath.Mat4;
	public function convertToNodeSpace(worldPoint:Vec2):Vec2;
	public function convertToWorldSpace(nodePoint:Vec2):Vec2;
	public function convertToNodeSpaceAR(worldPoint:Vec2):Vec2;
	public function convertToWorldSpaceAR(nodePoint:Vec2):Vec2;
	public function getNodeToParentTransform(out:AffineTransform):AffineTransform;
	public function getNodeToParentTransformAR(out:AffineTransform):AffineTransform;
	public function getNodeToWorldTransform(out:AffineTransform):AffineTransform;
	public function getNodeToWorldTransformAR(out:AffineTransform):AffineTransform;
	public function getParentToNodeTransform(out:AffineTransform):AffineTransform;
	public function getWorldToNodeTransform(out:AffineTransform):AffineTransform;
	public function convertTouchToNodeSpace(touch:Touch):Vec2;
	public function convertTouchToNodeSpaceAR(touch:Touch):Vec2;
	public function getBoundingBox():Rect;
	public function getBoundingBoxToWorld():Rect;
	public function addChild(child:Node, ?zIndex:Float, ?name:String):Void;
	public function cleanup():Void;
	public function sortAllChildren():Void;
	public function getDisplayedOpacity():Float;
	public function getDisplayedColor():Color;
	public var cascadeOpacity : Bool;
	public function isCascadeOpacityEnabled():Bool;
	public function setCascadeOpacityEnabled(cascadeOpacityEnabled:Bool):Void;
	public function setOpacityModifyRGB(opacityValue:Bool):Void;
	public function isOpacityModifyRGB():Bool;
}
@:native("cc.PrivateNode") extern class PrivateNode extends Node {
	public function new(?name:String):Void;
}
@:native("cc.Scene") extern class Scene extends Node {
	public var autoReleaseAssets : Bool;
}
@:native("cc.Scheduler") extern class Scheduler {
	public function enableForTarget(target:Dynamic):Void;
	public function setTimeScale(timeScale:Float):Void;
	public function getTimeScale():Float;
	public function update(dt:Float):Void;
	@:overload(function(callback:haxe.Constraints.Function, target:Dynamic, interval:Float, ?paused:Bool):Void { })
	public function schedule(callback:haxe.Constraints.Function, target:Dynamic, interval:Float, repeat:Float, delay:Float, ?paused:Bool):Void;
	public function scheduleUpdate(target:Dynamic, priority:Float, paused:Bool):Void;
	public function unschedule(callback:haxe.Constraints.Function, target:Dynamic):Void;
	public function unscheduleUpdate(target:Dynamic):Void;
	public function unscheduleAllForTarget(target:Dynamic):Void;
	public function unscheduleAll():Void;
	public function unscheduleAllWithMinPriority(minPriority:Float):Void;
	public function isScheduled(callback:haxe.Constraints.Function, target:Dynamic):Bool;
	public function pauseAllTargets():Void;
	public function pauseAllTargetsWithMinPriority(minPriority:Float):Void;
	public function resumeTargets(targetsToResume:Array<Dynamic>):Void;
	public function pauseTarget(target:Dynamic):Void;
	public function resumeTarget(target:Dynamic):Void;
	public function isTargetPaused(target:Dynamic):Bool;
	static public var PRIORITY_SYSTEM : Float;
	static public var PRIORITY_NON_SYSTEM : Float;
}
@:native("cc.ParticleAsset") extern class ParticleAsset extends Asset {

}
@:native("cc.ParticleSystem") extern class ParticleSystem extends Component {
	public var preview : Bool;
	public var custom : Bool;
	public var file : String;
	public var spriteFrame : SpriteFrame;
	public var texture : String;
	public var particleCount : Float;
	public var autoRemoveOnFinish : Bool;
	public var playOnLoad : Bool;
	public var active : Bool;
	public var totalParticles : Float;
	public var duration : Float;
	public var emissionRate : Float;
	public var life : Float;
	public var lifeVar : Float;
	public var startColor : Dynamic;
	public var startColorVar : Dynamic;
	public var endColor : Dynamic;
	public var endColorVar : Dynamic;
	public var angle : Float;
	public var angleVar : Float;
	public var startSize : Float;
	public var startSizeVar : Float;
	public var endSize : Float;
	public var endSizeVar : Float;
	public var startSpin : Float;
	public var startSpinVar : Float;
	public var endSpin : Float;
	public var endSpinVar : Float;
	public var sourcePos : Vec2;
	public var posVar : Vec2;
	public var positionType : ParticleSystem.PositionType;
	public var emitterMode : ParticleSystem.EmitterMode;
	public var gravity : Vec2;
	public var speed : Float;
	public var speedVar : Float;
	public var tangentialAccel : Float;
	public var tangentialAccelVar : Float;
	public var radialAccel : Float;
	public var radialAccelVar : Float;
	public var rotationIsDir : Bool;
	public var startRadius : Float;
	public var startRadiusVar : Float;
	public var endRadius : Float;
	public var endRadiusVar : Float;
	public var rotatePerS : Float;
	public var rotatePerSVar : Float;
	static public var DURATION_INFINITY : Float;
	static public var START_SIZE_EQUAL_TO_END_SIZE : Float;
	static public var START_RADIUS_EQUAL_TO_END_RADIUS : Float;
	public function stopSystem():Void;
	public function resetSystem():Void;
	public function isFull():Bool;
	public function setTextureWithRect(texture:Texture2D, rect:Rect):Void;
}
@:native("cc.TiledLayer") extern class TiledLayer extends Component {
	public function getLayerName():String;
	public function SetLayerName(layerName:String):Void;
	public function getProperty(propertyName:String):Dynamic;
	public function getPositionAt(pos:haxe.extern.EitherType<Vec2, Float>, ?y:Float):Vec2;
	public function setTileGIDAt(gid:Float, posOrX:haxe.extern.EitherType<Vec2, Float>, flagsOrY:Float, ?flags:Float):Void;
	public function getTileGIDAt(pos:haxe.extern.EitherType<Vec2, Float>, ?y:Float):Float;
	public function getTiledTileAt(x:Float, y:Float, forceCreate:Bool):cc.TiledTile;
	public function setTiledTileAt(x:Float, y:Float, tiledTile:cc.TiledTile):cc.TiledTile;
	public function getTexture():Texture2D;
	public function setTexture(texture:Texture2D):Void;
	public function getLayerSize():Size;
	public function getMapTileSize():Size;
	public function getTileSet():Dynamic;//return TMXTilesetInfo
	public function setTileSet(tileset:Dynamic):Void;//get TMXTilesetInfo
	public function getLayerOrientation():Float;
	public function getProperties():Array<Dynamic>;
}
@:native("cc.TiledMap") extern class TiledMap extends Component {
	public var tmxAsset : TiledMapAsset;
	public function getMapSize():Size;
	public function getTileSize():Size;
	public function getMapOrientation():Float;
	public function getObjectGroups():Array<TiledObjectGroup>;
	public function getObjectGroup(groupName:String):TiledObjectGroup;
	public function getProperties():Array<Dynamic>;
	public function allLayers():Array<TiledLayer>;
	public function getLayer(layerName:String):TiledLayer;
	public function getProperty(propertyName:String):String;
	public function getPropertiesForGID(GID:Float):Dynamic;
}
@:native("cc.TiledMapAsset") extern class TiledMapAsset extends Asset {
	public var textures : Array<Texture2D>;
	public var textureNames : Array<String>;
}
@:native("cc.TiledObjectGroup") extern class TiledObjectGroup extends Component {
	public function getPositionOffset():Vec2;
	public function getProperties():Dynamic;
	public function getGroupName():String;
	public function getObject(objectName:String):Dynamic;
	public function getObjects():Array<Dynamic>;
}
@:native("cc.TiledTile") extern class TiledTile extends Component {
	public var x : Float;
	public var y : Float;
	public var gid : Float;
	public var layer : TiledLayer;
}
@:native("cc.VideoPlayer") extern class VideoPlayer extends Component {
	public var resourceType : ResourceType;
	public var remoteURL : String;
	public var clip : String;
	public var currentTime : Float;
	public var volume : Float;
	public var mute : Bool;
	public var keepAspectRatio : Bool;
	public var isFullscreen : Bool;
	public var videoPlayerEvent : Array<Component.EventHandler>;
	public function play():Void;
	public function resume():Void;
	public function pause():Void;
	public function stop():Void;
	public function getDuration():Float;
	public function isPlaying():Bool;
	public function destroy():Bool;
}
@:native("cc.WebView") extern class WebView extends Component {
	public var url : String;
	public var webviewLoadedEvents : Array<Component.EventHandler>;
	public function setJavascriptInterfaceScheme(scheme:String):Void;
	public function setOnJSCallback(callback:haxe.Constraints.Function):Void;
	public function evaluateJS(str:String):Void;
	public function destroy():Bool;
}
@:native("cc.NodePool") extern class NodePool {
	public function new(?poolHandlerComp:haxe.extern.EitherType<{ public var prototype : Component; }, String>):Void;
	public var poolHandlerComp : haxe.extern.EitherType<haxe.Constraints.Function, String>;
	public function size():Float;
	public function clear():Void;
	public function put(obj:Node):Void;
	public function get(params:haxe.extern.Rest<Dynamic>):Node;
}
@:native("cc.Asset") extern class Asset extends RawAsset {
	public var loaded : Bool;
	public var nativeUrl : String;
	static public var preventDeferredLoadDependents : Bool;
	static public var preventPreloadNativeObject : Bool;
	public function toString():String;
	public function createNode(callback:String -> Dynamic -> Void):Void;
}
@:native("cc.AudioClip") extern class AudioClip extends Asset implements IEventTarget {
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.BitmapFont") extern class BitmapFont extends Font {

}
@:native("cc.Font") extern class Font extends Asset {

}
@:native("cc.JsonAsset") extern class JsonAsset extends Asset {
	public var json : Dynamic;
}
@:native("cc.LabelAtlas") extern class LabelAtlas extends BitmapFont {

}
@:native("cc.Prefab") extern class Prefab extends Asset {
	public var data : Node;
	public var optimizationPolicy : Prefab.OptimizationPolicy;
	public var asyncLoadAssets : Bool;
	public function compileCreateFunction():Void;
}
@:native("cc.RawAsset") extern class RawAsset {

}
@:native("cc.RenderTexture") extern class RenderTexture extends Texture2D {
	public function initWithSize(?width:Float, ?height:Float):Void;
	public function readPixels(?data:Uint8Array, ?x:Float, ?y:Float, ?w:Float, ?h:Float):Uint8Array;
}
@:native("cc.SceneAsset") extern class SceneAsset extends Asset {
	public var scene : Scene;
	public var asyncLoadAssets : Bool;
}
@:native("cc._Script") extern class _Script extends Asset {

}
@:native("cc._JavaScript") extern class _JavaScript extends Asset {

}
@:native("cc.CoffeeScript") extern class CoffeeScript extends Asset {

}
@:native("cc.TypeScript") extern class TypeScript extends Asset {

}
@:native("cc.SpriteAtlas") extern class SpriteAtlas extends Asset {
	public function getTexture():Texture2D;
	public function getSpriteFrame(key:String):SpriteFrame;
	public function getSpriteFrames():Array<Dynamic>;
}
@:native("cc.SpriteFrame") extern class SpriteFrame extends Asset implements IEventTarget {
	public function new(?filename:haxe.extern.EitherType<String, Texture2D>, ?rect:Rect, ?rotated:Bool, ?offset:Vec2, ?originalSize:Size):Void;
	public var insetTop : Float;
	public var insetBottom : Float;
	public var insetLeft : Float;
	public var insetRight : Float;
	public function textureLoaded():Bool;
	public function isRotated():Bool;
	public function setRotated(bRotated:Bool):Void;
	public function getRect():Rect;
	public function setRect(rect:Rect):Void;
	public function getOriginalSize():Size;
	public function setOriginalSize(size:Size):Void;
	public function getTexture():Texture2D;
	public function getOffset():Vec2;
	public function setOffset(offsets:Vec2):Void;
	public function clone():SpriteFrame;
	public function setTexture(textureOrTextureFile:haxe.extern.EitherType<String, Texture2D>, ?rect:Rect, ?rotated:Bool, ?offset:Vec2, ?originalSize:Size):Bool;
	public function ensureLoadTexture():Void;
	public function clearTexture():Void;
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.TTFFont") extern class TTFFont extends Font {

}
@:native("cc.TextAsset") extern class TextAsset extends Asset {
	public var text : String;
}
@:native("cc.Texture2D") extern class Texture2D extends Asset implements IEventTarget {
	public var url : String;
	public var width : Float;
	public var height : Float;
	public function getImpl():Void;
	public function update(options:{ public var image : ImageElement; public var mipmap : Bool; public var format : PixelFormat; public var minFilter : Filter; public var magFilter : Filter; public var wrapS : WrapMode; public var wrapT : WrapMode; public var premultiplyAlpha : Bool; }):Void;
	public function initWithElement(element:haxe.extern.EitherType<ImageElement, CanvasElement>):Void;
	public function initWithData(data:Array<Any>, pixelFormat:Float, pixelsWidth:Float, pixelsHeight:Float):Bool;
	public function getHtmlElementObj():ImageElement;
	public function destroy():Void;
	public function getPixelFormat():Float;
	public function hasPremultipliedAlpha():Bool;
	public function hasMipmap():Bool;
	public function handleLoadedTexture(?premultiplied:Bool):Void;
	public function description():String;
	public function releaseTexture():Void;
	public function setTexParameters(wrapS:WrapMode, wrapT:WrapMode):Void;
	public function setFilters(minFilter:Texture2D.Filter, magFilter:Texture2D.Filter):Void;
	public function setFlipY(flipY:Bool):Void;
	public function setPremultiplyAlpha(premultiply:Bool):Void;
	public function setMipmap(mipmap:Bool):Void;
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.BoxCollider") extern class BoxCollider extends Collider implements IBox {
	public var offset : Vec2;
	public var size : Size;
}
@:native("cc.CircleCollider") extern class CircleCollider extends Collider implements ICircle {
	public var offset : Vec2;
	public var radius : Float;
}
@:native("cc.Collider") extern class Collider extends Component {
	public var tag : Float;
}
@:native("cc.CollisionManager") extern class CollisionManager implements IEventTarget {
	public var enabled : Bool;
	public var enabledDrawBoundingBox : Bool;
	public var enabledDebugDraw : Bool;
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.Intersection") extern class Intersection {
	static public function lineLine(a1:Vec2, a2:Vec2, b1:Vec2, b2:Vec2):Bool;
	static public function lineRect(a1:Vec2, a2:Vec2, b:Rect):Bool;
	static public function linePolygon(a1:Vec2, a2:Vec2, b:Array<Vec2>):Bool;
	static public function rectRect(a:Rect, b:Rect):Bool;
	static public function rectPolygon(a:Rect, b:Array<Vec2>):Bool;
	static public function polygonPolygon(a:Array<Vec2>, b:Array<Vec2>):Bool;
	static public function circleCircle(a:{ public var position : Vec2; public var radius : Float; }, b:{ public var position : Vec2; public var radius : Float; }):Bool;
	static public function polygonCircle(polygon:Array<Vec2>, circle:{ public var position : Vec2; public var radius : Float; }):Bool;
	static public function pointInPolygon(point:Vec2, polygon:Array<Vec2>):Bool;
	static public function pointLineDistance(point:Vec2, start:Vec2, end:Vec2, isSegment:Bool):Bool;
}
@:native("cc.PolygonCollider") extern class PolygonCollider extends Collider implements IPolygon {
	public var offset : Vec2;
	public var points : Array<Vec2>;
}
@:native("cc.Camera") extern class Camera extends Component {
	public var zoomRatio : Float;
	public var cullingMask : Float;
	public var clearFlags : Camera.ClearFlags;
	public var backgroundColor : Color;
	public var depth : Float;
	public var targetTexture : RenderTexture;
	static public var main : Camera;
	static public var cameras : Array<Dynamic>;
	static public function findCamera(node:Node):Camera;
	public function getNodeToCameraTransform(node:Node):AffineTransform;
	public function getCameraToWorldPoint(point:Vec2, out:Vec2):Vec2;
	public function containsNode(node:Node):Bool;
	public function render(root:Node):Void;
}
@:native("cc.Animation") extern class Animation extends Component implements IEventTarget {
	public var defaultClip : AnimationClip;
	public var currentClip : AnimationClip;
	public var playOnLoad : Bool;
	public function getClips():Array<AnimationClip>;
	public function play(?name:String, ?startTime:Float):AnimationState;
	public function playAdditive(?name:String, ?startTime:Float):AnimationState;
	public function stop(?name:String):Void;
	public function pause(?name:String):Void;
	public function resume(?name:String):Void;
	public function setCurrentTime(?time:Float, ?name:String):Void;
	public function getAnimationState(name:String):AnimationState;
	public function addClip(clip:AnimationClip, ?newName:String):AnimationState;
	public function removeClip(clip:AnimationClip, ?force:Bool):Void;
	public function sample(name:String):Void;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic, ?useCapture:Bool):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function hasEventListener(type:String):Bool;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.AudioSource") extern class AudioSource extends Component {
	public var isPlaying : Bool;
	public var clip : AudioClip;
	public var volume : Float;
	public var mute : Bool;
	public var loop : Bool;
	public var playOnLoad : Bool;
	public function play():Void;
	public function stop():Void;
	public function pause():Void;
	public function resume():Void;
	public function rewind():Void;
	public function getCurrentTime():Void;
	public function setCurrentTime(time:Float):Void;
	public function getDuration():Void;
}
@:native("cc.BlockInputEvents") extern class BlockInputEvents extends Component {

}
@:native("cc.Button") extern class Button extends Component {
	public var interactable : Bool;
	public var enableAutoGrayEffect : Bool;
	public var transition : Button.Transition;
	public var normalColor : Color;
	public var pressedColor : Color;
	public var hoverColor : Color;
	public var disabledColor : Color;
	public var duration : Float;
	public var zoomScale : Float;
	public var normalSprite : SpriteFrame;
	public var pressedSprite : SpriteFrame;
	public var hoverSprite : SpriteFrame;
	public var disabledSprite : SpriteFrame;
	public var target : Node;
	public var clickEvents : Array<Component.EventHandler>;
}
@:native("cc.Canvas") extern class Canvas extends Component {
	static public var instance : Canvas;
	public var designResolution : Size;
	public var fitHeight : Bool;
	public var fitWidth : Bool;
}
@:native("cc.Component") extern class Component {
	public var node : Node;
	public var uuid : String;
	public var enabled : Bool;
	public var enabledInHierarchy : Bool;
	public var _isOnLoadCalled : Float;
	@:overload(function(className:String):Dynamic { })
	public function addComponent<T:(Component)>(type:Class<T>):T;
	@:overload(function(className:String):Dynamic { })
	public function getComponent<T:(Component)>(type:{ public var prototype : T; }):T;
	@:overload(function(className:String):Array<Dynamic> { })
	public function getComponents<T:(Component)>(type:{ public var prototype : T; }):Array<T>;
	@:overload(function(className:String):Dynamic { })
	public function getComponentInChildren<T:(Component)>(type:{ public var prototype : T; }):T;
	@:overload(function(className:String):Array<Dynamic> { })
	public function getComponentsInChildren<T:(Component)>(type:{ public var prototype : T; }):Array<T>;
	public function _getLocalBounds(out_rect:Rect):Void;
	public function onRestore():Void;
	public function schedule(callback:haxe.Constraints.Function, ?interval:Float, ?repeat:Float, ?delay:Float):Void;
	public function scheduleOnce(callback:haxe.Constraints.Function, ?delay:Float):Void;
	public function unschedule(callback_fn:haxe.Constraints.Function):Void;
	public function unscheduleAllCallbacks():Void;
}
@:native("cc.Label") extern class Label extends Component {
	public var string : String;
	public var horizontalAlign : HorizontalAlign;
	public var verticalAlign : VerticalAlign;
	public var actualFontSize : Float;
	public var fontSize : Float;
	public var fontFamily : String;
	public var lineHeight : Float;
	public var overflow : Label.Overflow;
	public var enableWrapText : Bool;
	public var font : Font;
	public var isSystemFontUsed : Bool;
}
@:native("cc.LabelOutline") extern class LabelOutline extends Component {
	public var color : Color;
	public var width : Float;
}
@:native("cc.Layout") extern class Layout extends Component {
	public var type : LayoutType;
	public var resizeMode : Layout.ResizeMode;
	public var cellSize : Size;
	public var startAxis : Layout.AxisDirection;
	public var paddingLeft : Float;
	public var paddingRight : Float;
	public var paddingTop : Float;
	public var paddingBottom : Float;
	public var spacingX : Float;
	public var spacingY : Float;
	public var verticalDirection : Layout.VerticalDirection;
	public var horizontalDirection : Layout.HorizontalDirection;
	public function updateLayout():Void;
	public var padding : Float;
}
@:native("cc.Mask") extern class Mask extends Component {
	public var type : MaskType;
	public var spriteFrame : SpriteFrame;
	public var alphaThreshold : Float;
	public var inverted : Bool;
	public var segements : Float;
}
@:native("cc.MotionStreak") extern class MotionStreak extends Component {
	public var preview : Bool;
	public var fadeTime : Float;
	public var minSeg : Float;
	public var stroke : Float;
	public var texture : Texture2D;
	public var color : Color;
	public var fastMode : Bool;
	public function reset():Void;
}
@:native("cc.PageView") extern class PageView extends ScrollView {
	public var sizeMode :  SpriteSizeMode;
	public var direction : Direction;
	public var scrollThreshold : Float;
	public var autoPageTurningThreshold : Float;
	public var pageTurningEventTiming : Float;
	public var indicator : PageViewIndicator;
	public var pageTurningSpeed : Float;
	public var pageEvents : Array<Component.EventHandler>;
	public function getCurrentPageIndex():Float;
	public function setCurrentPageIndex(index:Float):Void;
	public function getPages():Array<Node>;
	public function addPage(page:Node):Void;
	public function insertPage(page:Node, index:Float):Void;
	public function removePage(page:Node):Void;
	public function removePageAtIndex(index:Float):Void;
	public function removeAllPages():Void;
	public function scrollToPage(idx:Float, timeInSecond:Float):Void;
}
@:native("cc.PageViewIndicator") extern class PageViewIndicator extends Component {
	public var spriteFrame : SpriteFrame;
	public var direction : Direction;
	public var cellSize : Size;
	public var spacing : Float;
	public function setPageView(target:PageView):Void;
}
@:native("cc.ProgressBar") extern class ProgressBar extends Component {
	public var barSprite : Sprite;
	public var mode : ProgressBar.Mode;
	public var totalLength : Float;
	public var progress : Float;
	public var reverse : Bool;
}
@:native("cc.RenderComponent") extern class RenderComponent extends Component {
	public var srcBlendFactor : BlendFactor;
	public var dstBlendFactor : BlendFactor;
}
@:native("cc.RichText") extern class RichText extends Component {
	public var string : String;
	public var horizontalAlign : TextAlignment;
	public var fontSize : Float;
	public var font : cc.TTFFont;
	public var maxWidth : Float;
	public var lineHeight : Float;
	public var imageAtlas : SpriteAtlas;
	public var handleTouchEvent : Bool;
}
@:native("cc.Scrollbar") extern class Scrollbar extends Component {
	public var handle : Sprite;
	public var direction : Direction;
	public var enableAutoHide : Bool;
	public var autoHideTime : Float;
}
@:native("cc.ScrollView") extern class ScrollView extends Component {
	public var content : Node;
	public var horizontal : Bool;
	public var vertical : Bool;
	public var inertia : Bool;
	public var brake : Float;
	public var elastic : Bool;
	public var bounceDuration : Float;
	public var horizontalScrollBar : Scrollbar;
	public var verticalScrollBar : Scrollbar;
	public var scrollEvents : Array<Component.EventHandler>;
	public var cancelInnerEvents : Bool;
	public function scrollToBottom(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToTop(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToLeft(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToRight(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToTopLeft(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToTopRight(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToBottomLeft(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToBottomRight(?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToOffset(offset:Vec2, ?timeInSecond:Float, ?attenuated:Bool):Void;
	public function getScrollOffset():Vec2;
	public function getMaxScrollOffset():Vec2;
	public function scrollToPercentHorizontal(percent:Float, ?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollTo(anchor:Vec2, ?timeInSecond:Float, ?attenuated:Bool):Void;
	public function scrollToPercentVertical(percent:Float, ?timeInSecond:Float, ?attenuated:Bool):Void;
	public function stopAutoScroll():Void;
	public function setContentPosition(position:Vec2):Void;
	public function getContentPosition():Position;
	public function isScrolling():Bool;
	public function isAutoScrolling():Bool;
}
@:native("cc.Slider") extern class Slider extends Component {
	public var handle : Button;
	public var direction : Direction;
	public var progress : Float;
	public var slideEvents : Array<Component.EventHandler>;
}
@:fakeEnum(String) extern enum SpriteState {
    NORMAL;
    GRAY;
}
@:native("cc.Sprite") extern class Sprite extends Component {
	public var spriteFrame : SpriteFrame;
	public var type : Sprite.Type;
	public var fillType : Sprite.FillType;
	public var fillCenter : Vec2;
	public var fillStart : Float;
	public var fillRange : Float;
	public var trim : Bool;
	public var sizeMode : SpriteSizeMode;
	public function setState(state:SpriteState):Void;
	public function getState():SpriteState;
}
@:native("cc.Toggle") extern class Toggle extends Button {
	public var isChecked : Bool;
	public var toggleGroup : ToggleGroup;
	public var checkMark : Sprite;
	public var checkEvents : Array<Component.EventHandler>;
	public function check():Void;
	public function uncheck():Void;
}
@:native("cc.ToggleContainer") extern class ToggleContainer extends Component {
	public var allowSwitchOff : Bool;
	public var toggleItems : Array<Toggle>;
}
@:native("cc.ToggleGroup") extern class ToggleGroup extends Component {
	public var allowSwitchOff : Bool;
	public var toggleItems : Array<Dynamic>;
}
@:native("cc.ViewGroup") extern class ViewGroup extends Component {

}
@:native("cc.Widget") extern class Widget extends Component {
	public var target : Node;
	public var isAlignTop : Bool;
	public var isAlignVerticalCenter : Bool;
	public var isAlignBottom : Bool;
	public var isAlignLeft : Bool;
	public var isAlignHorizontalCenter : Bool;
	public var isAlignRight : Bool;
	public var isStretchWidth : Bool;
	public var isStretchHeight : Bool;
	public var top : Float;
	public var bottom : Float;
	public var left : Float;
	public var right : Float;
	public var horizontalCenter : Float;
	public var verticalCenter : Float;
	public var isAbsoluteHorizontalCenter : Bool;
	public var isAbsoluteVerticalCenter : Bool;
	public var isAbsoluteTop : Bool;
	public var isAbsoluteBottom : Bool;
	public var isAbsoluteLeft : Bool;
	public var isAbsoluteRight : Bool;
	public var alignMode : Widget.AlignMode;
	public function updateAlignment():Void;
	public var isAlignOnce : Bool;
}
@:native("cc.EventTarget") extern class EventTarget {
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
interface IEventTarget {
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.Event") extern class Event {
	public function new(type:String, bubbles:Bool):Void;
	public var type : String;
	public var bubbles : Bool;
	public var target : Dynamic;
	public var currentTarget : Dynamic;
	public var eventPhase : Float;
	public function unuse():String;
	public function reuse():String;
	public function stopPropagation():Void;
	public function stopPropagationImmediate():Void;
	public function isStopped():Bool;
	public function getCurrentTarget():Node;
	public function getType():String;
	static public var NO_TYPE : String;
	static public var TOUCH : String;
	static public var MOUSE : String;
	static public var KEYBOARD : String;
	static public var ACCELERATION : String;
	static public var NONE : Float;
	static public var CAPTURING_PHASE : Float;
	static public var AT_TARGET : Float;
	static public var BUBBLING_PHASE : Float;
}
@:native("cc.SystemEvent") extern class SystemEvent extends EventTarget {
	public function setAccelerometerEnabled(isEnable:Bool):Void;
	public function setAccelerometerInterval(interval:Float):Void;
}
@:native("cc.Touch") extern class Touch {
	public function getLocation():Vec2;
	public function getLocationX():Float;
	public function getLocationY():Float;
	public function getPreviousLocation():Vec2;
	public function getStartLocation():Vec2;
	public function getDelta():Vec2;
	public function getLocationInView():Vec2;
	public function getPreviousLocationInView():Vec2;
	public function getStartLocationInView():Vec2;
	public function getID():Float;
	public function setTouchInfo(id:Float, x:Float, y:Float):Void;
}
@:native("cc.Graphics") extern class Graphics extends Component {
	public var lineWidth : Float;
	public var lineJoin : Graphics.LineJoin;
	public var lineCap : Graphics.LineCap;
	public var strokeColor : Color;
	public var fillColor : Color;
	public var miterLimit : Float;
	public function moveTo(?x:Float, ?y:Float):Void;
	public function lineTo(?x:Float, ?y:Float):Void;
	public function bezierCurveTo(?c1x:Float, ?c1y:Float, ?c2x:Float, ?c2y:Float, ?x:Float, ?y:Float):Void;
	public function quadraticCurveTo(?cx:Float, ?cy:Float, ?x:Float, ?y:Float):Void;
	public function arc(?cx:Float, ?cy:Float, ?r:Float, ?startAngle:Float, ?endAngle:Float, ?counterclockwise:Bool):Void;
	public function ellipse(?cx:Float, ?cy:Float, ?rx:Float, ?ry:Float):Void;
	public function circle(?cx:Float, ?cy:Float, ?r:Float):Void;
	public function rect(?x:Float, ?y:Float, ?w:Float, ?h:Float):Void;
	public function roundRect(?x:Float, ?y:Float, ?w:Float, ?h:Float, ?r:Float):Void;
	public function fillRect(?x:Float, ?y:Float, ?w:Float, ?h:Float):Void;
	public function clear(?clean:Bool):Void;
	public function close():Void;
	public function stroke():Void;
	public function fill():Void;
}
@:native("cc.loader") extern class Loader extends Pipeline {
	static public var assetLoader : Dynamic;
	static public var downloader : Dynamic;
	static public var loader : Dynamic;
	static public function getXMLHttpRequest():XMLHttpRequest;
	static public function addDownloadHandlers(extMap:Dynamic):Void;
	static public function addLoadHandlers(extMap:Dynamic):Void;
	@:overload(function(resources:haxe.extern.EitherType<String, haxe.extern.EitherType<Array<String>, { @:optional
		public var uuid : String; @:optional
		public var url : String; @:optional
		public var type : String; }>>, progressCallback:Float -> Float -> Dynamic -> Void, completeCallback:haxe.Constraints.Function):Void { })
	static public function load(resources:haxe.extern.EitherType<String, haxe.extern.EitherType<Array<String>, { @:optional
		public var uuid : String; @:optional
		public var url : String; @:optional
		public var type : String; }>>, ?completeCallback:haxe.Constraints.Function):Void;
	@:overload(function<T>(url:String, type:Class<T>, completeCallback:Error -> T -> Void):Void { })
	@:overload(function(url:String, type:Class<Any>):Void { })
	@:overload(function<T>(url:String, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> T -> Void):Void { })
	@:overload(function(url:String, completeCallback:Error -> Any -> Void):Void { })
	@:overload(function(url:String):Void { })
	static public function loadRes<T>(url:String, type:Class<T>, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> T -> Void):Void;
	@:overload(function<T>(url:Array<String>, type:Class<T>, completeCallback:Error -> Array<T> -> Void):Void { })
	@:overload(function(url:Array<String>, type:Class<Any>):Void { })
	@:overload(function<T>(url:Array<String>, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> Array<T> -> Void):Void { })
	@:overload(function(url:Array<String>, completeCallback:Error -> Array<Any> -> Void):Void { })
	@:overload(function(url:Array<String>):Void { })
	static public function loadResArray<T>(url:Array<String>, type:Class<T>, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> Array<T> -> Void):Void;
	@:overload(function<T>(url:String, type:Class<T>, completeCallback:Error -> Array<T> -> Array<String> -> Void):Void { })
	@:overload(function(url:String, type:Any):Void { })
	@:overload(function<T>(url:String, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> Array<T> -> Array<String> -> Void):Void { })
	@:overload(function(url:String, completeCallback:Error -> Array<Any> -> Array<String> -> Void):Void { })
	@:overload(function(url:String):Void { })
	static public function loadResDir<T>(url:String, type:Class<T>, progressCallback:Float -> Float -> T -> Void, completeCallback:Error -> Array<T> -> Array<String> -> Void):Void;
	static public function getRes(url:String, ?type:haxe.Constraints.Function):Dynamic;
	static public function getDependsRecursively(owner:haxe.extern.EitherType<Asset, haxe.extern.EitherType<RawAsset, String>>):Array<Dynamic>;
	static public function release(asset:haxe.extern.EitherType<Asset, haxe.extern.EitherType<RawAsset, haxe.extern.EitherType<String, Array<Dynamic>>>>):Void;
	static public function releaseAsset(asset:Asset):Void;
	static public function releaseRes(url:String, ?type:haxe.Constraints.Function):Void;
	static public function releaseResDir(url:String, ?type:haxe.Constraints.Function):Void;
	static public function releaseAll():Void;
	static public function setAutoRelease(assetOrUrlOrUuid:haxe.extern.EitherType<Asset, String>, autoRelease:Bool):Void;
	static public function setAutoReleaseRecursively(assetOrUrlOrUuid:haxe.extern.EitherType<Asset, String>, autoRelease:Bool):Void;
	static public function isAutoRelease(assetOrUrl:haxe.extern.EitherType<Asset, String>):Bool;
}
@:native("cc.LoadingItems") extern class LoadingItems extends CallbacksInvoker {
	public function onProgress(completedCount:Float, totalCount:Float, item:Dynamic):Void;
	public function onComplete(errors:Array<Dynamic>, items:LoadingItems):Void;
	public var map : Dynamic;
	public var completed : Dynamic;
	public var totalCount : Float;
	public var completedCount : Float;
	public var active : Bool;
	static public function create(pipeline:Pipeline, urlList:Array<Dynamic>, onProgress:haxe.Constraints.Function, onComplete:haxe.Constraints.Function):LoadingItems;
	static public function getQueue(item:Dynamic):LoadingItems;
	@:overload(function(id:String):Void { })
	static public function itemComplete(item:Dynamic):Void;
	public function append(urlList:Array<Dynamic>):Array<Dynamic>;
	public function allComplete():Void;
	public function isCompleted():Bool;
	public function isItemCompleted(id:String):Bool;
	public function exists(id:String):Bool;
	public function getContent(id:String):Dynamic;
	public function getError(id:String):Dynamic;
	public function addListener(key:String, callback:haxe.Constraints.Function, target:Dynamic):Bool;
	public function hasListener(key:String, ?callback:haxe.Constraints.Function, ?target:Dynamic):Bool;
	public function removeAllListeners(key:haxe.extern.EitherType<String, Dynamic>):Void;
	public function destroy():Void;
}
@:native("cc.Pipeline") extern class Pipeline {
	public function new(pipes:Array<Dynamic>):Void;
	public function insertPipe(pipe:Dynamic, index:Float):Void;
	public function insertPipeAfter(refPipe:Dynamic, newPipe:Dynamic):Void;
	public function appendPipe(pipe:Dynamic):Void;
	public function flowIn(items:Array<Dynamic>):Void;
	public function copyItemStates(srcItem:Dynamic, dstItems:haxe.extern.EitherType<Array<Dynamic>, Dynamic>):Void;
	public function getItem(id:Dynamic):Dynamic;
	public function removeItem(id:Dynamic):Bool;
	public function clear():Void;
}
@:native("cc.Renderer") extern class Renderer {
	static public var renderEngine : Dynamic;
	static public var drawCalls : Float;
}
@:native("cc.Constructor") extern class Constructor {
	public function setAccelerometerEnabled(isEnable:Bool):Void;
	public function setAccelerometerInterval(interval:Float):Void;
}
@:enum abstract Macro(Int) {
	var RAD = 0;
	var DEG = 0;
	var REPEAT_FOREVER = 0;
	var FLT_EPSILON = 0;
	var MIN_ZINDEX = 0;
	var MAX_ZINDEX = 0;
	var ONE = 0;
	var ZERO = 0;
	var SRC_ALPHA = 0;
	var SRC_ALPHA_SATURATE = 0;
	var SRC_COLOR = 0;
	var DST_ALPHA = 0;
	var DST_COLOR = 0;
	var ONE_MINUS_SRC_ALPHA = 0;
	var ONE_MINUS_SRC_COLOR = 0;
	var ONE_MINUS_DST_ALPHA = 0;
	var ONE_MINUS_DST_COLOR = 0;
	var ONE_MINUS_CONSTANT_ALPHA = 0;
	var ONE_MINUS_CONSTANT_COLOR = 0;
	var ORIENTATION_PORTRAIT = 0;
	var ORIENTATION_LANDSCAPE = 0;
	var ORIENTATION_AUTO = 0;
	var FIX_ARTIFACTS_BY_STRECHING_TEXEL_TMX = 0;
	var DIRECTOR_STATS_POSITION = 0;
	var ENABLE_STACKABLE_ACTIONS = 0;
	var TOUCH_TIMEOUT = 0;
	var BATCH_VERTEX_COUNT = 0;
	var ENABLE_TILEDMAP_CULLING = 0;
	var DOWNLOAD_MAX_CONCURRENT = 0;
	var ENABLE_TRANSPARENT_CANVAS = 0;
	var ENABLE_WEBGL_ANTIALIAS = 0;
	var ENABLE_CULLING = 0;
	var CLEANUP_IMAGE_CACHE = 0;
}
@:enum abstract KEY(Int) {
	var none = 0;
	var back = 0;
	var menu = 0;
	var backspace = 0;
	var tab = 0;
	var enter = 0;
	var shift = 0;
	var ctrl = 0;
	var alt = 0;
	var pause = 0;
	var capslock = 0;
	var escape = 0;
	var space = 0;
	var pageup = 0;
	var pagedown = 0;
	var end = 0;
	var home = 0;
	var left = 0;
	var up = 0;
	var right = 0;
	var down = 0;
	var select = 0;
	var insert = 0;
	var Delete = 0;
	var a = 0;
	var b = 0;
	var c = 0;
	var d = 0;
	var e = 0;
	var f = 0;
	var g = 0;
	var h = 0;
	var i = 0;
	var j = 0;
	var k = 0;
	var l = 0;
	var m = 0;
	var n = 0;
	var o = 0;
	var p = 0;
	var q = 0;
	var r = 0;
	var s = 0;
	var t = 0;
	var u = 0;
	var v = 0;
	var w = 0;
	var x = 0;
	var y = 0;
	var z = 0;
	var num0 = 0;
	var num1 = 0;
	var num2 = 0;
	var num3 = 0;
	var num4 = 0;
	var num5 = 0;
	var num6 = 0;
	var num7 = 0;
	var num8 = 0;
	var num9 = 0;
	var mul = 0;
	var add = 0;
	var sub = 0;
	var numdel = 0;
	var dec = 0;
	var f1 = 0;
	var f2 = 0;
	var f3 = 0;
	var f4 = 0;
	var f5 = 0;
	var f6 = 0;
	var f7 = 0;
	var f8 = 0;
	var f9 = 0;
	var f10 = 0;
	var f11 = 0;
	var f12 = 0;
	var numlock = 0;
	var scrolllock = 0;
	// var ; = 0;
	var semicolon = 0;
	var equal = 0;
	// var = = 0;
	// var , = 0;
	var comma = 0;
	var dash = 0;
	// var . = 0;
	var period = 0;
	var forwardslash = 0;
	var grave = 0;
	// var [ = 0;
	var openbracket = 0;
	var backslash = 0;
	// var ] = 0;
	var closebracket = 0;
	var quote = 0;
	var dpadLeft = 0;
	var dpadRight = 0;
	var dpadUp = 0;
	var dpadDown = 0;
	var dpadCenter = 0;
}
@:enum abstract ImageFormat(Int) {
	var JPG = 0;
	var PNG = 0;
	var TIFF = 0;
	var WEBP = 0;
	var PVR = 0;
	var ETC = 0;
	var S3TC = 0;
	var ATITC = 0;
	var TGA = 0;
	var RAWDATA = 0;
	var UNKNOWN = 0;
}
@:enum abstract BlendFactor(Int) {
	var ONE = 0;
	var ZERO = 0;
	var SRC_ALPHA = 0;
	var SRC_COLOR = 0;
	var DST_ALPHA = 0;
	var DST_COLOR = 0;
	var ONE_MINUS_SRC_ALPHA = 0;
	var ONE_MINUS_SRC_COLOR = 0;
	var ONE_MINUS_DST_ALPHA = 0;
	var ONE_MINUS_DST_COLOR = 0;
}
@:enum abstract TextAlignment(Int) {
	var LEFT = 0;
	var CENTER = 0;
	var RIGHT = 0;
}
@:enum abstract VerticalTextAlignment(Int) {
	var TOP = 0;
	var CENTER = 0;
	var BOTTOM = 0;
}
@:native("cc.Object") extern class Object {
	public var name : String;
	public var isValid : Bool;
	public function destroy():Bool;
}
@:enum abstract Flags(Int) {
	var DontSave = 0;
	var EditorOnly = 0;
}
@:native("cc.Screen") extern class Screen {
	public function init():Void;
	public function fullScreen():Bool;
	public function requestFullScreen(element:Element, onFullScreenChange:haxe.Constraints.Function):Void;
	public function exitFullScreen():Bool;
	public function autoFullScreen(element:Element, onFullScreenChange:haxe.Constraints.Function):Void;
}
@:native("cc.Sys") extern class Sys {
	static public var LANGUAGE_ENGLISH : String;
	static public var LANGUAGE_CHINESE : String;
	static public var LANGUAGE_FRENCH : String;
	static public var LANGUAGE_ITALIAN : String;
	static public var LANGUAGE_GERMAN : String;
	static public var LANGUAGE_SPANISH : String;
	static public var LANGUAGE_DUTCH : String;
	static public var LANGUAGE_RUSSIAN : String;
	static public var LANGUAGE_KOREAN : String;
	static public var LANGUAGE_JAPANESE : String;
	static public var LANGUAGE_HUNGARIAN : String;
	static public var LANGUAGE_PORTUGUESE : String;
	static public var LANGUAGE_ARABIC : String;
	static public var LANGUAGE_NORWEGIAN : String;
	static public var LANGUAGE_POLISH : String;
	static public var LANGUAGE_TURKISH : String;
	static public var LANGUAGE_UKRAINIAN : String;
	static public var LANGUAGE_ROMANIAN : String;
	static public var LANGUAGE_BULGARIAN : String;
	static public var LANGUAGE_UNKNOWN : String;
	static public var OS_IOS : String;
	static public var OS_ANDROID : String;
	static public var OS_WINDOWS : String;
	static public var OS_MARMALADE : String;
	static public var OS_LINUX : String;
	static public var OS_BADA : String;
	static public var OS_BLACKBERRY : String;
	static public var OS_OSX : String;
	static public var OS_WP8 : String;
	static public var OS_WINRT : String;
	static public var OS_UNKNOWN : String;
	static public var UNKNOWN : Float;
	static public var WIN32 : Float;
	static public var LINUX : Float;
	static public var MACOS : Float;
	static public var ANDROID : Float;
	static public var IPHONE : Float;
	static public var IPAD : Float;
	static public var BLACKBERRY : Float;
	static public var NACL : Float;
	static public var EMSCRIPTEN : Float;
	static public var TIZEN : Float;
	static public var WINRT : Float;
	static public var WP8 : Float;
	static public var MOBILE_BROWSER : Float;
	static public var DESKTOP_BROWSER : Float;
	static public var EDITOR_PAGE : Float;
	static public var EDITOR_CORE : Float;
	static public var WECHAT_GAME : Float;
	static public var QQ_PLAY : Float;
	static public var BROWSER_TYPE_WECHAT : String;
	static public var BROWSER_TYPE_WECHAT_GAME : String;
	static public var BROWSER_TYPE_WECHAT_GAME_SUB : String;
	static public var BROWSER_TYPE_QQ_PLAY : String;
	static public var BROWSER_TYPE_ANDROID : String;
	static public var BROWSER_TYPE_IE : String;
	static public var BROWSER_TYPE_QQ : String;
	static public var BROWSER_TYPE_MOBILE_QQ : String;
	static public var BROWSER_TYPE_UC : String;
	static public var BROWSER_TYPE_UCBS : String;
	static public var BROWSER_TYPE_360 : String;
	static public var BROWSER_TYPE_BAIDU_APP : String;
	static public var BROWSER_TYPE_BAIDU : String;
	static public var BROWSER_TYPE_MAXTHON : String;
	static public var BROWSER_TYPE_OPERA : String;
	static public var BROWSER_TYPE_OUPENG : String;
	static public var BROWSER_TYPE_MIUI : String;
	static public var BROWSER_TYPE_FIREFOX : String;
	static public var BROWSER_TYPE_SAFARI : String;
	static public var BROWSER_TYPE_CHROME : String;
	static public var BROWSER_TYPE_LIEBAO : String;
	static public var BROWSER_TYPE_QZONE : String;
	static public var BROWSER_TYPE_SOUGOU : String;
	static public var BROWSER_TYPE_UNKNOWN : String;
	static public var isNative : Bool;
	static public var isBrowser : Bool;
	static public var isMobile : Bool;
	static public var platform : Float;
	static public var language : String;
	static public var os : String;
	static public var osVersion : String;
	static public var osMainVersion : Float;
	static public var browserType : String;
	static public var browserVersion : String;
	static public var windowPixelResolution : Size;
	static public var localStorage : Dynamic;
	static public var capabilities : Dynamic;
	static public function getNetworkType():NetworkType;
	static public function getBatteryLevel():Float;
	static public function garbageCollect():Void;
	static public function dumpRoot():Void;
	static public function restartVM():Void;
	static public function cleanScript(jsfile:String):Void;
	static public function isObjectValid(obj:Dynamic):Bool;
	static public function dump():Void;
	static public function openURL(url:String):Void;
	static public function now():Float;
}
@:enum abstract NetworkType(Int) {
	var NONE = 0;
	var LAN = 0;
	var WWAN = 0;
}
@:native("cc.View") extern class View {
	public function setTargetDensityDPI(densityDPI:String):Void;
	public function getTargetDensityDPI():String;
	public function resizeWithBrowserSize(enabled:Bool):Void;
	public function setResizeCallback(callback:haxe.extern.EitherType<haxe.Constraints.Function, Void>):Void;
	public function setOrientation(orientation:Float):Void;
	public function adjustViewportMeta(enabled:Bool):Void;
	public function enableRetina(enabled:Bool):Void;
	public function isRetinaEnabled():Bool;
	public function enableAntiAlias(enabled:Bool):Void;
	public function isAntiAliasEnabled():Bool;
	public function enableAutoFullScreen(enabled:Bool):Void;
	public function isAutoFullScreenEnabled():Bool;
	public function getCanvasSize():Size;
	public function getFrameSize():Size;
	public function setFrameSize(width:Float, height:Float):Void;
	public function getVisibleSize():Size;
	public function getVisibleSizeInPixel():Size;
	public function getVisibleOrigin():Vec2;
	public function getVisibleOriginInPixel():Vec2;
	public function getResolutionPolicy():ResolutionPolicy;
	public function setResolutionPolicy(resolutionPolicy:haxe.extern.EitherType<ResolutionPolicy, Float>):Void;
	public function setDesignResolutionSize(width:Float, height:Float, resolutionPolicy:haxe.extern.EitherType<ResolutionPolicy, Float>):Void;
	public function getDesignResolutionSize():Size;
	public function setRealPixelResolution(width:Float, height:Float, resolutionPolicy:haxe.extern.EitherType<ResolutionPolicy, Float>):Void;
	public function setViewportInPoints(x:Float, y:Float, w:Float, h:Float):Void;
	public function setScissorInPoints(x:Float, y:Float, w:Float, h:Float):Void;
	public function isScissorEnabled():Bool;
	public function getScissorRect():Rect;
	public function getViewportRect():Rect;
	public function getScaleX():Float;
	public function getScaleY():Float;
	public function getDevicePixelRatio():Float;
	public function convertToLocationInView(tx:Float, ty:Float, relatedPos:Dynamic):Vec2;
}
@:native("cc.ContainerStrategy") extern class ContainerStrategy {
	public function preApply(view:View):Void;
	public function apply(view:View, designedResolution:Size):Void;
	public function postApply(view:View):Void;
}
@:native("cc.ContentStrategy") extern class ContentStrategy {
	public function preApply(view:View):Void;
	public function apply(view:View, designedResolution:Size):Dynamic;
	public function postApply(view:View):Void;
}
@:native("cc.EqualToFrame") extern class EqualToFrame extends ContainerStrategy {

}
@:native("cc.ProportionalToFrame") extern class ProportionalToFrame extends ContainerStrategy {

}
@:native("cc.EqualToWindow") extern class EqualToWindow extends EqualToFrame {

}
@:native("cc.ProportionalToWindow") extern class ProportionalToWindow extends ProportionalToFrame {

}
@:native("cc.OriginalContainer") extern class OriginalContainer extends ContainerStrategy {

}
@:native("cc.ResolutionPolicy") extern class ResolutionPolicy {
	public function new(containerStg:ContainerStrategy, contentStg:ContentStrategy):Void;
	public function preApply(view:View):Void;
	public function apply(view:View, designedResolution:Size):Dynamic;
	public function postApply(view:View):Void;
	public function setContainerStrategy(containerStg:ContainerStrategy):Void;
	public function setContentStrategy(contentStg:ContentStrategy):Void;
	static public var EXACT_FIT : Float;
	static public var NO_BORDER : Float;
	static public var SHOW_ALL : Float;
	static public var FIXED_HEIGHT : Float;
	static public var FIXED_WIDTH : Float;
	static public var UNKNOWN : Float;
}
@:native("cc.VisibleRect") extern class VisibleRect {
	public function init(visibleRect:Rect):Void;
	public var topLeft : Vec2;
	public var topRight : Vec2;
	public var top : Vec2;
	public var bottomLeft : Vec2;
	public var bottomRight : Vec2;
	public var bottom : Vec2;
	public var center : Vec2;
	public var left : Vec2;
	public var right : Vec2;
	public var width : Float;
	public var height : Float;
}
@:native("cc._CallbacksHandler") extern class _CallbacksHandler {
	public function add(key:String, callback:haxe.Constraints.Function, ?target:Dynamic):Void;
	public function hasEventListener(key:String, ?callback:haxe.Constraints.Function, ?target:Dynamic):Bool;
	public function removeAll(keyOrTarget:haxe.extern.EitherType<String, Dynamic>):Void;
	public function remove(key:String, callback:haxe.Constraints.Function, ?target:Dynamic):Void;
}
@:native("cc.CallbacksInvoker") extern class CallbacksInvoker extends _CallbacksHandler {
	public function invoke(key:String, ?p1:Dynamic, ?p2:Dynamic, ?p3:Dynamic, ?p4:Dynamic, ?p5:Dynamic):Void;
}
@:native("cc.Details") extern class Details {
	public var uuidList : Array<String>;
	public var uuidObjList : Array<Dynamic>;
	public var uuidPropList : Array<String>;
	public function reset():Void;
	public function push(obj:Dynamic, propName:String, uuid:String):Void;
}
@:native("cc.Url") extern class Url {
	static public function raw(url:String):String;
}
@:native("cc.WorldManifold") extern class WorldManifold {
	public var points : Array<Dynamic>;
	public var normal : Vec2;
}
@:native("cc.ManifoldPoint") extern class ManifoldPoint {
	public var localPoint : Vec2;
	public var normalImpulse : Float;
	public var tangentImpulse : Float;
}
@:native("cc.Manifold") extern class Manifold {
	public var type : Float;
	public var localPoint : Vec2;
	public var localNormal : Vec2;
	public var points : Array<Dynamic>;
}
@:native("cc.PhysicsImpulse") extern class PhysicsImpulse {
	public var normalImpulses : Dynamic;
	public var tangentImpulses : Dynamic;
}
@:native("cc.PhysicsContact") extern class PhysicsContact {
	public function getWorldManifold():WorldManifold;
	public function getManifold():Manifold;
	public function getImpulse():PhysicsImpulse;
	public var colliderA : Collider;
	public var colliderB : Collider;
	public var disabled : Bool;
	public var disabledOnce : Bool;
	public function isTouching():Bool;
	public function setTangentSpeed(tangentSpeed:Float):Void;
	public function getTangentSpeed():Float;
	public function setFriction(friction:Float):Void;
	public function getFriction():Float;
	public function resetFriction():Void;
	public function setRestitution(restitution:Float):Void;
	public function getRestitution():Float;
	public function resetRestitution():Void;
}
@:native("cc.PhysicsManager") extern class PhysicsManager implements IEventTarget {
	static public var DrawBits : DrawBits;
	static public var PTM_RATIO : Float;
	static public var VELOCITY_ITERATIONS : Float;
	static public var POSITION_ITERATIONS : Float;
	static public var FIXED_TIME_STEP : Float;
	static public var MAX_ACCUMULATOR : Float;
	public var enabledAccumulator : Bool;
	public function testPoint(point:Vec2):PhysicsCollider;
	public function testAABB(rect:Rect):Array<Dynamic>;
	public function rayCast(p1:Vec2, p2:Vec2, type:RayCastType):Array<Dynamic>;
	public var enabled : Bool;
	public var debugDrawFlags : Float;
	public var gravity : Vec2;
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:enum abstract DrawBits(Int) {
	var e_aabbBit = 0;
	var e_jointBit = 0;
	var e_shapeBit = 0;
}
@:native("cc.PhysicsRayCastResult") extern class PhysicsRayCastResult {
	public var collider : PhysicsCollider;
	public var point : Vec2;
	public var normal : Vec2;
	public var fraction : Float;
}
@:enum abstract RigidBodyType(Int) {
	var Static = 0;
	var Kinematic = 0;
	var Dynamic = 0;
	var Animated = 0;
}
@:enum abstract RayCastType(Int) {
	var Closest = 0;
	var Any = 0;
	var AllClosest = 0;
	var All = 0;
}
@:native("cc.RigidBody") extern class RigidBody extends Component {
	public var enabledContactListener : Bool;
	public function onBeginContact(contact:PhysicsContact, selfCollider:PhysicsCollider, otherCollider:PhysicsCollider):Void;
	public function onEndContact(contact:PhysicsContact, selfCollider:PhysicsCollider, otherCollider:PhysicsCollider):Void;
	public function onPreSolve(contact:PhysicsContact, selfCollider:PhysicsCollider, otherCollider:PhysicsCollider):Void;
	public function onPostSolve(contact:PhysicsContact, selfCollider:PhysicsCollider, otherCollider:PhysicsCollider):Void;
	public var bullet : Bool;
	public var type : RigidBodyType;
	public var allowSleep : Bool;
	public var gravityScale : Float;
	public var linearDamping : Float;
	public var angularDamping : Float;
	public var linearVelocity : Vec2;
	public var angularVelocity : Float;
	public var fixedRotation : Bool;
	public var awake : Bool;
	public var active : Bool;
	public function getLocalPoint(worldPoint:Vec2, out:Vec2):Vec2;
	public function getWorldPoint(localPoint:Vec2, out:Vec2):Vec2;
	public function getWorldVector(localVector:Vec2, out:Vec2):Vec2;
	public function getLocalVector(worldVector:Vec2, out:Vec2):Vec2;
	public function getWorldPosition(out:Vec2):Vec2;
	public function getWorldRotation():Float;
	public function getLocalCenter():Vec2;
	public function getWorldCenter():Vec2;
	public function getLinearVelocityFromWorldPoint(worldPoint:Vec2, out:Vec2):Vec2;
	public function getMass():Float;
	public function getInertia():Float;
	public function getJointList():Array<Dynamic>;
	public function applyForce(force:Vec2, point:Vec2, wake:Bool):Void;
	public function applyForceToCenter(force:Vec2, wake:Bool):Void;
	public function applyTorque(torque:Float, wake:Bool):Void;
	public function applyLinearImpulse(impulse:Vec2, point:Vec2, wake:Bool):Void;
	public function applyAngularImpulse(impulse:Float, wake:Bool):Void;
	public function syncPosition(enableAnimated:Bool):Void;
	public function syncRotation(enableAnimated:Bool):Void;
}
@:native("cc.Color") extern class Color extends ValueType {
	public function new(?r:Float, ?g:Float, ?b:Float, ?a:Float):Void;
	static public var WHITE : Color;
	static public var BLACK : Color;
	static public var TRANSPARENT : Color;
	static public var GRAY : Color;
	static public var RED : Color;
	static public var GREEN : Color;
	static public var BLUE : Color;
	static public var YELLOW : Color;
	static public var ORANGE : Color;
	static public var CYAN : Color;
	static public var MAGENTA : Color;
	public function getR():Float;
	public function setR(red:Float):Color;
	public function getG():Float;
	public function setG(green:Float):Color;
	public function getB():Float;
	public function setB(blue:Float):Color;
	public function getA():Float;
	public function setA(alpha:Float):Color;
	public function toCSS(opt:String):String;
	public function fromHEX(hexString:String):Color;
	public function toHEX(fmt:String):String;
	public function toRGBValue():Float;
	public function fromHSV(h:Float, s:Float, v:Float):Color;
	public function toHSV():Dynamic;
}
@:native("cc.Quat") extern class Quat extends ValueType {
	public function new(?x:Float, ?y:Float, ?z:Float, ?w:Float):Void;
	public var x : Float;
	public var y : Float;
	public var z : Float;
	public var w : Float;
	public function quat(?x:haxe.extern.EitherType<Float, Dynamic>, ?y:Float, ?z:Float, ?w:Float):Quat;
}
@:native("cc.Rect") extern class Rect extends ValueType {
	public function new(?x:Float, ?y:Float, ?w:Float, ?h:Float):Void;
	public var x : Float;
	public var y : Float;
	public var width : Float;
	public var height : Float;
	static public function fromMinMax(v1:Vec2, v2:Vec2):Rect;
	public function intersects(rect:Rect):Void;
	public function intersection(out:Rect, rectB:Rect):Rect;
	public function contains(point:Vec2):Void;
	public function containsRect(rect:Rect):Void;
	public function union(out:Rect, rectB:Rect):Rect;
	public function transformMat4(out:Rect, mat:vmath.Mat4):Void;
	public var xMin : Float;
	public var yMin : Float;
	public var xMax : Float;
	public var yMax : Float;
	public var center : Vec2;
	public var origin : Vec2;
	public var size : Size;
}
@:native("cc.Size") extern class Size {
	public function new(width:haxe.extern.EitherType<Float, Size>, ?height:Float):Void;
	public var width : Float;
	public var height : Float;
	static public var ZERO : Size;
	public function clone():Size;
	public function equals(other:Size):Bool;
	public function lerp(to:Rect, ratio:Float, ?out:Size):Size;
	public function toString():String;
}
@:native("cc.ValueType") extern class ValueType {
	public function clone():ValueType;
	public function equals(other:ValueType):Bool;
	public function lerp(to:ValueType, ratio:Float):ValueType;
	public function set(source:ValueType):Void;
	public function toString():String;
}
@:native("cc.Vec2") extern class Vec2 extends ValueType {
	public function new(?x:Float, ?y:Float):Void;
	public var x : Float;
	public var y : Float;
	public function pFuzzyEqual(other:Vec2, variance:Float):Bool;
	public function clampf(min_inclusive:Vec2, max_inclusive:Vec2):Vec2;
	public function addSelf(vector:Vec2):Vec2;
	public function add(vector:Vec2, ?out:Vec2):Vec2;
	public function subSelf(vector:Vec2):Vec2;
	public function sub(vector:Vec2, ?out:Vec2):Vec2;
	public function mulSelf(num:Float):Vec2;
	public function mul(num:Float, ?out:Vec2):Vec2;
	public function scaleSelf(vector:Vec2):Vec2;
	public function scale(vector:Vec2, ?out:Vec2):Vec2;
	public function divSelf(divisor:Vec2):Vec2;
	public function div(divisor:Vec2, ?out:Vec2):Vec2;
	public function negSelf():Vec2;
	public function neg(?out:Vec2):Vec2;
	public function dot(?vector:Vec2):Float;
	public function cross(?vector:Vec2):Float;
	public function mag():Float;
	public function magSqr():Float;
	public function normalizeSelf():Vec2;
	public function normalize(?out:Vec2):Vec2;
	public function angle(vector:Vec2):Float;
	public function signAngle(vector:Vec2):Float;
	public function rotate(radians:Float, ?out:Vec2):Vec2;
	public function rotateSelf(radians:Float):Vec2;
	public function project(vector:Vec2):Vec2;
	static public var ONE : Vec2;
	static public var ZERO : Vec2;
	static public var UP : Vec2;
	static public var RIGHT : Vec2;
}
@:native("cc.Vec3") extern class Vec3 extends ValueType {
	public function new(?x:Float, ?y:Float, ?z:Float):Void;
	public var x : Float;
	public var y : Float;
	public var z : Float;
	public function pFuzzyEqual(other:Vec3, variance:Float):Bool;
	public function clampf(min_inclusive:Vec3, max_inclusive:Vec3):Vec3;
	public function addSelf(vector:Vec3):Vec3;
	public function add(vector:Vec3, ?out:Vec3):Vec3;
	public function subSelf(vector:Vec3):Vec3;
	public function sub(vector:Vec3, ?out:Vec3):Vec3;
	public function mulSelf(num:Float):Vec3;
	public function mul(num:Float, ?out:Vec3):Vec3;
	public function scaleSelf(vector:Vec3):Vec3;
	public function scale(vector:Vec3, ?out:Vec3):Vec3;
	public function divSelf(vector:Vec3):Vec3;
	public function div(vector:Vec3, ?out:Vec3):Vec3;
	public function negSelf():Vec3;
	public function neg(?out:Vec3):Vec3;
	public function dot(?vector:Vec3):Float;
	public function cross(vector:Vec3, ?out:Vec3):Vec3;
	public function mag():Float;
	public function magSqr():Float;
	public function normalizeSelf():Vec3;
	public function normalize(?out:Vec3):Vec3;
	public function v3(?x:haxe.extern.EitherType<Float, Dynamic>, ?y:Float, ?z:Float):Vec3;
}
@:native("cc.Path") extern class Path {
	static public function join():String;
	static public function extname(pathStr:String):Dynamic;
	static public function mainFileName(fileName:String):String;
	static public function basename(pathStr:String, ?extname:String):Dynamic;
	static public function dirname(pathStr:String):Dynamic;
	static public function changeExtname(pathStr:String, ?extname:String):String;
}
@:native("cc.AffineTransform") extern class AffineTransform {
	static public function create(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):AffineTransform;
	static public function identity():AffineTransform;
	static public function clone(t:AffineTransform):AffineTransform;
	static public function concat(out:AffineTransform, t1:AffineTransform, t2:AffineTransform):AffineTransform;
	@:overload(function(out:AffineTransform, t:AffineTransform):AffineTransform { })
	static public function invert(out:AffineTransform, t:AffineTransform):AffineTransform;
	static public function transformVec2(out:Vec2, point:haxe.extern.EitherType<Vec2, Float>, transOrY:haxe.extern.EitherType<AffineTransform, Float>, ?t:AffineTransform):Vec2;
	static public function transformSize(out:Size, size:Size, t:AffineTransform):Size;
	static public function transformRecta(out:Rect, rect:Rect, anAffineTransform:AffineTransform):Rect;
	static public function transformObb(out_bl:Vec2, out_tl:Vec2, out_tr:Vec2, out_br:Vec2, rect:Rect, anAffineTransform:AffineTransform):Void;
}
@:native("cc._BaseNode") extern class _BaseNode implements IEventTarget {
	public var name : String;
	public var uuid : String;
	public var children : Array<Node>;
	public var childrenCount : Float;
	public var active : Bool;
	public var activeInHierarchy : Bool;
	public function new(?name:String):Void;
	public var parent : Node;
	public function attr(attrs:Dynamic):Void;
	public function getChildByUuid(uuid:String):Node;
	public function getChildByName(name:String):Node;
	public function insertChild(child:Node, siblingIndex:Float):Void;
	public function getSiblingIndex():Float;
	public function setSiblingIndex(index:Float):Void;
	public function walk(prefunc:_BaseNode -> Void, postfunc:_BaseNode -> Void):Void;
	public function removeFromParent(?cleanup:Bool):Void;
	public function removeChild(child:Node, ?cleanup:Bool):Void;
	public function removeAllChildren(?cleanup:Bool):Void;
	public function isChildOf(parent:Node):Bool;
	@:overload(function(className:String):Dynamic { })
	public function getComponent<T:Component>(type:Class<T>):T;
	@:overload(function(className:String):Array<Dynamic> { })
	public function getComponents<T:(Component)>(type:Class<T>):Array<T>;
	@:overload(function(className:String):Dynamic { })
	public function getComponentInChildren<T:(Component)>(type:Class<T>):T;
	@:overload(function(className:String):Array<Dynamic> { })
	public function getComponentsInChildren<T:(Component)>(type:Class<T>):Array<T>;
	@:overload(function(className:String):Dynamic { })
	public function addComponent<T:(Component)>(type:Class<T>):T;
	public function removeComponent(component:haxe.extern.EitherType<String, haxe.extern.EitherType<haxe.Constraints.Function, Component>>):Void;
	public function destroyAllChildren():Void;
	public function hasEventListener(type:String):Bool;
	@:overload(function<T>(type:String, callback:T -> Void, ?target:Dynamic):T -> Void { })
	public function on(type:String, callback:Event.EventCustom -> Void, ?target:Dynamic, ?useCapture:Bool):Event.EventCustom -> Void;
	public function off(type:String, ?callback:haxe.Constraints.Function, ?target:Dynamic, ?useCapture:Bool):Void;
	public function targetOff(target:Dynamic):Void;
	public function once(type:String, callback:?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> ?Dynamic -> Void, ?target:Dynamic):Void;
	public function emit(type:String, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic):Void;
	public function dispatchEvent(event:Event):Void;
}
@:native("cc.Misc") extern class Misc {
	static public function clampf(value:Float, min_inclusive:Float, max_inclusive:Float):Float;
	static public function clamp01(value:Float):Float;
	static public function lerp(a:Float, b:Float, r:Float):Float;
	static public function degreesToRadians(angle:Float):Float;
	static public function radiansToDegrees(angle:Float):Float;
}
@:native("cc.EditBox") extern class EditBox extends Component {
	public var string : String;
	public var backgroundImage : SpriteFrame;
	public var returnType : EditBox.KeyboardReturnType;
	public var inputFlag : EditBox.InputFlag;
	public var inputMode : EditBox.InputMode;
	public var fontSize : Float;
	public var lineHeight : Float;
	public var fontColor : Color;
	public var placeholder : String;
	public var placeholderFontSize : Float;
	public var placeholderFontColor : Color;
	public var maxLength : Float;
	public var stayOnTop : Bool;
	public var tabIndex : Float;
	public var editingDidBegan : Array<Component.EventHandler>;
	public var textChanged : Array<Component.EventHandler>;
	public var editingDidEnded : Array<Component.EventHandler>;
	public var editingReturn : Array<Component.EventHandler>;
	public function setFocus():Void;
	public function isFocused():Void;
	public function destroy():Bool;
}
@:native("cc.PhysicsBoxCollider") extern class PhysicsBoxCollider extends PhysicsCollider implements IBox {
	public var offset : Vec2;
	public var size : Size;
}
@:native("cc.PhysicsChainCollider") extern class PhysicsChainCollider extends PolygonCollider {
	public var loop : Bool;
}
@:native("cc.PhysicsCircleCollider") extern class PhysicsCircleCollider extends PhysicsCollider implements ICircle {
	public var offset : Vec2;
	public var radius : Float;
}
@:native("cc.PhysicsCollider") extern class PhysicsCollider {
	public var density : Float;
	public var sensor : Bool;
	public var friction : Float;
	public var restitution : Float;
	public var body : RigidBody;
	public function apply():Void;
	public function getAABB():Void;
}
@:native("cc.PhysicsPolygonCollider") extern class PhysicsPolygonCollider extends PhysicsCollider implements IPolygon {
	public var offset : Vec2;
	public var points : Array<Vec2>;
}
@:native("cc.DistanceJoint") extern class DistanceJoint extends Joint {
	public var distance : Float;
	public var frequency : Float;
	public var _0 : Float;
}
@:native("cc.Joint") extern class Joint extends Component {
	public var anchor : Vec2;
	public var connectedAnchor : Vec2;
	public var connectedBody : RigidBody;
	public var collideConnected : Bool;
	public function apply():Void;
	public function getWorldAnchor():Vec2;
	public function getWorldConnectedAnchor():Vec2;
	public function getReactionForce(timeStep:Float):Float;
	public function getReactionTorque(timeStep:Float):Float;
}
@:native("cc.MotorJoint") extern class MotorJoint extends Joint {
	public var linearOffset : Vec2;
	public var angularOffset : Float;
	public var maxForce : Float;
	public var maxTorque : Float;
	public var correctionFactor : Float;
}
@:native("cc.MouseJoint") extern class MouseJoint extends Joint {
	public var mouseRegion : Node;
	public var target : Vec2;
	public var frequency : Float;
	public var _0 : Float;
	public var maxForce : Float;
}
@:native("cc.PrismaticJoint") extern class PrismaticJoint extends Joint {
	public var localAxisA : Vec2;
	public var referenceAngle : Float;
	public var enableLimit : Bool;
	public var enableMotor : Bool;
	public var lowerLimit : Float;
	public var upperLimit : Float;
	public var maxMotorForce : Float;
	public var motorSpeed : Float;
}
@:native("cc.RevoluteJoint") extern class RevoluteJoint extends Joint {
	public var referenceAngle : Float;
	public var lowerAngle : Float;
	public var upperAngle : Float;
	public var maxMotorTorque : Float;
	public var motorSpeed : Float;
	public var enableLimit : Bool;
	public var enableMotor : Bool;
	public function getJointAngle():Float;
}
@:native("cc.RopeJoint") extern class RopeJoint extends Joint {
	public var maxLength : Float;
}
@:native("cc.WeldJoint") extern class WeldJoint extends Joint {
	public var referenceAngle : Float;
	public var frequency : Float;
	public var _0 : Float;
}
@:native("cc.WheelJoint") extern class WheelJoint extends Joint {
	public var localAxisA : Vec2;
	public var maxMotorTorque : Float;
	public var motorSpeed : Float;
	public var enableMotor : Bool;
	public var frequency : Float;
	public var dampingRatio : Float;
}
@:native("cc.CcTopLevel") extern class CcTopLevel {
	static var ENGINE_VERSION : String;
	static function speed(action:ActionInterval, speed:Float):Action;
	static function follow(followedNode:Node, rect:Rect):Action;
	static function setPoints(points:Array<Dynamic>):Void;
	static function cardinalSplineTo(duration:Float, points:Array<Dynamic>, tension:Float):ActionInterval;
	static function updatePosition(newPos:Vec2):Void;
	static function cardinalSplineBy(duration:Float, points:Array<Dynamic>, tension:Float):ActionInterval;
	static function catmullRomTo(dt:Float, points:Array<Dynamic>):ActionInterval;
	static function catmullRomBy(dt:Float, points:Array<Dynamic>):ActionInterval;
	static function easeIn(rate:Float):Dynamic;
	static function easeOut(rate:Float):Dynamic;
	static function easeInOut(rate:Float):Dynamic;
	static function easeExponentialIn():Dynamic;
	static function easeExponentialOut():Dynamic;
	static function easeExponentialInOut():Dynamic;
	static function easeSineIn():Dynamic;
	static function easeSineOut():Dynamic;
	static function easeSineInOut():Dynamic;
	static function easeElasticIn(period:Float):Dynamic;
	static function easeElasticOut(period:Float):Dynamic;
	static function easeElasticInOut(period:Float):Dynamic;
	static function easeBounceIn():Dynamic;
	static function easeBounceOut():Dynamic;
	static function easeBounceInOut():Dynamic;
	static function easeBackIn():Dynamic;
	static function easeBackOut():Dynamic;
	static function easeBackInOut():Dynamic;
	static function easeBezierAction(p0:Float, p1:Float, p2:Float, p3:Float):Dynamic;
	static function easeQuadraticActionIn():Dynamic;
	static function easeQuadraticActionOut():Dynamic;
	static function easeQuadraticActionInOut():Dynamic;
	static function easeQuarticActionIn():Dynamic;
	static function easeQuarticActionOut():Dynamic;
	static function easeQuarticActionInOut():Dynamic;
	static function easeQuinticActionIn():Dynamic;
	static function easeQuinticActionOut():Dynamic;
	static function easeQuinticActionInOut():Dynamic;
	static function easeCircleActionIn():Dynamic;
	static function easeCircleActionOut():Dynamic;
	static function easeCircleActionInOut():Dynamic;
	static function easeCubicActionIn():Dynamic;
	static function easeCubicActionOut():Dynamic;
	static function easeCubicActionInOut():Dynamic;
	static function show():ActionInstant;
	static function hide():ActionInstant;
	static function toggleVisibility():ActionInstant;
	static function removeSelf(?isNeedCleanUp:Bool):ActionInstant;
	static function flipX(flip:Bool):ActionInstant;
	static function flipY(flip:Bool):ActionInstant;
	static function place(pos:haxe.extern.EitherType<Vec2, Float>, ?y:Float):ActionInstant;
	static function callFunc(selector:haxe.Constraints.Function, ?selectorTarget:Dynamic, ?data:Dynamic):ActionInstant;
	static function sequence(actionOrActionArray:haxe.extern.EitherType<FiniteTimeAction, Array<FiniteTimeAction>>, tempArray:haxe.extern.Rest<FiniteTimeAction>):ActionInterval;
	static function repeat(action:FiniteTimeAction, times:Float):ActionInterval;
	static function repeatForever(action:FiniteTimeAction):ActionInterval;
	static function spawn(actionOrActionArray:haxe.extern.EitherType<FiniteTimeAction, Array<FiniteTimeAction>>, tempArray:haxe.extern.Rest<FiniteTimeAction>):FiniteTimeAction;
	static function rotateTo(duration:Float, deltaAngleX:Float, ?deltaAngleY:Float):ActionInterval;
	static function rotateBy(duration:Float, deltaAngleX:Float, ?deltaAngleY:Float):ActionInterval;
	static function moveBy(duration:Float, deltaPos:haxe.extern.EitherType<Vec2, Float>, ?deltaY:Float):ActionInterval;
	static function moveTo(duration:Float, position:haxe.extern.EitherType<Vec2, Float>, ?y:Float):ActionInterval;
	static function skewTo(t:Float, sx:Float, sy:Float):ActionInterval;
	static function skewBy(t:Float, sx:Float, sy:Float):ActionInterval;
	static function jumpBy(duration:Float, position:haxe.extern.EitherType<Vec2, Float>, ?y:Float, ?height:Float, ?jumps:Float):ActionInterval;
	static function jumpTo(duration:Float, position:haxe.extern.EitherType<Vec2, Float>, ?y:Float, ?height:Float, ?jumps:Float):ActionInterval;
	static function bezierBy(t:Float, c:Array<Vec2>):ActionInterval;
	static function bezierTo(t:Float, c:Array<Vec2>):ActionInterval;
	static function scaleTo(duration:Float, sx:Float, ?sy:Float):ActionInterval;
	static function scaleBy(duration:Float, sx:Float, ?sy:haxe.extern.EitherType<Float, Void>):ActionInterval;
	static function blink(duration:Float, blinks:Float):ActionInterval;
	static function fadeTo(duration:Float, opacity:Float):ActionInterval;
	static function fadeIn(duration:Float):ActionInterval;
	static function fadeOut(d:Float):ActionInterval;
	static function tintTo(duration:Float, red:Float, green:Float, blue:Float):ActionInterval;
	static function tintBy(duration:Float, deltaRed:Float, deltaGreen:Float, deltaBlue:Float):ActionInterval;
	static function delayTime(d:Float):ActionInterval;
	static function reverseTime(action:FiniteTimeAction):ActionInterval;
	static function targetedAction(target:Node, action:FiniteTimeAction):ActionInterval;
	static var director : Director;
	static var systemEvent : SystemEvent;
	static function Class(?options:{ @:optional
	public var name : String; @:optional
	// public var extends : haxe.Constraints.Function; @:optional
	public var ctor : haxe.Constraints.Function; @:optional
	public var __ctor__ : haxe.Constraints.Function; @:optional
	public var properties : Dynamic; @:optional
	public var statics : Dynamic; @:optional
	public var mixins : Array<haxe.Constraints.Function>; @:optional
	public var editor : { @:optional
	public var executeInEditMode : Bool; @:optional
	public var requireComponent : haxe.Constraints.Function; @:optional
	public var menu : String; @:optional
	public var executionOrder : Float; @:optional
	public var disallowMultiple : Bool; @:optional
	public var playOnFocus : Bool; @:optional
	public var inspector : String; @:optional
	public var icon : String; @:optional
	public var help : String; }; @:optional
	public var update : haxe.Constraints.Function; @:optional
	public var lateUpdate : haxe.Constraints.Function; @:optional
	public var onLoad : haxe.Constraints.Function; @:optional
	public var start : haxe.Constraints.Function; @:optional
	public var onEnable : haxe.Constraints.Function; @:optional
	public var onDisable : haxe.Constraints.Function; @:optional
	public var onDestroy : haxe.Constraints.Function; @:optional
	public var onFocusInEditor : haxe.Constraints.Function; @:optional
	public var onLostFocusInEditor : haxe.Constraints.Function; @:optional
	public var resetInEditor : haxe.Constraints.Function; @:optional
	public var onRestore : haxe.Constraints.Function; @:optional
	public var _getLocalBounds : haxe.Constraints.Function; }):haxe.Constraints.Function;
	static function Enum<T>(obj:T):T;
	static function handleTouchesBegin(touches:Array<Dynamic>):Void;
	static function handleTouchesMove(touches:Array<Dynamic>):Void;
	static function handleTouchesEnd(touches:Array<Dynamic>):Void;
	static function handleTouchesCancel(touches:Array<Dynamic>):Void;
	static function getSetOfTouchesEndOrCancel(touches:Array<Dynamic>):Array<Dynamic>;
	static function getHTMLElementPosition(element:HtmlElement):Dynamic;
	static function getPreTouch(touch:Touch):Touch;
	static function setPreTouch(touch:Touch):Void;
	@:overload(function(location:Vec2, pos:Vec2, eventType:Float):EventMouse {})
	static function getTouchByXY(tx:Float, ty:Float, pos:Vec2):Touch;
	static function getPointByEvent(event:Touch, pos:Vec2):Vec2;
	static function getTouchesByEvent(event:Touch, pos:Vec2):Array<Dynamic>;
	static function registerSystemEvent(element:HtmlElement):Void;
	static function update(dt:Float):Void;
	static function isValid(value:Dynamic, ?strictMode:Bool):Bool;
	static var view : View;
	static var winSize : Size;
	static var Integer : String;
	static var Float : String;
	static var Boolean : String;
	static var String : String;
	static function deserialize(data:haxe.extern.EitherType<String, Dynamic>, ?details:Details, ?options:Dynamic):Dynamic;
	@:overload(function<T>(original:T):T {})
	static function instantiate(original:Prefab):Node;
	static function color(?r:Float, ?g:Float, ?b:Float, ?a:Float):Color;
	static function rect(?x:Float, ?y:Float, ?w:Float, ?h:Float):Rect;
	static function size(w:haxe.extern.EitherType<Float, Size>, ?h:Float):Size;
	static function v2(?x:haxe.extern.EitherType<Float, Dynamic>, ?y:Float):Vec2;
	static function p(?x:haxe.extern.EitherType<Float, Dynamic>, ?y:Float):Vec2;
	static function find(path:String, ?referenceNode:Node):Node;
}
