//
//  SCOptionTableController.m
//  TouchCustoms
//
//  Created by Aleks Nesterow on 10/26/10.
//	aleks@screencustoms.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//

#import "SCOptionTableController.h"

#import "SCColorScheme.h"
#import "SCLog.h"
#import "SCMemoryManagement.h"

#define kPurpleColor	RGB(50, 79, 133)

@implementation SCOptionTableController

@synthesize optionBasket = _optionBasket;

- (void)dealloc
{
	SC_RELEASE_SAFELY(_optionBasket);
	
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.optionBasket.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *result = nil;
	
	static NSString *CellIdentifier = @"option-cell";
	result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (!result)
	{
		result = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
										 reuseIdentifier:CellIdentifier] autorelease];
		
	}
	
	result.textLabel.text = [self.optionBasket.itemNames objectAtIndex:indexPath.row];
	
	if ([self.optionBasket.selectedIndexes containsIndex:indexPath.row])
	{
		result.accessoryType = UITableViewCellAccessoryCheckmark;
		result.textLabel.textColor = kPurpleColor;
	}
	else
	{
		result.accessoryType = UITableViewCellAccessoryNone;
		result.textLabel.textColor = [UIColor blackColor];
	}
	
	return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	switch (self.optionBasket.selectType)
	{
		case SCOptionSingleSelect:
		{
			[self.optionBasket selectNoItems];
			
			NSArray *visibleRowIndexPathList = [tableView indexPathsForVisibleRows];
			
			for (NSIndexPath *visibleRowIndexPath in visibleRowIndexPathList)
			{
				UITableViewCell *cell = [tableView cellForRowAtIndexPath:visibleRowIndexPath];
				cell.accessoryType = UITableViewCellAccessoryNone;
				cell.textLabel.textColor = [UIColor blackColor];
			}
			
			break;
		}
		case SCOptionMultipleSelect:
		{
			break;
		}
	}
	
	[self.optionBasket toggleItem:indexPath.row];
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	if (UITableViewCellAccessoryCheckmark == cell.accessoryType)
	{
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.textLabel.textColor = [UIColor blackColor];
	}
	else
	{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		cell.textLabel.textColor = kPurpleColor;
	}
}

@end
