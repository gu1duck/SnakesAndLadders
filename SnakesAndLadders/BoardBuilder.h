//
//  RoomBuilder.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"

@interface BoardBuilder : NSObject

- (Space*)buildBoardWithDimensionsX: (int) xDimension andY: (int) yDimension;
+ (instancetype)boardBuilder;
- (Space*)definePlayerStartFrom:(Space*) anySpace;
- (void)definePlayerPathFrom:(Space*) startSpace;


@end
