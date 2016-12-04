//
//  JWUserNameDataSource.m
//  FastSearchJabber
//
//  Created by jinren on 03/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWUserNameDataSource.h"
#import "JWContactDataManager.h"

#define TABLEVIEW_COLUMN_DISPLAY_NAME    @"DisplayName"
#define TABLEVIEW_COLUMN_CEC_NAME    @"CECName"

@implementation JWUserNameDataSource

+ (instancetype)ShareInstance
{
    static JWUserNameDataSource  *gJWUserNameDataSource = nil;
    if (gJWUserNameDataSource == nil) {
        gJWUserNameDataSource = [[JWUserNameDataSource alloc] init];
    }
    return gJWUserNameDataSource;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _filterContacts = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSArray* contacts = [JWContactDataManager ShareInstance].contacts;
    NSString* strFilter = [JWContactDataManager ShareInstance].strFilter;
    [self.filterContacts removeAllObjects];
    for (JWContact *contact in contacts) {
        if (strFilter.length == 0 || [contact ContainsString:strFilter]) {
            [self.filterContacts addObject:contact];
        }
    }
    return [self.filterContacts count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    JWContact *contact = [self.filterContacts objectAtIndex:row];
    //NSLog(@"show : %@", contact.displayName);
    if([tableColumn.identifier isEqualToString:TABLEVIEW_COLUMN_DISPLAY_NAME])
    {
        return contact.displayName;
    }
    else
    {
        return contact.cecName;
    }
    
}

@end
