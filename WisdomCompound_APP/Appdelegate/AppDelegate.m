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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      [self configRootViewController];
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


@end
