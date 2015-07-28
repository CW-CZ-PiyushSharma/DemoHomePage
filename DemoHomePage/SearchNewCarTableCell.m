//
//  NewCarTableViewCell.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "SearchNewCarTableCell.h"
#import "UITextField+Padding.h"

@implementation SearchNewCarTableCell
@synthesize carTextField = _carTextField;

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"SearchNewCarTableCell" owner:nil options:nil];
        self = [nibArray objectAtIndex:0];
        _carTextField.delegate = self;
        [_carTextField setBorderForColor:[UIColor lightGrayColor] width:0.5f];
        [_carTextField setCornerRadius:2];
        [_carTextField setLeftPadding:10];
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
