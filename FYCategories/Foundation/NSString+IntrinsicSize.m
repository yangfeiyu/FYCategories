//
//  NSString+IntrinsicSize.m
//  iFang
//
//  Created by dhf on 14/12/13.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import "NSString+IntrinsicSize.h"

@implementation NSString (IntrinsicSize)

- (CGSize)estimatedSizeForFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    return [self estimatedSizeForAttributes:attrs maxSize:maxSize];
}

- (CGSize)estimatedSizeForAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize {
    if (self.length > 0) {
        CGRect frame = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil];
        
        CGSize size = frame.size;
        //hack: 需要加上额外的一部分size,有些情况下计算出来的像素点并不是那么精准
        return CGSizeMake(ceil(size.width) + 1.0, ceil(size.height) + 1.0);
    } else {
        return CGSizeZero;
    }
}

@end
