//
//  KKRequestManager.m
//  SWNew
//
//  Created by MR.KING on 16/6/12.
//  Copyright © 2016年 KING. All rights reserved.
//

#import "KKRequestManager.h"

#import "AFNetworking.h"

@interface KKRequestManager()

@property(nonatomic,strong)AFHTTPSessionManager * manager;

@end

@implementation KKRequestManager

/**************  GET **********/
-(void)GETWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler{
    [self GETWithURLStr:urlStr parameters:parameters completion:handler progress:nil];
}

-(void)GETWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler{
    [self GETWithURLStr:urlStr completion:handler progress:nil];
}

-(void)GETWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))downProgress{
    [self GETWithURLStr:urlStr parameters:nil completion:handler progress:downProgress];
}

-(void)GETWithURLStr:(NSString*)urlStr
          parameters:(id)parameters
          completion:(void(^)(id responseData,NSError * error))handler
            progress:(void(^)(double progress))downProgress{
    [self.manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (downloadProgress) {
            downProgress(((double)downloadProgress.completedUnitCount) / ((double)downloadProgress.totalUnitCount));
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (handler) {
             handler(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (handler) {
            handler(nil,error);
        }
    }];
}


/**************  POST  *************/
-(void)POSTWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler{
    [self POSTWithURLStr:urlStr parameters:nil completion:handler progress:nil];
}


-(void)POSTWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler{
    [self POSTWithURLStr:urlStr parameters:parameters completion:handler progress:nil];
}

-(void)POSTWithURLStr:(NSString*)urlStr completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))uploadProgressHandler{
    [self POSTWithURLStr:urlStr parameters:nil completion:handler progress:uploadProgressHandler];
}

-(void)POSTWithURLStr:(NSString*)urlStr parameters:(id)parameters completion:(void(^)(id responseData,NSError * error))handler progress:(void(^)(double progress))uploadProgressHandler{
    [self.manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (uploadProgressHandler) {
            uploadProgressHandler(((double)uploadProgress.completedUnitCount) / ((double)uploadProgress.totalUnitCount));
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (handler) {
            handler(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (handler) {
            handler(nil,error);
        }
        
    }];
    
}

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        NSURLSessionConfiguration * configure = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        configure.allowsCellularAccess = YES;
        
        configure.timeoutIntervalForRequest = 60;
        
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil sessionConfiguration:configure];
        
        // 设置返回的数据是二进制数据
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                
    }
    return _manager;
}

+(instancetype)defaultManager{
    static KKRequestManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[KKRequestManager alloc]init];
        }
    });
    return manager;
}

@end
