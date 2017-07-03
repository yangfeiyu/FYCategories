//
//  NSString+IntrinsicSize.h
//  iFang
//
//  Created by dhf on 14/12/13.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IntrinsicSize)

- (CGSize)estimatedSizeForFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

- (CGSize)estimatedSizeForAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize;

@end
