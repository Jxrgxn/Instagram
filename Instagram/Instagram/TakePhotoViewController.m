//
//  TakePhotoViewController.m
//  Instagram
//
//  Created by Harrison Ferrone on 8/19/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "TakePhotoViewController.h"

@interface TakePhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation TakePhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.imagePicker = [UIImagePickerController new];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;

}


- (IBAction)onButtonTapped:(id)sender {
    if  ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}

-(IBAction)onTappedLibrary:(id)sender
{
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.imageView.image = selectedImage;

        NSData *imageData = UIImageJPEGRepresentation(selectedImage, 0.06);

        PFObject *userPhoto = [PFObject objectWithClassName:@"userPhoto"];

        [userPhoto setObject:[PFFile fileWithData:imageData] forKey:@"imageFile"];
        [userPhoto saveInBackground];
    }];
}


#pragma mark - Upload Image

-(void)uploadImage:(NSData *)imageData
{
    PFObject *userPhoto = [PFObject objectWithClassName:@"userPhoto"];
    [userPhoto setObject:[PFFile fileWithData:imageData] forKey:@"imageFile"];
    [userPhoto setObject:[PFUser currentUser] forKey:@"user"];
    [userPhoto saveInBackground];
}

-(void)downloadImages
{
    PFQuery *query = [PFQuery queryWithClassName:@"UserPhoto"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"UserPhoto" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%lu",(unsigned long)objects.count);
        for (PFObject *photo in objects) {
            NSLog(@"%@", objects);
        }
         }];

        //if there are photos we start extracting the data
        //Save list of object IDs while extracting the data
//        NSMutableArray *newObjectIDArray = [NSMutableArray new];
//        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
//
//        if (objects.count > 0){
//            for (PFObject *eachObject in objects){
//                [newObjectIDArray addObject:[eachObject objectId]];
//            }
//        }
//
//        NSMutableArray *newCompareObjectIDArray = [NSMutableArray arrayWithArray:newObjectIDArray];
//        NSMutableArray *newCompareObjectIDArray2 = [NSMutableArray arrayWithArray:newObjectIDArray];
//        NSMutableArray *oldCompareObjectIDArray = [standardUserDefaults objectForKey:@"objectIDArray"];
//        if([standardUserDefaults objectForKey:@"objectIDArray"]){
//            [newCompareObjectIDArray removeObjectsInArray:oldCompareObjectIDArray]; //So Now you just have the new objects
//


//        }
//        
//    }];
}

//- (void)buttonTouched:(id)sender {
//    // When picture is touched, open a viewcontroller with the image
//    PFObject *theObject = (PFObject *)[allImages objectAtIndex:[sender tag]];
//    PFFile *theImage = [theObject objectForKey:@"imageFile"];
//
//    NSData *imageData;
//    imageData = [theImage getData];
//    UIImage *selectedPhoto = [UIImage imageWithData:imageData];
//    PhotoDetailViewController *pdvc = [[PhotoDetailViewController alloc] init];
//
//    pdvc.selectedImage = selectedPhoto;
//    [self presentViewController:pdvc animated:YES completion:nil];
//}

#pragma mark -- You're gonna have to refresh the view here 

/*-(void)downloadAllImages
{
    PFQuery *photoQuery = [PFQuery queryWithClassName:@"userPhoto"];
    PFUser *user = [PFUser currentUser];
    [photoQuery whereKey:@"user" equalTo:user];

    NSMutableArray *photoObjectArray = [NSMutableArray new];
    if (objects.count > 0){
        for (PFObject *eachObject in objects) {
        [photoObjectArray addObject:[eachObject objectId]];
        }
    }

}*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
