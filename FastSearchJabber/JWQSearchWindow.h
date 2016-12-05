//
//  JWQSearchWindow.h
//  FastSearchJabber
//
//  Created by jinren on 28/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface JWQSearchWindow : NSWindow<NSTextFieldDelegate, NSTableViewDelegate, NSSearchFieldDelegate>

@property (weak, nonatomic) IBOutlet NSSearchField* searchText;
@property (weak, nonatomic) IBOutlet NSTableView* nameTableView;
@property (weak, nonatomic) IBOutlet NSScrollView* scrollView;

@end
