//
//  UIView+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/9/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LayerAccessExtension)

@property (assign, nonatomic) CGFloat cornerRadius;
@property (strong, nonatomic) UIColor *borderColor;
@property (assign, nonatomic) CGFloat borderWidth;

- (void)removeSubLayer:(NSString *)layerName;

@end

typedef NS_ENUM(NSInteger, UIViewBorderDirection) {
    UIViewBorderTop     = 1,
    UIViewBorderBottom  = 2,
    UIViewBorderLeft    = 4,
    UIViewBorderRight   = 8,
};

@interface UIView (BorderCreater)

- (void)addBottomBorder:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addLeftBorder:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addRightBorder:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addTopBorder:(UIColor *)color width:(CGFloat)borderWidth;

- (void)addBorder:(UIViewBorderDirection)direction color:(UIColor *)color width:(CGFloat)width;

@end

@interface UIView (RoundBorderEffect)

- (void)addRoundBorderEffect;
- (void)addRoundBorderEffect:(BOOL)roundCorner border:(BOOL)border opacity:(float)opacity shadow:(BOOL)shadow;
- (void)addRoundBorderEffect:(BOOL)roundCorner cornerRadius:(CGFloat)cornerRadius border:(BOOL)border borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor opacity:(float)opacity shadow:(BOOL)shadow;

- (void)addCircleEffect;
- (void)addCircleBorderEffect;
- (void)addCircleBorderEffect:(UIColor *)borderColor;

@end

