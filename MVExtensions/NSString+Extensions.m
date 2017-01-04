//
//  NSString+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (NSComparisonResult)compareVersion:(NSString *)anotherVersion {
    NSArray *version1Parts = [self componentsSeparatedByString:@"."];
    NSArray *version2Parts = [anotherVersion componentsSeparatedByString:@"."];
    
    NSInteger maxLength = MAX(version1Parts.count, version2Parts.count);
    for(NSInteger index = 0; index < maxLength; index++) {
        NSInteger version1Part = (index<version1Parts.count)?[version1Parts[index] integerValue]:0;
        NSInteger version2Part = (index<version2Parts.count)?[version2Parts[index] integerValue]:0;
        if(version1Part > version2Part) {
            return NSOrderedDescending;
        } else if(version1Part < version2Part) {
            return NSOrderedAscending;
        }
    }
    
    return NSOrderedSame;
}

+ (NSString *)formatFloat:(NSNumber *)number {
    //default have 2 Fraction Digits
    return [self formatFloat:number fractionDigits:2];
}

+ (NSString *)formatFloat:(NSNumber *)number fractionDigits:(NSInteger)fractionDigits {
    static NSNumberFormatter *formatter = nil;
    if(!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setMaximumFractionDigits:fractionDigits];
        [formatter setMinimumFractionDigits:fractionDigits];
        [formatter setRoundingMode:NSNumberFormatterRoundHalfEven];
    }
    
    [formatter setMaximumFractionDigits:fractionDigits];
    [formatter setMinimumFractionDigits:fractionDigits];
    
    return [formatter stringFromNumber:number];
}

@end

NSString *docPath(NSString *path) {
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) firstObject];
    return [documentsPath stringByAppendingPathComponent:path];
}
