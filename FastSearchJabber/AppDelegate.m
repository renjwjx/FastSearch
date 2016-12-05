//
//  AppDelegate.m
//  FastSearchJabber
//
//  Created by jinren on 26/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "AppDelegate.h"
#import "GlobalHotKeyManager.h"
#import "JWStatusBarManager.h"
#import "JWQSearchWindow.h"
#import "JWUserNameDataSource.h"
#import "JWContactDataManager.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[GlobalHotKeyManager ShareInstance] registerGlobalHotKey];
    [JWStatusBarManager ShareInstance];
    [JWContactDataManager ShareInstance];
    [JWUserNameDataSource ShareInstance];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [[GlobalHotKeyManager ShareInstance] unRegisterGlobalHotKey];
}


@end
