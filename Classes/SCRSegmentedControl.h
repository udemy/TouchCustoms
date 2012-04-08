//
//  SCRSegmentedControl.h
//  TouchCustoms
//
//  Created by Aleks Nesterow-Rutkowski on 1/25/10.
//	aleks@screencustoms.com
//	
//	Purpose
//	Represents a multi-row segmented control.
//

#import "SCRSegmentColorScheme.h"

enum {
	SCRSegmentedControlNoSegment = -1 /* Segment index for no selected segment. */
};

@interface SCRSegmentedControl : UIControl {

@private
	SCRSegmentColorScheme _colorScheme;
	NSUInteger _columnCount, _rowCount;
	NSArray *_columnPattern;
    NSArray *_columnPropertions;
	NSArray *_segmentTitles;
	NSArray *_segmentImages;
	NSMutableArray *_segments;
	NSInteger _selectedIndex;
}

@property (nonatomic, assign) SCRSegmentColorScheme colorScheme;
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) NSUInteger rowCount;
/** 
  * Overrides columnCount. Allows you to have e. g. 2 columns in the first row and 3 columns in the second row.
  * 
  * Initialization example:
  * [NSArray arrayWithObjects:[NSNumber numberWithUnsignedInt:2], [NSNumber numberWithUnsignedInt:3], nil];
  * 
  */
@property (nonatomic, retain) NSArray *columnPattern;
/**
  * If set, allows to specify column proportions for each row.
  * 
  * Initialization example for a control with 2 rows, 3 equal-width cells in the first rows,
  * and custom proportions for the cells in the second row.
  * 
  * NSArray *firstRowProportions = [NSArray arrayWithObjects:nil];
  * NSArray *secondRowProportions = [NSArray arrayWithObjects:[NSNumber numberWithFloat:.4]
  * , [NSNumber numberWithFloat:.2], [NSNumber numberWithFloat:.2]
  * , [NSNumber numberWithFloat:.2], nil];
  * segmentedControl.columnProportions = [NSArray arrayWithObjects:firstRowProportions, secondRowProportions, nil];
  * 
  * In case proportions specified don't make up 1, then simple width / cell_count formula is used.
  */
@property (nonatomic, retain) NSArray *columnProportions;
/** If you specified 3 columns and 2 rows, this array should contain 6 items. */
@property (nonatomic, copy) NSArray *segmentTitles;
/** If you specified 3 columns and 2 rows, this array should contain 6 items.
  * Overrides segmentTitles, which means that if segmentImages array is valid,
  * the control will render images instead of text for segments. */
@property (nonatomic, copy) NSArray *segmentImages;

@property (nonatomic, assign) NSInteger selectedIndex;

@end
