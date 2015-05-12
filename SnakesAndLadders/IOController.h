//
//  IOController.h
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"

typedef enum Difficulty {easy, standard, hard} Difficulty;

@interface IOController : NSObject

- (void) printBoardFrom: (Space*) origin;
- (int) getBoardSize;
- (Difficulty) getDifficulty;




@end
