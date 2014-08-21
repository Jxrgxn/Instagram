//
//  FeedViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedCellTableViewCell.h"

@interface FeedViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSMutableArray *allImagesArray;

@end

@implementation FeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allImagesArray = [NSMutableArray new];
    [self downloadAllImages];
}

-(void)downloadAllImages
{
    PFQuery *allImageQuery = [PFQuery queryWithClassName:@"userPhoto"];
    [allImageQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        for (PFObject *object in objects) {
            PFFile *file = [object objectForKey:@"imageFile"];
            [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                UIImage *image = [UIImage imageWithData:data];
                [self.allImagesArray addObject:image];
                [self.myTableView reloadData];
                NSLog(@"%lu", (unsigned long)self.allImagesArray.count);
            }];
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.allImagesArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID" forIndexPath:indexPath];

    cell.imageView.image = [self.allImagesArray objectAtIndex:indexPath.row];
    
    return cell;
}




@end
