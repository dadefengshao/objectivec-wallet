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

@required
-(void)receiveMonths:(NSMutableArray<Month*>*)months;

@end


@interface Services : NSObject

// properties
@property (nonatomic, weak) id<ServicesDelegate> delegate;

// methods
-(instancetype) init;
-(void)retrieveMonths;

@end
