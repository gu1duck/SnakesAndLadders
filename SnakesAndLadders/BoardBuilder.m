//
//  RoomBuilder.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "BoardBuilder.h"

@implementation BoardBuilder

+ (instancetype)boardBuilder
{
    BoardBuilder* builder = [[BoardBuilder alloc] init];
    return builder;
}

- (Space*)buildBoardWithDimensionsX: (int) sizeX andY: (int) sizeY
{
    Space* origin = [self buildRowOfRoomsOfSize:sizeX];
    Space* target = origin;
    for(int i=1; i<sizeY;i++)
    {
        Space* newRow = [self buildRowOfRoomsOfSize:sizeX];
        [self attachRow: target toSouthRow: newRow];
        target = newRow;
    }
    
    
    int count = 1;
    NSString* debug = @"\n";
    NSString* countString = [NSString stringWithFormat:@"%d ", count];
    debug = [debug stringByAppendingString:countString];
    Space* head = origin;
    while (head.south)
    {
        while (head.east)
        {
            head = head.east;
            count++;
            countString = [NSString stringWithFormat:@"%d ", count];
            debug = [debug stringByAppendingString:countString];
        }
        debug = [debug stringByAppendingString:@"\n"];
        while (head.west)
        {
            head = head.west;
        }
        head = head.south;
        count++;
        countString = [NSString stringWithFormat:@"%d ", count];
        debug = [debug stringByAppendingString:countString];
    }
    while (head.east)
    {
        head = head.east;
        count++;
        countString = [NSString stringWithFormat:@"%d ", count];
        debug = [debug stringByAppendingString:countString];
    }
    [self definePlayerPathFrom:[self definePlayerStartFrom:origin]];
    //NSLog(@"%@", debug);
    
    return origin;
}

- (Space*)buildRowOfRoomsOfSize:(int) sizeX
{
    Space* origin = [[Space alloc] init];
    Space* target = origin;
    for(int i=1; i<sizeX; i++)
    {
        Space* newRoom = [[Space alloc] init];
        [newRoom attachEastOf: target];
        target = newRoom;
    }
    return origin;
}

- (void) attachRow: (Space*) northRowOrigin toSouthRow: (Space*) southRowOrigin
{
    Space* south = southRowOrigin;
    Space* north = northRowOrigin;
    while (south){
        [south attachSouthOf:north];
        south = south.east;
        north = north.east;
    }
}

- (Space*)definePlayerStartFrom:(Space*) anySpace{
    while (anySpace.west)
        anySpace = anySpace.west;
    while (anySpace.south)
        anySpace = anySpace.south;
    return anySpace;
}

- (void)definePlayerPathFrom:(Space*) startSpace{
    Space* pathBuilder = startSpace;
    BOOL east = YES;
    BOOL first = YES;
    int count = 1;
    pathBuilder.index = count;
    //NSLog(@"%d ",pathBuilder.index);
    count++;
    
    while (pathBuilder.north){
        if (!first){
            pathBuilder.next = pathBuilder.north;
            pathBuilder = pathBuilder.next;
            pathBuilder.prev = pathBuilder.south;
            pathBuilder.index = count;
            //NSLog(@"%d ",pathBuilder.index);
            count++;
        }
        if (east) {
            while (pathBuilder.east){
                pathBuilder.next = pathBuilder.east;
                pathBuilder = pathBuilder.next;
                pathBuilder.prev = pathBuilder.west;
                pathBuilder.index = count;
                //NSLog(@"%d ",pathBuilder.index);
                count++;
            }
        } else {
            while (pathBuilder.west){
                pathBuilder.next = pathBuilder.west;
                pathBuilder = pathBuilder.next;
                pathBuilder.prev = pathBuilder.east;
                pathBuilder.index = count;
                //NSLog(@"%d ",pathBuilder.index);
                count++;
            }
        }
        east = !east;
        first = NO;
    }
}


@end
