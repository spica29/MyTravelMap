//
//  MemoryStorage.m
//  MyTravelMap
//
//  Created by Academy387 on 11/12/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoryStorage.h"


@implementation MemoryStorage

+(id)sharedManager {
    static MemoryStorage *memoryStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memoryStorage = [[self alloc] init];
    });
    return memoryStorage;
}

-(id)init {
    if (self = [super init]) {
        self.someProperty = @"Some String";
        self.listTravelsArray = [[NSMutableArray alloc] init];
    }
    return self;
    

}

@end