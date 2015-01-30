//
//  ViewController.m
//  HireMe
//
//  Created by Seema on 1/22/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIApplicationDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet CustomPopoverView *popoverSignIn;

@property (strong, nonatomic) IBOutlet CustomPopoverView *popoverSignUP;
@property (strong, nonatomic) IBOutlet CustomPopoverView *popoverLinkedIn;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldPassword;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Padding in textField
    
    [self paddingWithTextField:self.txtFieldEmail andPlaceholder:@"E-mail"];
    [self paddingWithTextField:self.txtFieldPassword andPlaceholder:@"Password"];
    
    
    //SignIn Button
    [self.popoverSignIn setTitle:@"SIGN IN"];
    [self.popoverSignIn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"signIn.png"]]];
    [self.popoverSignIn setTitleFontSize:15];
    [self.popoverSignIn addTarget:self action:@selector(signInTapped) forControlEvents:UIControlEventTouchUpInside];
    
    //SignUp Button
    [self.popoverSignUP setTitle:@"SIGN UP"];
    [self.popoverSignUP setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"signup-button.png"]]];
    [self.popoverSignUP setTitleFontSize:16];
    [self.popoverSignUP addTarget:self action:@selector(signUpTapped) forControlEvents:UIControlEventTouchUpInside];
    
    //LoginUsing Linked In
    [self.popoverLinkedIn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"linkedIn.png"]]];
    [self.popoverLinkedIn addTarget:self action:@selector(linkedInTapped) forControlEvents:UIControlEventTouchUpInside];

}

-(void)paddingWithTextField:(UITextField*)textField andPlaceholder:(NSString*)placeholder {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.placeholder = placeholder;
    [textField setValue:[UIColor colorWithWhite:255.0f alpha:0.8] forKeyPath:@"_placeholderLabel.textColor"];
    textField.textColor =[UIColor customColorWhite];
}

-(void)signInTapped {

}

-(void)signUpTapped {

}

-(void)linkedInTapped {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
