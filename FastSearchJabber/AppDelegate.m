//
//  AppDelegate.m
//  FastSearchJabber
//
//  Created by jinren on 26/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "AppDelegate.h"
#import "GlobalHotKeyManager.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[GlobalHotKeyManager ShareInstance] registerGlobalHotKey];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [[GlobalHotKeyManager ShareInstance] unRegisterGlobalHotKey];
}


@end
