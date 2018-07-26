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
-(void)receiveMonths:(NSMutableArray<Month*>*)months;
-(void)receiveBalance:(NSNumber*)balance;
-(void)receiveSumIncomes:(NSNumber*)incomes;
-(void)receiveSumExpenses:(NSNumber*)expenses;
-(void)didAddMonth;

@end


@interface Services : NSObject

// properties
@property (nonatomic, weak) id<ServicesDelegate> delegate;

// methods
-(instancetype) init;
-(void)retrieveMonths;
-(void)retrieveBalance;
-(void)retrieveSumIncomes;
-(void)retrieveSumExpenses;
-(void)addMonth:(Month*)month;

@end
