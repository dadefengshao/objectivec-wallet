//
//  Month.h
//  Wallet
//
//  Created by Julianny Favinha on 7/25/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Month : NSObject

// public properties
@property (nonatomic, readwrite) NSNumber* num;
@property (nonatomic, readwrite) NSString* month;
@property (nonatomic, readwrite) NSMutableArray<Entry *>* entries;

// public methods
-(instancetype) init;
-(void) addEntry: (Entry*) entry;
-(NSNumber*) sumEntries;

@end
