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
        _name = self.name;
        _entries = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addEntry: (Entry*) entry {
    [_entries addObject:entry];
}

-(NSNumber*) sumEntries {
    NSNumber *sum = @0;
    
    for (Entry *entry in _entries) {
        sum = [NSNumber numberWithFloat:([sum floatValue] + [entry.value floatValue])];
    }
    
    return sum;
}

-(NSNumber*) sumIncomes {
    NSNumber *sumIncomes = @0;
    NSNumber *zero = @0;

    for (Entry *entry in _entries) {
        if (entry.value.floatValue > zero.floatValue) {
//            NSLog(@"value: %@", entry.value);
            sumIncomes = [NSNumber numberWithFloat:([sumIncomes floatValue] + [entry.value floatValue])];
        }
    }
    
    return sumIncomes;
}

-(NSNumber*) sumExpenses {
    NSNumber *sumExpenses = @0;
    NSNumber *zero = @0;
    
    for (Entry *entry in _entries) {
        if (entry.value.floatValue < zero.floatValue) {
            sumExpenses = [NSNumber numberWithFloat:([sumExpenses floatValue] + [entry.value floatValue])];
        }
    }
    
    return sumExpenses;
}

@end
