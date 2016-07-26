//
//  CHAlertView.m
//  MMCustomApp
//
//  Created by lichanghong on 16/7/26.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import "CHAlertView.h"

@interface CHAlertView ()

@end

@implementation CHAlertView
 

+ (void)show:(id)sender Controller:(UIViewController *)controller
{
    if ([sender isKindOfClass:[UIAlertView class]]) {
        [sender show];
    }
    else
    {
        [controller presentViewController:sender animated:NO completion:^{
        }];
    }
}


+ (instancetype)createAlertViewWithTitle:(NSString *)title message:(NSString *)message
                                delegate:(id)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...
{
    id _cameraAlert=nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        _cameraAlert = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil, nil];
        
        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            [_cameraAlert addButtonWithTitle:otherButtonTitles];
            
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                [_cameraAlert addButtonWithTitle:otherString];
            }
        }
        va_end(args);
    }
    else
    {
        _cameraAlert = [UIAlertController alertControllerWithTitle:title  message:message preferredStyle:UIAlertControllerStyleAlert];
        if (cancelButtonTitle) {
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {}];
            [_cameraAlert addAction:cancelAction];
        }

        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                              }];
            [_cameraAlert addAction:okAction];

            
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                UIAlertAction* okAction2 = [UIAlertAction actionWithTitle:otherString style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {
                                                                  }];
                [_cameraAlert addAction:okAction2];
            }
        } 
        va_end(args);
    }
    return _cameraAlert;
}

@end
