//
//  JWQSearchWindow.m
//  FastSearchJabber
//
//  Created by jinren on 28/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWQSearchWindow.h"

@implementation JWQSearchWindow

- (void)awakeFromNib
{
    [super awakeFromNib];
    //self.styleMask = self.styleMask & ~NSWindowStyleMaskTitled;
    self.inputText.delegate = self;
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}

- (BOOL)canBecomeMainWindow
{
    return YES;
}

- (void)controlTextDidEndEditing:(NSNotification *)obj
{
    NSLog(@"end Editing:%@", [obj.object stringValue]);
    if ([obj.object stringValue].length == 0) {
        return;
    }
    NSString* imURL = [NSString stringWithFormat:@"ciscoim://%@", [obj.object stringValue]];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:imURL]];
    [NSApp hide:nil];
}
@end
