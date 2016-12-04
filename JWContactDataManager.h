//
//  JWContactDataManager.h
//  FastSearchJabber
//
//  Created by jinren on 03/12/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWContact.h"

@interface JWContactDataManager : NSObject

@property (strong, nonatomic) NSArray<JWContact *>* contacts;

@property (strong, nonatomic) NSString* strFilter;

+ (instancetype)ShareInstance;

@end
