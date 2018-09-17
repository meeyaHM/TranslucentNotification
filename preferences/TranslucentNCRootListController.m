#include "TranslucentNCRootListController.h"
#include <notify.h>

@implementation TranslucentNCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"TranslucentNC" target:self] retain];
	}

	return _specifiers;
}

-(void)developerLink {
	NSString *urlString = @"https://1conan.com/about";
	NSURL *url = [NSURL URLWithString:[urlString 
		stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
	[[UIApplication sharedApplication] openURL:url];
}

-(void)respring {
	notify_post("com.1conan.translucentnotif/respring");
}

-(void)confirmRespring {

	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Respring"
                         		 	message:@"Are you sure you want to respring?"
                          		preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Respring" 
															style:UIAlertActionStyleDefault
                          		handler:^(UIAlertAction * action) {
																[self respring];
															}];
  UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" 
															style:UIAlertActionStyleCancel 
															handler:nil];

	[alert addAction:ok];
	[alert addAction:cancel];
	[self presentViewController:alert animated:YES completion:nil];

}



@end
