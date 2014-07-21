//
//  MatchViewController.m
//  collab
//
//  Created by Taeho Ko on 7/20/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "MatchViewController.h"

@interface MatchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (nonatomic) int profileImageIndex;
- (IBAction)onDoneButton:(id)sender;

@end

@implementation MatchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.profileImageIndex = self.currentImageIndex - 1;
    if (self.profileImageIndex == 0) {
        self.profileImageIndex = 5;
    }

    self.profileImageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"profile_0%d",(self.profileImageIndex)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
