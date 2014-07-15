//
//  LoginViewController.m
//  collab
//
//  Created by Taeho Ko on 7/14/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "LoginViewController.h"
#import "TabViewController.h"
#import "DiscoverViewController.h"
#import "ChatViewController.h"
#import "ProfileViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIView *uiTextField;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)onEditingChanged:(id)sender;
- (IBAction)onLoginButton:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.passwordTextField.secureTextEntry = YES;
    self.loginButton.enabled = NO;
    self.indicatorView.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.uiTextField.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.uiTextField.frame.size.height, self.uiTextField.frame.size.width, self.uiTextField.frame.size.height);
                         
                         self.logoImageView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y +10);
                     }
                     completion:nil];
}


- (void)willHideKeyboard:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect containerFrame = self.uiTextField.frame;
                         containerFrame.origin.y += 60;
                         self.uiTextField.frame = containerFrame;
                         
                         self.logoImageView.transform = CGAffineTransformMakeScale(1, 1);
                         self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y -10);
                     } completion:nil ];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

- (IBAction)onEditingChanged:(id)sender {
    
    if (([self.passwordTextField.text isEqualToString:@""]) || ([self.usernameTextField.text isEqualToString:@""])) {
        self.loginButton.enabled = NO;
        
    } else {
        self.loginButton.enabled = YES;
    }
}


- (IBAction)onLoginButton:(id)sender {
    [self.indicatorView startAnimating];
    self.indicatorView.alpha = 1;
    
    [self performSelector:@selector(loadCondition) withObject:nil afterDelay:1];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = self.view.center;
    
    [self.view addSubview:indicatorView];
    
}

- (void) loadCondition
{
    [self.indicatorView stopAnimating];
    self.indicatorView.alpha = 0;
    
    if ([self.passwordTextField.text isEqualToString:@"password"]) {
        self.loginButton.enabled = YES;
        [self presentMainPage];
        
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Wrong email or password" message:@"Please try enter user name and password again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        self.loginButton.enabled = YES;
        
    }
    
}

- (void)presentMainPage {
    TabViewController *tabVC = [[TabViewController alloc] init];
    tabVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    ChatViewController *chatVC = [[ChatViewController alloc] init];
    ProfileViewController *profileVC = [[ProfileViewController alloc] init];
    
    UINavigationController *discoverNVC = [[UINavigationController alloc] initWithRootViewController: discoverVC];
    UINavigationController *chatNVC = [[UINavigationController alloc] initWithRootViewController: chatVC];
    UINavigationController *profileNVC = [[UINavigationController alloc] initWithRootViewController: profileVC];
    
    tabVC.viewControllers = @[discoverNVC, chatNVC, profileNVC];
    
    discoverNVC.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    discoverNVC.navigationBar.translucent = NO;
    discoverNVC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    chatNVC.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    chatNVC.navigationBar.translucent = NO;
    chatNVC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    profileNVC.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    profileNVC.navigationBar.translucent = NO;
    profileNVC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [self presentViewController:tabVC animated:YES completion:nil];

}
@end
