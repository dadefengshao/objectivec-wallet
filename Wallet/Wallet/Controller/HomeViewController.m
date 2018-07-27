//
//  HomeViewController.m
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "HomeViewController.h"
#include "Services.h"

@interface HomeViewController ()<ServicesDelegate> {
    Services *services;
}

@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UILabel *expense;
@property (weak, nonatomic) IBOutlet UILabel *income;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    services = [[Services alloc] init];
    services.delegate = self;
    [services retrieveBalance];
    [services retrieveSumIncomes];
    [services retrieveSumExpenses];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - ServicesDelegate methods
 */

- (void)receiveBalance:(NSNumber *)balance {
    NSLog(@"receiveBalance");
    
    _balance.text = [balance stringValue];
}

-(void)receiveSumIncomes:(NSNumber*)incomes {
    NSLog(@"receiveSumIncomes");

    _income.text = [incomes stringValue];
}

-(void)receiveSumExpenses:(NSNumber*)expenses {
    NSLog(@"receiveSumExpenses");

    _expense.text = [expenses stringValue];
}

@end
