//
//  REFNewInspection4ViewController.h
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REFNewInspection4ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtOnewayStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtOnewayStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtCotaRouteStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtCotaRouteStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtPavStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtPavStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtRPMStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtRPMStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtSideStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtSideStatus2;


@end
