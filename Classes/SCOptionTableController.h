//
//  SCOptionTableController.h
//  TouchCustoms
//
//  Created by Aleks Nesterow on 10/26/10.
//	aleks@screencustoms.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//	
//	Purpose
//	
//	Allows to select a single element or a series of elements out of the list.
//	Selection type is regulated by SCOptionBasket parameters.
//

#import "SCOptionBasket.h"

@interface SCOptionTableController : UITableViewController
{
@private
	SCOptionBasket *_optionBasket;
}

@property (nonatomic, retain) SCOptionBasket *optionBasket;

@end
