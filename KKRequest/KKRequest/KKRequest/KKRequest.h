//
//  Request.h
//  PZJY
//
//  Created by ebeijia on 16/2/29.
//  Copyright © 2016年 EBJ. All righUI reserved.
//

#import <Foundation/Foundation.h>

@class SerBackDataModel;

typedef enum : NSUInteger {
    RequestDataResultDealTypeAnalysis, // 自动进行解析
    RequestDataResultDealTypeBackOriData ,  // 不解析数据，将原数据返回
} RequestDataResultDealType; // 当网络请求有错误的时候，处理的方法



@interface KKRequest : NSObject


/// 发起一个网络请求
+(void)POSTWithURLStr:(NSString*)urlStr
           parameters:(id)parameters
             dealtype:(RequestDataResultDealType)type
                 data:(void(^)(id data))bdata
                error:(void(^)(NSError * error))bError;



#pragma mark - 子类不必须实现
/// 默认提供一个其他情况下对数据的判断，例如 异地登录
/// 当返回NO，则调用 `+dealForOtherJudgeWithBackData:URLStr:parameters:dealtype:data:error:`
+(BOOL)otherJudgeOKByData:(NSData*)data;

/// 处理请求超时的情况
+(void)dealForOtherJudgeWithBackData:(NSData*)data // 请求超时的时候的数据
                              URLStr:(NSString*)urlStr  // 之前请求的url
                          parameters:(id)parameters    // 之前请求的参数
                            dealtype:(RequestDataResultDealType)type    // 之前请求的处理数据类型
                                data:(void(^)(id data))bdata    // 之前的网路请求数据的回调
                               error:(void(^)(NSError * error))bError;  // 之前网络请求网络错误的回调




#pragma mark - 子类必须实现
/// 处理请求超时的情况
+(void)dealForLoginTimeOutWithBackData:(NSData*)data
                                URLStr:(NSString*)urlStr
                            parameters:(id)parameters
                              dealtype:(RequestDataResultDealType)type
                                  data:(void(^)(id data))bdata
                                 error:(void(^)(NSError * error))bError;

/**
 *  判断是否登录超时
 *
 *  @param data 判断依据的数据
 *
 *  @return     YES  or  NO
 */
+(BOOL)judgeIsLoginOutByData:(NSData*)data;


/**
 *  当网络请求失败并且网络的错误需要自动处理的情况进入
 *
 *  @param error 网络错误信息
 */
+(void)showNetError:(NSError*)error;

@end
