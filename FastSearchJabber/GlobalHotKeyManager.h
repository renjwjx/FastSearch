//
//  GlobalHotKeyManager.h
//  FastSearchJabber
//
//  Created by jinren on 26/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

@interface GlobalHotKeyManager : NSObject


+ (instancetype)ShareInstance;

- (void)registerGlobalHotKey;
- (void)unRegisterGlobalHotKey;
@end
