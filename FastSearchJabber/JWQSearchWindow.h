//
//  JWQSearchWindow.h
//  FastSearchJabber
//
//  Created by jinren on 28/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JWQSearchWindow : NSWindow<NSTextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSTextField* inputText;
@end
