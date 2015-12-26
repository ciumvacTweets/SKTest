//
//  AppDelegate.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenuHandler.h"
#import "MainMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [self rootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (UIViewController *)rootViewController {
    
    return [[UINavigationController alloc] initWithRootViewController:[self loginViewController]];
}


- (UIViewController *)loginViewController {
    MainMenuHandler *handler = [[MainMenuHandler alloc] init];
    
    return [[MainMenuViewController alloc] initWithHandler:handler];
}



@end
