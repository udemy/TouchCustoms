//
//  NSString+SCRMethods.h
//  TouchCustoms
//
//  Created by Aleks Nesterow on 7/19/09.
//  aleks.nesterow@gmail.com
//  
//  Copyright © 2009-2010 Screencustoms, LLC. All rights reserved.
//  
//  Purpose
//  Extension methods for NSString.
//

@interface NSString (SCRMethods)

+ (BOOL)isNullOrEmpty:(NSString *)aString;
+ (NSString *)stringFromInteger:(NSInteger)anInteger;
+ (NSString *)stringFromDouble:(double)aDouble;
- (NSString *)stringByAddingPercentEscapes;
- (NSString *)stringByTruncatingWith:(NSString *)truncateString measuringAgainstFont:(UIFont *)font
							forWidth:(CGFloat)width;
+ (CGFloat)widthOfString:(NSString *)aString withFont:(UIFont *)font;

@end
