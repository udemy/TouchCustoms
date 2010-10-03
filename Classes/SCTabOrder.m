//
//  SCTabOrder.m
//  TouchCustoms
//
//  Created by Aleks Nesterow on 2/12/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screen Customs s.r.o.
//	All rights reserved.
//

#import "SCTabOrder.h"
#import "SCMemoryManagement.h"

@implementation SCTabOrder

@synthesize delegate = _delegate;

- (id)init
{
	if (self = [super init])
	{
		_textFields = [[NSMutableArray alloc] initWithCapacity:8];
	}
	
	return self;
}

- (void)dealloc
{	
	for (UITextField *textField in _textFields)
	{
		textField.delegate = nil;
	}
	
	SC_RELEASE_SAFELY(_textFields);
	
	[super dealloc];
}

- (void)addTextField:(UITextField *)textField
{
	if (![_textFields containsObject:textField])
	{
		[[_textFields lastObject] setReturnKeyType:UIReturnKeyNext];
		textField.delegate = self;
		
		UIReturnKeyType returnKeyType = UIReturnKeyDone;
		
		if ([self.delegate respondsToSelector:@selector(returnKeyTypeForLastTextField:)])
		{
			returnKeyType = [self.delegate returnKeyTypeForLastTextField:self];
		}
		
		textField.returnKeyType = returnKeyType;
		[_textFields addObject:textField];
	}
}

- (void)removeTextField:(UITextField *)textField
{	
	if ([_textFields containsObject:textField])
	{
		textField.delegate = nil;
		textField.returnKeyType = UIReturnKeyDefault;
		[_textFields removeObject:textField];
		
		UIReturnKeyType returnKeyType = UIReturnKeyDone;
		
		if ([self.delegate respondsToSelector:@selector(returnKeyTypeForLastTextField:)])
		{
			returnKeyType = [self.delegate returnKeyTypeForLastTextField:self];
		}
		
		[[_textFields lastObject] setReturnKeyType:returnKeyType];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	BOOL handled = [self.delegate tabOrderShouldReturn:self];
	
	if (!handled)
	{
		if ([_textFields containsObject:textField])
		{
			if (textField == [_textFields lastObject])
			{
				[textField resignFirstResponder];
			} 
			else
			{
				[[_textFields objectAtIndex:[_textFields indexOfObject:textField] + 1] becomeFirstResponder];
			}
		}
	}
	
	return YES;
}

@end
