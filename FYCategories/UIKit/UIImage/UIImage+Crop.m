//
//  UIImage+Crop.m
//  JiaoYou
//
//  Created by dyun on 2/28/13.
//  Copyright (c) 2013 dyun. All rights reserved.
//

#import "UIImage+Crop.h"
#import <CoreGraphics/CGImage.h>
@implementation UIImage (Crop)
- (UIImage *) crop:(CGFloat) ratio
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    CGFloat cRatio = width/height;
    if (cRatio > ratio) {
        width = height*ratio;
    } else {
        height = width / ratio;
    }
    CGFloat x = (self.size.width-width)/2;
    CGFloat y = (self.size.height-height)/2;
    CGRect rect = CGRectMake(x*self.scale,
                              y*self.scale,
                              width*self.scale,
                              height*self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

- (UIImage *)croppedWithRect:(CGRect)rect
{
    rect = CGRectMake(rect.origin.x * self.scale, rect.origin.y * self.scale, rect.size.width * self.scale, rect.size.height * self.scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return croppedImage;
}

- (UIImage *)squareByExpandTransprent
{
    CGSize size = self.size;
    CGPoint point = CGPointZero;
    
    if (size.width > size.height)
    {
        point.y = (size.width - size.height)/2;
        size.height = size.width;
    }
    else
    {
        point.x = (size.height - size.width)/2;
        size.width = size.height;
    }
    
    // Create a bitmap graphics context
    // This will also set it as the current context
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0 alpha:0].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    // Draw the scaled image in the current context
    [self drawInRect:CGRectMake(point.x, point.y, self.size.width, self.size.height)];
    
    // Create a new image from current context
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Pop the current context from the stack
    UIGraphicsEndImageContext();
    
    // Return our new scaled image
    return scaledImage;
}


-(UIImage *)scaleToSize:(CGSize)size
{
    // Create a bitmap graphics context
    // This will also set it as the current context
    UIGraphicsBeginImageContext(size);
    
    // Draw the scaled image in the current context
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // Create a new image from current context
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Pop the current context from the stack
    UIGraphicsEndImageContext();
    
    // Return our new scaled image
    return scaledImage;
}

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
