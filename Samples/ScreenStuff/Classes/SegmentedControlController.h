//
//  SegmentedControlController.h
//  ScreenStuff
//
//  Created by Aleks Nesterow on 3/4/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screen Customs s.r.o.
//	All rights reserved.
//	
//	Purpose
//	SCRSegmentedControl show-case with one, two, and three rows.
//

@class SCRSegmentedControl;

@interface SegmentedControlController : UIViewController {

@private
	SCRSegmentedControl *_oneRowControl, *_twoRowControl, *_threeRowControl;
	UILabel *_valueLabel;
}

@property (nonatomic, retain) IBOutlet SCRSegmentedControl *oneRowControl, *twoRowControl, *threeRowControl;
@property (nonatomic, retain) IBOutlet UILabel *valueLabel;

- (IBAction)selectedIndexChanged:(id)sender;

@end
