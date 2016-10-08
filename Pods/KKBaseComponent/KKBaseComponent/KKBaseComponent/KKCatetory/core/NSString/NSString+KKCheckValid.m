//
//  NSString+Tool.m
//  SWXY
//
//  Created by MR.KING on 15/12/30.
//  Copyright © 2015年 EBJ. All righUI reserved.
//

#import "NSString+KKCheckValid.h"

@implementation NSString (KKCheckValid)



-(NSString *)kk_ridSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

-(BOOL)kk_ctStr:(NSString *)str{
    return kkContainStr(self, str, NSCaseInsensitiveSearch);
}

-(BOOL)kk_ctStrStrit:(NSString*)otherS{
    return kkContainStr(self, otherS, NSLiteralSearch);
}

static BOOL kkContainStr(NSString * str ,NSString * beCheck, NSStringCompareOptions options){
    NSRange range = [str rangeOfString:beCheck options:options];
    if (range.location == NSNotFound) {
        return NO;
    }
    return YES;
}


-(BOOL)isKk_Empty{
    return self.isKk_lenZero;
}

-(BOOL)isKk_lenZero{
    return  ([self length] == 0);
}


-(BOOL)isKk_ValidURL{
    NSRange range = [self rangeOfString:@"http" options:NSCaseInsensitiveSearch];
    return ([self isKk_Empty] || (range.location == NSNotFound));
}

-(BOOL)isKk_ValidEmail{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString *pattern = @"^\\w+([-_.]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,6})+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

-(BOOL)isKk_ValidTelNum{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString * pattern = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

-(BOOL)isKk_ValidMobilPNum{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString * pattern = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

-(BOOL)isKk_ValidBankNum{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString *pattern = @"^([0-9]{16,19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

-(BOOL)isKk_ValidPsw{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString *pattern = @"^[0-9]{6,14}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

-(BOOL)isKk_validIDNum{
    if ([self isKk_Empty]) {
        return NO;
    }
    NSString *pattern = @"^(\\d{14}|\\d{18})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}





/***=====================================
 ===            old                    ===
 ***===================================*/




-(BOOL)checkURL{
    NSRange range = [self rangeOfString:@"http" options:NSCaseInsensitiveSearch];
    
    if ([self isEmpty] || (range.location == NSNotFound)) {
        return NO;
    }
    return YES;
}

-(NSString *)getRidOfSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

-(BOOL)checkEmail{
    if ([self kk_ctStr:@".com"]) {
        return YES;
    }
    return NO;
}

-(BOOL)checkLengWithIn:(NSInteger)min max:(NSInteger)max{
    
    if (([self length] >= min)&&([self length] <= max)) {
        return YES;
    }
    return NO;
}

-(BOOL)checkPassWord{
    if ([self isEmpty]) {
        return NO;
    }
    NSString *pattern = @"^[0-9]{6,14}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


- (BOOL)checkTelNumber
{
    if ([self isEmpty]) {
        return NO;
    }
    NSString * pattern = @"^[1][3,4,5,7,8][0-9]{9}$";
//    NSString *pattern = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

-(BOOL)checkPhoneNumber{
    if ([self isEmpty]) {
        return NO;
    }
    NSString * pattern = @"^[1][3,4,5,7,8][0-9]{9}$";
    //    NSString *pattern = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


#pragma 正则匹配用户身份证号15或18位
- (BOOL)checkUserIdCard
{
    if ([self isEmpty]) {
        return NO;
    }
    NSString *pattern = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma 正则匹配用户身份证号15或18位
-(BOOL)checkBankNumCard
{
    if ([self isEmpty]) {
        return NO;
    }
    NSString *pattern = @"^([0-9]{16,19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


-(BOOL)ebjContainsString:(NSString*)string{
    NSRange range = [self rangeOfString:string];
    if (range.location == NSNotFound) {
        return NO;
    }
    return YES;
}


// 判断是否为空  默认不为空的判断
-(BOOL)isEmpty{
    if ([self length ] == 0) {
        return  YES;
    }
    return NO;
}

-(BOOL)useful{
    if (!self || [self isEmpty]) {
        return NO;
    }
    return YES;
}




@end
