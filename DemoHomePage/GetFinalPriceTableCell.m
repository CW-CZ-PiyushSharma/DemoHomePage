//
//  GetFinalPriceCell.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "GetFinalPriceTableCell.h"
#import "UITextField+Padding.h"
#import "UIView+UIEnhancements.h"

@implementation GetFinalPriceTableCell
@synthesize finalPriceButton = _finalPriceButton, privateLabel = _privateLabel;

- (void)awakeFromNib {
    // Initialization code
    [_privateLabel sizeToFit];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"GetFinalPriceTableCell" owner:nil options:nil];
        self = [nibArray objectAtIndex:0];
        _carTextField.delegate = self;
        [_carTextField setCornerRadius:2];
        [_carTextField setLeftPadding:10];
        _finalPriceButton.layer.cornerRadius = 2;
        _finalPriceButton.layer.masksToBounds = YES;
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
