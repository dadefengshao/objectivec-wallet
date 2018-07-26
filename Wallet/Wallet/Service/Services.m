//
//  Services.m
//  Wallet
//
//  Created by Julianny Favinha on 7/26/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "Services.h"
#import "Month.h"
#import "Entry.h"

@implementation Services

-(instancetype) init {
    if (self = [super init]) {
        _delegate = self.delegate;
    }
    return self;
}

//private methods
-(NSMutableArray<Month*>*)months {
    Month *month1 = [[Month alloc] init];
    month1.month = @"Janeiro";
    
    Entry *entry1 = [[Entry alloc] init];
    entry1.desc = @"Entry 1";
    entry1.value = @10.00;
    
    Entry *entry2 = [[Entry alloc] init];
    entry2.desc = @"Entry 2";
    entry2.value = @20.00;
    
    month1.entries = [NSMutableArray arrayWithArray:@[entry1, entry2]];
    
    Month *month2 = [[Month alloc] init];
    month2.month = @"Fevereiro";
    
    Entry *entry3 = [[Entry alloc] init];
    entry3.desc = @"Entry 3";
    entry3.value = @3.00;
    
    month2.entries = [NSMutableArray arrayWithArray:@[entry3]];
    
    return [NSMutableArray arrayWithArray:@[month1, month2]];
}

// public methods
-(void)retrieveMonths {
    NSLog(@"retrieveMonths");

    [_delegate receiveMonths:[NSMutableArray arrayWithArray:[self months]]];
}

-(void)retrieveBalance {
    NSLog(@"retrieveMonths");
    
    NSMutableArray<Month*>* months = [self months];
    NSNumber* balance = @0;
    
    for (Month *month in months) {
        balance = [NSNumber numberWithFloat:([balance floatValue] + [[month sumEntries] floatValue])];
    }
    
    [_delegate receiveBalance:balance];
}

@end
