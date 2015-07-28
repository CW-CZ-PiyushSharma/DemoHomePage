//
//  HomePage.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 24/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "HomePage.h"
#import "CellMetaData.h"
#import "DiscoverCarsTableCell.h"
#import "GetFinalPriceTableCell.h"
#import "LatestUpdatesTableViewCell.h"
#import "SearchNewCarTableCell.h"
#define HELVETICA_CONDENSED_BOLD_FONT @"HelveticaNeue-CondensedBold"

@interface HomePage () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *cellMetaDataArray;
    NSArray *tableViewArray;
}
@end

static NSString *newCarIdentifier = @"newCarCell";
static NSString *discoverIdentifier = @"discoverCars";
static NSString *getFinalPriceIdentifier = @"finalPrice";
static NSString *latesUpdatesCellIdentifier = @"latestUpdates";

@implementation HomePage
@synthesize homePageTableView = _homePageTableView, homeScrollView = _homeScrollView;
@synthesize newUsedSegControl = _newUsedSegControl;
#pragma mark - View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeArray];
    [_homePageTableView registerClass:[SearchNewCarTableCell class] forCellReuseIdentifier:newCarIdentifier];
    [_homePageTableView registerClass:[DiscoverCarsTableCell class] forCellReuseIdentifier:discoverIdentifier];
    [_homePageTableView registerClass:[GetFinalPriceTableCell class] forCellReuseIdentifier:getFinalPriceIdentifier];
    [_homePageTableView registerClass:[LatestUpdatesTableViewCell class] forCellReuseIdentifier:latesUpdatesCellIdentifier];
    
    UIImage *image = [UIImage imageNamed:@"logo.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    [_newUsedSegControl setTitle:@"New cars" forSegmentAtIndex:0];
    [_newUsedSegControl setTitle:@"Used cars" forSegmentAtIndex:1];

 
    
    
    NSDictionary *normalAtt = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:HELVETICA_CONDENSED_BOLD_FONT size:15], NSFontAttributeName,
                                          [UIColor blackColor], NSForegroundColorAttributeName,
                                           nil];
    
    
      [_newUsedSegControl setTitleTextAttributes:normalAtt forState:UIControlStateNormal];
  
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:HELVETICA_CONDENSED_BOLD_FONT size:15], NSFontAttributeName,
                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                           nil];
    [_newUsedSegControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
  

    

    [self newCarSegmentChanged:_newUsedSegControl];
    
    
    
    // Do any additional setup after loading the view from its nib.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
  
    CGRect frame = _newUsedSegControl.frame;
    frame.size.height = 40.0f;
    _newUsedSegControl.frame = frame;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)initializeArray{
    cellMetaDataArray = [[NSMutableArray alloc] init];
    CellMetaData *cellData = [[CellMetaData alloc] init];
    cellData.identifier = newCarIdentifier;
    cellData.cellClass = [SearchNewCarTableCell class];
    cellData.height = 150;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = discoverIdentifier;
    cellData.cellClass = [DiscoverCarsTableCell class];
    cellData.height = 425;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = getFinalPriceIdentifier;
    cellData.cellClass = [GetFinalPriceTableCell class];
    cellData.height = 300;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = latesUpdatesCellIdentifier;
    cellData.cellClass = [LatestUpdatesTableViewCell class];
    cellData.height = 400;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    
    
    
    
    
    
}


#pragma mark - Table View Delegates and Datasource -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellMetaData *cellData = [tableViewArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData.identifier forIndexPath:indexPath];
//    if(cell == nil){
//        cell = [[cellData.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellData.identifier];
//    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellMetaData *cellData = [tableViewArray objectAtIndex:indexPath.row];
    return cellData.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

#pragma mark - Button Actions
- (IBAction)newCarSegmentChanged:(id)sender {
   
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.cellType == %d",segControl.selectedSegmentIndex];
    tableViewArray = [cellMetaDataArray filteredArrayUsingPredicate:predicate];
    [UIView transitionWithView:_homePageTableView
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^(void) {
                        [_homePageTableView reloadData];
                        
                    } completion:^(BOOL finished) {
                        CGRect frame = _homePageTableView.frame;
                        frame.size = _homePageTableView.contentSize;
                        _homePageTableView.frame = frame;
                        _homeScrollView.contentSize = CGSizeMake(self.view.frame.size.width, _homePageTableView.frame.origin.y + _homePageTableView.frame.size.height);
                    }];
   
   
   
    
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
