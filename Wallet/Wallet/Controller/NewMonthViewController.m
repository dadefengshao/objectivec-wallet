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
    NSArray *_months;
}

@property (weak, nonatomic) IBOutlet UIPickerView *monthPicker;

@end

@implementation NewMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    services = [[Services alloc] init];
    services.delegate = self;
    
    _months = @[@"Janeiro",
                @"Fevereiro",
                @"Março",
                @"Abril",
                @"Maio",
                @"Junho",
                @"Julho",
                @"Agosto",
                @"Setembro",
                @"Outubro",
                @"Novembro",
                @"Dezembro"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    Month *month = [[Month alloc] init];
    month.name = [_months objectAtIndex:[_monthPicker selectedRowInComponent:0]];
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
    return _months.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _months[row];
}

/*
 #pragma mark - Picker View delegate methods
 */

-(void)didAddMonth:(NSArray<Month*>*)months {
    NSLog(@"didAddMonth");
}

@end


