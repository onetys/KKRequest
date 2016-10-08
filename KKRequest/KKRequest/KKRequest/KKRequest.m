//
//  Request.m
//  PZJY
//
//  Created by ebeijia on 16/2/29.
//  Copyright © 2016年 EBJ. All righUI reserved.
//

#import "KKRequest.h"
#import "SerBackDataModel.h"
#import "KKRequestManager.h"
#import "MJExtension.h"

@implementation KKRequest


/// 请求中间数据处理层
/// 错误自动处理层
+(void)POSTWithURLStr:(NSString*)urlStr
           parameters:(id)parameters
             dealtype:(RequestDataResultDealType)type
                 data:(void(^)(id data))bdata
                error:(void(^)(NSError * error))bError{
    
    [self POSTWithURLStr:urlStr parameters:parameters data:^(id data) {
        
        // 1.判断是否登录超时
        if ([self judgeIsLoginOutByData:data]) {
            // 当登录超时的时候，重新登录并重新发送数据
            [self dealForLoginTimeOutWithBackData:data
                                           URLStr:urlStr
                                       parameters:parameters
                                         dealtype:type
                                             data:bdata
                                            error:bError];
            
        }
        // 2. 其他的判断条件，如：异地登录
        else if(![self otherJudgeOKByData:data]){
            [self dealForOtherJudgeWithBackData:data URLStr:urlStr parameters:parameters dealtype:type data:bdata error:bError];
        }
        // 3. 如果没有异常情况则处理数据
        else{
            [self dealDataWithDealtype:type data:bdata responseData:data];
        }
        
    } error:^(NSError *error) {
        /**
         *  如果错误的回调存在，说明要在请求的地方进行处理
         *  如果错误的回调不存在，说明要在此处理
         */
        if (bError) {
            bError(error);
        }else{
            // 展示网络无连接
            [self showNetError:error];
            // 即便没有代码中没有实现错误的回调block，但是仍然要回调，以示网络请求完毕
            bdata(nil);
        }
    }];
}

/// 网络请求层
+(void)POSTWithURLStr:(NSString*)urlStr
           parameters:(id)parameters
                 data:(void(^)(id data))bdata
                error:(void(^)(NSError * error))bError{
    [[KKRequestManager defaultManager]
     POSTWithURLStr:urlStr
     parameters:parameters
     completion:^(id responseData, NSError *error) {
         // 主要以错误信息为依据。
         // 存在错误则网络错误，不存在则回调数据。
         if (error) {
             if (bError) {
                 bError(error);
             }
         }else{
             bdata(responseData);
         }
    }];
}

/// 处理请求超时的情况
/// 这个方法一定要被子类重写
+(void)dealForLoginTimeOutWithBackData:(NSData*)data
                                URLStr:(NSString*)urlStr
                          parameters:(id)parameters
                            dealtype:(RequestDataResultDealType)type
                                data:(void(^)(id data))bdata
                                 error:(void(^)(NSError * error))bError{
    
    NSAssert([self class] != [KKRequest class], @"method -showNetError must be override by subclass");
    
}


/// 处理请求超时的情况
+(void)dealForOtherJudgeWithBackData:(NSData*)data
                                URLStr:(NSString*)urlStr
                            parameters:(id)parameters
                              dealtype:(RequestDataResultDealType)type
                                  data:(void(^)(id data))bdata
                                 error:(void(^)(NSError * error))bError{
    
}


/**
 *  处理数据
 *  根据 type 判断：
 *  如果为原始数据，则直接回调原始数据
 *  如果类型为解析数据，则解析之后回调解析之后的数据
 *
 *  @param type  处理数据的类型 RequestDataResultDealType
 *  @param bdata 数据的回调
 *  @param data  将要处理的数据
 */
+(void)dealDataWithDealtype:(RequestDataResultDealType)type
                       data:(void(^)(id data))bdata
               responseData:(NSData*)data{
   
    // 1. 如果类型为解析
    if (type == RequestDataResultDealTypeAnalysis) {
        // 处理数据
        SerBackDataModel * model = [SerBackDataModel modelWithData:data];
        bdata(model);
    }
    // 2. 类型为原始数据
    else if (type == RequestDataResultDealTypeBackOriData){
        if (bdata) {
            bdata(data);
        }
    }
}

+(BOOL)otherJudgeOKByData:(NSData*)data{
    return YES;
}


/**
 *  判断是否登录超时
 *
 *  @param data 判断依据的数据
 *
 *  @return     YES  or  NO
 */
+(BOOL)judgeIsLoginOutByData:(NSData*)data{
    
    NSAssert([self class] != [KKRequest class], @"method -showNetError must be override by subclass");
    
    return NO;
}


/**
 *  当网络请求失败并且网络的错误需要自动处理的情况进入
 *
 *  @param error 网络错误信息
 */
+(void)showNetError:(NSError*)error{
    NSAssert([self class] != [KKRequest class], @"method -showNetError must be override by subclass");
}



@end
