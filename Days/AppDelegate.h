//
//  AppDelegate.h
//  Days
//
//  Created by Jr on 4/5/13.
//  Copyright (c) 2013 Ailleurs. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem *statusItem;
}


- (IBAction) refreshDays:(id) sender;
- (IBAction) editDayst:(id) sender;

@property (assign) IBOutlet NSWindow *window;


@end
