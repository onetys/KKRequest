//
//  UIAlertController+KKAdd.m
//  SWNew
//
//  Created by MR.KING on 16/7/28.
//  Copyright © 2016年 KING. All rights reserved.
//

#import "UIAlertController+KKAdd.h"

@implementation UIAlertController (KKAdd)

/***=====================================
 ===            present sheet         ===
 ***===================================*/
+(void)alertSheetWithTitle:(NSString *)title
               cancelTitle:(NSString *)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertSheetWithTitle:title message:nil cancelT:CT destructiveT:DT destructiveAct:DAct title_1:nil act_1:nil title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}


+(void)alertSheetWithTitle:(NSString *)title
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertSheetWithTitle:title message:nil cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}



+(void)alertSheetWithTitle:(NSString *)title
                   message:(NSString *)message
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertSheetWithTitle:title message:message cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}





+(void)alertSheetWithTitle:(NSString *)title
                   message:(NSString *)message
                   cancelT:(NSString*)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                   title_2:(NSString*)title_2
                     act_2:(void(^)(UIAlertAction * action))act_2
                   title_3:(NSString*)title_3
                     act_3:(void(^)(UIAlertAction * action))act_3
                 inViewCtl:(UIViewController*)viewCtl{
    
    NSParameterAssert(viewCtl);
    
    UIAlertController * alertVC = [UIAlertController alertSheetWithTitle:title message:message cancelT:CT destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:title_2 act_2:act_2 title_3:title_3 act_3:act_3];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewCtl presentViewController:alertVC animated:YES completion:nil];
    });
    
}



/***=====================================
 ===            create sheet          ===
 ***===================================*/
+(UIAlertController *)alertSheetWithTitle:(NSString *)title
               cancelTitle:(NSString *)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1{
    return  [self alertSheetWithTitle:title message:nil cancelT:CT destructiveT:DT destructiveAct:DAct title_1:nil act_1:nil title_2:nil act_2:nil title_3:nil act_3:nil];
}


+(UIAlertController *)alertSheetWithTitle:(NSString *)title
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1{
    return [self alertSheetWithTitle:title message:nil cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil];
}



+(UIAlertController *)alertSheetWithTitle:(NSString *)title
                   message:(NSString *)message
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1{
    return [self alertSheetWithTitle:title message:message cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil];
}




+(UIAlertController *)alertSheetWithTitle:(NSString *)title
                   message:(NSString *)message
                   cancelT:(NSString*)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                   title_2:(NSString*)title_2
                     act_2:(void(^)(UIAlertAction * action))act_2
                   title_3:(NSString*)title_3
                     act_3:(void(^)(UIAlertAction * action))act_3{
    
    return [self alertWithTitle:title message:message cancelT:CT destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:title_2 act_2:act_2 title_3:title_3 act_3:act_3 style:UIAlertControllerStyleActionSheet];
    
}

/***=====================================
 ===            create                ===
 ***===================================*/


+(UIAlertController *)alertWithTitle:(NSString *)title
                              cancelTitle:(NSString *)CT
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1{
    return  [self alertWithTitle:title message:nil cancelT:CT destructiveT:DT destructiveAct:DAct title_1:nil act_1:nil title_2:nil act_2:nil title_3:nil act_3:nil];
}


+(UIAlertController *)alertWithTitle:(NSString *)title
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1{
    return [self alertWithTitle:title message:nil cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil];
}



+(UIAlertController *)alertWithTitle:(NSString *)title
                                  message:(NSString *)message
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1{
    return [self alertWithTitle:title message:message cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil];
}

+(UIAlertController *)alertWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  cancelT:(NSString*)CT
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1
                                  title_2:(NSString*)title_2
                                    act_2:(void(^)(UIAlertAction * action))act_2
                                  title_3:(NSString*)title_3
                                    act_3:(void(^)(UIAlertAction * action))act_3{
    return [self alertWithTitle:title message:message cancelT:CT destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:title_2 act_2:act_2 title_3:title_3 act_3:act_3 style:UIAlertControllerStyleAlert];
    
}

/***=====================================
 ===            present               ===
 ***===================================*/
+(void)alertWithTitle:(NSString *)title
               cancelTitle:(NSString *)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertWithTitle:title message:nil cancelT:CT destructiveT:DT destructiveAct:DAct title_1:nil act_1:nil title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}


+(void)alertWithTitle:(NSString *)title
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertWithTitle:title message:nil cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}



+(void)alertWithTitle:(NSString *)title
                   message:(NSString *)message
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl{
    [self alertWithTitle:title message:message cancelT:@"取消" destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:nil act_2:nil title_3:nil act_3:nil inViewCtl:viewCtl];
}





+(void)alertWithTitle:(NSString *)title
                   message:(NSString *)message
                   cancelT:(NSString*)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                   title_2:(NSString*)title_2
                     act_2:(void(^)(UIAlertAction * action))act_2
                   title_3:(NSString*)title_3
                     act_3:(void(^)(UIAlertAction * action))act_3
                 inViewCtl:(UIViewController*)viewCtl{
    
    NSParameterAssert(viewCtl);
    
    UIAlertController * alertVC = [UIAlertController alertWithTitle:title message:message cancelT:CT destructiveT:DT destructiveAct:DAct title_1:title_1 act_1:act_1 title_2:title_2 act_2:act_2 title_3:title_3 act_3:act_3];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewCtl presentViewController:alertVC animated:YES completion:nil];
    });
    
}


/***=====================================
 ===            base create           ===
 ***===================================*/
+(UIAlertController *)alertWithTitle:(NSString *)title
                                  message:(NSString *)message
                                  cancelT:(NSString*)CT
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1
                                  title_2:(NSString*)title_2
                                    act_2:(void(^)(UIAlertAction * action))act_2
                                  title_3:(NSString*)title_3
                                    act_3:(void(^)(UIAlertAction * action))act_3
                               style:(UIAlertControllerStyle)style{
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    if (CT) {
        [alertVC addAction:[UIAlertAction actionWithTitle:CT style:UIAlertActionStyleCancel handler:nil ]];
    }
    
    
    if (DT && (DT.length)) {
        [alertVC addAction:[UIAlertAction actionWithTitle:DT style:UIAlertActionStyleDestructive handler:DAct]];
    }
    
    if (title_1) {
        [alertVC addAction:[UIAlertAction actionWithTitle:title_1 style:UIAlertActionStyleDefault handler:act_1]];
    }
    
    if (title_2) {
        [alertVC addAction:[UIAlertAction actionWithTitle:title_1 style:UIAlertActionStyleDefault handler:act_2]];
    }
    
    if (title_3) {
        [alertVC addAction:[UIAlertAction actionWithTitle:title_1 style:UIAlertActionStyleDefault handler:act_3]];
    }
    
    return  alertVC;

}


@end
