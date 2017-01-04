//
//  NSDate+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (QuickFormatter)

+ (instancetype)dateFromString:(NSString *)dateString format:(NSString *)format {
    if(dateString != nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"US_en"];
        formatter.dateFormat = format;
        return [formatter dateFromString:dateString];
    }
    
    return nil;
}

+ (NSString *)dateToString:(NSDate *)date format:(NSString *)format {
    if(date != nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"US_en"];
        formatter.dateFormat = format;
        return [formatter stringFromDate:date];
    }
    
    return @"";
}

+ (instancetype)fullDateFromString:(NSString *)dateString {
    return [self dateFromString:dateString format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)fullDateToString:(NSDate *)date {
    return [self dateToString:date format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)fullDateToDisplayedString:(NSDate *)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSDate *otherDate = [cal dateFromComponents:components];
    if ([today isEqualToDate:otherDate]) {
        return @"今天";
    }
    
    components = [cal components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate dateWithTimeInterval:-(3600 * 24) sinceDate:[NSDate date]]];
    NSDate *yesterday = [cal dateFromComponents:components];
    if ([yesterday isEqualToDate:otherDate]) {
        return @"昨天";
    }
    
    return [self dateToString:date format:@"yy-MM-dd"];
}

+ (NSString *)detailShortDateToString:(NSDate *)date {
    return [self dateToString:date format:@"HH:mm:ss"];
}

+ (NSString *)hourMinuteShortDateToString:(NSDate *)date {
    return [self dateToString:date format:@"HH:mm"];
}

@end
