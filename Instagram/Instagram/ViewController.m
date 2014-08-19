//
//  ViewController.m
//  Instagram
//
//  Created by Basel Farag on 8/18/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onButtonPressedSignIn:(id)sender
{
    //create User with properties and save the text field input to User
    PFObject *user = [PFObject objectWithClassName:@"User"];
    user[@"username"] = self.usernameTextField.text;
    user[@"password"] = self.passwordTextField.text;
    user[@"name"] = @"Harrison Ferrone";

    [user saveEventually:^(BOOL succeeded, NSError *error)
     {
         if (error)
         {
             NSLog(@"%@", [error userInfo]);
         }
     }];

    //resign keyboard when sign in button is pressed - when navigating back to this page the UI will be reset
    [self.passwordTextField resignFirstResponder];
}

@end
