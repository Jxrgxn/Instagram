//
//  FeedViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property NSArray *userArray;

@end

@implementation FeedViewController

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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"feedCellID" forIndexPath:indexPath];

    return cell;
}

@end
