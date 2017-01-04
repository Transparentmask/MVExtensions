//
//  UITextField+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extensions.h"

@interface UITextField (ViewStyle)

- (void)setLeftImage:(UIImage *)image; // Default Edge Inset: top:0, left:10, bottom:0, right:10
- (void)setLeftImage:(UIImage *)image edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setRightLabel:(NSString *)text; // Default Edge Inset: top:0, left:10, bottom:0, right:10
- (void)setRightLabel:(NSString *)text edgeInsets:(UIEdgeInsets)edgeInsets;
//- (void)addBorders:(UIViewBorderDirection)borderDirections;

- (void)addBorders:(UIViewBorderDirection)borderDirections;
- (void)addBorders:(UIViewBorderDirection)borderDirections color:(UIColor *)color;

@end

@interface UITextField (Utils)

- (void)selectAllRange;

@end

@interface UITextField (Toolbar)

- (UIToolbar *)useFunctionalToolbar;
- (UIToolbar *)functionalToolbar;

@end
