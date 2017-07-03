//
//  UIView+TLLayout.h
//  iFang
//
//  Created by dhf on 14/11/17.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TLLayout)

@property (nonatomic, strong) NSArray *hiddenConstraints;

// set hidden and remove any constraints involving this view from its superview
- (void)hideAndRemoveConstraints;
- (void)showAndRestoreConstraints;

@end
