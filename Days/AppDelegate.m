//
//  AppDelegate.m
//  Days
//
//  Created by Jr on 4/5/13.
//  Copyright (c) 2013 Ailleurs. All rights reserved.
//

#import "AppDelegate.h"
#import "AFHTTPRequestOperation.h"

@implementation AppDelegate

- (void)awakeFromNib {
    NSLog(@"Awake from  Nib");
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setToolTip:@"Days of drought"];
    [statusItem setMenu:statusMenu];
    [statusItem setTitle:@"-"];
    [statusItem setHighlightMode:YES];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:360 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    
    [self refresh];
}

/*
    Actions
*/
- (IBAction)refreshDays:(id)sender {
    NSLog(@"refresh days");
    [self refresh];
}

- (IBAction)editDayst:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://gist.github.com/3on/939ce16194fe4263a4c1"]; // not cool
    NSWorkspace *workspace = [[NSWorkspace alloc] init]; // sounds quite uncool to init everytime.
    [workspace openURL: url];
}

/*
    Methods
*/

- (int)daysFromNow:(NSDate *)dt {
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [[NSDate alloc] init];
    NSDateComponents *components = [calendar components:unitFlags fromDate:dt toDate:now options:0];
    return (int)[components day] + 1;
}

- (void)refresh {
    NSLog(@"update");
    
    NSURL *url = [NSURL URLWithString:@"https://gist.github.com/3on/939ce16194fe4263a4c1/raw/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSArray *dates = [str componentsSeparatedByString:@"\n"];
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"dd'-'MM'-'yyyy"];
        NSDate *date = [formater dateFromString: [dates objectAtIndex:0]];
        NSLog(@"%@", [date description]);
        NSNumber *nb = @([self daysFromNow:date]);
        
        [statusItem setTitle: [nb stringValue]];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [operation start];
}


@end
