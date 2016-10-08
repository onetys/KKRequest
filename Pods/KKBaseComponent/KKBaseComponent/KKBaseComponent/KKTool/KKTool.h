//
//  TSTool.h
//  PZJ
//
//  Created by MR.KING on 16/5/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface KKTool : NSObject

/**
 *  app 支持的所有语言
 */
+(NSArray*)appSupportLanguages;

/**
 *  app 当前的额语言
 */
+(NSString*)appLanguage;


+(UIViewController*)getViewVtlWhicViewIsIn:(UIView*)view;

// 截屏
+(UIImage*)getImageInView:(UIView*)view;
+(UIImage*)getImageInLayer:(CALayer*)layer;

// 打开系统的浏览器
+(void)openSystemWebBrowserWithStr:(NSString*)urlStr;


// 根据plist文件  获取到程序本身的 plist文件目录
+(NSString*)plistInBundleWithName:(NSString *)name;

+(id)iphoneIDRunStateIsTest:(id)test product:(id)product;

+(CGFloat)iphoneRunStateIsTest:(CGFloat)test product:(CGFloat)product;

+(id)iphoneIDIs4:(id)iphone4 is5:(id)iphone5 is6:(id)iphone6 isPlus:(id)plus;

+(CGFloat)iphoneIs4:(CGFloat)iphone4 is5:(CGFloat)iphone5 is6:(CGFloat)iphone6 isPlus:(CGFloat)plus;

//返回当前设备的型号
+(NSString*)iphoneVersion;


+(BOOL)judgeTopTextFieldText:(UITextField*)textField With:(NSRange)range replacemenUItring:(nullable NSString *)string;

// 是否是更新版本之后做的事情
+(BOOL)isAfterUpdataVersion;

+(void)saveCurrenUIystemVersion;


/**
 *  弹出提示框提示用户完善个人信息
 *
 *  @param viewController 要显示的viewcontroller
 */
//+(void)preferctPersonInfoIn:(nonnull UIViewController*)viewController;




/**
 *  获取路径
 *
 *  @param fileName 文件名字
 *
 *  @return 路径
 */
+(nullable NSString *)filePathWithName:(nonnull NSString  * )fileName;




/**
 *  后的文本所占的高度
 *
 *  @param text      内容
 *  @param textWidth 设定的宽度
 *  @param size      字体大小
 *  @param lineSpace 行间距
 *  @return 高度
 */
+ (CGFloat)textHeightFromTexUItring:(nonnull NSString *)text width:(CGFloat)textWidth fonUIize:(CGFloat)size lineSpacing:(double)lineSpace;


/**
 *  后的文本所占的高度
 *
 *  @param text      内容
 *  @param textWidth 设定的宽度
 *  @param size      字体大小
 *
 *  @return 高度
 */
+ (CGFloat)textHeightFromTexUItring:(nullable NSString *)text width:(CGFloat)textWidth fonUIize:(CGFloat)size;




/**
 *  判断手势是否超时
 *
 *  @return 超时的内容
 */
+(nonnull NSString*)isTimeOut;


// 将时间差 转换为分秒
+(nonnull NSString*)transTimeChaToStringWith:(NSTimeInterval)timeCha;




+(void)setValue:(nullable id)value forKey:(nonnull NSString *)key;
+(nullable id)valueForKey:(nonnull NSString *)key;


/*
 *获取iOS版本号系统版本号
 */
+ (double)getSystemVersion;


/*获取程序版本号*/
+ (nonnull NSString *)getAppVersion;


/*通过颜色来生成一个纯色图片*/
+ (UIImage *)createImageFromColor:(UIColor *)color withFrame:(CGRect)rect;

+ (CGFloat)textWidthFromTextString:(NSString *)text height:(CGFloat)textHeight fonUIize:(CGFloat)size;

@end
