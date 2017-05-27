//
//  UserinterfaceViewController.m
//  TP_lab8_2
//
//  Created by Admin on 27.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "UserinterfaceViewController.h"

@interface UserinterfaceViewController ()

@end

@implementation UserinterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage"]]];
    // Do view setup here.
}

- (IBAction)workWithAccount:(id)sender {
    [self performSegueWithIdentifier:@"BankAccount" sender:self];
}

- (IBAction)showBanksMap:(id)sender {
    [self performSegueWithIdentifier:@"BankMap" sender:self];
}


@end
