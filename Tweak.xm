#define PLIST_PATH @"/var/mobile/Library/Preferences/com.1conan.translucentnotification.plist"

float cAlphaKey;
 
@interface NCNotificationShortLookView
-(void)setBackgroundView:(id)arg1;
@end

%hook NCNotificationShortLookView
-(void)setBackgroundView:(id)arg1 {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	cAlphaKey = ([prefs objectForKey:@"AlphaKey"] ? [[prefs objectForKey:@"AlphaKey"] floatValue] : 0.5);
	[arg1 setAlpha:cAlphaKey];
	%orig;
}
%end