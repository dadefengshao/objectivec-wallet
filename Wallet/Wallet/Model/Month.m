//
//  Month.m
//  Wallet
//
//  Created by Julianny Favinha on 7/25/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "Month.h"
#import "Entry.h"

@implementation Month

-(instancetype) init {
    if (self = [super init]) {
        _num = self.num;
        _month = self.month;
        _entries = self.entries;
    }
    return self;
}

-(void) addEntry: (Entry*) entry {
    [_entries addObject:entry];
}

@end
