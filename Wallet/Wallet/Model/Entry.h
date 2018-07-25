//
//  Entry.h
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

// public properties
@property (nonatomic, readwrite) NSNumber* num;
@property (nonatomic, readwrite) NSString* desc;
@property (nonatomic, readwrite) NSDate* date;
@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSString* category;
@property (nonatomic, readwrite) NSString* payment;

// public methods
-(instancetype) init;

@end
