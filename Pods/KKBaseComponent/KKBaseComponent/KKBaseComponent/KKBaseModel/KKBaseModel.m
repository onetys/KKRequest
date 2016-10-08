//
//  KKBaseModel.m
//  KKQT
//
//  Created by KING on 2016/10/7.
//  Copyright © 2016年 King. All rights reserved.
//

#import "KKBaseModel.h"

@implementation KKBaseModel

#if DEBUG
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSAssert(1, @"KKError : set %@ for undefinedKey: %@",self,key);
}
#else
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
#endif

@end
