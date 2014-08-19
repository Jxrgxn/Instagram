//
//  FollowingViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "FollowingViewController.h"

@interface FollowingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *followersTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *followingNewsSegmentedControl;
@property NSArray *userArray;

@end

@implementation FollowingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"followingCellID"];

    return cell;
}

@end
