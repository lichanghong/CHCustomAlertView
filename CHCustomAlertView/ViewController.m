//
//  ViewController.m
//  CHCustomAlertView
//
//  Created by lichanghong on 16/7/26.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import "ViewController.h"
#import "CHAlertView.h"

@interface ViewController ()<CHAlertViewDelegate>

@end

@implementation ViewController
{
    CHAlertView *alertview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    alertview  = [CHAlertView createAlertViewWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other1",@"other2",@"other3",@"other4",nil];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)AlertView:(CHAlertView *)alertview didClickButtonAtIndex:(NSInteger)index
{
    NSLog(@"-----%ld",(long)index);
}

- (void)viewDidAppear:(BOOL)animated
{
//    [CHAlertView show:alertview Controller:self];
    [alertview showInController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
