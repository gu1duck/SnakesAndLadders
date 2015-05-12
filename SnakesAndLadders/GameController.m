//
//  GameController.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "GameController.h"

@implementation GameController

-(instancetype)initWithInput{
    self = [super init];
    if (self){
        self.io = [IOController new];
        self.sizeXY = [self.io getBoardSize];
        self.builder = [BoardBuilder boardBuilder];
        self.origin = [self.builder buildBoardWithDimensionsX:self.sizeXY andY:self.sizeXY];
        self.startingSpace = [self.builder definePlayerStartFrom:self.origin];
        self.difficulty = [self.io getDifficulty];
        NSLog(@"SNAKES: %d; LADDERS: %d", [self numberOfSnakes], [self numberOfLadders]);
        
    }
        return self;
}

-(void)placeSnakes{
//    for (int i = 0; int < [self numberOfSnakes]; i++){
    
}

-(int)numberOfSnakes{
    return self.difficulty * self.sizeXY / 10;
}

-(int)numberOfLadders{
    return (20-self.difficulty) * self.sizeXY /10;
}

@end
