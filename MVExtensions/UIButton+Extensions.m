//
//  UIButton+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 7/5/16.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "UIButton+Extensions.h"
#import "UIView+EasyUseGeometry.h"

@implementation UIButton (CenterVertically)

- (void)centerVerticallyWithPadding:(CGFloat)padding {
    CGSize imageSize = self.imageView.size;
    NSString *title = self.titleLabel.text;
    if(!CGSizeEqualToSize(imageSize, CGSizeZero) && title) {
        CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
        CGFloat totalHeight = imageSize.height + titleSize.height + padding;
        
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight-imageSize.height), 0, 0, -titleSize.width);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(totalHeight-titleSize.height), 0);
    }
}

- (void)centerVertically {
    [self centerVerticallyWithPadding:8.0];
}

@end
