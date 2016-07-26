//
//  CHAlertView.h
//  MMCustomApp
//
//  Created by lichanghong on 16/7/26.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHAlertView;

@protocol CHAlertViewDelegate <NSObject>

- (void)AlertView:(CHAlertView *)alertview didClickButtonAtIndex:(NSInteger)index;

@end

@interface CHAlertView : UIView

@property (nonatomic,weak)id<CHAlertViewDelegate>delegate;

+ (instancetype)createAlertViewWithTitle:(NSString *)title
                                 message:(NSString *)message
                                delegate:(id)delegate
                       cancelButtonTitle:(NSString *)cancelButtonTitle
                       otherButtonTitles:(NSString *)otherButtonTitles, ...;


- (void)showInController:(UIViewController *)controller;



@end
