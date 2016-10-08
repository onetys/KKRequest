//
//  NSDictionary+AddProperty.m
//  PZJY
//
//  Created by MR.KING on 16/3/1.
//  Copyright © 2016年 EBJ. All righUI reserved.
//


#ifndef NSDictionary_KKAddProperty_m
#define NSDictionary_KKAddProperty_m

#import "NSDictionary+AddProperty.h"
#import <objc/runtime.h>

@implementation NSDictionary (AddProperty)

@dynamic  sendTime;
@dynamic  rspCode;
@dynamic  rspMsg;
@dynamic  data;
@dynamic  role;
@dynamic  signType;
@dynamic  sign;
@dynamic roleAcc;


-(NSString *)sendTime{
    return  [self objectForKey:@"sendTime"];
}



-(NSString *)rspCode{
    return  [self objectForKey:@"rspCode"];
}



-(NSString *)rspMsg{
    if ([[self objectForKey:@"rspMsg"] length] == 0) {
           return @"未知错误";
    }else{
        return [self objectForKey:@"rspMsg"];
    }
}

-(NSArray*)list{
    NSArray * arr = [self objectForKey:@"list"];
    return arr;
}

-(NSDictionary *)data{
    NSData * data = [[self objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding];
    if ([data isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }else if ([data isKindOfClass:[NSDictionary class]]){
        return (NSDictionary*)data;
    }
    return (NSDictionary*)data;
}

-(BOOL)serKeyUseful{
    NSAssert(1, @"需要重写serKeyUserful");
    return NO;
}

-(NSString * )serKey{
    return [self objectForKey:@"serKey"];
}



-(NSString *)role{
    return  [self objectForKey:@"role"];
}



-(NSString *)signType{
    return  [self objectForKey:@"signType"];;
}



-(NSString *)sign{
    return  [self objectForKey:@"sign"];
}


-(NSString *)roleAcc{
    return  [self objectForKey:@"roleAcc"];;
}


@end


#endif
