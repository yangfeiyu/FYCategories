//
//  MBProgressHUD+Utils.m
//  iFang
//
//  Created by dhf on 14/12/3.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import "MBProgressHUD+Utils.h"
#import "LoadingView.h"

@implementation MBProgressHUD (Utils)

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud showLoadingMsg:msg inView:window];
    return hud;
}

+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg inView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud showLoadingMsg:msg inView:view];
    return hud;
}

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg {
    return [self showFleetingMsg:msg img:nil];
}

+ (MBProgressHUD *)showFleetingMsg:(NSString *)msg img:(UIImage *)img {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud showFleetingMsg:msg img:img];
    return hud;
}

- (void)showLoadingMsg:(NSString *)msg inView:(UIView *)view {
    LoadingView *loadingView = [[LoadingView alloc] init];
    loadingView.titleLabel.text = msg;
    self.customView = loadingView;
    self.mode = MBProgressHUDModeCustomView;
    self.removeFromSuperViewOnHide = YES;
    self.graceTime = 0;
    self.opacity = 0;
    self.userInteractionEnabled = YES;
}

- (void)showFleetingMsg:(NSString *)msg{
    [self showFleetingMsg:msg img:nil];
}

- (void)showFleetingMsg:(NSString *)msg img:(UIImage *)img{
    self.labelText = msg;
    self.customView = [[UIImageView alloc] initWithImage:img];
    self.mode = MBProgressHUDModeCustomView;
    self.removeFromSuperViewOnHide = YES;
    self.dimBackground = NO;
    self.graceTime = 0.5;
    self.userInteractionEnabled = NO;
    
    [self hide:YES afterDelay:2];
}

@end
