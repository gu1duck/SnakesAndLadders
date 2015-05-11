//
//  IOController.m
//  SnakesAndLadders
//
//  Created by Jeremy Petter on 2015-05-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "IOController.h"
#import "Space.h"

@implementation IOController

- (void) printBoardFrom: (Space*) origin {
    Space* head = origin;
    
    int count = origin.index;
    NSString* debug = @"\n";
    NSString* countString = [NSString stringWithFormat:@"%d ", count];
    debug = [debug stringByAppendingString:countString];
    
    while (head.south)
    {
        while (head.east)
        {
            head = head.east;
            count = head.index;
            countString = [NSString stringWithFormat:@"%d ", count];
            debug = [debug stringByAppendingString:countString];
        }
        debug = [debug stringByAppendingString:@"\n"];
        while (head.west)
        {
            head = head.west;
        }
        head = head.south;
        count = head.index;
        countString = [NSString stringWithFormat:@"%d ", count];
        debug = [debug stringByAppendingString:countString];
    }
    while (head.east)
    {
        head = head.east;
        count = head.index;
        countString = [NSString stringWithFormat:@"%d ", count];
        debug = [debug stringByAppendingString:countString];
    }
    NSLog(@"%@", debug);
}


@end
