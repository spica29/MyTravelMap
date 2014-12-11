//
//  Travel.h
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Travel : NSObject

@property NSString *destination;
@property NSDate *date;
@property NSString *experience;
@property NSInteger rating;
@property NSInteger numOfDays;




-(void)addTravel;


- (NSString *)fullDetails;


@end
