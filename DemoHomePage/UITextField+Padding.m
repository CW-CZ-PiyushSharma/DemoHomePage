//
//  UITextField+Padding.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "UITextField+Padding.h"

@implementation UITextField (Padding)

-(void) setLeftPadding:(int) paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void) setRightPadding:(int) paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(void) setCornerRadius:(int) radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void) setBorderForColor:(UIColor *)color
                    width:(float)width
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}
@end
