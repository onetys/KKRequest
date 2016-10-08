//
//  NSString+Tool.h
//  SWXY
//
//  Created by MR.KING on 15/12/30.
//  Copyright © 2015年 EBJ. All righUI reserved.
//

#import <Foundation/Foundation.h>

#import "KKMacro.h"

@interface NSString (KKCheckValid)

#define KKNonatomic NS_NONATOMIC_IOSONLY


/**
 *  去掉空格
 */
@property(KKNonatomic,copy,readonly)NSString * kk_ridSpace;



/**
 *  是否包含字符串，区分大小写
 */

-(BOOL)kk_ctStrStrit:(NSString*)otherS;

/**
 *  是否包含字符串
 */
-(BOOL)kk_ctStr:(NSString *)str;


/**
 *  字符串长度为0
 */
@property(nonatomic,assign,readonly,getter=isKk_lenZero)BOOL  kk_lenZero;


/**
 *  为空
 */
@property(nonatomic,assign,readonly,getter=isKk_Empty)BOOL kk_Empty;


/**
 *  为空
 */
@property(nonatomic,assign,readonly,getter=isKk_ValidEmail)BOOL kk_ValidEmail;

/**
 *  为空
 */
@property(nonatomic,assign,readonly,getter=isKk_ValidMobilPNum)BOOL kk_ValidMobilPNum;


/**
 *  为空
 */
@property(nonatomic,assign,readonly,getter=isKk_ValidTelNum)BOOL Kk_ValidTelNum;


/**
 *  为空
 */
@property(nonatomic,assign,readonly,getter=isKk_ValidBankNum)BOOL kk_ValidBankNum;


/**
 *  检查URL是否合格
 */
@property(KKNonatomic,assign,readonly,getter=isKk_ValidURL)BOOL  kk_validURL;



/**
 *  检查URL是否合格
 */
@property(KKNonatomic,assign,readonly,getter=isKk_ValidPsw)BOOL  kk_ValidPsw;

/**
 *  检查URL是否合格
 */
@property(KKNonatomic,assign,readonly,getter=isKk_validIDNum)BOOL  kk_validIDNum;

-(BOOL)checkURL KKDeprecated("user -kk_validURL");

/**
 *  消除空格
 */
-(NSString *)getRidOfSpace KKDeprecated("user -kk_ridSpace");

-(BOOL)checkLengWithIn:(NSInteger)min max:(NSInteger)max;
-(BOOL)checkPassWord KKDeprecated("user -kk_ValidPsw");


-(BOOL)checkPhoneNumber KKDeprecated("user -kk_ValidMobilPNum");

- (BOOL)checkTelNumber KKDeprecated("user -Kk_ValidTelNum");

- (BOOL)checkUserIdCard KKDeprecated("user -kk_validIDNum");
-(BOOL)checkBankNumCard KKDeprecated("user -kk_ValidBankNum");
-(BOOL)checkEmail KKDeprecated("user -kk_ValidEmail");

-(BOOL)useful KKDeprecated("user -kk_Empty");
@end
