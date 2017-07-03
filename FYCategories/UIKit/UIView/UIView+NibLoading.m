//
//  UIView+NibLoading.m
//  peony
//
//  Created by dhf on 14-10-15.
//  Copyright (c) 2014年 iorcas. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+(instancetype)loadInstanceFromNib {
    UIView *result = nil;
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id obj in elements) {
        if ([obj isKindOfClass:[self class]]) {
            result = obj;
            break;
        }
    }
    return result;
}

@end
