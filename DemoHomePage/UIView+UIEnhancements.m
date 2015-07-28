//
//  UIView+UIEnhancements.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 28/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "UIView+UIEnhancements.h"

@implementation UIView (UIEnhancements)

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
