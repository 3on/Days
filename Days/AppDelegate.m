//
//  AppDelegate.m
//  Days
//
//  Created by Jr on 4/5/13.
//  Copyright (c) 2013 Ailleurs. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [statusItem setTitle:@"42"];
    [statusItem setToolTip:@"Days of drought"];
    [statusItem setMenu:statusMenu];
    
    NSLog(@"Awake from  Nib");
    [self update];
}

- (IBAction)refreshDays:(id)sender {
    NSLog(@"refresh days");
}

- (void)update {
    NSLog(@"update");
}

@end
