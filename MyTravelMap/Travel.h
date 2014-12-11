//
//  Travel.h
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "City.h"

@interface Travel : NSObject

@property NSString *destination;

@property City *city;
@property NSDate *date;
@property NSString *experience;
@property NSInteger rating;
@property NSInteger numDays;




- (NSString *)fullDetails;


@end
