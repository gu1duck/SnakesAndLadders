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
    if (space.contents.value > 0) output = [output stringByAppendingString:@"l"];
    else if (space.contents.value < 0) output = [output stringByAppendingString:@"s"];
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
                NSLog(@"There will be more ladders than snakes.");
                return easy;
                break;
            case 'n':
            case 'N':
                NSLog(@"There will be even numbers of snakes and ladders.");
                return standard;
                break;
            case 'h':
            case 'H':
                NSLog(@"There will be more snakes than ladders.");
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

- (int) getRoll: (Player*) player{
    NSLog(@"%@, please enter your roll, or enter [R] to have it generate for you.\n>", player.name);
    NSString* input = [IOController getInput];
    int roll;
    if (input){
        char control = [input characterAtIndex:0];
        switch (control) {
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
                roll = (int) control;
                break;
            case 'r':
            case 'R':
                roll = arc4random_uniform(6)+1;
                break;
            default:
                NSLog(@"Not a valid roll.");
                return [self getRoll:player];
                break;
        }
        NSLog(@"%@ moves %d spaces", player.name, roll);
        return roll;
    }
    NSLog(@"Not a valid roll.");
    return [self getRoll:player];
}

@end
