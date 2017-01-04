//
//  UIColor+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (HexColor)

+ (UIColor *)colorWithInt:(int)intColor {
    return [self colorWithInt:intColor alpha:1.0f];
}

+ (UIColor *)colorWithInt:(int)intColor alpha:(CGFloat)alpha {
    int red = (intColor & 0xFF0000) >> 16;
    int green = (intColor & 0x00FF00) >> 8;
    int blue = (intColor & 0x0000FF);
    
    return [self colorWithIntRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue {
    return [self colorWithIntRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(float)red/255.0f green:(float)green/255.0f blue:(float)blue/255.0f alpha:alpha];
}

+ (UIColor *)colorWithIntString:(NSString *)intColorString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:intColorString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithIntRed:((rgbValue & 0xFF0000) >> 16) green:((rgbValue & 0xFF00) >> 8) blue:(rgbValue & 0xFF)];
}

@end

@implementation UIColor (ColorImage)

- (UIImage *)colorImage:(CGSize)size {
    return [self colorImage:size cornerRadius:0 resizable:TRUE resizeMode:UIImageResizingModeTile];
}
- (UIImage *)colorImage:(CGSize)size cornerRadius:(CGFloat)cornerRadius resizable:(BOOL)resizable resizeMode:(UIImageResizingMode)resizeMode {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    roundedRectPath.lineWidth = 0;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, FALSE, [UIScreen mainScreen].scale);
    
    [self setFill];
    [roundedRectPath fill];
    [roundedRectPath stroke];
    [roundedRectPath addClip];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(resizable) {
        return [image resizableImageWithCapInsets:UIEdgeInsetsMake(size.height/2, size.width/2, size.height/2, size.width/2) resizingMode:resizeMode];
    }
    
    return image;
}

@end
