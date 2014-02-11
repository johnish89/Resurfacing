//
//  REFNewInspection3ViewController.h
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REFNewInspection3ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtItem408Status1;
@property (weak, nonatomic) IBOutlet UITextField *txtItem408Status2;
@property (weak, nonatomic) IBOutlet UITextField *txtItem254Status1;
@property (weak, nonatomic) IBOutlet UITextField *txtItem254Status2;
@property (weak, nonatomic) IBOutlet UITextField *txtItem413Status1;
@property (weak, nonatomic) IBOutlet UITextField *txtItem413Status2;

@property (weak, nonatomic) IBOutlet UITextField *txtItemBrickStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtItemBrickStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtItemSamiStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtItemSamiStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtItemPrelevelStatus1;

@property (weak, nonatomic) IBOutlet UITextField *txtItemPrelevelStatus2;
@property (weak, nonatomic) IBOutlet UITextField *txtItemAsphStatus1;
@property (weak, nonatomic) IBOutlet UITextField *txtItemAsphStatus2;

@end
