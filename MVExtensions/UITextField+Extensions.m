//
//  UITextField+Extensions.m
//  MVExtensions
//
//  Created by Martin Yin on 5/3/2016.
//  Copyright © 2016 Marchell. All rights reserved.
//

#import "UITextField+Extensions.h"
#import "UIColor+Extensions.h"
#import "UIView+EasyUseGeometry.h"

@implementation UITextField (ViewStyle)

- (void)setLeftImage:(UIImage *)image {
    [self setLeftImage:image edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
}

- (void)setLeftImage:(UIImage *)image edgeInsets:(UIEdgeInsets)edgeInsets {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(edgeInsets.left, edgeInsets.top, [imageView width] + edgeInsets.left + edgeInsets.right, [imageView height] + edgeInsets.top + edgeInsets.bottom)];
    
    [leftView addSubview:imageView];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setRightLabel:(NSString *)text {
    [self setRightLabel:text edgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
}

- (void)setRightLabel:(NSString *)text edgeInsets:(UIEdgeInsets)edgeInsets {
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.backgroundColor = [UIColor clearColor];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.textColor = self.textColor;
    rightLabel.font = self.font;
    rightLabel.text = text;
    [rightLabel sizeToFit];
    rightLabel.frame = CGRectMake(0, 0, edgeInsets.left + edgeInsets.right, edgeInsets.top + edgeInsets.bottom);
    
    self.rightView = rightLabel;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addBorders:(UIViewBorderDirection)borderDirections {
    [self addBorders:borderDirections color:[UIColor colorWithIntString:@"#D1D1D1"]];
}

- (void)addBorders:(UIViewBorderDirection)borderDirections color:(UIColor *)color {
    [self addBorder:borderDirections color:color width:0.5f];
}

@end

@implementation UITextField (Utils)

- (void)selectAllRange {
    [self setSelectedTextRange:[self textRangeFromPosition:[self beginningOfDocument] toPosition:[self beginningOfDocument]]];
    [self setSelectedTextRange:[self textRangeFromPosition:[self beginningOfDocument] toPosition:[self endOfDocument]]];
}

@end

@implementation UITextField (Toolbar)

- (UIToolbar *)useFunctionalToolbar {
    if(![self functionalToolbar]) {
        UIToolbar *keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        keyboardToolbar.barStyle = UIBarStyleBlack;
        keyboardToolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                  [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(finishInput:)]];
        self.inputAccessoryView = keyboardToolbar;
        
        return keyboardToolbar;
    }
    
    return nil;
}

- (UIToolbar *)functionalToolbar {
    if(self.inputAccessoryView && [self.inputAccessoryView isKindOfClass:[UIToolbar class]]) {
        return (UIToolbar *)self.inputAccessoryView;
    }
    
    return nil;
}

- (void)finishInput:(id)sender {
    [self resignFirstResponder];
}

@end
