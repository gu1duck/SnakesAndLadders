//
//  Room.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoardElement.h"

@interface Space : NSObject

@property(nonatomic) Space* north;
@property(nonatomic) Space* south;
@property(nonatomic) Space* east;
@property(nonatomic) Space* west;
@property(nonatomic) Space* next;
@property(nonatomic) Space* prev;
@property(nonatomic) BoardElement* contents;
@property(assign) int index;


- (void) attachEastOf: (Space*) target;
- (void) attachSouthOf: (Space*) target;
- (instancetype)init;

@end
