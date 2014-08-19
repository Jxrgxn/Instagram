//
//  ProfileViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    PFObject *user = [PFObject objectWithClassName:@"User"];
    self.profileNameLabel.text = user[@"name"];
}


@end
