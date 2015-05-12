//
//  Player.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Player.h"

@implementation Player

+(instancetype)playerWithPosition: (Space*) position {
    Player* player = [[Player alloc] init];
    player.postion = position;
}
@end
