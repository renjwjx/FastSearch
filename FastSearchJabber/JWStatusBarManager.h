//
//  JWStatusBarManager.h
//  FastSearchJabber
//
//  Created by jinren on 27/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface JWStatusBarManager : NSObject

+ (instancetype)ShareInstance;
@property (strong, nonatomic) NSStatusItem* statusItem;

//- (void)registerGlobalHotKey;
//- (void)unRegisterGlobalHotKey;
- (void)triggerGlobalHotKey;

@end
