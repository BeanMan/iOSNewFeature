//
//  AppDelegate.m
//  玩玩指纹
//
//  Created by bean on 16/2/16.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//3DTouch  相关设置看一下工程外的文档
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    //判断先前我们设置的唯一标识
    
    int a = [shortcutItem.type intValue];
    
    switch (a) {
        case 0:
        {
            //        NSArray *arr = @[@"hello 3D Touch"];
            //        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
            //        //设置当前的VC 为rootVC
            
            NSLog(@"0000");
            
            //        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            //        }];
            
        }
            break;
        case 1:
        {
            NSLog(@"1111");
        }
            break;
        default:
            break;
    }
    
    
    
    /**
     typedef NS_ENUM(NSInteger, UIApplicationShortcutIconType) {
     UIApplicationShortcutIconTypeCompose,//编辑的图标
     UIApplicationShortcutIconTypePlay,//播放图标
     UIApplicationShortcutIconTypePause,//暂停图标
     UIApplicationShortcutIconTypeAdd,//添加图标
     UIApplicationShortcutIconTypeLocation,//定位图标
     UIApplicationShortcutIconTypeSearch,//搜索图标
     UIApplicationShortcutIconTypeShare//分享图标
     } NS_ENUM_AVAILABLE_IOS(9_0);
     
     */
}

@end
