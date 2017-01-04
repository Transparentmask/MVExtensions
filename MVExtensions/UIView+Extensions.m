//
//  UIView+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/9/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "UIView+Extensions.h"
#import "NSArray+Extensions.h"
#import "UIView+EasyUseGeometry.h"

@implementation UIView (LayerAccessExtension)

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = [borderColor CGColor];
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)removeSubLayer:(NSString *)layerName {
    if(self.layer.sublayers.count > 0) {
        NSMutableArray *needRemoveLayers = [NSMutableArray arrayWithArray:[self.layer.sublayers filterObjectsUsingBlock:^BOOL(CALayer *layer, NSUInteger idx) {
            return [layer.name isEqualToString:layerName];
        }]];
        
        while(needRemoveLayers.count > 0) {
            [needRemoveLayers.lastObject removeFromSuperlayer];
            [needRemoveLayers removeLastObject];
        }
    }
}

@end

@implementation UIView (BorderCreater)

- (void)addBottomBorder:(UIColor *)color width:(CGFloat)borderWidth {
    [self addBorder:UIViewBorderBottom color:color width:borderWidth];
}

- (void)addLeftBorder:(UIColor *)color width:(CGFloat)borderWidth {
    [self addBorder:UIViewBorderLeft color:color width:borderWidth];
}

- (void)addRightBorder:(UIColor *)color width:(CGFloat)borderWidth {
    [self addBorder:UIViewBorderRight color:color width:borderWidth];
}

- (void)addTopBorder:(UIColor *)color width:(CGFloat)borderWidth {
    [self addBorder:UIViewBorderTop color:color width:borderWidth];
}

- (void)addBorder:(UIViewBorderDirection)direction color:(UIColor *)color width:(CGFloat)width {
    if((direction&UIViewBorderTop) == UIViewBorderTop) {
        for(CALayer *layer in self.layer.sublayers) {
            if([layer.name isEqualToString:@"UIViewBorderTop"]) {
                [layer removeFromSuperlayer];
                break;
            }
        }
        CALayer *border = [CALayer layer];
        border.name = @"UIViewBorderTop";
        border.backgroundColor = color.CGColor;
        
        border.frame = CGRectMake(0, 0, self.frame.size.width, width);
        [self.layer addSublayer:border];
    }
    
    if((direction&UIViewBorderBottom) == UIViewBorderBottom) {
        for(CALayer *layer in self.layer.sublayers) {
            if([layer.name isEqualToString:@"UIViewBorderBottom"]) {
                [layer removeFromSuperlayer];
                break;
            }
        }
        CALayer *border = [CALayer layer];
        border.name = @"UIViewBorderBottom";
        border.backgroundColor = color.CGColor;
        
        border.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
        [self.layer addSublayer:border];
    }
    
    if((direction&UIViewBorderLeft) == UIViewBorderLeft) {
        for(CALayer *layer in self.layer.sublayers) {
            if([layer.name isEqualToString:@"UIViewBorderLeft"]) {
                [layer removeFromSuperlayer];
                break;
            }
        }
        CALayer *border = [CALayer layer];
        border.name = @"UIViewBorderLeft";
        border.backgroundColor = color.CGColor;
        
        border.frame = CGRectMake(0, 0, width, self.frame.size.height);
        [self.layer addSublayer:border];
    }
    
    if((direction&UIViewBorderRight) == UIViewBorderRight) {
        for(CALayer *layer in self.layer.sublayers) {
            if([layer.name isEqualToString:@"UIViewBorderRight"]) {
                [layer removeFromSuperlayer];
                break;
            }
        }
        CALayer *border = [CALayer layer];
        border.name = @"UIViewBorderRight";
        border.backgroundColor = color.CGColor;
        
        border.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
        [self.layer addSublayer:border];
    }
}

@end

@implementation UIView (RoundBorderEffect)

- (void)addRoundBorderEffect {
    [self addRoundBorderEffect:TRUE border:TRUE opacity:1 shadow:TRUE];
}

- (void)addRoundBorderEffect:(BOOL)roundCorner border:(BOOL)border opacity:(float)opacity shadow:(BOOL)shadow {
    [self addRoundBorderEffect:roundCorner cornerRadius:3 border:border borderWidth:1 borderColor:[UIColor whiteColor] opacity:opacity shadow:shadow];
}

- (void)addRoundBorderEffect:(BOOL)roundCorner cornerRadius:(CGFloat)cornerRadius border:(BOOL)border borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor opacity:(float)opacity shadow:(BOOL)shadow {
    if(roundCorner) {
        self.cornerRadius = cornerRadius;
    }
    
    if(border) {
        self.borderWidth = borderWidth;
        self.borderColor = borderColor;
    }
    
    self.layer.opacity = opacity;
    
    if(shadow) {
        self.clipsToBounds = TRUE;
        self.layer.shadowColor = UIColor.blackColor.CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowRadius = 1;
        self.layer.shadowOpacity = 0.1;
    }
}

- (void)addCircleEffect {
    [self addRoundBorderEffect:TRUE cornerRadius:self.width/2 border:FALSE borderWidth:0 borderColor:nil opacity:1 shadow:FALSE];
}

- (void)addCircleBorderEffect {
    [self addCircleBorderEffect:[UIColor whiteColor]];
}

- (void)addCircleBorderEffect:(UIColor *)borderColor {
    [self addRoundBorderEffect:TRUE cornerRadius:self.width/2 border:TRUE borderWidth:1 borderColor:borderColor opacity:1 shadow:FALSE];
}

@end
