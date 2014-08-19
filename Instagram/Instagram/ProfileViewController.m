//
//  ProfileViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property NSArray *userArray;
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *postNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingNumberLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.userArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"profileCellID" forIndexPath:indexPath];

    return cell;
}

@end
