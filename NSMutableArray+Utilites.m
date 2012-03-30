//
//  NSMutableArray+Utilites.m
//
//  Created by Sergey Lenkov on 05.06.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import "NSMutableArray+Utilites.h"

@implementation NSMutableArray (Utilites)

- (void)reverse {
	for (int i = 0; i < (floor([self count] / 2)); i++) {
		[self exchangeObjectAtIndex:i withObjectAtIndex:([self count] - (i + 1))];
	}
}

@end
