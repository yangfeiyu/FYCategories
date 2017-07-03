//
//  NSArray+EnumeratingExtras.m
//  iFang
//
//  Created by dhf on 14/11/17.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import "NSArray+EnumeratingExtras.h"

@implementation NSArray (EnumeratingExtras)

- (NSArray *) objectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:predicate]];
}

@end
