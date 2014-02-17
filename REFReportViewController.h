//
//  REFReportViewController.h
//  Resurfacing
//
//  Created by John Norman on 2/10/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REFReportViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *iDNumber;
@property (weak, nonatomic) IBOutlet UITextField *inspectionDate;
@property (weak, nonatomic) IBOutlet UITextField *inspector;
@property (weak, nonatomic) IBOutlet UITextField *zone;

@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *improvements;
@property (weak, nonatomic) IBOutlet UITextField *limitsFrom;
@property (weak, nonatomic) IBOutlet UITextField *limitsTo;
@property (weak, nonatomic) IBOutlet UITextField *startStation;
@property (weak, nonatomic) IBOutlet UITextField *finishStation;
@property (weak, nonatomic) IBOutlet UITextField *pavementWidth;
@property (weak, nonatomic) IBOutlet UITextField *pavementLength;

@end
