package cc;

@:native("Anysdk.AgentManager") extern class AgentManager {
	public function init(appKey:String, appSecret:String, privateKey:String, oauthLoginServer:String):Void;
	public function loadAllPlugins(callback:haxe.Constraints.Function, target:Dynamic):Void;
	public function unloadAllPlugins():Void;
	public function getUserPlugin():anysdk.ProtocolUser;
	public function getIAPPlugins():Array<anysdk.ProtocolIAP>;
	public function getIAPPlugin():anysdk.ProtocolIAP;
	public function getSocialPlugin():anysdk.ProtocolSocial;
	public function getSharePlugin():anysdk.ProtocolShare;
	public function getAnalyticsPlugin():anysdk.ProtocolAnalytics;
	public function getAdsPlugin():anysdk.ProtocolAds;
	public function getPushPlugin():anysdk.ProtocolPush;
	public function getRECPlugin():anysdk.ProtocolREC;
	public function getCrashPlugin():anysdk.ProtocolCrash;
	public function getAdTrackingPlugin():anysdk.ProtocolAdTracking;
	public function getCustomPlugin():anysdk.ProtocolCustom;
	public function getCustomParam():String;
	public function getChannelId():String;
	public function isAnaylticsEnabled():Bool;
	public function setIsAnaylticsEnabled(enabled:Bool):Void;
	static public function end():Void;
	static public function getInstance():anysdk.AgentManager;
}
@:native("Anysdk.PluginProtocol") extern class PluginProtocol {
	public function isFunctionSupported(functionName:String):Bool;
	public function getPluginName():String;
	public function getPluginVersion():String;
	public function getSDKVersion():String;
	public function callFuncWithParam(funName:String, args:haxe.extern.Rest<Dynamic>):Void;
	public function callStringFuncWithParam(funName:String, args:haxe.extern.Rest<Dynamic>):String;
	public function callIntFuncWithParam(funName:String, args:haxe.extern.Rest<Dynamic>):Float;
	public function callBoolFuncWithParam(funName:String, args:haxe.extern.Rest<Dynamic>):Bool;
	public function callFloatFuncWithParam(funName:String, args:haxe.extern.Rest<Dynamic>):Float;
}
@:native("Anysdk.ProtocolUser") extern class ProtocolUser extends PluginProtocol {
	public function login(args:haxe.extern.Rest<Dynamic>):Void;
	public function isLogined():Bool;
	public function getUserID():String;
	public function getPluginId():String;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
	public function logout():Void;
	public function showToolBar(place:anysdk.ToolBarPlace):Void;
	public function hideToolBar():Void;
	public function enterPlatform():Void;
	public function exit():Void;
	public function pause():Void;
	public function realNameRegister():Void;
	public function antiAddictionQuery():Void;
	public function submitLoginGameRole(data:Dynamic):Void;
	public function getUserInfo(info:Dynamic):Void;
	public function getAvailableLoginType(info:Dynamic):Void;
	public function setLoginType(loginType:String):Void;
	public function sendToDesktop():Void;
	public function openBBS():Void;
}
@:native("Anysdk.ProtocolIAP") extern class ProtocolIAP extends PluginProtocol {
	public function payForProduct(info:Dynamic):Void;
	public function getOrderId():String;
	static public function resetPayState():Void;
	public function getPluginId():String;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
}
@:native("Anysdk.ProtocolAnalytics") extern class ProtocolAnalytics extends PluginProtocol {
	public function startSession():Void;
	public function stopSession():Void;
	public function setSessionContinueMillis(millis:Float):Void;
	public function logError(errorId:String, message:String):Void;
	public function logEvent(errorId:String, args:haxe.extern.Rest<Dynamic>):Void;
	public function logTimedEventBegin(eventId:String):Void;
	public function logTimedEventEnd(eventId:String):Void;
	public function setCaptureUncaughtException(enabled:Bool):Void;
	public function setAccount(paramMap:Dynamic):Void;
	public function onChargeRequest(paramMap:Dynamic):Void;
	public function onChargeSuccess(orderID:String):Void;
	public function onChargeFail(paramMap:Dynamic):Void;
	public function onChargeOnlySuccess(paramMap:Dynamic):Void;
	public function onPurchase(paramMap:Dynamic):Void;
	public function onUse(paramMap:Dynamic):Void;
	public function onReward(paramMap:Dynamic):Void;
	public function startLevel(paramMap:Dynamic):Void;
	public function finishLevel(levelID:String):Void;
	public function failLevel(paramMap:Dynamic):Void;
	public function startTask(paramMap:Dynamic):Void;
	public function finishTask(taskID:String):Void;
	public function failTask(paramMap:Dynamic):Void;
}
@:native("Anysdk.ProtocolShare") extern class ProtocolShare extends PluginProtocol {
	public function share(info:Dynamic):Void;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
}
@:native("Anysdk.ProtocolAds") extern class ProtocolAds extends PluginProtocol {
	public function hideAds(adstype:anysdk.AdsType, idx:Float):Void;
	public function preloadAds(adstype:anysdk.AdsType, idx:Float):Void;
	public function queryPoints():Float;
	public function isAdTypeSupported(arg0:anysdk.AdsType):Bool;
	public function spendPoints(points:Float):Void;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
}
@:native("Anysdk.ProtocolSocial") extern class ProtocolSocial extends PluginProtocol {
	public function signIn():Void;
	public function signOut():Void;
	public function submitScore(leadboardID:String, score:Float):Void;
	public function showLeaderboard(leaderboardID:String):Void;
	public function showAchievements():Void;
	public function share(info:Dynamic):Void;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
	public function pauseRecording():Void;
	public function interact():Void;
	public function subscribe():Void;
}
@:native("Anysdk.ProtocolPush") extern class ProtocolPush extends PluginProtocol {
	public function startPush():Void;
	public function closePush():Void;
	public function delAlias(alias:String):Void;
	public function setAlias(alias:String):Void;
	public function delTags(tags:Dynamic):Void;
	public function setTags(tags:Dynamic):Void;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
}
@:native("Anysdk.ProtocolCrash") extern class ProtocolCrash extends PluginProtocol {
	public function setUserIdentifier(identifier:String):Void;
	public function reportException(message:String, exception:String):Void;
	public function leaveBreadcrumb(breadcrumb:String):Void;
}
@:native("Anysdk.ProtocolREC") extern class ProtocolREC extends PluginProtocol {
	public function share(info:Dynamic):Void;
	public function startRecording():Void;
	public function stopRecording():Void;
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
	public function pauseRecording():Void;
	public function resumeRecording():Void;
	public function isAvailable():Bool;
	public function isRecording():Bool;
	public function showToolBar():Void;
	public function hideToolBar():Void;
	public function showVideoCenter():Void;
	public function enterPlatform():Void;
	public function setMetaData(info:Dynamic):Void;
}
@:native("Anysdk.ProtocolAdTracking") extern class ProtocolAdTracking extends PluginProtocol {
	public function onPay(productInfo:Dynamic):Void;
	public function onLogin(userInfo:Dynamic):Void;
	public function onRegister(userId:String):Void;
	public function trackEvent(eventId:String, paramMap:Dynamic):Void;
	public function onCreateRole(userInfo:Dynamic):Void;
	public function onLevelUp(info:Dynamic):Void;
	public function onStartToPay(info:Dynamic):Void;
}
@:native("Anysdk.ProtocolCustom") extern class ProtocolCustom extends PluginProtocol {
	public function setListener(listener:haxe.Constraints.Function, target:Dynamic):Void;
	public function getListener():haxe.Constraints.Function;
}
@:native("Anysdk.PluginParam") extern class PluginParam {
	static public function create(parameters:haxe.extern.EitherType<Float, haxe.extern.EitherType<String, Dynamic>>):anysdk.PluginParam;
}
@:enum abstract UserActionResultCode(Int) {
	var kInitSuccess = 0;
	var kInitFail = 0;
	var kLoginSuccess = 0;
	var kLoginNetworkError = 0;
	var kLoginNoNeed = 0;
	var kLoginFail = 0;
	var kLoginCancel = 0;
	var kLogoutSuccess = 0;
	var kLogoutFail = 0;
	var kPlatformEnter = 0;
	var kPlatformBack = 0;
	var kPausePage = 0;
	var kExitPage = 0;
	var kAntiAddictionQuery = 0;
	var kRealNameRegister = 0;
	var kAccountSwitchSuccess = 0;
	var kAccountSwitchFail = 0;
	var kOpenShop = 0;
	var kAccountSwitchCancel = 0;
	var kUserExtension = 0;
	var kSendToDesktopSuccess = 0;
	var kSendToDesktopFail = 0;
	var kGetAvailableLoginTypeSuccess = 0;
	var kGetAvailableLoginTypeFail = 0;
	var kGetUserInfoSuccess = 0;
	var kGetUserInfoFail = 0;
	var kOpenBBSSuccess = 0;
	var kOpenBBSFail = 0;
}
@:enum abstract ToolBarPlace(Int) {
	var kToolBarTopLeft = 0;
	var kToolBarTopRight = 0;
	var kToolBarMidLeft = 0;
	var kToolBarMidRight = 0;
	var kToolBarBottomLeft = 0;
	var kToolBarBottomRight = 0;
}
@:enum abstract PayResultCode(Int) {
	var kPaySuccess = 0;
	var kPayFail = 0;
	var kPayCancel = 0;
	var kPayNetworkError = 0;
	var kPayProductionInforIncomplete = 0;
	var kPayInitSuccess = 0;
	var kPayInitFail = 0;
	var kPayNowPaying = 0;
	var kPayReStringgeSuccess = 0;
	var kPayExtension = 0;
	var kPayNeedLoginAgain = 0;
	var kRequestSuccess = 0;
	var kRequestFail = 0;
}
@:enum abstract AccountType(Int) {
	var ANONYMOUS = 0;
	var REGISTED = 0;
	var SINA_WEIBO = 0;
	var TENCENT_WEIBO = 0;
	var QQ = 0;
	var ND91 = 0;
}
@:enum abstract AccountOperate(Int) {
	var LOGIN = 0;
	var LOGOUT = 0;
	var REGISTER = 0;
}
@:enum abstract AccountGender(Int) {
	var MALE = 0;
	var FEMALE = 0;
	var UNKNOWN = 0;
}
@:enum abstract TaskType(Int) {
	var GUIDE_LINE = 0;
	var MAIN_LINE = 0;
	var BRANCH_LINE = 0;
	var DAILY = 0;
	var ACTIVITY = 0;
	var OTHER = 0;
}
@:enum abstract ShareResultCode(Int) {
	var kShareSuccess = 0;
	var kShareFail = 0;
	var kShareCancel = 0;
	var kShareNetworkError = 0;
	var kShareExtension = 0;
}
@:enum abstract SocialRetCode(Int) {
	var kScoreSubmitSucceed = 0;
	var kScoreSubmitfail = 0;
	var kAchUnlockSucceed = 0;
	var kAchUnlockFail = 0;
	var kSocialSignInSucceed = 0;
	var kSocialSignInFail = 0;
	var kSocialSignOutSucceed = 0;
	var kSocialSignOutFail = 0;
	var kSocialGetGameFriends = 0;
	var kSocialExtensionCode = 0;
	var kSocialGetFriendsInfoSuccess = 0;
	var kSocialGetFriendsInfoFail = 0;
	var kSocialAlreadySubscription = 0;
	var kSocialNoSubscription = 0;
	var kSocialSubscriptionFail = 0;
}
@:enum abstract AdsResultCode(Int) {
	var kAdsReceived = 0;
	var kAdsShown = 0;
	var kAdsDismissed = 0;
	var kPointsSpendSucceed = 0;
	var kPointsSpendFailed = 0;
	var kNetworkError = 0;
	var kUnknownError = 0;
	var kOfferWallOnPointsChanged = 0;
	var kRewardedVideoWithReward = 0;
	var kInAppPurchaseFinished = 0;
	var kAdsClicked = 0;
	var kAdsExtension = 0;
}
@:enum abstract AdsPos(Int) {
	var kPosCenter = 0;
	var kPosTop = 0;
	var kPosTopLeft = 0;
	var kPosTopRight = 0;
	var kPosBottom = 0;
	var kPosBottomLeft = 0;
	var kPosBottomRight = 0;
}
@:enum abstract AdsType(Int) {
	var AD_TYPE_BANNER = 0;
	var AD_TYPE_FULLSCREEN = 0;
	var AD_TYPE_MOREAPP = 0;
	var AD_TYPE_OFFERWALL = 0;
	var AD_TYPE_REWARDEDVIDEO = 0;
	var AD_TYPE_NATIVEEXPRESS = 0;
	var AD_TYPE_NATIVEADVANCED = 0;
}
@:enum abstract PushActionResultCode(Int) {
	var kPushReceiveMessage = 0;
	var kPushExtensionCode = 0;
}
@:enum abstract CustomResultCode(Int) {
	var kCustomExtension = 0;
}
@:enum abstract RECResultCode(Int) {
	var kRECInitSuccess = 0;
	var kRECInitFail = 0;
	var kRECStartRecording = 0;
	var kRECStopRecording = 0;
	var kRECPauseRecording = 0;
	var kRECResumeRecording = 0;
	var kRECEnterSDKPage = 0;
	var kRECQuitSDKPage = 0;
	var kRECShareSuccess = 0;
	var kRECShareFail = 0;
	var kRECExtension = 0;
}
@:native("Anysdk.AnysdkTopLevel") extern class AnysdkTopLevel {
	static var agentManager : anysdk.AgentManager;
}
