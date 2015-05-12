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
        
    }
        return self;
}

@end
