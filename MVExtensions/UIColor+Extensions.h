//
//  UIColor+Extensions.h
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithInt:(int)intColor;
+ (UIColor *)colorWithInt:(int)intColor alpha:(CGFloat)alpha;
+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue;
+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithIntString:(NSString *)intColorString; // #rrggbb

@end

@interface UIColor (ColorImage)

- (UIImage *)colorImage:(CGSize)size;
- (UIImage *)colorImage:(CGSize)size cornerRadius:(CGFloat)cornerRadius resizable:(BOOL)resizable resizeMode:(UIImageResizingMode)resizeModel;

@end
