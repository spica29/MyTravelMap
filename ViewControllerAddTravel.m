//
//  ViewControllerAddTravel.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewControllerAddTravel.h"


@interface ViewControllerAddTravel ()

@end

@implementation ViewControllerAddTravel

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveClicked:(id)sender {
    self.travel.destination=self.tBoxDestination.text;
    self.travel.experience=self.tBoxExperience.text;
    self.travel.date=self.datePicker.date;
    
    //desava se dodjela na klik dugmeta AddTravel
}
- (IBAction)btnStar1Click:(id)sender {
    self.travel.rating=1;
    //Ovdje treba dodati boju
}
- (IBAction)btnStar2Click:(id)sender {
    self.travel.rating=2;
}
- (IBAction)btnStar3Click:(id)sender {
    self.travel.rating=3;
}
- (IBAction)btnStar4Click:(id)sender {
    self.travel.rating=4;
}
- (IBAction)btnStar5Click:(id)sender {
    self.travel.rating=5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
