//
//  UITabBar+Extra.m
//  Overseas
//
//  Created by yangfeiyu on 15-3-6.
//

#import "UITabBar+Extra.h"

@implementation UITabBar (Extra)

- (CGPoint)getBadgeViewCenterByItemIndex:(NSInteger)itemIndex {
    UITabBar *tabBar = self;
    UIView *tabBarButton = tabBar.subviews[itemIndex + 1];
    if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        
        UIView *badgeView = [tabBarButton valueForKeyPath:@"_badge"];
        if (badgeView) {
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            CGPoint point = [tabBarButton convertPoint:badgeView.center toView:keyWindow];
            return point;
        }
    }
    return CGPointZero;
}

@end
