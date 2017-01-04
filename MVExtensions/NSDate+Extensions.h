//
//  NSDate+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (QuickFormatter)

+ (instancetype)fullDateFromString:(NSString *)dateString;

+ (NSString *)fullDateToString:(NSDate *)date;

+ (NSString *)fullDateToDisplayedString:(NSDate *)date;             /**< 消息中心使用*/

+ (NSString *)detailShortDateToString:(NSDate *)date;

+ (NSString *)hourMinuteShortDateToString:(NSDate *)date;
@end
