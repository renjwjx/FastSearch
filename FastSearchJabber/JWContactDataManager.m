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
                                  @"Aileen Zhang":@"linzhan3",
                                  @"Bin Wu":@"binw2",
                                  @"Bin Xu":@"bxu3",
                                  @"Binli He":@"binlhe",
                                  @"Bo Zhou":@"bozho",
                                  @"Chang Liu":@"chanliu3",
                                  @"Chao Wei":@"chaowei",
                                  @"Charlie Zhang":@"changjzh",
                                  @"Cheng Chang":@"chenchan",
                                  @"Cheng Zheng":@"czheng2",
                                  @"Chengzhi Li":@"chengzhl",
                                  @"Chuanfeng Zhou":@"chuazhou",
                                  @"Ciman chen":@"cimchen",
                                  @"Danielle Shi":@"weshi2",
                                  @"Dave Zhang":@"weizhan4",
                                  @"Eric Ma":@"erima",
                                  @"Fanglin Liu":@"fanglliu",
                                  @"Fei Ye":@"feye2",
                                  @"Guanwen Hua":@"guhua",
                                  @"HanGuang Dan":@"hadan",
                                  @"Hui Luo":@"huiluo",
                                  @"Jefferson Lyu":@"plv",
                                  @"Ji Li":@"jil3",
                                  @"Jinwei Ren":@"jinren",
                                  @"Jupiter Han":@"juphan",
                                  @"Kun Qian":@"kunq",
                                  @"Lin Qian":@"linqian",
                                  @"Mingmin Wang":@"mingmwan",
                                  @"Ning Liu":@"niliu2",
                                  @"Pan Qin":@"paqin",
                                  @"Pauline Zhang":@"pauzhang",
                                  @"Peng Li":@"peli3",
                                  @"Qingyuan Wang":@"qingywan",
                                  @"Qiongfang Zhang":@"qiozhang",
                                  @"Quinn Xie":@"quxie",
                                  @"Shucai Dong":@"shucdong",
                                  @"Sting Gao":@"stigao",
                                  @"Tim Chen":@"ttaiyue",
                                  @"Wansheng Kang":@"wakang",
                                  @"Wayne Zhu":@"wazhu",
                                  @"Wen Jiang":@"wejiang2",
                                  @"Wenbo Ma":@"wenbma",
                                  @"Winston Hu":@"chenguhu",
                                  @"Xifei Hua":@"xifhua",
                                  @"Xin Pan":@"xinpa",
                                  @"Xinyuan Tang":@"xinytang",
                                  @"Xiuquan Hao":@"xiuhao",
                                  @"Xiuwen Wu":@"xiuwwu",
                                  @"Xuemin Mei":@"xumei",
                                  @"Yifeng Xu":@"yifexu",
                                  @"Yu Jin":@"yjin2",
                                  @"Yuga Zhang":@"yujzhang",
                                  @"YuXiang Hu":@"yuxhu",
                                  @"Zheng Xing":@"zhexing",
                                  @"Zhenhua Chu":@"zhechu",
                                  @"Zhiqiang Chu":@"zhichu",
                                  @"Zhiqiang Wang":@"zhiqiawa"};
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
