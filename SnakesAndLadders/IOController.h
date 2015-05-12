//
//  IOController.h
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"
#import "Player.h"

typedef enum Difficulty {easy = 6, standard = 10, hard = 14} Difficulty;

@interface IOController : NSObject

- (void) printBoardFrom: (Space*) origin;
- (int) getBoardSize;
- (Difficulty) getDifficulty;
- (int) getRoll: (Player*) player;




@end
