//
//  IOController.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "IOController.h"
#import "Space.h"
#import "BoardElement.h"

@implementation IOController

- (void) printBoardFrom: (Space*) origin {
    Space* head = origin;
    
    int count = origin.index;
    NSString* debug = @"\n";
    NSString* countString = [NSString stringWithFormat:@"%@", [self drawBoardSpace: head]];
    debug = [debug stringByAppendingString:countString];
    
    while (head.south)
    {
        while (head.east)
        {
            head = head.east;
            count = head.index;
            countString = [NSString stringWithFormat:@"%@", [self drawBoardSpace: head]];
            debug = [debug stringByAppendingString:countString];
        }
        debug = [debug stringByAppendingString:@"|\n"];
        while (head.west)
        {
            head = head.west;
        }
        head = head.south;
        count = head.index;
        countString = [NSString stringWithFormat:@"%@", [self drawBoardSpace: head]];
        debug = [debug stringByAppendingString:countString];
    }
    while (head.east)
    {
        head = head.east;
        count = head.index;
        countString = [NSString stringWithFormat:@"%@", [self drawBoardSpace: head]];
        debug = [debug stringByAppendingString:countString];
    }
    debug = [debug stringByAppendingString:@"|\n"];
    NSLog(@"%@", debug);
}

- (NSString*) drawBoardSpace: (Space*) space{
    NSString* output = @"|";
    if (space.contents.value < 0) output = [output stringByAppendingString:@"s"];
    else if (space.index < 100) output = [output stringByAppendingString:@" "];
    if (space.index < 10) output = [output stringByAppendingString:@" "];
    NSString* countString = [NSString stringWithFormat:@"%d", space.index];
    output = [output stringByAppendingString:countString];
    return output;
}

- (NSString*) drawLine: (int) sizeX{
    NSString* output = @"+";
    for (int i = 0; i < sizeX * 4-1; i++){
        output = [output stringByAppendingString:@"-"];
    }
    output = [output stringByAppendingString:@"+"];
    return output;
}


+ (NSString*) getInput
{
    char str [100];
    scanf("%100s", str);
    NSString *nsInput = [[NSString alloc] initWithUTF8String: str];
    
    return nsInput;
}

- (int) getBoardSize
{
    NSLog(@"Please enter a number 3 or higher to set the size of the board. \"5\" will create a 5x5 board.");
    NSString* input = [IOController getInput];
//    NSRange rangeOfInt = [input rangeOfCharacterFromSet: [NSCharacterSet letterCharacterSet]];
//    int firstInt = (int)rangeOfInt.location+2;
//    input = [input substringToIndex: firstInt];
    
    if (input){
        int control = (int)[input integerValue];
        if (control > 2){
            return control;
        }
    }
    NSLog(@"Not a valid board size");
    return [self getBoardSize];
}

- (Difficulty) getDifficulty
{
    NSLog(@"Please enter a difficulty: [E]asy [N]ormal or [H]ard.");
    NSString* input = [IOController getInput];
    if (input){
        char control = [input characterAtIndex:0];
        switch (control) {
            case 'e':
            case 'E':
                return easy;
                break;
            case 'n':
            case 'N':
                return standard;
                break;
            case 'h':
            case 'H':
                return hard;
                break;
                
            default:
                NSLog(@"Not a valid difficulty");
                return [self getBoardSize];
                break;
        }
    }
    NSLog(@"Not a valid difficulty");
    return [self getBoardSize];
}

@end
