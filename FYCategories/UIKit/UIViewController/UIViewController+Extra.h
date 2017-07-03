//
//  UIViewController+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extra)

- (void)setLeftButtonItemWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock;
- (void)setLeftButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock;
- (void)setRightButtonItemsWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock;
- (void)setRightButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock;

- (void)hideNavigationBarBottomLine;
- (void)showNavigationBarBottomLine;

- (void)addChildrenViewController:(UIViewController *)childViewController;
- (void)removeChildrenViewController:(UIViewController *)childViewController;

- (void)setStatusBarBackgroundColor:(UIColor *)color;

@end
