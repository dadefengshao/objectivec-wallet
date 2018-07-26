//
//  BookViewController.m
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "BookViewController.h"

// import to view swift classes
#import "Wallet-Swift.h"

#include "Services.h"

@interface BookViewController ()<UITableViewDataSource, UITableViewDelegate, ServicesDelegate> {
    Services *services;
    NSMutableArray<Month*> *months;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    services = [[Services alloc] init];
    services.delegate = self;
    [services retrieveMonths];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueMonth"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MonthViewController *destViewController = segue.destinationViewController;
        destViewController.month = months[indexPath.row];
    }
}

/*
 #pragma mark - Table View methods
 */

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* cellId = @"BookCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    cell.textLabel.text = months[indexPath.row].month;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return months.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"SegueMonth" sender:self];
}

/*
 #pragma mark - ServicesDelegate methods
 */

- (void)receiveMonths:(NSMutableArray<Month*>*)months {
    NSLog(@"receiveMonths");
    self->months = months;
    [_tableView reloadData];
}

@end
