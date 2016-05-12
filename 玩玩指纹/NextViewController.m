//
//  NextViewController.m
//  玩玩指纹
//
//  Created by bean on 16/5/12.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(100, 150, 200, 80)];
    lb.text = @"我是弹出来的";
    [self.view addSubview:lb];
    
    
    
    
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"第一个按钮" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        [self showAlertWithMessage:@"如果不错给个start吧"];
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"第二个按钮" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        [self showAlertWithMessage:@"推荐给好友吧"];
    }];
    
    
    [array addObject:action1];
    [array addObject:action2];
    
    return array;
}

- (void)showAlertWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"peekpok" message:message delegate:self cancelButtonTitle:@"就不" otherButtonTitles:@"好的", nil];
    [alert show];
}

@end
