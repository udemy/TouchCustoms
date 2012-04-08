//
//  RatingViewStandAloneController.h
//  ScreenStuff
//
//  Created by Aleks Nesterow on 3/2/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screen Customs s.r.o.
//	All rights reserved.
//	
//	Purpose
//	SCRatingView showcase as a stand-alone control.
//

#import "SCRRatingView.h"

@interface RatingViewStandAloneController : UIViewController<SCRRatingDelegate> {

@private
	SCRRatingView *_ratingView;
	UILabel *_ratingLabel, *_userRatingLabel;
}

@property (nonatomic, retain) IBOutlet SCRRatingView *ratingView;
@property (nonatomic, retain) IBOutlet UILabel *ratingLabel, *userRatingLabel;

- (IBAction)ratingSelected:(UISegmentedControl *)sender;

@end
