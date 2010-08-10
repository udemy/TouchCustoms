//
//  NSArray+Linq.h
//  TouchCustoms
//
//  Created by Aleks Nesterow on 8/10/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//	
//	Purpose
//	Contains LINQ-like operators for arrays.
//

@interface NSArray (Linq)

+ (NSArray *)map:(NSArray *)array usingBlock:(id (^)(id currentItem))block;
- (NSArray *)mapUsingBlock:(id (^)(id currentItem))block;

@end
