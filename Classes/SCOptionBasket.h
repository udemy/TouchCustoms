//
//  SCOptionBasket.h
//  TouchCustoms
//
//  Created by Aleks Nesterow on 10/26/10.
//	aleks@screencustoms.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//	
//	Purpose
//	Contains a full list of elements and remembers the selected element or a series of elements.
//

typedef enum {
	SCOptionSingleSelect,
	SCOptionMultipleSelect
} SCOptionSelectType;

@interface SCOptionBasket : NSObject <NSCoding>
{
@private
	SCOptionSelectType _selectType;
	NSMutableIndexSet *_selectedIndexes;
}

@property (nonatomic, assign) SCOptionSelectType selectType;
@property (nonatomic, readonly) NSIndexSet *selectedIndexes;

- (id)initWithSelectType:(SCOptionSelectType)selectType;
/** If the item is already selected, it becomes deselected (removed from selectedItems). */
- (void)toggleItem:(NSUInteger)itemIndex;
- (void)selectAllItems;
- (void)selectNoItems;

@end

@interface SCOptionBasket (Protected)

- (void)postProcessCreatedIndexes;
- (NSString *)selectedItemsDescription;

@end

@interface SCOptionBasket (MustOverride)

- (NSArray *)items;
- (NSArray *)itemNames;

@end
