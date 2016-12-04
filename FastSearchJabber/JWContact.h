//
//  JWContact.h
//  FastSearchJabber
//
//  Created by jinren on 04/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWContact : NSObject
@property (strong, nonatomic) NSString* displayName;
@property (strong, nonatomic) NSString* cecName;
@property (strong, readonly) NSString* jid;

+ (instancetype)contactWithDisplayName:(NSString*)name cecName:(NSString*)cecName;

- (BOOL)ContainsString:(NSString*)str;

@end
