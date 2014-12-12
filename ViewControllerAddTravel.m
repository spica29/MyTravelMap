//
//  ViewControllerAddTravel.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewControllerAddTravel.h"
#import "ViewControllerTravelListViewController.h"
#import "MemoryStorage.h"

@interface ViewControllerAddTravel ()
@property MemoryStorage *TravelsMemory;
@property NSDate *dateNow;
@end

@implementation ViewControllerAddTravel

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btnStar1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btnStar2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btnStar3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btnStar4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.travel = [[Travel alloc] init];
    self.travel.numDays=1;
    self.dateNow=self.datePicker.date;
    
    _TravelsMemory=[MemoryStorage sharedManager];

    // Do any additional setup after loading the view.
}

- (IBAction)saveClicked:(id)sender {
    
    self.travel.city = [[City alloc] init];
    self.travel.destination=self.tBoxDestination.text;
    self.travel.city.name=self.tBoxDestination.text;
    self.travel.experience=self.tBoxExperience.text;
    self.travel.date=self.datePicker.date;
    //MemoryStorage sharedManager
    
    
    self.travel.city.latitude = 0;
    self.travel.city.longitude = 0;
    // Do any additional setup after loading the view, typically from a nib.
    
    // API za koordinate zadanog grada

    NSString* serverPath = [[NSString alloc] initWithFormat:@("https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyCbQwlpEl2MRB-il9MljyU5wCcR8fOXEfQ"), self.travel.city.name];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                               self.travel.city.latitude = [[[[[[responseDict valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"]valueForKey:@"lat" ] objectAtIndex:0] doubleValue];
                               self.travel.city.longitude = [[[[[[responseDict valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"]valueForKey:@"lng" ] objectAtIndex:0] doubleValue];
                               [_TravelsMemory.listTravelsArray addObject:self.travel];

                               //[self mapa];
                           }];
    
    
    
    self.tBoxDestination.text=@"";
    self.tBoxExperience.text=@"";
    self.datePicker.date=self.dateNow;
    self.sliderDay.value=1;
    self.travel.rating=0;
    [self btnStarColor:0];

    //desava se dodjela na klik dugmeta AddTravel
}

//ViewControllerTravelListViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqual:(@"saveToCell")])
    {
        ViewControllerTravelListViewController *controler= (ViewControllerTravelListViewController*)[segue destinationViewController];
        [controler setNewTravel:self.travel];
    }
}

- (IBAction)btnStar1Click:(id)sender {
    NSInteger i=1;
    self.travel.rating=i;
    [self btnStarColor:i];
    }
- (IBAction)btnStar2Click:(id)sender {
    NSInteger i=2;
    self.travel.rating=i;
    [self btnStarColor:i];
    }
- (IBAction)btnStar3Click:(id)sender {
    NSInteger i=3;
    self.travel.rating=i;
 [self btnStarColor:i];
}
- (IBAction)btnStar4Click:(id)sender {
    NSInteger i=4;
    self.travel.rating=i;
   [self btnStarColor:i];
}
- (IBAction)btnStar5Click:(id)sender {
    NSInteger i=5;
    self.travel.rating=i;
  [self btnStarColor:i];
}



//u ovoj funkciji se dodju boje za batne

- (void)btnStarColor:(NSInteger)rating
{
    if(rating==0)
    {
        [self.btnStar1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (rating==1) {
        [self.btnStar1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (rating==2) {
        [self.btnStar1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (rating==3) {
        [self.btnStar1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (rating==4) {
        [self.btnStar1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (rating==5) {
        [self.btnStar1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar3 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar4 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.btnStar5 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
}


- (IBAction)numberDays:(id)sender {
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)self.sliderDay.value];
    
    self.lblNumberDays.text= inStr;
    self.travel.numDays=self.sliderDay.value;
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if([text isEqual:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    } else {
        return YES;
    }
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
