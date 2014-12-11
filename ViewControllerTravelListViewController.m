//
//  ViewControllerTravelListViewController.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewControllerTravelListViewController.h"

@interface ViewControllerTravelListViewController ()
@property NSMutableArray *listTravels;
@end



@implementation ViewControllerTravelListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listTravels=[[NSMutableArray alloc] init];
    Travel *t1=[[Travel alloc] init];
    t1.experience=@"iskustvo";
    t1.rating=5;
    t1.destination=@"Sarajvo";
    Travel *t2=[[Travel alloc] init];
    t2.experience=@"iskustdsadfsdvo";
    t2.rating=2;
    t2.destination=@"Sarfdsfajvo";
    
    [self.listTravels addObject:t1];
    [self.listTravels addObject:t2];
    
    
    //Iz baye ce uyimat informaciju o broju Putovanja
    
    
    // Do any additional setup after loading the view.
}


-(void)setNewTravel:(Travel *)travelToShow
{
    self.travel=travelToShow;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listTravels.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"travelInfo"];
    cell.textLabel.text = [self.listTravels[indexPath.row] fullDetails];
    return cell;
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
