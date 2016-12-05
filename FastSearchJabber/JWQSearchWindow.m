//
//  JWQSearchWindow.m
//  FastSearchJabber
//
//  Created by jinren on 28/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "JWQSearchWindow.h"
#import "JWContactDataManager.h"
#import "JWUserNameDataSource.h"

#define TABLEVIEW_ROW_HEIGH     22


@implementation JWQSearchWindow

- (void)awakeFromNib
{
    [super awakeFromNib];
    //self.styleMask = self.styleMask & ~NSWindowStyleMaskTitled;
    self.searchText.delegate = self;
    self.searchText.sendsSearchStringImmediately = NO;
    self.nameTableView.delegate = self;
    self.nameTableView.dataSource = [JWUserNameDataSource ShareInstance];
    [[JWContactDataManager ShareInstance] addObserver:self forKeyPath:@"strFilter" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)becomeKeyWindow
{
    //[self.searchText becomeFirstResponder];
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}

- (BOOL)canBecomeMainWindow
{
    return YES;
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{

    NSInteger numOfContact = [[JWContactDataManager ShareInstance].contacts count];
    NSInteger tableView_heigh = numOfContact * TABLEVIEW_ROW_HEIGH;
    
    NSLog(@"keyPath: %@, tableView_heigh:%ld", keyPath, tableView_heigh);
    NSRect f = self.contentView.frame;
    f.size.height = self.nameTableView.frame.size.height;
    self.nameTableView.frame = f;
    NSLog(@"keyPath: %@, tableView_heigh:%ld, frame:%@", keyPath, tableView_heigh, NSStringFromRect(f));
}

- (IBAction)startFilterTableView:(id)sender
{
  //  NSLog(@"startFilterTableView");
}

# pragma mark NSTableviewDelegate
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return TABLEVIEW_ROW_HEIGH;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    return YES;
}
#pragma mark NSSearchDelegate

- (void)controlTextDidChange:(NSNotification *)obj
{
    NSLog(@"searchText: %@", [obj.object stringValue]);
    [[JWContactDataManager ShareInstance] setStrFilter:[obj.object stringValue]];
    [self.nameTableView reloadData];
    
    if (self.nameTableView.numberOfRows > 0) {
        [self.nameTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:YES];
    }
}

- (void)searchFieldDidEndSearching:(NSSearchField *)sender
{
    NSLog(@"didEnd:%@", sender.stringValue);
}

- (void)searchFieldDidStartSearching:(NSSearchField *)sender
{
    NSLog(@"didStart:%@", sender.stringValue);
}


- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector
{
    if (commandSelector == @selector(insertNewline:)) {
        JWContact* contact = [self getTableViewSelectContact];
        if (contact == nil) {
            return NO;
        }
        NSEvent* event = [NSApp currentEvent];
        if((event.modifierFlags & NSEventModifierFlagShift) == NSEventModifierFlagShift){
            NSLog(@"Shitf+Enter Pressed");
            [self startToCall:contact];
        } else {
            NSLog(@"Enter Pressed");
            [self startToChat:contact];
        }
    } else if(commandSelector == @selector(moveDown:)) {
        [self moveSelectionToNextTableViewCell];
    } else if (commandSelector == @selector(moveUp:)) {
        [self moveSelectionToPreTableViewCell];
    } else {
        return NO;
    }
    return YES;
}
#pragma mark Keypad

- (void)keyDown:(NSEvent *)event
{
    [super keyDown:event];
    NSLog(@"keyDown:%@", event);
    JWContact* contact = [self getTableViewSelectContact];
    if (event.keyCode != 36 || contact == nil) {
        return;
    }
    
    if((event.modifierFlags & NSEventModifierFlagShift) == NSEventModifierFlagShift){
        NSLog(@"Shitf+Enter Pressed");
        [self startToCall:contact];
    } else {
        NSLog(@"Enter Pressed");
        [self startToChat:contact];
    }
}

#pragma mark CrossLaunch
- (void)startToChat:(JWContact*)contact
{
    NSLog(@"start To Chat : %@", contact.jid);
    NSString* imURL = [NSString stringWithFormat:@"ciscoim://%@", contact.jid];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:imURL]];
    [NSApp hide:nil];

}

- (void)startToCall:(JWContact*)contact
{
    NSLog(@"start To Call: %@", contact.jid);
    NSString* imURL = [NSString stringWithFormat:@"ciscotel://%@", contact.jid];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:imURL]];
    [NSApp hide:nil];

}

- (void)moveSelectionToNextTableViewCell
{
    NSInteger index = self.nameTableView.selectedRow;
    NSInteger numOfRows = self.nameTableView.numberOfRows;
    index = (index + 1) % numOfRows;
    
    [self.nameTableView deselectAll:self.nameTableView];
    [self.nameTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:index] byExtendingSelection:YES];
}

- (void)moveSelectionToPreTableViewCell
{
    
    NSInteger index = self.nameTableView.selectedRow;
    NSInteger numOfRows = self.nameTableView.numberOfRows;
    index = (index + numOfRows - 1) % numOfRows ;
    
    [self.nameTableView deselectAll:self.nameTableView];
    [self.nameTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:index] byExtendingSelection:YES];
    
}

- (IBAction)tableViewAction:(id)sender
{
    NSLog(@"action");
}

- (IBAction)tableViewDoubleAction:(id)sender
{
    NSLog(@"Double action");
}

- (JWContact*)getTableViewSelectContact
{
    if (self.nameTableView.selectedRow < 0) {
        return nil;
    }
    JWContact* contact = [[JWUserNameDataSource ShareInstance].filterContacts objectAtIndex:self.nameTableView.selectedRow];
    return contact;
}

- (void)dealloc
{
    [self removeObserver:self.nameTableView.dataSource forKeyPath:@"@count.filterContacts"];
}
@end
