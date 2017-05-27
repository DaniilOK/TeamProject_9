//
//  ViewController.m
//  TP_lab8_2
//
//  Created by Admin on 26.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *registerView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage"]]];
    
    [_registerView setHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swithcLoginRegistration:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *) sender;
    NSInteger select = seg.selectedSegmentIndex;
    [self.errorMessage setText:@""];
    if(select == 0){
        [self.logInView setHidden:NO];
        [self.registerView setHidden:YES];
    }
    else {
        [self.logInView setHidden:YES];
        [self.registerView setHidden:NO];
    }
}


- (IBAction)acceptRoules:(id)sender {
    UISwitch *swit = (UISwitch *) sender;
    
    
    if ([swit isOn])
        self.registry.enabled = true;
    else
        self.registry.enabled = false;
}


- (IBAction)LogIN:(id)sender {
    [self.errorMessage setTextColor:UIColor.redColor];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([self.loginEntry.text isEqualToString:(NSString*)[user objectForKey:@"login"]] && [self.passwordEntry.text isEqualToString:(NSString*)[user objectForKey:@"password"]])
    {
        [self performSegueWithIdentifier:@"UserInterface" sender:self];
    }
    else{
        [self.errorMessage setText:@"Неверно введены данные!"];
    }
}

- (IBAction)Registration:(id)sender {
    [self.errorMessage setTextColor:UIColor.redColor];
    if (![self.loginRegistry.text isEqualToString:@""] && ![self.passwordRegistry.text isEqualToString:@""]){
        if (![self.passwordRegistry.text isEqualToString:self.retryPasswordRegistry.text])
            [self.errorMessage setText:@"Поля \"пароль\" и \"повторите пароль\" должны совпадать"];
        else {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:self.loginRegistry.text forKey:@"login"];
        [user setObject:self.passwordRegistry.text forKey:@"password"];
        [user setObject:self.emailRegistry.text forKey:@"email"];
        [user setObject:@"0" forKey:@"account"];
            
            [self.errorMessage setTextColor:UIColor.greenColor];
            [self.errorMessage setText:@"Вы успешно зарегистрировались!"];
            
        }
    }
    else
        [self.errorMessage setText:@"Заполните пустые поля!"];
    
}






@end
