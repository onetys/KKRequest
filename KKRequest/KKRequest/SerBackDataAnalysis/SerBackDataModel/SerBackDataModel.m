//
//  SerBackDataModel.m
//  PZJY
//
//  Created by MR.KING on 16/4/1.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "SerBackDataModel.h"

#import "SerBackCodeModel.h"

#import "MJExtension.h"

@interface SerBackDataModel()
{
    SerBackCodeModel * _codeModel;
}
@end

@implementation SerBackDataModel

+(instancetype)modelWithData:(NSData *)data{
    NSAssert([data isKindOfClass:[NSData class]], @"");
    return [self mj_objectWithKeyValues:[data mj_keyValues]];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"rspCode":@"success",
             @"rspMsg":@"errorInfo",
             @"data":@"content"
             };
}

+(instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc] initWithDictionary:dictionary];
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
        self.data = dictionary[@"data"];
    }
    return self;
}

-(BOOL)codeSuccess{
    return self.rspCode.intValue;
}

-(SerBackCodeModel *)codeModel{
    if (!_codeModel) {
        _codeModel = [[SerBackCodeModel alloc]init];
    }
    _codeModel.rspCode = self.rspCode;
    _codeModel.rspMsg = self.rspMsg;
    return _codeModel;
}



@end
