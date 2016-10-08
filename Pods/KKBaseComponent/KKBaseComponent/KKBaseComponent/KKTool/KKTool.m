//
//  TSTool.m
//  PZJ
//
//  Created by MR.KING on 16/5/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "KKTool.h"

#import "NSString+KKTool.h"

#import "NSString+KKCheckValid.h"

#import "KKMacro.h"

@implementation KKTool

+(NSArray *)appSupportLanguages{
    NSUserDefaults *defaults = [ NSUserDefaults standardUserDefaults ];
    // 取得 iPhone 支持的所有语言设置
    return [defaults objectForKey : @"AppleLanguages" ];
}

+(NSString *)appLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    return [languages objectAtIndex:0];
}


+(UIViewController*)getViewVtlWhicViewIsIn:(UIView*)view{
    UIView * tmp = view;
    for (; tmp.nextResponder; tmp = tmp.superview) {
        if ([tmp.nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)tmp.nextResponder;
        }
    }
    return nil;
}



+(UIImage*)getImageInView:(UIView*)view{
    if (!view) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width, view.frame.size.height), YES, 0);     //设置截屏大小
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    return viewImage;
}

+(UIImage*)getImageInLayer:(CALayer*)layer{
    if (!layer) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(layer.frame.size.width, layer.frame.size.height), YES, 0);     //设置截屏大小
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    return viewImage;
}

+(void)openSystemWebBrowserWithStr:(NSString*)urlStr{
    if (!urlStr || ([urlStr isKk_Empty])) {
        return;
    }
    NSURL * url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        [[UIApplication sharedApplication]openURL:url];
    }
}


+(UIImage*)doubleLines{
    UIImage * image =[[UIImage imageNamed:@"line@2x"]resizableImageWithCapInsets:UIEdgeInsetsMake(45, 115, 10, 15)];
    return image;
}




+(NSString*)plistInBundleWithName:(NSString *)name{
    return [[NSBundle mainBundle]pathForResource:name ofType:@"plist"];
}


+(id)iphoneIDRunStateIsTest:(id)test product:(id)product{
#ifdef DEBUG
    return test;
#else
    return product;
#endif
}

+(CGFloat)iphoneRunStateIsTest:(CGFloat)test product:(CGFloat)product{
#ifdef DEBUG
    return test;
#else
    return product;
#endif
}

+(id)iphoneIDIs4:(id)iphone4 is5:(id)iphone5 is6:(id)iphone6 isPlus:(id)plus{
    NSString * iphone = [self iphoneVersion];
    return [iphone kk_ctStr:@"4"]?iphone4:[iphone kk_ctStr:@"5"]?iphone5:[iphone kk_ctStr:@"6"]?iphone6:plus;
}

+(CGFloat)iphoneIs4:(CGFloat)iphone4 is5:(CGFloat)iphone5 is6:(CGFloat)iphone6 isPlus:(CGFloat)plus{
    NSString * iphone = [self iphoneVersion];
    return [iphone kk_ctStr:@"4"]?iphone4:[iphone kk_ctStr:@"5"]?iphone5:[iphone kk_ctStr:@"6"]?iphone6:plus;
}

+(NSString*)iphoneVersion{
    if (KScreenWidth == 320) {
        if (KScreenHeight == 480) {
            return @"4/4s";
        }else{
            return @"5/5s";
        }
    }else if (KScreenWidth == 375){
        return @"6/6s";
    }else if (KScreenWidth >= 414){
        return @"plus/plus";
    }
    return @"UNKnow";
}


