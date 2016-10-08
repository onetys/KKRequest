//
//  NSDictionary+AddProperty.h
//  PZJY
//
//  Created by MR.KING on 16/3/1.
//  Copyright © 2016年 EBJ. All righUI reserved.
//

#ifndef NSDictionary_KKAddProperty_h
#define NSDictionary_KKAddProperty_h

#import <Foundation/Foundation.h>

@interface NSDictionary (AddProperty)

@property(nonatomic,strong)NSString * sendTime;

@property(nonatomic,strong)NSString * rspCode;

@property(nonatomic,strong)NSString * rspMsg;

@property(nonatomic,strong)NSDictionary * data;

@property(nonatomic,strong)NSString * role;

@property(nonatomic,strong)NSArray * roleAcc;

@property(nonatomic,strong)NSString * signType;

@property(nonatomic,strong)NSString * sign;

@property(nonatomic,copy,readonly)NSString * serKey;

@property(nonatomic,assign,readonly)BOOL serKeyUseful;

@property(nonatomic,strong,readonly)NSArray * list;

@end

#endif
