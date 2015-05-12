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
    [controller placeObjects];
    [controller.io printBoardFrom:controller.origin];    
    
    
    
    
}
