//
//  SCTabOrder.h
//  TouchCustoms
//
//  Created by Aleks Nesterow on 2/12/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screen Customs s.r.o.
//	All rights reserved.
//	
//	Purpose
//	Allows to go from one field to another using Next button on the screen keyboard.
//	The last text-field when Done clicked will close the keyboard.
//

@class SCTabOrder;

@protocol SCTabOrderDelegate <NSObject>

@required

- (BOOL)tabOrderShouldReturn:(SCTabOrder *)tabOrder;

@optional

- (UIReturnKeyType)returnKeyTypeForLastTextField:(SCTabOrder *)tabOrder;

@end

@class SCTabOrderGroup;

@interface SCTabOrder : NSObject<UITextFieldDelegate> {

@private
	id <SCTabOrderDelegate> _delegate;
	NSMutableArray *_textFields;
}

@property (nonatomic, assign) IBOutlet id <SCTabOrderDelegate> delegate;

- (void)addTextField:(UITextField *)textField;
- (void)removeTextField:(UITextField *)textField;

@end
