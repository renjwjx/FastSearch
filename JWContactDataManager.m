//
//  ContactDataManager.m
//  FastSearchJabber
//
//  Created by jinren on 03/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWContactDataManager.h"

@implementation JWContactDataManager

+ (instancetype)ShareInstance
{
    static JWContactDataManager  *gJWContactDataManager = nil;
    if (gJWContactDataManager == nil) {
        gJWContactDataManager = [[JWContactDataManager alloc] init];
    }
    return gJWContactDataManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        _contacts = [self loadContactData];
    }
    return self;
}

- (NSArray*)loadContactData
{
    JWContact* contact1 = [JWContact contactWithDisplayName:@"Xuemin Mei" cecName:@"xumei"];
    JWContact* contact2 = [JWContact contactWithDisplayName:@"Hui Luo" cecName:@"huiluo"];
    JWContact* contact3 = [JWContact contactWithDisplayName:@"Binli He" cecName:@"binlhe"];
    JWContact* contact4 = [JWContact contactWithDisplayName:@"Cheng Chang" cecName:@"chenchan"];
    
    return @[contact1, contact2, contact3, contact4];
}

@end
