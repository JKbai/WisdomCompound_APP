//
//  AppDelegate.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeMainController.h"
#import "BaseNavigationController.h"

#import "CommonControlCache.h"
#import "CommonControlModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      //设置window的根控制器
      [self configRootViewController];
    
      //获取公共配置数据
      [self getCommonControlData];
    return YES;
}


/**
 配置window的根控制器
 */
- (void)configRootViewController {
    
    HomeMainController *homeVC = [[HomeMainController alloc]init];
    BaseNavigationController *navi = [[BaseNavigationController alloc]initWithRootViewController:homeVC];
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
}


/**
 获取公共配置数据
 */
- (void)getCommonControlData {
    
    [CommonControlCache updateCacheWithSuccess:^{
        
        XBLog(@"数据缓存成功");
       
    } error:^(NSString *err) {
        [self getCommonControlData];
    }];
    
}





@end
