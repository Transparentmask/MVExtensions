//
//  NSArray+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "NSArray+Extensions.h"

@implementation NSArray (MapExtension)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id mapObject = block(obj, idx);
        if(mapObject) {
            [result addObject:mapObject];
        }
    }];
    
    return result;
}

@end

@implementation NSArray (FilterExtension)

- (NSArray *)filterObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block {
    NSIndexSet *indexSet = [self indexesOfObjectsPassingTest:^BOOL(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return block(obj, idx);
    }];
    
    return (indexSet.count > 0) ? [self objectsAtIndexes:indexSet] : [NSArray array];
}

@end
