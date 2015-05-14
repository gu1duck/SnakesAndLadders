//
//  Player.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Player.h"

@implementation Player

+(instancetype)playerWithName: (NSString*) name andStart: (Space*) start{
    Player* player = [[Player alloc] init];
    player.startingSpace = start;
    player.name = name;
    return player;
}
-(int)move:(int)number{
    for (int i; i < number; i++){
        if (!self.position){
            self.position = self.startingSpace;
        } else if (self.position.next){
            self.position = self.position.next;
        }
    }
    return self.position.index;
}

-(int)checkCollisions{
    int offset = self.position.contents.value;
    if (offset < 0){
        for (int i=0; i< abs(offset); i++){
                self.position = self.position.prev;
        }
        //return new position and whether the player hit a snake or ladder in one value
        return -(self.position.index);
    }
    if (offset > 0){
        for (int i=0; i< offset; i++){
                self.position = self.position.next;
        }
        return (self.position.index);
    }
    return 0;
}

@end
