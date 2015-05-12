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
        [self placeObjects];
        
    }
        return self;
}

-(void)placeObjects{
    for (int i = 0; i < [self numberOfSnakes]; i++){
        [self placeSnake];
    }
    for (int i = 0; i < [self numberOfLadders]; i++){
        [self placeLadder];
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

-(void)placeLadder{
    int range = (self.sizeXY * self.sizeXY) - self.sizeXY - 1;
    int startPos = arc4random_uniform(range)+1;
    Space* start = self.startingSpace;
    for (int i = 0; i<startPos; i++){
        start = start.next;
    }
    if (start.contents){
        [self placeLadder];
    } else {
        range = (self.sizeXY * self.sizeXY) - startPos -1 - self.sizeXY + (startPos % self.sizeXY);
        int endPos = startPos + range + (startPos % self.sizeXY);
        Space* end = start;
        for (int i = startPos; i<endPos; i++){
            end = end.next;
        }
        if (end.contents){
            [self placeLadder];
        } else {
            Ladder* ladder = [[Ladder alloc] init];
            ladder.value = endPos - startPos;
            start.contents = ladder;
        }
    }
}

@end
