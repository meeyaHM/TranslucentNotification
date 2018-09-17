#define PLIST_PATH @"/var/mobile/Library/Preferences/com.1conan.translucentnotification.plist"

float cAlphaKey;
 
@interface NCNotificationShortLookView
-(void)setBackgroundView:(id)arg1;
@end

@interface FBSystemService
+(id)sharedInstance;
-(void)exitAndRelaunch:(BOOL)arg1;
@end

%hook NCNotificationShortLookView
-(void)setBackgroundView:(id)arg1 {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	cAlphaKey = ([prefs objectForKey:@"AlphaKey"] ? [[prefs objectForKey:@"AlphaKey"] floatValue] : 0.5);
	[arg1 setAlpha:cAlphaKey];
	%orig;
}
%end

void respring() {
	[[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}

%ctor {
	%init();
	
	CFNotificationCenterAddObserver(
		CFNotificationCenterGetDarwinNotifyCenter(), 
		NULL, 
		(CFNotificationCallback)respring, 
		(CFStringRef)@"com.1conan.translucentnotif/respring", 
		NULL, 
		CFNotificationSuspensionBehaviorDeliverImmediately
	);
}
