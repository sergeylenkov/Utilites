//
//  NSDate+Utilites.h
//
//  Created by Sergey Lenkov on 06.11.10.
//

#import "NSDate+Utilites.h"

@implementation NSDate (Utilites)

- (NSDate *)truncate {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self];
	
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	
	return [calendar dateFromComponents:components];
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	
	[components setHour:hours];
	
	return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	
	[components setMinute:minutes];
	
	return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	
	[components setDay:days];
	
	return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	
	[components setMonth:months];
	
	return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSInteger)daysCountBetweenDate:(NSDate *)date {
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *components = [calendar components:NSDayCalendarUnit fromDate:[self truncate] toDate:[date truncate] options:0];
    [calendar release];
    
	return abs([components day]);
}

- (NSString *)dbDateRepresentation {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self];

    return [NSString stringWithFormat:@"%ld-%.2ld-%.2ld", [components year], [components month], [components day]];
}

- (NSString *)shortDateRepresentation {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    return [dateFormatter stringFromDate:self];
}

- (NSString *)mediumDateRepresentation {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
    
    return [formatter stringFromDate:self];
}

- (NSString *)longDateRepresentation {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterLongStyle];
    
    return [formatter stringFromDate:self];
}

- (NSString *)longDateRepresentationWithTime {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterLongStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
     
    return [formatter stringFromDate:self];
}

- (NSString *)fullDateRepresentation {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterFullStyle];
    
    return [formatter stringFromDate:self];
}

- (NSString *)timeRepresentation {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"HH:mm"];
    
    return [formatter stringFromDate:self];
}

- (NSString *)systemTimeRepresentation {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [formatter stringFromDate:self];
}

- (NSString *)shortMonthName {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"MMM"];
    
    return [formatter stringFromDate:self];
}

- (NSString *)monthName {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"MMMM"];
    
    return [formatter stringFromDate:self];
}

- (NSString *)weekDayName {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"EEEE"];
    
    return [formatter stringFromDate:self];
}

- (NSInteger)year {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"yyyy"];
    
    return [[formatter stringFromDate:self] intValue];
}

- (NSInteger)month {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"MM"];
    
    return [[formatter stringFromDate:self] intValue];
}

- (NSInteger)day {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"d"];
    
    return [[formatter stringFromDate:self] intValue];
}

- (NSInteger)hour {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"HH"];
    
    return [[formatter stringFromDate:self] intValue];
}

- (NSInteger)minute {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"mm"];
    
    return [[formatter stringFromDate:self] intValue];
}

- (NSInteger)week {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSWeekCalendarUnit) fromDate:self];
    
    return [components week];
}

- (NSInteger)weekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSWeekdayCalendarUnit) fromDate:self];
    
    return [components weekday];
}

+ (NSDate *)dateFromDbString:(NSString *)db {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter dateFromString:db];
}

+ (NSDate *)dateFromRFC1123:(NSString *)rfc {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
	[formatter setLocale:locale];
    [locale release];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    
    return [formatter dateFromString:rfc];
}

+ (NSDate *)dateFromTZ:(NSString *)tz {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    return [formatter dateFromString:tz];
}

+ (NSDate *)dateFromUTCString:(NSString *)utc {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter dateFromString:utc];
}

- (NSString *)UTCString {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:self];
}

- (NSString *)UTCStringWithMilliseconds {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    
    return [formatter stringFromDate:self];
}

- (BOOL)isToday {
    if ([[self truncate] isEqualToDate:[[NSDate date] truncate]]) {
        return YES;
    }
    
    return NO;
}

@end
