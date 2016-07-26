//
//  CHAlertView.m
//  MMCustomApp
//
//  Created by lichanghong on 16/7/26.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import "CHAlertView.h"

@interface CHAlertView ()
@property (nonatomic,strong)id alertItem;

@end

@implementation CHAlertView

 
- (void)showInController:(UIViewController *)controller
{
    CHAlertView *sender = self;
    if ([sender isKindOfClass:[UIAlertView class]]) {
        [sender.alertItem show];
    }
    else
    {
        [controller presentViewController:sender.alertItem animated:NO completion:^{
        }];
    }
}

+ (instancetype)createAlertViewWithTitle:(NSString *)title message:(NSString *)message
                                delegate:(id)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...
{
    CHAlertView *alertview = [[CHAlertView alloc]init];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        alertview.alertItem = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil, nil];
        
        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            [alertview.alertItem addButtonWithTitle:otherButtonTitles];
            
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                [alertview.alertItem addButtonWithTitle:otherString];
            }
        }
        va_end(args);
    }
    else
    {
        alertview.alertItem = [UIAlertController alertControllerWithTitle:title  message:message preferredStyle:UIAlertControllerStyleAlert];
        if (cancelButtonTitle) {
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {}];
            [alertview.alertItem addAction:cancelAction];
        }

        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                              }];
            [alertview.alertItem addAction:okAction];

            
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                UIAlertAction* okAction2 = [UIAlertAction actionWithTitle:otherString style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {
                                                                  }];
                [alertview.alertItem addAction:okAction2];
            }
        } 
        va_end(args);
    }
    return alertview;
}

@end
