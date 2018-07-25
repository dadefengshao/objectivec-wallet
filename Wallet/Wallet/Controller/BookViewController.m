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

#import "Month.h"

@interface BookViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray<Month*> *months;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeMonths];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeMonths {
    Month *month1 = [[Month alloc] init];
    month1.month = @"Janeiro";
    
    Entry *entry1 = [[Entry alloc] init];
    entry1.desc = @"Entry 1";
    entry1.value = @10.00;
    
    Entry *entry2 = [[Entry alloc] init];
    entry2.desc = @"Entry 2";
    entry2.value = @20.00;
    
    month1.entries = [NSMutableArray arrayWithArray:@[entry1, entry2]];
    
    Month *month2 = [[Month alloc] init];
    month2.month = @"Fevereiro";
    
    Entry *entry3 = [[Entry alloc] init];
    entry3.desc = @"Entry 3";
    entry3.value = @3.00;
    
    month2.entries = [NSMutableArray arrayWithArray:@[entry3]];
    
    months = [NSMutableArray arrayWithArray:@[month1, month2]];
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

@end
