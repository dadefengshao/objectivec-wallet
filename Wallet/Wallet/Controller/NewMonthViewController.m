//
//  NewMonthViewController.m
//  Wallet
//
//  Created by Julianny Favinha on 7/25/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

#import "NewMonthViewController.h"

@interface NewMonthViewController ()<UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray *_months;
}

@property (weak, nonatomic) IBOutlet UIPickerView *monthPicker;

@end

@implementation NewMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
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

@end


