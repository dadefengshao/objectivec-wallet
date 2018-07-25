//
//  Entry.m
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(instancetype) init {
    if (self = [super init]) {
        _num = self.num;
        _value = self.value;
        _desc = self.desc;
        _date = self.date;
        _type = self.type;
        _category = self.category;
        _payment = self.payment;
    }
    return self;
}

@end
