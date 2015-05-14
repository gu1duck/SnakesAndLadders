//
//  Player.h
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "BoardElement.h"
#import "Space.h"

@interface Player : BoardElement
@property (nonatomic) Space* position;
@property (nonatomic) NSString* name;
@property (nonatomic) Space* startingSpace;

+(instancetype)playerWithName: (NSString*) name andStart:(Space*) start;
-(int)move:(int)number;
-(int)checkCollisions;


@end
