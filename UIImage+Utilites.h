//
//  UIImage+Utilites.h
//
//  Created by Sergey Lenkov on 30.05.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage (UIImage_Utilites)

- (UIImage *)scaleAndRotateWithReslution:(int)resolution;
- (UIImage *)imageByCroppingToRect:(CGRect)rect;

@end