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
    NSDictionary* contactList = @{
                             @"Aileen Zhang":@"linzhan3"};
    NSMutableArray<JWContact*> *contacts = [NSMutableArray arrayWithCapacity:500];
    NSArray* allKeys = [contactList allKeys];
    
    NSArray* allDisplayNames = [allKeys sortedArrayUsingSelector:@selector(compare:)];
    for (NSString* aDisplayNames in allDisplayNames) {
        NSString* cecName = [contactList objectForKey:aDisplayNames];
        JWContact* aContact = [JWContact contactWithDisplayName:aDisplayNames cecName:cecName];
        [contacts addObject:aContact];
    }
    
    return contacts;
}

@end
