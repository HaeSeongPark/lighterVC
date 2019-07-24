//
//  AppDelegate.h
//  lighterVC
//
//  Created by rhino Q on 22/07/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark todo : # what is diffrence '#import' between '@class'
@class Store;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedDelegate;
@property (readonly, strong, nonatomic) Store *store;


@end

