//
//  NSArray+EnumeratingExtras.h
//  iFang
//
//  Created by dhf on 14/11/17.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (EnumeratingExtras)

/**
 * filter the array
 */
- (NSArray *) objectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;

@end
