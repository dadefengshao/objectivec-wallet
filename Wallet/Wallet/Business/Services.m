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
#import "Wallet-Swift.h"

@implementation Services

-(instancetype) init {
    if (self = [super init]) {
        _delegate = self.delegate;
    }
    
    return self;
}

// public methods
-(void)retrieveMonths {
    NSLog(@"retrieveMonths");
    
    [_delegate receiveMonths:[DatabaseManager getPropertyList]];
}

-(void)addMonth:(Month *)month {
    NSLog(@"addMonth %@", month.name);
    month.num = @0;

    NSArray<Month*>* months = [DatabaseManager addPropertyListWithMonth:month];
    
    [_delegate didAddMonth:months];
}

-(void)retrieveBalance {
    NSLog(@"retrieveBalance");
    
    NSArray<Month*>* months = [DatabaseManager getPropertyList];
    NSNumber* balance = @0;
    
//    for (Month *month in months) {
//        for (Entry *entry in month.entries) {
//            NSLog(@"entry: %@, %@", entry.desc, entry.value);
//        }
//    }

    for (Month *month in months) {
        balance = [NSNumber numberWithFloat:([balance floatValue] + [[month sumEntries] floatValue])];
    }
    
    [_delegate receiveBalance:balance];
}

-(void)retrieveSumIncomes {
    NSLog(@"retrieveSumIncomes");
    
    NSArray<Month*>* months = [DatabaseManager getPropertyList];
    NSNumber* incomes = @0;

    for (Month *month in months) {
        incomes = [NSNumber numberWithFloat:([incomes floatValue] + [[month sumIncomes] floatValue])];
    }
    
    [_delegate receiveSumIncomes:incomes];
}

-(void)retrieveSumExpenses {
    NSLog(@"retrieveSumIncomes");
    
    NSArray<Month*>* months = [DatabaseManager getPropertyList];
    NSNumber* expenses = @0;

    for (Month *month in months) {
        expenses = [NSNumber numberWithFloat:([expenses floatValue] + [[month sumExpenses] floatValue])];
    }
    
    [_delegate receiveSumExpenses:expenses];
    
}

@end
