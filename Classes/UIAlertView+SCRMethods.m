//
//  UIAlertView+SCRMethods.m
//  TouchCustoms
//
//  Created by Aleks Nesterow-Rutkowski on 3/14/10.
//	aleks@screencustoms.com
//

#import "UIAlertView+SCRMethods.h"

@implementation UIAlertView (SCRMethods)

+ (void)showYesNoAlertWithMessage:(NSString *)message delegate:(id)delegate
{
    [[UIAlertView yesNoAlertViewWithMessage:message delegate:delegate] show];
}

+ (UIAlertView *)yesNoAlertViewWithMessage:(NSString *)message delegate:(id)delegate
{
    UIAlertView *result = [[[UIAlertView alloc] initWithTitle:message message:nil delegate:delegate
                                            cancelButtonTitle:NSLocalizedString(@"No", @"")
                                            otherButtonTitles:NSLocalizedString(@"Yes", @""), nil] autorelease];
    return result;
}

+ (UIAlertView *)alertViewFromError:(NSError *)error
{	
	UIAlertView *result = [[[UIAlertView alloc] 
							initWithTitle:NSLocalizedString([error localizedFailureReason], @"")
							message:NSLocalizedString([error localizedDescription], @"")
							delegate:nil
							cancelButtonTitle:NSLocalizedString(@"OK", @"")
							otherButtonTitles:nil] autorelease];
	return result;
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message
{	
	[[[[UIAlertView alloc] initWithTitle:title
								 message:message
								delegate:nil
					   cancelButtonTitle:NSLocalizedString(@"OK", @"")
					   otherButtonTitles:nil] autorelease] show];
}

+ (void)showWithMessage:(NSString *)message
{	
	[UIAlertView showWithTitle:message message:nil];
}

@end
