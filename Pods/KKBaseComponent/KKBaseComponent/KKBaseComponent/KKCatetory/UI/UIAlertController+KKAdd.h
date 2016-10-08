//
//  UIAlertController+KKAdd.h
//  SWNew
//
//  Created by MR.KING on 16/7/28.
//  Copyright © 2016年 KING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (KKAdd)


/***=====================================
 ===            present sheet         ===
 ***===================================*/
+(void)alertSheetWithTitle:(NSString *)title
               cancelTitle:(NSString *)CT
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl;


+(void)alertSheetWithTitle:(NSString *)title
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl;


+(void)alertSheetWithTitle:(NSString *)title
                   message:(NSString *)message
              destructiveT:(NSString*)DT
            destructiveAct:(void(^)(UIAlertAction * action))DAct
                   title_1:(NSString*)title_1
                     act_1:(void(^)(UIAlertAction * action))act_1
                 inViewCtl:(UIViewController*)viewCtl;



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
                 inViewCtl:(UIViewController*)viewCtl;


/***=====================================
 ===            create sheet          ===
 ***===================================*/
+(UIAlertController *)alertSheetWithTitle:(NSString *)title
                              cancelTitle:(NSString *)CT
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1;


+(UIAlertController *)alertSheetWithTitle:(NSString *)title
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1;



+(UIAlertController *)alertSheetWithTitle:(NSString *)title
                                  message:(NSString *)message
                             destructiveT:(NSString*)DT
                           destructiveAct:(void(^)(UIAlertAction * action))DAct
                                  title_1:(NSString*)title_1
                                    act_1:(void(^)(UIAlertAction * action))act_1;



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
                                    act_3:(void(^)(UIAlertAction * action))act_3;

/***=====================================
 ===            create                ===
 ***===================================*/


+(UIAlertController *)alertWithTitle:(NSString *)title
                         cancelTitle:(NSString *)CT
                        destructiveT:(NSString*)DT
                      destructiveAct:(void(^)(UIAlertAction * action))DAct
                             title_1:(NSString*)title_1
                               act_1:(void(^)(UIAlertAction * action))act_1;


+(UIAlertController *)alertWithTitle:(NSString *)title
                        destructiveT:(NSString*)DT
                      destructiveAct:(void(^)(UIAlertAction * action))DAct
                             title_1:(NSString*)title_1
                               act_1:(void(^)(UIAlertAction * action))act_1;



+(UIAlertController *)alertWithTitle:(NSString *)title
                             message:(NSString *)message
                        destructiveT:(NSString*)DT
                      destructiveAct:(void(^)(UIAlertAction * action))DAct
                             title_1:(NSString*)title_1
                               act_1:(void(^)(UIAlertAction * action))act_1;

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
                               act_3:(void(^)(UIAlertAction * action))act_3;

/***=====================================
 ===            present               ===
 ***===================================*/
+(void)alertWithTitle:(NSString *)title
          cancelTitle:(NSString *)CT
         destructiveT:(NSString*)DT
       destructiveAct:(void(^)(UIAlertAction * action))DAct
              title_1:(NSString*)title_1
                act_1:(void(^)(UIAlertAction * action))act_1
            inViewCtl:(UIViewController*)viewCtl;


+(void)alertWithTitle:(NSString *)title
         destructiveT:(NSString*)DT
       destructiveAct:(void(^)(UIAlertAction * action))DAct
              title_1:(NSString*)title_1
                act_1:(void(^)(UIAlertAction * action))act_1
            inViewCtl:(UIViewController*)viewCtl;



+(void)alertWithTitle:(NSString *)title
              message:(NSString *)message
         destructiveT:(NSString*)DT
       destructiveAct:(void(^)(UIAlertAction * action))DAct
              title_1:(NSString*)title_1
                act_1:(void(^)(UIAlertAction * action))act_1
            inViewCtl:(UIViewController*)viewCtl;





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
            inViewCtl:(UIViewController*)viewCtl;


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
                               style:(UIAlertControllerStyle)style;

@end
