package cc;

@:native("Sp.Skeleton") extern class Skeleton extends cc.Component {
	public var paused : Bool;
	public var skeletonData : SkeletonData;
	public var defaultSkin : String;
	public var defaultAnimation : String;
	public var animation : String;
	public var _defaultSkinIndex : Float;
	public var loop : Bool;
	public var premultipliedAlpha : Bool;
	public var timeScale : Float;
	public var debugSlots : Bool;
	public var debugBones : Bool;
	public function setSkeletonData(skeletonData:sp.spine.SkeletonData):Void;
	public function setAnimationStateData(stateData:sp.spine.AnimationStateData):Void;
	public function updateWorldTransform():Void;
	public function setToSetupPose():Void;
	public function setBonesToSetupPose():Void;
	public function setSlotsToSetupPose():Void;
	public function findBone(boneName:String):sp.spine.Bone;
	public function findSlot(slotName:String):sp.spine.Slot;
	public function setSkin(skinName:String):sp.spine.Skin;
	public function getAttachment(slotName:String, attachmentName:String):sp.spine.Attachment;
	public function setAttachment(slotName:String, attachmentName:String):Void;
	public function getTextureAtlas(regionAttachment:haxe.extern.EitherType<sp.spine.RegionAttachment, spine.BoundingBoxAttachment>):sp.spine.TextureAtlasRegion;
	public function setMix(fromAnimation:String, toAnimation:String, duration:Float):Void;
	public function setAnimation(trackIndex:Float, name:String, loop:Bool):sp.spine.TrackEntry;
	public function addAnimation(trackIndex:Float, name:String, loop:Bool, ?delay:Float):sp.spine.TrackEntry;
	public function findAnimation(name:String):sp.spine.Animation;
	public function getCurrent(trackIndex:Void):sp.spine.TrackEntry;
	public function clearTracks():Void;
	public function clearTrack(trackIndex:Float):Void;
	public function setStartListener(listener:haxe.Constraints.Function):Void;
	public function setInterruptListener(listener:haxe.Constraints.Function):Void;
	public function setEndListener(listener:haxe.Constraints.Function):Void;
	public function setDisposeListener(listener:haxe.Constraints.Function):Void;
	public function setCompleteListener(listener:haxe.Constraints.Function):Void;
	public function setEventListener(listener:haxe.Constraints.Function):Void;
	public function setTrackStartListener(entry:sp.spine.TrackEntry, listener:haxe.Constraints.Function):Void;
	public function setTrackInterruptListener(entry:sp.spine.TrackEntry, listener:haxe.Constraints.Function):Void;
	public function setTrackEndListener(entry:sp.spine.TrackEntry, listener:haxe.Constraints.Function):Void;
	public function setTrackDisposeListener(entry:sp.spine.TrackEntry, listener:haxe.Constraints.Function):Void;
	public function setTrackCompleteListener(entry:sp.spine.TrackEntry, listener:sp.spine.TrackEntry -> Float -> Void):Void;
	@:overload(function():sp.spine.AnimationState { })
	public function setTrackEventListener(entry:sp.spine.TrackEntry, listener:haxe.Constraints.Function):Void;
}
@:enum abstract AnimationEventType(Int) {
	var START = 0;
	var END = 0;
	var COMPLETE = 0;
	var EVENT = 0;
}
@:native("Sp.SkeletonData") extern class SkeletonData extends cc.Asset {
	public var skeletonJson : Dynamic;
	public var atlasText : String;
	public var textures : Array<cc.Texture2D>;
	public var scale : Float;
	public function getRuntimeData(?quiet:Bool):sp.spine.SkeletonData;
}
