//
//  SerBackDataModel.h
//  PZJY
//
//  Created by MR.KING on 16/4/1.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SerBackCodeModel;

@interface SerBackDataModel : NSObject  /********服务器返回的数据**********/


@property(nonatomic,copy)NSString * rspCode;

@property(nonatomic,copy)NSString * rspMsg;

@property(nonatomic,copy)NSDictionary * data;

@property(nonatomic,strong,readonly)SerBackCodeModel * codeModel;

-(BOOL)codeSuccess;

+(instancetype)modelWithData:(NSData*)data;

//{"success":0,"errorInfo":"用户名或密码错误","content":""}
/*
@property(nonatomic,copy)NSString * sendTime;


@property(nonatomic,strong)NSArray * roleAcc;

@property(nonatomic,copy)NSString * signType;

@property(nonatomic,copy)NSString * sign;

-(BOOL)codeSuccess;

*/
@end
