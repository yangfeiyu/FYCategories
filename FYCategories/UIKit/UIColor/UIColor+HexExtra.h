//
//  UIColor+HexExtra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLORHEX(c)                         [UIColor colorWithHexString:c]

@interface UIColor (HexExtra)

+ (UIColor *)colorWithHexString:(NSString *)rgb;


@end
