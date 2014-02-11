//
//  REFNewInspectionViewController.h
//  Resurfacing
//
//  Created by Prime on 2/1/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@protocol ModalSelectLocationViewDelegate

-(void)didReceiveLatitude:(NSString *)latitudevalue longitudeValue:(NSString *)longitudevalue distance:(NSString *)distance;

@end

@interface REFNewInspectionViewController : UIViewController<ModalSelectLocationViewDelegate, MBProgressHUDDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate,CLLocationManagerDelegate>

@property(nonatomic,retain) UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *txtInspecDate;
@property (weak, nonatomic) IBOutlet UITextField *txtInspectionId;
@property (weak, nonatomic) IBOutlet UITextField *txtInspectorName;
@property (weak, nonatomic) IBOutlet UITextField *txtZone;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet;

@property (weak, nonatomic) IBOutlet UITextField *txtImprovements;
@property (weak, nonatomic) IBOutlet UITextField *txtLimitFrom;
@property (weak, nonatomic) IBOutlet UITextField *txtLimitTo;
@property (weak, nonatomic) IBOutlet UITextField *txtStartStation;
@property (weak, nonatomic) IBOutlet UITextField *txtFinishStation;
@property (weak, nonatomic) IBOutlet UITextField *txtPavWidth;
@property (weak, nonatomic) IBOutlet UITextField *txtPavLength;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet1;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet2;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet3;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet4;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet5;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet6;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet7;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet1Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet2Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet3Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet4Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet5Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet6Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet7Direction;






@end
