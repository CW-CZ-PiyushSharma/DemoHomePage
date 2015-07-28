//
//  HomeUsedCarSearchCell.m
//  DemoHomePage
//
//  Created by Babul Prabhakar on 28/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "HomeUsedCarSearchCell.h"

@implementation HomeUsedCarSearchCell


-(id)initWithFrame:(CGRect)frame {
    
    self = [[[NSBundle mainBundle]loadNibNamed:@"HomeUsedCarSearchCell" owner:nil options:nil] firstObject];
    return self;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
