//
//  REFNewInspectionResultViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFNewInspectionResultViewController.h"
#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>



@interface REFNewInspectionResultViewController ()

@end

@implementation REFNewInspectionResultViewController
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
    scrollView.frame = CGRectMake(0,0, 768, 1024);
    [scrollView setContentSize:CGSizeMake(768, 1400)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
