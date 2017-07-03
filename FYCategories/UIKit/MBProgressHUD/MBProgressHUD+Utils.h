//
//  MBProgressHUD+Utils.h
//  iFang
//
//  Created by dhf on 14/12/3.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Utils)

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg;

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg inView:(UIView *)view;

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg;

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

- (void)showLoadingMsg:(NSString *)msg inView:(UIView *)view;

- (void)showFleetingMsg:(NSString *)msg;

- (void)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

@end
