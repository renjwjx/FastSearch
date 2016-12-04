//
//  JWUserNameDataSource.h
//  FastSearchJabber
//
//  Created by jinren on 03/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface JWUserNameDataSource : NSObject<NSTableViewDataSource>

@property (strong, nonatomic) NSMutableArray* filterContacts;

+ (instancetype)ShareInstance;

@end
