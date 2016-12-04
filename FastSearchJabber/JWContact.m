//
//  JWContact.m
//  FastSearchJabber
//
//  Created by jinren on 04/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWContact.h"

@implementation JWContact

- (instancetype)init
{
    self = [super init];
    if (self) {
        _displayName = @"name";
        _cecName = @"cecName";
    }
    return self;
}

+ (instancetype)contactWithDisplayName:(NSString*)name cecName:(NSString*)cecName
{
    JWContact* contact = [[JWContact alloc] init];
    contact.displayName = name;
    contact.cecName = cecName;
    
    return contact;
}

- (NSString *)jid
{
    return [_cecName stringByAppendingString:@"@cisco.com"];
}

- (BOOL)ContainsString:(NSString*)str
{
    if ([self.displayName containsString:str]
        || [self.cecName containsString:str]) {
        return YES;
    }
    return NO;
}


@end
