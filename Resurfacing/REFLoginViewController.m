//
//  REFLoginViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFLoginViewController.h"
#import "REFDashboardViewController.h"

@interface REFLoginViewController ()

@end

@implementation REFLoginViewController
@synthesize txtUsername,txtPassword;

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
	// Do any additional setup after loading the view.

}
-(void)viewWillAppear:(BOOL)animated
{
    txtPassword.text=@"";
    txtUsername.text=@"";
}
-(IBAction)login:(id)sender
{
   if(txtUsername.text.length==0 && txtPassword.text.length==0)
   {
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty"
                                                       message:@"Please enter your username and password."
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles: nil];
       [alert show];
       [txtUsername becomeFirstResponder];

   }
   else if(txtUsername.text.length<=0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty"
                                                        message:@"Please enter the username."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        [txtUsername becomeFirstResponder];
    }
    else if(txtPassword.text.length<=0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty"
                                                        message:@"Please enter the password."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        [txtPassword becomeFirstResponder];
    }
    else
    {
        REFDashboardViewController *dashboardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Dashboard"];
        [self.navigationController pushViewController:dashboardViewController animated:YES];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
