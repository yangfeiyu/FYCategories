//
// Created by LiXiaoQing on 14/11/20.
//

#import <Foundation/Foundation.h>

extern NSUInteger const kPhoneNumberLength;
extern NSUInteger const kCodeNumberLength;

typedef NS_ENUM(NSInteger, CharsType) {
    CharsType_numeral = 1,      // 只许数字
    CharsType_letter,           // 只许大小写字母
    CharsType_numeralAndXx,     // 只许数字加上X和x
    CharsType_numeralAndLetter, // 只许数字加上大小写字母
    CharsType_allChar,          // 允许输入所有字符
};

@interface UITextField (TextFormatter)

+ (BOOL)phoneNumberTextField:(UITextField *)textField range:(NSRange)range string:(NSString *)string;

+ (BOOL)textField:(UITextField *)textField range:(NSRange)range string:(NSString *)string CharType:(CharsType)CharType maxLength:(NSInteger)maxLength separatorIndexs:(NSArray *)indexs separator:(NSString *)separator;

/**
 *  验证码判断 只能是数字
 *  参数 digits 只能输入的位数
 */
+ (BOOL)codeNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string digits:(NSUInteger)digits;

/**
 *  格式化后的号码转正常数字
 */
+ (NSString *)toOriginalText:(UITextField *)textField separator:(NSString *)separator;
+ (NSString *)phoneNumberToOriginalText:(UITextField *)textField;

@end
