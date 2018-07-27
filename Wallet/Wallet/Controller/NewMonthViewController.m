//
//  NewMonthViewController.m
//  Wallet
//
//  Created by Julianny Favinha on 7/25/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "NewMonthViewController.h"
#import "Services.h"

@interface NewMonthViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, ServicesDelegate> {
    Services *services;
    NSMutableArray *_monthsString;
}

@property (weak, nonatomic) IBOutlet UIPickerView *monthPicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButtonItem;

@end

@implementation NewMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    services = [[Services alloc] init];
    services.delegate = self;
    
    _monthsString = [[NSMutableArray alloc] init];
    [_monthsString addObject:@"Janeiro"];
    [_monthsString addObject:@"Fevereiro"];
    [_monthsString addObject:@"Março"];
    [_monthsString addObject:@"Abril"];
    [_monthsString addObject:@"Maio"];
    [_monthsString addObject:@"Junho"];
    [_monthsString addObject:@"Julho"];
    [_monthsString addObject:@"Agosto"];
    [_monthsString addObject:@"Setembro"];
    [_monthsString addObject:@"Outubro"];
    [_monthsString addObject:@"Novembro"];
    [_monthsString addObject:@"Dezembro"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [services retrieveMonths];
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    Month *month = [[Month alloc] init];
    month.name = [_monthsString objectAtIndex:[_monthPicker selectedRowInComponent:0]];
    [services addMonth:month];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

/*
 #pragma mark - Picker View delegate methods
*/

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _monthsString.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _monthsString[row];
}

/*
 #pragma mark - Picker View delegate methods
 */

-(void)didAddMonth:(NSArray<Month*>*)months {
    NSLog(@"didAddMonth");
}

-(void)receiveMonths:(NSArray<Month*>*)months {
    NSMutableArray<NSString*> *existingMonths = [[NSMutableArray alloc] init];
    
    for (Month* month in months) {
        [existingMonths addObject:month.name];
    }
    
    [_monthsString removeObjectsInArray: existingMonths];
    
    if ([_monthsString count] == 0) {
        [_saveBarButtonItem setEnabled:false];
    }
}

@end

