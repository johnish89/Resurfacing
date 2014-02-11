//
//  REFNewInspection2ViewController.h
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <CoreLocation/CoreLocation.h>

@protocol ModalSelectLocationViewDelegate

-(void)didReceiveLatitude:(NSString *)latitudevalue longitudeValue:(NSString *)longitudevalue;

@end

@interface REFNewInspection2ViewController : UIViewController<ModalSelectLocationViewDelegate,MBProgressHUDDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtStreet8Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet9Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet10Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet11Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet12Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet13Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet14Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet15Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet16Direction;
@property (weak, nonatomic) IBOutlet UITextField *txtStreet17Direction;

@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet8;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet9;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet10;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet11;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet12;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet13;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet14;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet15;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet16;
@property (weak, nonatomic) IBOutlet UITextField *txtConnectingStreet17;

@property (weak, nonatomic) IBOutlet UITextField *txtInstructionsDerection1;
@property (weak, nonatomic) IBOutlet UITextField *txtInstructionsDerection2;
@property (weak, nonatomic) IBOutlet UITextField *txtInstructionsDerection3;
@property (weak, nonatomic) IBOutlet UITextField *txtInstructionsDerection4;

@end
