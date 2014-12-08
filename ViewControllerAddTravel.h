//
//  ViewControllerAddTravel.h
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewController.h"
#import "Travel.h"

@interface ViewControllerAddTravel : ViewController
@property Travel *travel;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnStar1;
@property (weak, nonatomic) IBOutlet UIButton *btnStar2;
@property (weak, nonatomic) IBOutlet UIButton *btnStar3;
@property (weak, nonatomic) IBOutlet UIButton *btnStar4;
@property (weak, nonatomic) IBOutlet UIButton *btnStar5;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *tBoxDestination;
@property (weak, nonatomic) IBOutlet UITextView *tBoxExperience;

@end
