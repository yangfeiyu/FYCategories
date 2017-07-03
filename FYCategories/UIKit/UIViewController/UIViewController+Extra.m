//
//  UIViewController+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import "UIViewController+Extra.h"
#import "HOENavigationController.h"

@interface UIViewController()
@end

@implementation UIViewController (Extra)
#pragma mark - interface
- (void)setLeftButtonItemWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock{
    self.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:image
                                                                          actionBlock:actionBlock];
}

- (void)setRightButtonItemsWithImage:(UIImage *)image actionBlock:(void (^)())actionBlock{
    self.navigationItem.rightBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:image
                                                                           actionBlock:actionBlock];
}

- (void)setLeftButtonItemsWithTitle:(NSString *)title actionBlock:(void (^)())actionBlock{
    self.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithTitle:title
                                                                          actionBlock:actionBlock];
}

- (void)setRightButtonItemsWithTitle:(NSString *)title actionBlock:(void (^)())actionBlock{
    self.navigationItem.rightBarButtonItems = [UIBarButtonItem barButtonItemsWithTitle:title
                                                                           actionBlock:actionBlock];
}

- (void)hideNavigationBarBottomLine {
    if ([self.navigationController isKindOfClass:[HOENavigationController class]]) {
        HOENavigationController *nav = (HOENavigationController *)self.navigationController;
        [nav hideBarBttomLine:YES];
    }
}

- (void)showNavigationBarBottomLine {
    if ([self.navigationController isKindOfClass:[HOENavigationController class]]) {
        HOENavigationController *nav = (HOENavigationController *)self.navigationController;
        [nav hideBarBttomLine:NO];
    }
}

- (void)addChildrenViewController:(UIViewController *)childViewController {
    if (!childViewController.parentViewController) {
        [self addChildViewController:childViewController];
        [childViewController didMoveToParentViewController:self];
        [self.view addSubview:childViewController.view];
    }
}

- (void)removeChildrenViewController:(UIViewController *)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
