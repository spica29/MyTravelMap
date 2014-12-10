//
//  ViewControllerTravelListViewController.h
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewController.h"
#import "Travel.h"
@interface ViewControllerTravelListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property Travel *travel;


-(void)addTravelInArray: (Travel*)travelM;

-(void)setNewTravel:(Travel *)travelToShow;

@end
