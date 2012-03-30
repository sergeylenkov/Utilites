//
//  NSDate+Utilites.h
//
//  Created by Sergey Lenkov on 06.11.10.
//  Copyright 2010 Positive Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilites)

- (NSDate *)truncate;
- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateByAddingMonths:(NSInteger)months;
- (NSInteger)daysCountBetweenDate:(NSDate *)date;
- (NSString *)dbDateFormat;
- (NSString *)shortDateFormat;
- (NSString *)mediumDateFormat;
- (NSString *)longDateFormat;
- (NSString *)longDateFormatWithTime;
- (NSString *)fullDateFormat;
- (NSString *)timeFormat;
- (NSString *)shortMonthName;
- (NSString *)monthName;
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)week;
- (NSInteger)weekday;
+ (NSDate *)dateFromDbString:(NSString *)db;
+ (NSDate *)dateFromRFC1123:(NSString *)rfc;
+ (NSDate *)dateFromTZ:(NSString *)tz;
+ (NSDate *)dateFromUTCString:(NSString *)utc;
- (NSString *)UTCString;
- (NSString *)UTCStringWithMilliseconds;

@end
