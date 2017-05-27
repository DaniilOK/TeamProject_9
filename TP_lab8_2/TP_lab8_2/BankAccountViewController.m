//
//  BankAccountViewController.m
//  TP_lab8_2
//
//  Created by Admin on 27.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "BankAccountViewController.h"

@interface BankAccountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addMoney;
@property (weak, nonatomic) IBOutlet UITextField *getMoney;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property double myMoney;
@property (weak, nonatomic) IBOutlet UILabel *showMoney;


@end

@implementation BankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage"]]];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *acc = (NSString*)[user objectForKey:@"account"];
    _myMoney = [acc doubleValue];
    NSString* myNewString = [NSString stringWithFormat:@"%.1f руб.", _myMoney];
    [self.showMoney setText: myNewString];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Add:(id)sender {
    if ([self.addMoney.text isEqualToString:@""]){
        [self.errorMessage setTextColor:UIColor.redColor];
        [self.errorMessage setText:@"Заполните пустое поле!"];
    }
    else{
        NSString *addmon = self.addMoney.text;
        _myMoney += [addmon doubleValue];
        [self.errorMessage setTextColor:UIColor.greenColor];
        [self.errorMessage setText:@"Операция прошла успешно!"];
        NSString* myNewString = [NSString stringWithFormat:@"%.1f руб.", _myMoney];
        [self.showMoney setText: myNewString];
        [self.addMoney setText:@""];
    }
    
}

- (IBAction)Get:(id)sender {
    if ([self.getMoney.text isEqualToString:@""]){
        [self.errorMessage setTextColor:UIColor.redColor];
        [self.errorMessage setText:@"Заполните пустое поле!"];
    }
    else{
        double getmon = [self.getMoney.text doubleValue];
        if (self.myMoney - getmon < 0){
            [self.errorMessage setTextColor:UIColor.redColor];
            [self.errorMessage setText:@"На счете не хватает средств!"];
        }
        else{
            self.myMoney -= getmon;
            [self.errorMessage setTextColor:UIColor.greenColor];
            [self.errorMessage setText:@"Операция прошла успешно!"];
            NSString* myNewString = [NSString stringWithFormat:@"%.1f руб.", _myMoney];
            [self.showMoney setText: myNewString];
            [self.getMoney setText:@""];
        }
    }
}

- (IBAction)back:(id)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString* myNewString = [NSString stringWithFormat:@"%.1f", _myMoney];
    [user setObject:myNewString forKey:@"account"];
    [self performSegueWithIdentifier:@"UserInterface" sender:self];
    
}


@end
