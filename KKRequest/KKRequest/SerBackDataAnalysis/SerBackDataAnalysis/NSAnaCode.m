//
//  NSAnaCode.m
//  PZJ
//
//  Created by MR.KING on 16/4/29.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "NSAnaCode.h"

const NSString * RequestCodeSuccess = @"1"; //成功
const NSString * RequestCodeFail = @"0"; // 失败
const NSString * RequestCodeTokenExpired = @"2"; //token失效

/*
const NSString * RequestCodeSuccess = @"0000"; //成功
const NSString * RequestCodeFail = @"0001"; // 失败
const NSString * RequestCodeMissParamters = @"0002";    //缺少参数
const NSString * RequestCodeNotGetVerCode = @"0003"; //没有获取到验证码
const NSString * RequestCodeVerCodeExpiredOrWrong = @"0004"; //验证码过期
const NSString * RequestCodeUserNotExist = @"0005"; //用户不存在
const NSString * RequestCodeLessonHavaApply = @"0006"; //课程已经申请
const NSString * RequestCodePostFileWrongFormat = @"0008"; //上传文件格式错误
const NSString * RequestCodeNoAuthority = @"0009"; //没有权限

const NSString * RequestCodeActOrPwWrong = @"1001"; //账户或密码错误
const NSString * RequestCodeUserHaveExist = @"1002"; //用户已经存在
const NSString * RequestCodeTokenExpired = @"1003"; //token失效
const NSString * RequestCodeLoginOtherDevice = @"1004"; //token失效
const NSString * RequestCodeLaunageNoCH = @"1007";//"1007","姓名只能输入中文"
const NSString * RequestCodeSerKeyDisable = @"0010"; //用户已经扥估
const NSString * RequestCodeFileNotExist = @"2001"; //文件不存在
const NSString * RequestCodeSignWrong = @"3001"; //签名失败

const NSString * RequestCodeProductDown = @"0011"; //产品下线
const NSString * RequestCodeLessonStopApple = @"0012";   //该课程已停止招生

const NSString * RequestCodePhoneFormatWrong = @"0013"; //手机号格式
const NSString * RequestCodeEmailFormatWrong = @"0014"; //email格式
const NSString * RequestCodeNameForLong = @"0015"; //姓名过长
const NSString * RequestCodeEduForLong = @"0016"; //学历过长
const NSString * RequestCodeCoNameForLong = @"0017"; //单位过长
const NSString * RequestCodeDutiesNameForLong = @"0018"; //职务过长
const NSString * RequestCodeTelForLong = @"0019"; //电话长度过长

const NSString * RequestCodeServerBusy = @"9001";

 */


 
@interface NSAnaCode()
@property(nonatomic,assign)RequestCodeTypeType type;
@property(nonatomic,strong)NSMutableDictionary * anaPersonly;   // the code that is deal by self
@property(nonatomic,weak)SerBackCodeModel * codeModel;
@end

@implementation NSAnaCode


- (void)dealloc
{
    for (NSString * tmp in self.anaPersonly.allKeys) {
        id value = [self.anaPersonly valueForKey:tmp];
        [self.anaPersonly removeObjectForKey:tmp];
        value = nil;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.anaPersonly =[[NSMutableDictionary alloc]init];
    }
    return self;
}
+(NSString*)anaWithCodeModel:(SerBackCodeModel*)model{
    return [[[self alloc]init] anaWithCodeModel:model];
}

+(NSString*)anaWithCodeModel:(SerBackCodeModel*)model anaForCode:(RequestCodeTypeType)type deal:(void(^)(SerBackCodeModel*code))deal{
    NSAnaCode * code = [[self alloc]init];
    [code setAnaForCode:type deal:deal];
    return [code anaWithCodeModel:model];
}


/// 设置指定的类型进行回调解析，不会自动解析
-(void)setAnaForCode:(RequestCodeTypeType)type deal:(void(^)(SerBackCodeModel*code))deal{
    self.type = type;
    [self.anaPersonly setValue:deal forKey:[NSString stringWithFormat:@"%lu",type]];
}


/// 解析模型
-(NSString*)anaWithCodeModel:(SerBackCodeModel*)model{
    if (!model || (![model isKindOfClass:[SerBackCodeModel class]])) {
        return @"";
    }
    // 1. 设置model
    self.codeModel = model;
    
    // 2. 获取自动解析的方法名
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"defaultCode%@Action",model.rspCode]);
    
    // 3. 如果能够响应到方法名
    if ([self respondsToSelector:sel]) {
        
        // 4. 如果设置回调解析而不是自动解析，则判断当前返回的数据的类型是否为之前设置过的回调解析类型，找到则回调
        for (NSString * key in self.anaPersonly.allKeys) {
            RequestCodeTypeType type = [key integerValue];
            if (type & model.codeType) {
                ((void(^)(SerBackCodeModel*code))[self.anaPersonly valueForKey:key])(model);
                return @"" ;
            }
        }
        // 5. 调用自动解析的方法
        model.showMessage = [self performSelector:sel];
        
        return model.showMessage;
    }
    
    // 6. 如果没有对应的方法名，默认返回网络无了解。这种几乎不会很少进入
    model.showMessage = @"网络无连接 请稍后重试";
    return @"";
}

-(NSString*)defaultCode0Action{
    return (self.codeModel.rspMsg);
}

-(NSString*)defaultCode1Action{
    return @"";
}

-(NSString*)defaultCode0002Action{
//    DDlog(@"%@",self.codeModel.rspMsg);
    return @"";
}

/*
-(NSString*)defaultCode0003Action{
    return ServerNotGetVerCode;
}

-(NSString*)defaultCode0004Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0005Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0006Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0008Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0009Action{
    DDlog(@"%@",@"该账号注册为老师 请使用老师客户端登录");
    return @"该账号注册为老师 请使用老师客户端登录";
}


-(NSString*)defaultCode1001Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode1002Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode1003Action{
    DDlog(@"%@",self.codeModel.rspMsg);
    return @"";
}


   the notificatin will be send every time when call this method
   这个通知在你每次调用这个方法的时候，都会被发送
 
-(NSString*)defaultCode1004Action{
//    NSNotificationCurrentAccontHaveLoginAtOtherDevice;
    return @"服务器繁忙 请重试";
}

-(NSString*)defaultCode1007Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode1005Action{
    return self.codeModel.rspMsg;
}


//  the notificatin will be send every time when call this method
//   这个通知在你每次调用这个方法的时候，都会被发送

-(NSString*)defaultCode0010Action{
//    NSNotificationCurrentAccontHaveLoginAtOtherDevice;
    return @"服务器繁忙 请重试";
}

-(NSString*)defaultCode2001Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode3001Action{
    DDlog(@"%@",self.codeModel.rspMsg);
    return @"服务器繁忙 请重试";
}

-(NSString*)defaultCode0011Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0012Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0013Action{
    return self.codeModel.rspMsg;
}


-(NSString*)defaultCode0014Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0015Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0016Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0017Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0018Action{
    return self.codeModel.rspMsg;
}

-(NSString*)defaultCode0019Action{
    return self.codeModel.rspMsg;
}
*/
@end
