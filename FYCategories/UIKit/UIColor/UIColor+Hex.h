//
//  UIColor+Hex.h
//  FYCategories
//
//  Created by 杨飞宇 on 2017/4/19.
//  Copyright © 2017年 FY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

@end
