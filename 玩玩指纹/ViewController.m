//
//  ViewController.m
//  玩玩指纹
//
//  Created by bean on 16/2/16.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>//指纹所需
#import "NextViewController.h"
@interface ViewController ()<UIViewControllerPreviewingDelegate>//peekpok所需

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 120, 100);
    [btn setTitle:@"第一个touch" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(190, 100, 120, 100);
    [btn2 setTitle:@"第二个touch" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    
    UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, 350, 150)];
    lb.numberOfLines = 0;
    lb.text = @"此Demo3种功能。\n1.touchID:点击上面两个button能看见;\n2.peekpok:重按屏幕任意位置能看见;\n3.单击home键再重按app图标,就能看见";
    [self.view addSubview:lb];
    
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];//peekpok
    
}


-(void)click
{
    
    LAContext *context = [LAContext new];

    NSError *error;

    context.localizedFallbackTitle = @"我试试这是什么";//没作用

    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        NSLog(@"Touch ID可用");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:NSLocalizedString(@"我是标题下。。。", nil)
                          reply:^(BOOL success, NSError *error)
        {
                              if (success)
                              {
                                  NSLog(@"指纹通过");
                              }
                              else
                              {
                                  if (error.code == kLAErrorUserFallback)
                                  {
                                      NSLog(@"输入密码");
                                  }
                                  else if (error.code == kLAErrorUserCancel)
                                  {
                                      NSLog(@"取消");
                                  }
                                  else
                                  {
                                      NSLog(@"授权失败");
                                  }
                              }
        }];
        
    }
    else
    {
        NSLog(@"失败原因: %@", error);
    }
}


-(void)click2
{
    LAContext *lol = [[LAContext alloc] init];
    
    NSError *hi = nil;
    NSString *biaoti = @"我是标题";
    if ([lol canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&hi]) {
        [lol evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:biaoti reply:^(BOOL succes, NSError *error)
         {
             if (succes) {
                 NSLog(@"指纹通过");
             }
             else
             {
                 NSLog(@"%@",error.localizedDescription);
                 switch (error.code) {
                     case LAErrorSystemCancel:
                     {
                         NSLog(@"切换到其他APP，系统取消验证Touch ID");
                         //切换到其他APP，系统取消验证Touch ID
                         break;
                     }
                     case LAErrorUserCancel:
                     {
                         NSLog(@"用户取消验证Touch ID");
                         //用户取消验证Touch ID
                         break;
                     }
                     case LAErrorUserFallback:
                     {
                         NSLog(@"输入密码");
                         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                             //用户选择输入密码，切换主线程处理
                         }];
                         break;
                     }
                     default:
                     {
                         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                             //其他情况，切换主线程处理
                         }];
                         break;
                     }
                 }
             }
         }];
    }
    else
    {
        NSLog(@"失败");
    }
}


#pragma mark - 继续按压进入查看图片
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    viewControllerToCommit.view.backgroundColor = [UIColor whiteColor];[self showViewController:viewControllerToCommit sender:self];
}


#pragma mark - 注册预览视图的代理和来源视图
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
    NextViewController *content = [[NextViewController alloc] init];
    return content;
    
}
@end
