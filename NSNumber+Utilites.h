//
//  NSNumber+Utilites.h
//
//  Created by Sergey Lenkov on 06.11.10.
//  Copyright 2010 Positive Team. All rights reserved.
//

@interface NSNumber (Utilites)

- (NSString *)moneyFormat;
- (NSString *)byteFormat;
- (NSString *)bitFormat;
- (NSString *)durationFormatWithHours;
- (NSString *)durationFormatWithMinutes;

@end
