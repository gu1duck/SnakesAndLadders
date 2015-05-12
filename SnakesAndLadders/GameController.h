//
//  GameController.h
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoardBuilder.h"
#import "IOController.h"
#import "BoardElement.h"
#import "Snake.h"
#import "Ladder.h"
#import "Space.h"
#import "Player.h"

@interface GameController : NSObject
@property (assign) int sizeXY;
@property (nonatomic) BoardBuilder* builder;
@property (nonatomic) Difficulty difficulty;
@property (nonatomic) IOController* io;
@property (nonatomic) Space* origin;
@property (nonatomic) Space* startingSpace;
@property (assign) BOOL turn;
@property (nonatomic) Player* player1;
@property (nonatomic) Player* player2;
@property (nonatomic) BOOL gameOver;

-(instancetype)initWithInput;
-(void)placeObjects;

@end

