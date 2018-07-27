//
//  Services.h
//  Wallet
//
//  Created by Julianny Favinha on 7/26/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Month.h"

@protocol ServicesDelegate

@optional
-(void)receiveMonths:(NSArray<Month*>*)months;
-(void)didReceiveMonth:(Month*)month;
-(void)receiveBalance:(NSNumber*)balance;
-(void)receiveSumIncomes:(NSNumber*)incomes;
-(void)receiveSumExpenses:(NSNumber*)expenses;
-(void)didAddMonth:(NSArray<Month*>*)months;
-(void)didAddEntry:(NSArray<Month*>*)months;

@end


@interface Services : NSObject

// properties
@property (nonatomic, weak) id<ServicesDelegate> delegate;

// methods
-(instancetype) init;
-(void)retrieveMonths;
-(void)retrieveMonth:(NSString*)name;
-(void)retrieveBalance;
-(void)retrieveSumIncomes;
-(void)retrieveSumExpenses;
-(void)addMonth:(Month*)month;
-(void)addEntry:(Month*)month :(Entry*)entry;
@end
