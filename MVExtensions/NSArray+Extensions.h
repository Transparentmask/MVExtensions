//
//  NSArray+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MapExtension)
- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;
@end

@interface NSArray (FilterExtension)
- (NSArray *)filterObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
@end
