//
//  main.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"
#import "BoardBuilder.h"
#import "IOController.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    GameController* controller = [[GameController alloc] initWithInput];
    [controller.io printBoardFrom:controller.origin];
//    BoardBuilder* builder = [BoardBuilder boardBuilder];
//    Space* origin = [builder buildBoardWithDimensionsX:10 andY:10];
//    [builder definePlayerPathFrom:[builder definePlayerStartFrom:origin]];
//    IOController* io = [IOController new];
//    [io printBoardFrom:origin];
//    while (YES){
//        NSLog (@"%d", [io getBoardSize]);
//        Difficulty d = [io getDifficulty];
//        switch (d) {
//            case 0:
//                NSLog(@"EASY");
//                break;
//            case 1:
//                NSLog(@"NORMAL");
//                break;
//            case 2:
//                NSLog(@"NORMAL");
//                break;
//                
//            default:
//                break;
//        }
//    }
    
    
    
    
    
}
