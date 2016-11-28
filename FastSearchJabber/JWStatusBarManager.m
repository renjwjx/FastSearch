//
//  JWStatusBarManager.m
//  FastSearchJabber
//
//  Created by jinren on 27/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWStatusBarManager.h"

@implementation JWStatusBarManager

+ (instancetype)ShareInstance
{
    static JWStatusBarManager  *gStatusbarManager = nil;
    if (gStatusbarManager == nil) {
        gStatusbarManager = [[JWStatusBarManager alloc] init];
    }
    return gStatusbarManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        _statusItem.button.title = @"FastSearch";
        [_statusItem.button setTarget:self];
        [_statusItem.button setAction:@selector(handleStatusAction:)];
    }
    return self;
}

- (IBAction)handleStatusAction:(id)sender
{
    NSLog(@"Status Action");
}

- (void)triggerGlobalHotKey
{
    NSLog(@"HotKey Action");
  //  NSInteger heiht = NSApp.mainWindow.frame.size.height;
    static NSInteger heigh = 100;
    heigh = heigh + 100;
    [NSApp.mainWindow setFrame:CGRectMake(100, 100, 100, heigh) display:YES animate:YES];
}

@end
