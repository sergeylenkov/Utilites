//
//  NSApplication+Utilites.h
//
//  Created by Sergey Lenkov on 01.08.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSApplication (Utilites)

- (void)getSystemVersionMajor:(unsigned *)major minor:(unsigned *)minor bugFix:(unsigned *)bugFix;
- (BOOL)isLion;

@end
