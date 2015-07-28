//
//  UIView+UIEnhancements.h
//  DemoHomePage
//
//  Created by Piyush Sharma on 28/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIEnhancements)

-(void) setCornerRadius:(int) radius;
- (void)setBorderForColor:(UIColor *)color
                    width:(float)width;

@end
