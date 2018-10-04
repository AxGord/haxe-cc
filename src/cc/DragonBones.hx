package cc;

@:native("DragonBones.ArmatureDisplay") extern class ArmatureDisplay extends cc.Component {
	public var dragonAsset : DragonBonesAsset;
	public var dragonAtlasAsset : DragonBonesAtlasAsset;
	public var armatureName : String;
	public var animationName : String;
	public var _defaultArmatureIndex : Float;
	public var timeScale : Float;
	public var playTimes : Float;
	public var debugBones : Bool;
	public function playAnimation(animName:String, playTimes:Float):dragonBones.AnimationState;
	public function getArmatureNames():Array<Dynamic>;
	public function getAnimationNames(armatureName:String):Array<Dynamic>;
	public function addEventListener(type:String, listener:cc.Event -> Void, ?target:Dynamic):Void;
	public function removeEventListener(type:String, ?listener:haxe.Constraints.Function, ?target:Dynamic):Void;
	public function buildArmature(armatureName:String, node:cc.Node):dragonBones.ArmatureDisplay;
	public function armature():Dynamic;
}
@:native("DragonBones.DragonBonesAsset") extern class DragonBonesAsset extends cc.Asset {
	public var dragonBonesJson : String;
}
@:native("DragonBones.DragonBonesAtlasAsset") extern class DragonBonesAtlasAsset extends cc.Asset {
	public var atlasJson : String;
	public var texture : cc.Texture2D;
}
@:native("DragonBones.Map") interface Map<T> {

}
@:native("DragonBones.DragonBones") extern class DragonBones {
	static public var VERSION : String;
	static public var yDown : Bool;
	static public var debug : Bool;
	static public var debugDraw : Bool;
	static public var webAssembly : Bool;
	public function new(eventManager:IEventDispatcher):Void;
	public function advanceTime(passedTime:Float):Void;
	public function bufferEvent(value:EventObject):Void;
	public function bufferObject(object:BaseObject):Void;
	public var clock : WorldClock;
	public var eventManager : IEventDispatcher;
}
@:native("DragonBones.BaseObject") extern class BaseObject {
	static public function toString():String;
	static public function setMaxCount(objectConstructor:Dynamic, maxCount:Float):Void;
	static public function clearPool(?objectConstructor:Dynamic):Void;
	static public function borrowObject<T:(BaseObject)>(objectConstructor:{ public function new():T; }):T;
	public var hashCode : Float;
	public function returnToPool():Void;
}
@:native("DragonBones.Matrix") extern class Matrix {
	public var a : Float;
	public var b : Float;
	public var c : Float;
	public var d : Float;
	public var tx : Float;
	public var ty : Float;
	public function new(?a:Float, ?b:Float, ?c:Float, ?d:Float, ?tx:Float, ?ty:Float):Void;
	public function toString():String;
	public function copyFrom(value:Matrix):Matrix;
	public function copyFromArray(value:Array<Float>, ?offset:Float):Matrix;
	public function identity():Matrix;
	public function concat(value:Matrix):Matrix;
	public function invert():Matrix;
	public function transformPoint(x:Float, y:Float, result:{ public var x : Float; public var y : Float; }, ?delta:Bool):Void;
	public function transformRectangle(rectangle:{ public var x : Float; public var y : Float; public var width : Float; public var height : Float; }, ?delta:Bool):Void;
}
@:native("DragonBones.Transform") extern class Transform {
	static public var PI : Float;
	static public var PI_D : Float;
	static public var PI_H : Float;
	static public var PI_Q : Float;
	static public var RAD_DEG : Float;
	static public var DEG_RAD : Float;
	static public function normalizeRadian(value:Float):Float;
	public var x : Float;
	public var y : Float;
	public var skew : Float;
	public var rotation : Float;
	public var scaleX : Float;
	public var scaleY : Float;
	public function new(?x:Float, ?y:Float, ?skew:Float, ?rotation:Float, ?scaleX:Float, ?scaleY:Float):Void;
	public function toString():String;
	public function copyFrom(value:Transform):Transform;
	public function identity():Transform;
	public function add(value:Transform):Transform;
	public function minus(value:Transform):Transform;
	public function fromMatrix(matrix:Matrix):Transform;
	public function toMatrix(matrix:Matrix):Transform;
}
@:native("DragonBones.ColorTransform") extern class ColorTransform {
	public var alphaMultiplier : Float;
	public var redMultiplier : Float;
	public var greenMultiplier : Float;
	public var blueMultiplier : Float;
	public var alphaOffset : Float;
	public var redOffset : Float;
	public var greenOffset : Float;
	public var blueOffset : Float;
	public function new(?alphaMultiplier:Float, ?redMultiplier:Float, ?greenMultiplier:Float, ?blueMultiplier:Float, ?alphaOffset:Float, ?redOffset:Float, ?greenOffset:Float, ?blueOffset:Float):Void;
	public function copyFrom(value:ColorTransform):Void;
	public function identity():Void;
}
@:native("DragonBones.Point") extern class Point {
	public var x : Float;
	public var y : Float;
	public function new(?x:Float, ?y:Float):Void;
	public function copyFrom(value:Point):Void;
	public function clear():Void;
}
@:native("DragonBones.Rectangle") extern class Rectangle {
	public var x : Float;
	public var y : Float;
	public var width : Float;
	public var height : Float;
	public function new(?x:Float, ?y:Float, ?width:Float, ?height:Float):Void;
	public function copyFrom(value:Rectangle):Void;
	public function clear():Void;
}
@:native("DragonBones.UserData") extern class UserData extends BaseObject {
	public var ints : Array<Float>;
	public var floats : Array<Float>;
	public var strings : Array<String>;
	public function addInt(value:Float):Void;
	public function addFloat(value:Float):Void;
	public function addString(value:String):Void;
	public function getInt(?index:Float):Float;
	public function getFloat(?index:Float):Float;
	public function getString(?index:Float):String;
}
@:native("DragonBones.ActionData") extern class ActionData extends BaseObject {
	public var type : ActionType;
	public var name : String;
	public var bone : BoneData;
	public var slot : SlotData;
	public var data : UserData;
}
@:native("DragonBones.DragonBonesData") extern class DragonBonesData extends BaseObject {
	public var autoSearch : Bool;
	public var frameRate : Float;
	public var version : String;
	public var name : String;
	public var stage : ArmatureData;
	public var frameIndices : Array<Float>;
	public var cachedFrames : Array<Float>;
	public var armatureNames : Array<String>;
	public var armatures : Map<ArmatureData>;
	public var binary : ArrayBuffer;
	public var intArray : Int16Array;
	public var floatArray : Float32Array;
	public var frameIntArray : Int16Array;
	public var frameFloatArray : Float32Array;
	public var frameArray : Int16Array;
	public var timelineArray : Uint16Array;
	public var userData : UserData;
	public function addArmature(value:ArmatureData):Void;
	public function getArmature(name:String):ArmatureData;
	public function dispose():Void;
}
@:native("DragonBones.ArmatureData") extern class ArmatureData extends BaseObject {
	public var type : ArmatureType;
	public var frameRate : Float;
	public var cacheFrameRate : Float;
	public var scale : Float;
	public var name : String;
	public var aabb : Rectangle;
	public var animationNames : Array<String>;
	public var sortedBones : Array<BoneData>;
	public var sortedSlots : Array<SlotData>;
	public var defaultActions : Array<ActionData>;
	public var actions : Array<ActionData>;
	public var bones : Map<BoneData>;
	public var slots : Map<SlotData>;
	public var constraints : Map<ConstraintData>;
	public var skins : Map<SkinData>;
	public var animations : Map<AnimationData>;
	public var defaultSkin : SkinData;
	public var defaultAnimation : AnimationData;
	public var canvas : CanvasData;
	public var userData : UserData;
	public var parent : DragonBonesData;
	public function sortBones():Void;
	public function cacheFrames(frameRate:Float):Void;
	public function setCacheFrame(globalTransformMatrix:Matrix, transform:Transform):Float;
	public function getCacheFrame(globalTransformMatrix:Matrix, transform:Transform, arrayOffset:Float):Void;
	public function addBone(value:BoneData):Void;
	public function addSlot(value:SlotData):Void;
	public function addConstraint(value:ConstraintData):Void;
	public function addSkin(value:SkinData):Void;
	public function addAnimation(value:AnimationData):Void;
	public function addAction(value:ActionData, isDefault:Bool):Void;
	public function getBone(name:String):BoneData;
	public function getSlot(name:String):SlotData;
	public function getConstraint(name:String):ConstraintData;
	public function getSkin(name:String):SkinData;
	public function getMesh(skinName:String, slotName:String, meshName:String):MeshDisplayData;
	public function getAnimation(name:String):AnimationData;
}
@:native("DragonBones.BoneData") extern class BoneData extends BaseObject {
	public var inheritTranslation : Bool;
	public var inheritRotation : Bool;
	public var inheritScale : Bool;
	public var inheritReflection : Bool;
	public var type : BoneType;
	public var length : Float;
	public var name : String;
	public var transform : Transform;
	public var userData : UserData;
	public var parent : BoneData;
}
@:native("DragonBones.SurfaceData") extern class SurfaceData extends BoneData {
	public var segmentX : Float;
	public var segmentY : Float;
	public var vertices : Array<Float>;
}
@:native("DragonBones.SlotData") extern class SlotData extends BaseObject {
	static public var DEFAULT_COLOR : ColorTransform;
	static public function createColor():ColorTransform;
	public var blendMode : BlendMode;
	public var displayIndex : Float;
	public var zOrder : Float;
	public var name : String;
	public var color : ColorTransform;
	public var userData : UserData;
	public var parent : BoneData;
}
@:native("DragonBones.ConstraintData") extern class ConstraintData extends BaseObject {
	public var order : Float;
	public var name : String;
	public var target : BoneData;
	public var root : BoneData;
	public var bone : BoneData;
}
@:native("DragonBones.IKConstraintData") extern class IKConstraintData extends ConstraintData {
	public var scaleEnabled : Bool;
	public var bendPositive : Bool;
	public var weight : Float;
}
@:native("DragonBones.CanvasData") extern class CanvasData extends BaseObject {
	public var hasBackground : Bool;
	public var color : Float;
	public var x : Float;
	public var y : Float;
	public var width : Float;
	public var height : Float;
}
@:native("DragonBones.SkinData") extern class SkinData extends BaseObject {
	public var name : String;
	public var displays : Map<Array<DisplayData>>;
	public var parent : ArmatureData;
	public function addDisplay(slotName:String, value:DisplayData):Void;
	public function getDisplay(slotName:String, displayName:String):DisplayData;
	public function getDisplays(slotName:String):Array<DisplayData>;
}
@:native("DragonBones.DisplayData") extern class DisplayData extends BaseObject {
	public var type : DisplayType;
	public var name : String;
	public var path : String;
	public var parent : SkinData;
	public var transform : Transform;
}
@:native("DragonBones.ImageDisplayData") extern class ImageDisplayData extends DisplayData {
	public var pivot : Point;
	public var texture : TextureData;
}
@:native("DragonBones.ArmatureDisplayData") extern class ArmatureDisplayData extends DisplayData {
	public var inheritAnimation : Bool;
	public var actions : Array<ActionData>;
	public var armature : ArmatureData;
	public function addAction(value:ActionData):Void;
}
@:native("DragonBones.MeshDisplayData") extern class MeshDisplayData extends DisplayData {
	public var inheritDeform : Bool;
	public var offset : Float;
	public var weight : WeightData;
	public var glue : GlueData;
	public var texture : TextureData;
}
@:native("DragonBones.BoundingBoxDisplayData") extern class BoundingBoxDisplayData extends DisplayData {
	public var boundingBox : BoundingBoxData;
}
@:native("DragonBones.WeightData") extern class WeightData extends BaseObject {
	public var count : Float;
	public var offset : Float;
	public var bones : Array<BoneData>;
	public function addBone(value:BoneData):Void;
}
@:native("DragonBones.GlueData") extern class GlueData extends BaseObject {
	public var weights : Array<Float>;
	public var meshes : Array<MeshDisplayData>;
	public function addMesh(value:MeshDisplayData):Void;
}
@:native("DragonBones.BoundingBoxData") extern class BoundingBoxData extends BaseObject {
	public var type : BoundingBoxType;
	public var color : Float;
	public var width : Float;
	public var height : Float;
	public function containsPoint(pX:Float, pY:Float):Bool;
	public function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, intersectionPointA:{ public var x : Float; public var y : Float; }, intersectionPointB:{ public var x : Float; public var y : Float; }, normalRadians:{ public var x : Float; public var y : Float; }):Float;
}
@:native("DragonBones.RectangleBoundingBoxData") extern class RectangleBoundingBoxData extends BoundingBoxData {
	static public function rectangleIntersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, xMin:Float, yMin:Float, xMax:Float, yMax:Float, ?intersectionPointA:{ public var x : Float; public var y : Float; }, ?intersectionPointB:{ public var x : Float; public var y : Float; }, ?normalRadians:{ public var x : Float; public var y : Float; }):Float;
}
@:native("DragonBones.EllipseBoundingBoxData") extern class EllipseBoundingBoxData extends BoundingBoxData {
	static public function ellipseIntersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, xC:Float, yC:Float, widthH:Float, heightH:Float, ?intersectionPointA:{ public var x : Float; public var y : Float; }, ?intersectionPointB:{ public var x : Float; public var y : Float; }, ?normalRadians:{ public var x : Float; public var y : Float; }):Float;
}
@:native("DragonBones.PolygonBoundingBoxData") extern class PolygonBoundingBoxData extends BoundingBoxData {
	static public function polygonIntersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, vertices:Array<Float>, ?intersectionPointA:{ public var x : Float; public var y : Float; }, ?intersectionPointB:{ public var x : Float; public var y : Float; }, ?normalRadians:{ public var x : Float; public var y : Float; }):Float;
	public var x : Float;
	public var y : Float;
	public var vertices : Array<Float>;
	public var weight : WeightData;
}
@:native("DragonBones.AnimationData") extern class AnimationData extends BaseObject {
	public var frameIntOffset : Float;
	public var frameFloatOffset : Float;
	public var frameOffset : Float;
	public var frameCount : Float;
	public var playTimes : Float;
	public var duration : Float;
	public var scale : Float;
	public var fadeInTime : Float;
	public var cacheFrameRate : Float;
	public var name : String;
	public var cachedFrames : Array<Bool>;
	public var boneTimelines : Map<Array<TimelineData>>;
	public var surfaceTimelines : Map<Array<TimelineData>>;
	public var slotTimelines : Map<Array<TimelineData>>;
	public var constraintTimelines : Map<Array<TimelineData>>;
	public var animationTimelines : Map<Array<TimelineData>>;
	public var boneCachedFrameIndices : Map<Array<Float>>;
	public var slotCachedFrameIndices : Map<Array<Float>>;
	public var actionTimeline : TimelineData;
	public var zOrderTimeline : TimelineData;
	public var parent : ArmatureData;
	public function cacheFrames(frameRate:Float):Void;
	public function addBoneTimeline(bone:BoneData, timeline:TimelineData):Void;
	public function addSurfaceTimeline(surface:SurfaceData, timeline:TimelineData):Void;
	public function addSlotTimeline(slot:SlotData, timeline:TimelineData):Void;
	public function addConstraintTimeline(constraint:ConstraintData, timeline:TimelineData):Void;
	public function addAnimationTimeline(name:String, timeline:TimelineData):Void;
	public function getBoneTimelines(name:String):Array<TimelineData>;
	public function getSurfaceTimelines(name:String):Array<TimelineData>;
	public function getSlotTimelines(name:String):Array<TimelineData>;
	public function getConstraintTimelines(name:String):Array<TimelineData>;
	public function getAnimationTimelines(name:String):Array<TimelineData>;
	public function getBoneCachedFrameIndices(name:String):Array<Float>;
	public function getSlotCachedFrameIndices(name:String):Array<Float>;
}
@:native("DragonBones.TimelineData") extern class TimelineData extends BaseObject {
	public var type : TimelineType;
	public var offset : Float;
	public var frameIndicesOffset : Float;
}
@:native("DragonBones.AnimationConfig") extern class AnimationConfig extends BaseObject {
	public var pauseFadeOut : Bool;
	public var fadeOutMode : AnimationFadeOutMode;
	public var fadeOutTweenType : TweenType;
	public var fadeOutTime : Float;
	public var pauseFadeIn : Bool;
	public var actionEnabled : Bool;
	public var additiveBlending : Bool;
	public var displayControl : Bool;
	public var resetToPose : Bool;
	public var fadeInTweenType : TweenType;
	public var playTimes : Float;
	public var layer : Float;
	public var position : Float;
	public var duration : Float;
	public var timeScale : Float;
	public var weight : Float;
	public var fadeInTime : Float;
	public var autoFadeOutTime : Float;
	public var name : String;
	public var animation : String;
	public var group : String;
	public var boneMask : Array<String>;
	public function clear():Void;
	public function copyFrom(value:AnimationConfig):Void;
	public function containsBoneMask(name:String):Bool;
	public function addBoneMask(armature:Armature, name:String, ?recursive:Bool):Void;
	public function removeBoneMask(armature:Armature, name:String, ?recursive:Bool):Void;
}
@:native("DragonBones.TextureAtlasData") extern class TextureAtlasData extends BaseObject {
	public var autoSearch : Bool;
	public var width : Float;
	public var height : Float;
	public var scale : Float;
	public var name : String;
	public var imagePath : String;
	public var textures : Map<TextureData>;
	public function copyFrom(value:TextureAtlasData):Void;
	public function createTexture():TextureData;
	public function addTexture(value:TextureData):Void;
	public function getTexture(name:String):TextureData;
}
@:native("DragonBones.TextureData") extern class TextureData extends BaseObject {
	static public function createRectangle():Rectangle;
	public var rotated : Bool;
	public var name : String;
	public var region : Rectangle;
	public var parent : TextureAtlasData;
	public var frame : Rectangle;
	public function copyFrom(value:TextureData):Void;
}
@:native("DragonBones.IArmatureProxy") interface IArmatureProxy extends IEventDispatcher {
	public function dbInit(armature:Armature):Void;
	public function dbClear():Void;
	public function dbUpdate():Void;
	public function dispose(disposeProxy:Bool):Void;
	public var armature : Armature;
	public var animation : Animation;
}
@:native("DragonBones.Armature") extern class Armature extends BaseObject implements IAnimatable {
	public var inheritAnimation : Bool;
	public var userData : Dynamic;
	public var _cacheFrameIndex : Float;
	public var _glueSlots : Array<Slot>;
	public var _constraints : Array<Constraint>;
	public var _armatureData : ArmatureData;
	public var _replaceTextureAtlasData : TextureAtlasData;
	public var _dragonBones : DragonBones;
	public var _parent : Slot;
	public function _sortZOrder(slotIndices:haxe.extern.EitherType<Array<Float>, Int16Array>, offset:Float):Void;
	public function _addBoneToBoneList(value:Bone):Void;
	public function _removeBoneFromBoneList(value:Bone):Void;
	public function _addSlotToSlotList(value:Slot):Void;
	public function _removeSlotFromSlotList(value:Slot):Void;
	public function _bufferAction(action:ActionData, append:Bool):Void;
	public function dispose():Void;
	public function init(armatureData:ArmatureData, proxy:IArmatureProxy, display:Dynamic, dragonBones:DragonBones):Void;
	public function advanceTime(passedTime:Float):Void;
	public function invalidUpdate(?boneName:String, ?updateSlot:Bool):Void;
	public function containsPoint(x:Float, y:Float):Slot;
	public function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, ?intersectionPointA:{ public var x : Float; public var y : Float; }, ?intersectionPointB:{ public var x : Float; public var y : Float; }, ?normalRadians:{ public var x : Float; public var y : Float; }):Slot;
	public function getBone(name:String):Bone;
	public function getBoneByDisplay(display:Dynamic):Bone;
	public function getSlot(name:String):Slot;
	public function getSlotByDisplay(display:Dynamic):Slot;
	public function addBone(value:Bone, parentName:String):Void;
	public function addSlot(value:Slot, parentName:String):Void;
	public function addConstraint(value:Constraint):Void;
	public function removeBone(value:Bone):Void;
	public function removeSlot(value:Slot):Void;
	public function getBones():Array<Bone>;
	public function getSlots():Array<Slot>;
	public var flipX : Bool;
	public var flipY : Bool;
	public var cacheFrameRate : Float;
	public var name : String;
	public var armatureData : ArmatureData;
	public var animation : Animation;
	public var proxy : IArmatureProxy;
	public var eventDispatcher : IEventDispatcher;
	public var display : Dynamic;
	public var replacedTexture : Dynamic;
	public var clock : WorldClock;
	public var parent : Slot;
	public function replaceTexture(texture:Dynamic):Void;
	public function hasEventListener(type:EventStringType):Bool;
	public function addEventListener(type:EventStringType, listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function removeEventListener(type:EventStringType, listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function enableAnimationCache(frameRate:Float):Void;
	public function getDisplay():Dynamic;
}
@:native("DragonBones.TransformObject") extern class TransformObject extends BaseObject {
	public var globalTransformMatrix : Matrix;
	public var global : Transform;
	public var offset : Transform;
	public var origin : Transform;
	public var userData : Dynamic;
	public var _armature : Armature;
	public var _parent : Bone;
	public function _setArmature(value:Armature):Void;
	public function _setParent(value:Bone):Void;
	public function updateGlobalTransform():Void;
	public var armature : Armature;
	public var parent : Bone;
}
@:native("DragonBones.Bone") extern class Bone extends TransformObject {
	public var offsetMode : OffsetMode;
	public var animationPose : Transform;
	public var _transformDirty : Bool;
	public var _childrenTransformDirty : Bool;
	public var _hasConstraint : Bool;
	public var _blendState : BlendState;
	public var _boneData : BoneData;
	public var _cachedFrameIndices : Array<Float>;
	public function init(boneData:BoneData):Void;
	public function update(cacheFrameIndex:Float):Void;
	public function updateByConstraint():Void;
	public function invalidUpdate():Void;
	public function contains(value:TransformObject):Bool;
	public var boneData : BoneData;
	public var visible : Bool;
	public var name : String;
	public function getBones():Array<Bone>;
	public function getSlots():Array<Slot>;
	public var slot : Slot;
}
@:native("DragonBones.Surface") extern class Surface extends Bone {
	public var _vertices : Array<Float>;
	public var _deformVertices : Array<Float>;
	public function _getGlobalTransformMatrix(x:Float, y:Float):Matrix;
}
@:native("DragonBones.Slot") extern class Slot extends TransformObject {
	public var displayController : String;
	public var _colorDirty : Bool;
	public var _meshDirty : Bool;
	public var _zOrder : Float;
	public var _pivotX : Float;
	public var _pivotY : Float;
	public var _colorTransform : ColorTransform;
	public var _deformVertices : Array<Float>;
	public var _displayDatas : Array<DisplayData>;
	public var _slotData : SlotData;
	public var _meshData : MeshDisplayData;
	public var _cachedFrameIndices : Array<Float>;
	public function _updateVisible():Void;
	public function _updateGlueMesh():Void;
	public function _setDisplayIndex(value:Float, ?isAnimation:Bool):Bool;
	public function _setZorder(value:Float):Bool;
	public function _setColor(value:ColorTransform):Bool;
	public function _setDisplayList(value:Array<Dynamic>):Bool;
	public function init(slotData:SlotData, displayDatas:Array<DisplayData>, rawDisplay:Dynamic, meshDisplay:Dynamic):Void;
	public function update(cacheFrameIndex:Float):Void;
	public function updateTransformAndMatrix():Void;
	public function replaceDisplayData(value:DisplayData, ?displayIndex:Float):Void;
	public function containsPoint(x:Float, y:Float):Bool;
	public function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float, ?intersectionPointA:{ public var x : Float; public var y : Float; }, ?intersectionPointB:{ public var x : Float; public var y : Float; }, ?normalRadians:{ public var x : Float; public var y : Float; }):Float;
	public function invalidUpdate():Void;
	public var visible : Bool;
	public var displayIndex : Float;
	public var name : String;
	public var displayList : Array<Dynamic>;
	public var slotData : SlotData;
	public var rawDisplayDatas : Array<DisplayData>;
	public var boundingBoxData : BoundingBoxData;
	public var rawDisplay : Dynamic;
	public var meshDisplay : Dynamic;
	public var display : Dynamic;
	public var childArmature : Armature;
	public function getDisplay():Dynamic;
	public function setDisplay(value:Dynamic):Void;
}
@:native("DragonBones.Constraint") extern class Constraint extends BaseObject {
	public var _constraintData : ConstraintData;
	public var _target : Bone;
	public var _root : Bone;
	public function init(constraintData:ConstraintData, armature:Armature):Void;
	public function update():Void;
	public function invalidUpdate():Void;
	public var name : String;
}
@:native("DragonBones.IKConstraint") extern class IKConstraint extends Constraint {
	public var _bendPositive : Bool;
	public var _weight : Float;
}
@:native("DragonBones.IAnimatable") interface IAnimatable {
	public function advanceTime(passedTime:Float):Void;
	public var clock : WorldClock;
}
@:native("DragonBones.WorldClock") extern class WorldClock implements IAnimatable {
	public var time : Float;
	public var timeScale : Float;
	public function new(?time:Float):Void;
	public function advanceTime(passedTime:Float):Void;
	public function contains(value:IAnimatable):Bool;
	public function add(value:IAnimatable):Void;
	public function remove(value:IAnimatable):Void;
	public function clear():Void;
	public var clock : WorldClock;
}
@:native("DragonBones.Animation") extern class Animation extends BaseObject {
	public var timeScale : Float;
	public function init(armature:Armature):Void;
	public function advanceTime(passedTime:Float):Void;
	public function reset():Void;
	public function stop(?animationName:String):Void;
	public function playConfig(animationConfig:AnimationConfig):AnimationState;
	public function play(?animationName:String, ?playTimes:Float):AnimationState;
	public function fadeIn(animationName:String, ?fadeInTime:Float, ?playTimes:Float, ?layer:Float, ?group:String, ?fadeOutMode:AnimationFadeOutMode):AnimationState;
	public function gotoAndPlayByTime(animationName:String, ?time:Float, ?playTimes:Float):AnimationState;
	public function gotoAndPlayByFrame(animationName:String, ?frame:Float, ?playTimes:Float):AnimationState;
	public function gotoAndPlayByProgress(animationName:String, ?progress:Float, ?playTimes:Float):AnimationState;
	public function gotoAndStopByTime(animationName:String, ?time:Float):AnimationState;
	public function gotoAndStopByFrame(animationName:String, ?frame:Float):AnimationState;
	public function gotoAndStopByProgress(animationName:String, ?progress:Float):AnimationState;
	public function getState(animationName:String):AnimationState;
	public function hasAnimation(animationName:String):Bool;
	public function getStates():Array<AnimationState>;
	public var isPlaying : Bool;
	public var isCompleted : Bool;
	public var lastAnimationName : String;
	public var animationNames : Array<String>;
	public var animations : Map<AnimationData>;
	public var animationConfig : AnimationConfig;
	public var lastAnimationState : AnimationState;
	public function gotoAndPlay(animationName:String, ?fadeInTime:Float, ?duration:Float, ?playTimes:Float, ?layer:Float, ?group:String, ?fadeOutMode:AnimationFadeOutMode, ?pauseFadeOut:Bool, ?pauseFadeIn:Bool):AnimationState;
	public function gotoAndStop(animationName:String, ?time:Float):AnimationState;
	public var animationList : Array<String>;
	public var animationDataList : Array<AnimationData>;
}
@:native("DragonBones.AnimationState") extern class AnimationState extends BaseObject {
	public var actionEnabled : Bool;
	public var additiveBlending : Bool;
	public var displayControl : Bool;
	public var resetToPose : Bool;
	public var playTimes : Float;
	public var layer : Float;
	public var timeScale : Float;
	public var weight : Float;
	public var autoFadeOutTime : Float;
	public var fadeTotalTime : Float;
	public var name : String;
	public var group : String;
	public var _playheadState : Float;
	public var _fadeState : Float;
	public var _subFadeState : Float;
	public var _position : Float;
	public var _duration : Float;
	public var _fadeProgress : Float;
	public var _weightResult : Float;
	public var _blendState : BlendState;
	public var _animationData : AnimationData;
	public var _actionTimeline : ActionTimelineState;
	public var _parent : AnimationState;
	public function init(armature:Armature, animationData:AnimationData, animationConfig:AnimationConfig):Void;
	public function advanceTime(passedTime:Float, cacheFrameRate:Float):Void;
	public function play():Void;
	public function stop():Void;
	public function fadeOut(fadeOutTime:Float, ?pausePlayhead:Bool):Void;
	public function containsBoneMask(name:String):Bool;
	public function addBoneMask(name:String, ?recursive:Bool):Void;
	public function removeBoneMask(name:String, ?recursive:Bool):Void;
	public function removeAllBoneMask():Void;
	public var isFadeIn : Bool;
	public var isFadeOut : Bool;
	public var isFadeComplete : Bool;
	public var isPlaying : Bool;
	public var isCompleted : Bool;
	public var currentPlayTimes : Float;
	public var totalTime : Float;
	public var currentTime : Float;
	public var animationData : AnimationData;
}
@:native("DragonBones.BonePose") extern class BonePose extends BaseObject {
	public var current : Transform;
	public var delta : Transform;
	public var result : Transform;
}
@:native("DragonBones.BlendState") extern class BlendState {
	public var dirty : Bool;
	public var layer : Float;
	public var leftWeight : Float;
	public var layerWeight : Float;
	public var blendWeight : Float;
	public function update(weight:Float, layer:Float):Float;
	public function clear():Void;
}
@:native("DragonBones.TimelineState") extern class TimelineState extends BaseObject {
	public var playState : Float;
	public var currentPlayTimes : Float;
	public var currentTime : Float;
	public function init(armature:Armature, animationState:AnimationState, timelineData:TimelineData):Void;
	public function fadeOut():Void;
	public function update(passedTime:Float):Void;
}
@:native("DragonBones.TweenTimelineState") extern class TweenTimelineState extends TimelineState {

}
@:native("DragonBones.BoneTimelineState") extern class BoneTimelineState extends TweenTimelineState {
	public var bone : Bone;
	public var bonePose : BonePose;
	public function blend(state:Float):Void;
}
@:native("DragonBones.SlotTimelineState") extern class SlotTimelineState extends TweenTimelineState {
	public var slot : Slot;
}
@:native("DragonBones.ConstraintTimelineState") extern class ConstraintTimelineState extends TweenTimelineState {
	public var constraint : Constraint;
}
@:native("DragonBones.ActionTimelineState") extern class ActionTimelineState extends TimelineState {
	public function setCurrentTime(value:Float):Void;
}
@:native("DragonBones.ZOrderTimelineState") extern class ZOrderTimelineState extends TimelineState {

}
@:native("DragonBones.BoneAllTimelineState") extern class BoneAllTimelineState extends BoneTimelineState {

}
@:native("DragonBones.BoneTranslateTimelineState") extern class BoneTranslateTimelineState extends BoneTimelineState {

}
@:native("DragonBones.BoneRotateTimelineState") extern class BoneRotateTimelineState extends BoneTimelineState {

}
@:native("DragonBones.BoneScaleTimelineState") extern class BoneScaleTimelineState extends BoneTimelineState {

}
@:native("DragonBones.SurfaceTimelineState") extern class SurfaceTimelineState extends TweenTimelineState {
	public var surface : Surface;
	public function blend(state:Float):Void;
}
@:native("DragonBones.SlotDislayTimelineState") extern class SlotDislayTimelineState extends SlotTimelineState {

}
@:native("DragonBones.SlotColorTimelineState") extern class SlotColorTimelineState extends SlotTimelineState {

}
@:native("DragonBones.SlotFFDTimelineState") extern class SlotFFDTimelineState extends SlotTimelineState {
	public var meshOffset : Float;
}
@:native("DragonBones.IKConstraintTimelineState") extern class IKConstraintTimelineState extends ConstraintTimelineState {

}
@:native("DragonBones.AnimationTimelineState") extern class AnimationTimelineState extends TweenTimelineState {
	public var animationState : AnimationState;
	public function blend(state:Float):Void;
}
@:native("DragonBones.EventObject") extern class EventObject extends BaseObject {
	static public var START : String;
	static public var LOOP_COMPLETE : String;
	static public var COMPLETE : String;
	static public var FADE_IN : String;
	static public var FADE_IN_COMPLETE : String;
	static public var FADE_OUT : String;
	static public var FADE_OUT_COMPLETE : String;
	static public var FRAME_EVENT : String;
	static public var SOUND_EVENT : String;
	public var time : Float;
	public var type : EventStringType;
	public var name : String;
	public var armature : Armature;
	public var bone : Bone;
	public var slot : Slot;
	public var animationState : AnimationState;
	public var data : UserData;
}
@:native("DragonBones.IEventDispatcher") interface IEventDispatcher {
	public function hasDBEventListener(type:EventStringType):Bool;
	public function dispatchDBEvent(type:EventStringType, eventObject:EventObject):Void;
	public function addDBEventListener(type:EventStringType, listener:haxe.Constraints.Function, thisObject:Dynamic):Void;
	public function removeDBEventListener(type:EventStringType, listener:haxe.Constraints.Function, thisObject:Dynamic):Void;
	public function hasEvent(type:EventStringType):Bool;
	public function addEvent(type:EventStringType, listener:haxe.Constraints.Function, thisObject:Dynamic):Void;
	public function removeEvent(type:EventStringType, listener:haxe.Constraints.Function, thisObject:Dynamic):Void;
}
@:native("DragonBones.DataParser") extern class DataParser {
	@:overload(function(rawData:Dynamic):DragonBonesData { })
	public function parseDragonBonesData(rawData:Dynamic, scale:Float):DragonBonesData;
	@:overload(function(rawData:Dynamic, ?scale:Float):Dynamic { })
	public function parseTextureAtlasData(rawData:Dynamic, textureAtlasData:TextureAtlasData, scale:Float):Bool;
}
@:native("DragonBones.ObjectDataParser") extern class ObjectDataParser extends DataParser {
	static public function getInstance():ObjectDataParser;
}
@:native("DragonBones.ActionFrame") extern class ActionFrame {
	public var frameStart : Float;
	public var actions : Array<Float>;
}
@:native("DragonBones.BinaryDataParser") extern class BinaryDataParser extends ObjectDataParser {

}
@:native("DragonBones.BaseFactory") extern class BaseFactory {
	public var autoSearch : Bool;
	public function new(?dataParser:DataParser):Void;
	public function parseDragonBonesData(rawData:Dynamic, ?name:String, ?scale:Float):DragonBonesData;
	public function parseTextureAtlasData(rawData:Dynamic, textureAtlas:Dynamic, ?name:String, ?scale:Float):TextureAtlasData;
	public function updateTextureAtlasData(name:String, textureAtlases:Array<Dynamic>):Void;
	public function getDragonBonesData(name:String):DragonBonesData;
	public function addDragonBonesData(data:DragonBonesData, ?name:String):Void;
	public function removeDragonBonesData(name:String, ?disposeData:Bool):Void;
	public function getTextureAtlasData(name:String):Array<TextureAtlasData>;
	public function addTextureAtlasData(data:TextureAtlasData, ?name:String):Void;
	public function removeTextureAtlasData(name:String, ?disposeData:Bool):Void;
	public function getArmatureData(name:String, ?dragonBonesName:String):ArmatureData;
	public function clear(?disposeData:Bool):Void;
	public function buildArmature(armatureName:String, ?dragonBonesName:String, ?skinName:String, ?textureAtlasName:String):Armature;
	public function replaceDisplay(slot:Slot, displayData:DisplayData, ?displayIndex:Float):Void;
	public function replaceSlotDisplay(dragonBonesName:String, armatureName:String, slotName:String, displayName:String, slot:Slot, ?displayIndex:Float):Bool;
	public function replaceSlotDisplayList(dragonBonesName:String, armatureName:String, slotName:String, slot:Slot):Bool;
	public function replaceSkin(armature:Armature, skin:SkinData, ?isOverride:Bool, ?exclude:Array<String>):Bool;
	public function replaceAnimation(armature:Armature, armatureData:ArmatureData, ?isOverride:Bool):Bool;
	public function getAllDragonBonesData():Map<DragonBonesData>;
	public function getAllTextureAtlasData():Map<Array<TextureAtlasData>>;
	public var clock : WorldClock;
	public var dragonBones : DragonBones;
	public function changeSkin(armature:Armature, skin:SkinData, ?exclude:Array<String>):Bool;
	public function copyAnimationsToArmature(toArmature:Armature, fromArmatreName:String, ?fromSkinName:String, ?fromDragonBonesDataName:String, ?replaceOriginalAnimation:Bool):Bool;
}
@:native("DragonBones.BuildArmaturePackage") extern class BuildArmaturePackage {
	public var dataName : String;
	public var textureAtlasName : String;
	public var data : DragonBonesData;
	public var armature : ArmatureData;
	public var skin : SkinData;
}
@:native("DragonBones.DragonBonesTopLevel") extern class DragonBonesTopLevel {
	static var webAssemblyModule : Dynamic;
	static var jsb : Dynamic;
	static var CC_EDITOR : Bool;
	static var CC_PREVIEW : Bool;
	static var CC_DEV : Bool;
	static var CC_DEBUG : Bool;
	static var CC_BUILD : Bool;
	static var CC_JSB : Bool;
	static var CC_TEST : Bool;
	static var CC_WECHATGAME : Bool;
	static var CC_QQPLAY : Bool;
}
