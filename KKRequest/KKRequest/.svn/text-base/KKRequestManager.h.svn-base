//
//  KKRequestManager.h
//  SWNew
//
//  Created by MR.KING on 16/6/12.
//  Copyright © 2016年 KING. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKRequestManager : NSObject


/**************  GET **********/
-(void)GETWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler;

-(void)GETWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler;

-(void)GETWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))downProgress;

-(void)GETWithURLStr:(NSString*)urlStr
          parameters:(id)parameters
          completion:(void(^)(id responseData,NSError * error))handler
            progress:(void(^)(double progress))downProgress;

/**************  POST  *************/
-(void)POSTWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler;

-(void)POSTWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler;

-(void)POSTWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))uploadProgressHandler;

-(void)POSTWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))uploadProgressHandler;

/// 单例
+(instancetype)defaultManager;

@end
