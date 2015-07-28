//
//  NewsCollectionCell.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "NewsCollectionCell.h"

@implementation NewsCollectionCell
@synthesize mainView = _mainView;

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"NewsCollectionCell" owner:nil options:nil];
        self = [nibArray objectAtIndex:0];
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = 2;
        _mainView.layer.masksToBounds = YES;
    }
    return self;
}
@end
