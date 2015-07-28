//
//  GetFinalPriceCell.h
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetFinalPriceTableCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *carTextField;
@property (weak, nonatomic) IBOutlet UIButton *finalPriceButton;
@property (weak, nonatomic) IBOutlet UILabel *privateLabel;



@end
