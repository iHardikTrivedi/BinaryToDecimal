//
//  ViewController.m
//  BinaryToDecimal
//
//  Created by Hardik Trivedi on 30/12/2015.
//  Copyright © 2015 TheiHartBit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - ViewLifeCycle Method

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.lblResult setText:@""];
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *allowedCharacters = @"01";
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:allowedCharacters];
    if ([string stringByTrimmingCharactersInSet:characterSet].length == 0) {
        return YES;
    } else {
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
        return NO;
    }
}

#pragma mark - IBAction Methods

- (IBAction)btnShowInDecimalTapped:(id)sender
{
    int intNumber = [self.txtBinaryNumber.text intValue];
    int intDecimalNumber = 0;
    
    for (int i = 0; intNumber > 0; i++) {
        int intLast = intNumber % 10;
        intDecimalNumber += (intLast * pow(2, i));
        intNumber /= 10;
    }
    
    [self.lblResult setText:[NSString stringWithFormat:@"Decimal Number : %d", intDecimalNumber]];
}

@end
