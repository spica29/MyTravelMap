//
//  ViewControllerTravelListViewController.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewControllerTravelListViewController.h"
#import "MemoryStorage.h"

@interface ViewControllerTravelListViewController ()

@property MemoryStorage *TravelsMemory;

@end



@implementation ViewControllerTravelListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  // moramo imati ovdje deklariran Memorystorage yobg ispisa u tabeli
    _TravelsMemory=[MemoryStorage sharedManager];
}


-(void)setNewTravel:(Travel *)travelToShow
{
    self.travel=travelToShow;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _TravelsMemory.listTravelsArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell* cell;
   
    // if(indexPath.row%2==0){
    
    // cell=[tableView dequeueReusableCellWithIdentifier:@"showUser"];
    //      cell.textLabel.text=[[NSString alloc] initWithFormat:@"User %ld", (long)indexPath.row];}
    //  else{
    //      cell=[tableView dequeueReusableCellWithIdentifier:@"showUser2"];
    //      cell.textLabel.text=[[NSString alloc] initWithFormat:@"User %ld", (long)indexPath.row];
    // }
    
    //ili
    if(indexPath.row%2==0){
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"travelInfo"];}
    
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"travelInfo2"];
        
    }
    
    cell.textLabel.text=[_TravelsMemory.listTravelsArray[indexPath.row] fullDetails];
   

    
    
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
