//
//  UIAlertView+SCRMethods.m
//  TouchCustoms
//
//  Created by Aleks Nesterow on 3/14/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//

#import "UIAlertView+SCRMethods.h"

@implementation UIAlertView (SCRMethods)

+ (UIAlertView *)alertViewFromError:(NSError *)error {
	
	UIAlertView *result = [[[UIAlertView alloc] initWithTitle:[error localizedFailureReason]
													  message:[error localizedDescription]
													 delegate:nil
											cancelButtonTitle:NSLocalizedString(@"OK", @"")
											otherButtonTitles:nil] autorelease];
	return result;
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message {

	[[[[UIAlertView alloc] initWithTitle:title
								 message:message
								delegate:nil
					   cancelButtonTitle:NSLocalizedString(@"OK", @"")
					   otherButtonTitles:nil] autorelease] show];
}

+ (void)showWithMessage:(NSString *)message {

	[UIAlertView showWithTitle:nil message:message];
}

@end
