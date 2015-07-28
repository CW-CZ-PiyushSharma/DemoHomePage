//
//  NewCarTableViewCell.h
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchNewCarTableCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *carTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end
