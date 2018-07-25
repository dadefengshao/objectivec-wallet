//
//  BookViewController.m
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray<NSString *> *months;
    NSMutableArray<NSNumber *> *values;
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
    months = [NSMutableArray arrayWithArray:@[@"Junho", @"Julho"]];
    values = [NSMutableArray arrayWithArray:@[@-100.55f, @249.00f]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/*
 #pragma mark - Table View methods
 */

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* cellId = @"BookCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    cell.textLabel.text = months[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", values[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return months.count;
}

@end
