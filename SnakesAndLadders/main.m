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

int main(int argc, const char * argv[]) {
    BoardBuilder* builder = [BoardBuilder boardBuilder];
    Space* origin = [builder buildBoardWithDimensionsX:5 andY:5];
    [builder definePlayerPathFrom:[builder definePlayerStartFrom:origin]];
    IOController* io = [IOController new];
    [io printBoardFrom:origin];
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
    }
    
    
    
    
    
}
