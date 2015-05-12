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

-(void)placeObjects{
    for (int i = 0; i < [self numberOfSnakes]; i++){
        [self placeSnake];
    }
}

-(int)numberOfSnakes{
    return self.difficulty * self.sizeXY / 10;
}

-(int)numberOfLadders{
    return (20-self.difficulty) * self.sizeXY /10;
}

-(void)placeSnake{
    int range = (self.sizeXY * self.sizeXY) - self.sizeXY - 1;
    int headPos = arc4random_uniform(range)+self.sizeXY;
    Space* head = self.startingSpace;
    for (int i = 0; i<headPos; i++){
        head = head.next;
    }
    if (head.contents){
        [self placeSnake];
    } else {
        range = headPos - (headPos % self.sizeXY);
        int tailPos = arc4random_uniform(range);
        Space* tail = self.startingSpace;
        for (int i = 0; i<tailPos; i++){
            tail = tail.next;
        }
        if (tail.contents){
            [self placeSnake];
        } else {
            Snake* snake = [[Snake alloc] init];
            snake.value = tailPos - headPos;
            head.contents = snake;
        }
    }
}

@end
