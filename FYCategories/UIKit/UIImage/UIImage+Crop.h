//
//  UIImage+Crop.h
//  JiaoYou
//
//  Created by dyun on 2/28/13.
//  Copyright (c) 2013 dyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage (Crop)

- (UIImage *)crop:(CGFloat) ratio;

- (UIImage *)croppedWithRect:(CGRect)rect;

/* 将短边用透明色填充，返回正方形 */
- (UIImage *)squareByExpandTransprent;


- (UIImage *)scaleToSize:(CGSize)size;

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

@end
