//
//  Player.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Player.h"

@implementation Player

+(instancetype)playerWithPosition: (Space*) position andName: (NSString*) name {
    Player* player = [[Player alloc] init];
    player.position = position;
    player.name = name;
    return player;
}
@end
