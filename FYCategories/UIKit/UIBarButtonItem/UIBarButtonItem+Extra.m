//
//  UIBarButtonItem+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import "UIBarButtonItem+Extra.h"
#import "UIFont+Extra.h"
#import "UIControl+Extra.h"

static CGFloat const kBarButtonDefaultSpace = -14.0f;
static CGFloat const kBarButtonDefaultSize  = 44.0f;
@implementation UIBarButtonItem (Extra)

+ (NSArray *)barButtonItemsWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:RectSizeMake(kBarButtonDefaultSize, kBarButtonDefaultSize)];
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addActionBlock:^(id sender) {
        if (actionBlock) {
            actionBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    return [UIBarButtonItem barButtonItemsWithCustomView:button];
}

+ (NSArray *)barButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont helveticaFontOfSize:16.0f];
    [button setFrame:CGRectMake(0, 0, kBarButtonDefaultSize, kBarButtonDefaultSize)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:COLORHEX(GREEN_COLOR) forState:UIControlStateNormal];
    [button addActionBlock:^(id sender) {
        if (actionBlock) {
            actionBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    return [UIBarButtonItem barButtonItemsWithCustomView:button];
}

+ (NSArray *)barButtonItemsWithCustomView:(UIView *)customView {
    return [UIBarButtonItem barButtonItemsWithCustomView:customView space:kBarButtonDefaultSpace];
}

+ (NSArray *)barButtonItemsWithCustomView:(UIView *)customView space:(CGFloat)space{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    if (space == 0) {
        return @[barButtonItem];
    }
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    [spaceItem setWidth:space];
    return @[spaceItem, barButtonItem];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image highlightImage:(UIImage *)highlightImage {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
