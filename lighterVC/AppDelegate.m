//
//  AppDelegate.m
//  lighterVC
//
//  Created by rhino Q on 22/07/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"
#import "PhotosViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)sharedDelegate
{
    #pragma mark todo : solve the warning
    return [UIApplication sharedApplication].delegate;
}

#pragma mark todo : this method dosen't work. Make it work.
static BOOL isRunningTests(void)
{
    return [[[[NSProcessInfo processInfo] environment][@"XCInjectBundle"] pathExtension] isEqualToString:@"octest"];
}

@synthesize store = _store;

- (Store *)store
{
    if (_store == nil) {
        _store = [Store store];
    }
    return _store;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (isRunningTests()) {
        return YES;
    }
    PhotosViewController *photosViewController = [[PhotosViewController alloc] initWithNibName:@"PhotosViewController"
                                                                                        bundle:nil];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    
//    ViewController *vc = [ViewController new];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    return YES;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
