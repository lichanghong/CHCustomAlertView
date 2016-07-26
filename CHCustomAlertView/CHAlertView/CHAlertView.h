//
//  CHAlertView.h
//  MMCustomApp
//
//  Created by lichanghong on 16/7/26.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHAlertView : UIView

+ (instancetype)createAlertViewWithTitle:(NSString *)title
                                 message:(NSString *)message
                                delegate:(id)delegate
                       cancelButtonTitle:(NSString *)cancelButtonTitle
                       otherButtonTitles:(NSString *)otherButtonTitles, ...;


- (void)showInController:(UIViewController *)controller;



@end
