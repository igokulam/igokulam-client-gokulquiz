//
//  AnswerViewController.m
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

@synthesize choices, level, selections, qnTitle, qnText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    for (int i = 1; i <= [choices count]; i++) {
        [selections setValue:@"0" forKey:[NSString stringWithFormat:@"%d", i]];
    }
    [pickerView reloadAllComponents];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pickerView:(UIPickerView *)pV didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [selections setValue:@"1" forKey:[NSString stringWithFormat:@"%d", row]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [choices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[choices objectAtIndex:row] objectForKey:@"TEXT"];
    
}

- (IBAction)okayPressed:(id)sender {
    
    NSString *correct = @"NO";
    // Now go thru the list and tally the correct answers first
    for (int i = 1; i <= [choices count]; i++) {
        // TODO
    }
    
}

@end
