//
//  HomePage.h
//  DemoHomePage
//
//  Created by Piyush Sharma on 24/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePage : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *homePageTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScrollView;
@property (weak, nonatomic,getter=aNewUsedSegControl) IBOutlet UISegmentedControl *newUsedSegControl;

@end
