//
//  GlobalHotKeyManager.m
//  FastSearchJabber
//
//  Created by jinren on 26/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "GlobalHotKeyManager.h"
#import <Carbon/Carbon.h>

@implementation GlobalHotKeyManager


//用于保存快捷键事件回调的引用，以便于可以注销
static EventHandlerRef g_EventHandlerRef = NULL;

//用于保存快捷键注册的引用，便于可以注销该快捷键
static EventHotKeyRef a_HotKeyRef = NULL;
static EventHotKeyRef b_HotKeyRef = NULL;

//快捷键注册使用的信息，用在回调中判断是哪个快捷键被触发
static EventHotKeyID a_HotKeyID = {'keyA',1};
static EventHotKeyID b_HotKeyID = {'keyB',2};

+ (instancetype)ShareInstance
{
    static GlobalHotKeyManager *gHotKeyManager = nil;
    if (gHotKeyManager == nil) {
         gHotKeyManager = [[GlobalHotKeyManager alloc] init];
    }
    return gHotKeyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//快捷键的回调方法
OSStatus myHotKeyHandler(EventHandlerCallRef inHandlerCallRef, EventRef inEvent, void *inUserData)
{
    //判定事件的类型是否与所注册的一致
    if (GetEventClass(inEvent) == kEventClassKeyboard && GetEventKind(inEvent) == kEventHotKeyPressed)
    {
        //获取快捷键信息，以判定是哪个快捷键被触发
        EventHotKeyID keyID;
        GetEventParameter(inEvent,
                          kEventParamDirectObject,
                          typeEventHotKeyID,
                          NULL,
                          sizeof(keyID),
                          NULL,
                          &keyID);
        if (keyID.id == a_HotKeyID.id) {
            NSLog(@"pressed:shift+command+A");
        }
        if (keyID.id == b_HotKeyID.id) {
            NSLog(@"pressed:option+B");
        }
    }
    
    return noErr;
}

- (void)registerGlobalHotKey
{
    //先注册快捷键的事件回调
    EventTypeSpec eventSpecs[] = {{kEventClassKeyboard,kEventHotKeyPressed}};
    InstallApplicationEventHandler(NewEventHandlerUPP(myHotKeyHandler),
                                   GetEventTypeCount(eventSpecs),
                                   eventSpecs,
                                   NULL,
                                   &g_EventHandlerRef);
    
    //注册快捷键:shift+command+A
    RegisterEventHotKey(kVK_ANSI_A,
                        cmdKey|shiftKey,
                        a_HotKeyID,
                        GetApplicationEventTarget(),
                        0,
                        &a_HotKeyRef);
    
    //注册快捷键:option+B
    RegisterEventHotKey(kVK_ANSI_B,
                        optionKey,
                        b_HotKeyID,
                        GetApplicationEventTarget(),
                        0,
                        &b_HotKeyRef);
}

- (void)unRegisterGlobalHotKey
{
    //注销快捷键
    if (a_HotKeyRef)
    {
        UnregisterEventHotKey(a_HotKeyRef);
        a_HotKeyRef = NULL;
    }
    if (b_HotKeyRef)
    {
        UnregisterEventHotKey(b_HotKeyRef);
        b_HotKeyRef = NULL;
    }
    //注销快捷键的事件回调
    if (g_EventHandlerRef)
    {
        RemoveEventHandler(g_EventHandlerRef);
        g_EventHandlerRef = NULL;
    }
}

@end