+(BOOL)judgeTopTextFieldText:(UITextField*)textField With:(NSRange)range replacemenUItring:(NSString *)string{
    if ([textField.text isEqualToString:@"0"]) {
        if (range.length > 0) {
            return YES;
        }
        if ([string isEqualToString:@"."]) {
            return YES;
        }
        if ([string isEqualToString:@"0"]) {
            textField.text = @"0.00";
        }
    }
    
    if ([textField.text length] >= 9){
        if (range.length > 0) {
            return YES;
        }
        return NO;
    }
    
    if ([string length] > 1) {
        if (range.length > 0) {
            return YES;
        }
        return NO;
    }
    if ([string isEqualToString:@""]) {
        if (range.length > 0) {
            return YES;
        }
        return NO;
    }
    if (range.length == 1) {
        return YES;
    }
    if ((isdigit([string characterAtIndex:0]))||([string isEqualToString:@"."])) {
        NSString * text = textField.text;
        if ([text kk_ctStr:@"."]) {
            if ([string isEqualToString:@"."]) {
                return NO;
            }else{
                // 小数点之后的数字
                NSString * tmp = [text componentsSeparatedByString:@"."][1];
                if ([tmp length] == 2) {
                    return NO;
                }else{
                    return YES;
                }
            }
        }else{
            if ([text length] == 0) {
                if ([string isEqualToString:@"."]) {
                    return NO;
                }
            }
            if ([text length] >= 9) {
                return NO;
            }else{
                return YES;
            }
        }
        return YES;
    }else{
        return NO;
    }
}



// 是否是更新版本之后做的事情
+(BOOL)isAfterUpdataVersion{
    
    NSString *key = (NSString *)kCFBundleVersionKey;
    
    // 1.从Info.plist中取出版本号
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    // 2.从沙盒中取出上次存储的版本号
    NSString *saveVersion = [self valueForKey:key];
    
    if ([version isEqualToString:saveVersion]) {
        
        return NO;
        
    }else{// 版本号不一样：第一次使用新版本
        [self saveCurrenUIystemVersion];
        return YES;
    }
}
+(void)saveCurrenUIystemVersion{
    NSString *key = (NSString *)kCFBundleVersionKey;
    
    // 1.从Info.plist中取出版本号
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    // 存储当前最新版本号
    [self setValue:version forKey:key];
}
/*获取程序版本号*/
+ (NSString *)getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}







+(NSString *)filePathWithName:(NSString *)fileName{
    if (!fileName) {
        return @"";
    }
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documenUIDirectory = [paths1 objectAtIndex:0];
    NSString * filePath = [documenUIDirectory stringByAppendingPathComponent:fileName];
    
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!isExist) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
    
}




// 将时间差 转换为分秒
+(NSString*)transTimeChaToStringWith:(NSTimeInterval)timeCha{
    NSInteger minutes = timeCha/60;
    NSInteger seconds = (NSInteger)timeCha%60;
    return [NSString stringWithFormat:@"距离可以解锁时间还有%2.2ld分 %2.2ld秒",minutes,seconds];
}






/*
 *根据字符串的实际内容的多少 在固定的宽度和字体和行间距的大小，动态的计算出实际的高度
 */
+ (CGFloat)textHeightFromTexUItring:(NSString *)text width:(CGFloat)textWidth fonUIize:(CGFloat)size lineSpacing:(double)lineSpace{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpace];
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:size],
                                                                                 NSParagraphStyleAttributeName:paragraphStyle
                                                                                 
                                                                                 }];
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil];
    //返回计算出的行高
    return rect.size.height;
}

/*
 *根据字符串的实际内容的多少 在固定的宽度和字体和行间距的大小，动态的计算出实际的高度
 */
+ (CGFloat)textHeightFromTexUItring:(NSString *)text width:(CGFloat)textWidth fonUIize:(CGFloat)size{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:size]
                                                                                 
                                                                                 }];
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil];
    //返回计算出的行高
    return rect.size.height;
}





/*
 *获取iOS版本号系统版本号
 */
+ (double)getSystemVersion {
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}




/*通过颜色来生成一个纯色图片*/
+ (UIImage *)createImageFromColor:(UIColor *)color withFrame:(CGRect)rect {
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}

/*
 *根据字符串的实际内容的多少 在固定的宽度和字体和行间距的大小，动态的计算出实际的高度
 */
+ (CGFloat)textWidthFromTextString:(NSString *)text height:(CGFloat)textHeight fonUIize:(CGFloat)size{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:size]
                                                                                 
                                                                                 }];
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, textHeight) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil];
    //返回计算出的行高
    return rect.size.width;
}



@end
