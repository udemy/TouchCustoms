//
//  NSArray+Linq.m
//  TouchCustoms
//
//  Created by Aleks Nesterow on 8/10/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//

#import "NSArray+Linq.h"

@implementation NSArray (Linq)

+ (NSArray *)map:(NSArray *)array usingBlock:(id (^)(id currentItem))block {
	
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:array.count];
	
	for (id object in array) {
		
		[result addObject:block(object)];
	}
	
	return result;
}

- (NSArray *)mapUsingBlock:(id (^)(id currentItem))block {
	
	return [[self class] map:self usingBlock:block];
}

@end
