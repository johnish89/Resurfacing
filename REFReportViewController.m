//
//  REFReportViewController.m
//  Resurfacing
//
//  Created by John Norman on 2/10/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFReportViewController.h"

@interface REFReportViewController ()

@end

@implementation REFReportViewController
@synthesize scrollView;
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
    
    scrollView.frame = CGRectMake(0,0, 768, 4000);
    [scrollView setContentSize:CGSizeMake(768, 4001)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
