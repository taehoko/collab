//
//  ChatViewController.m
//  collab
//
//  Created by Taeho Ko on 7/13/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatGraceViewController.h"

@interface ChatViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *ChatListScrollView;
@property (weak, nonatomic) IBOutlet UIView *graceView;
- (IBAction)onGraceTap:(UITapGestureRecognizer *)sender;


@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Chat";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.ChatListScrollView.contentSize = CGSizeMake(320,562);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGraceTap:(UITapGestureRecognizer *)sender {
    
//    ChatGraceViewController *chatGraceVC = [[ChatGraceViewController alloc] init];
//    [self.navigationController pushViewController:chatGraceVC animated:YES];

    self.graceView.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1];
    
    ChatGraceViewController *chatGraceVC = [[ChatGraceViewController alloc] init];
    UINavigationController *chatGraceNVC = [[UINavigationController alloc] initWithRootViewController:chatGraceVC];
    
    chatGraceVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    chatGraceNVC.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    chatGraceNVC.navigationBar.translucent = NO;
    chatGraceNVC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    [self presentViewController:chatGraceNVC animated:YES completion:nil];
    
}

@end
