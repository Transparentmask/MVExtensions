//
//  NSString+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSComparisonResult)compareVersion:(NSString *)anotherVersion;

+ (NSString *)formatFloat:(NSNumber *)number; //default have 2 Fraction Digits
+ (NSString *)formatFloat:(NSNumber *)number fractionDigits:(NSInteger)fractionDigits;

@end

NSString *docPath(NSString *path);
