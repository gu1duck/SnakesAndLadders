//
//  Room.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Space.h"

@implementation Space

- (void) attachEastOf: (Space*) target
{
    self.west = target;
    target.east = self;
}

- (void) attachSouthOf: (Space*) target
{
    self.north = target;
    target.south = self;
}

- (instancetype)init{
    self = [super init];
    if (self){

    }
    return self;
}


@end
