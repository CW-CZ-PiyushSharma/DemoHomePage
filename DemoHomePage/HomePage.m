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


@interface HomePage () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *cellMetaDataArray;
}
@end

static NSString *newCarIdentifier = @"newCarCell";
static NSString *discoverIdentifier = @"discoverCars";
static NSString *getFinalPriceIdentifier = @"finalPrice";
static NSString *latesUpdatesCellIdentifier = @"latestUpdates";

@implementation HomePage
@synthesize homePageTableView = _homePageTableView, homeScrollView = _homeScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeArray];
    [_homePageTableView registerClass:[SearchNewCarTableCell class] forCellReuseIdentifier:newCarIdentifier];
    [_homePageTableView registerClass:[DiscoverCarsTableCell class] forCellReuseIdentifier:discoverIdentifier];
    [_homePageTableView registerClass:[GetFinalPriceTableCell class] forCellReuseIdentifier:getFinalPriceIdentifier];
    [_homePageTableView registerClass:[LatestUpdatesTableViewCell class] forCellReuseIdentifier:latesUpdatesCellIdentifier];
    _homePageTableView.delegate = self;
    _homePageTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGRect frame = _homePageTableView.frame;
    frame.size = _homePageTableView.contentSize;
    frame.size.height = frame.size.height + 10;
    _homePageTableView.frame = frame;
    _homeScrollView.contentSize = CGSizeMake(self.view.frame.size.width, _homePageTableView.frame.origin.y + _homePageTableView.frame.size.height);
    
}

-(void)initializeArray{
    cellMetaDataArray = [[NSMutableArray alloc] init];
    
    CellMetaData *cellData = [[CellMetaData alloc] init];
    cellData.identifier = newCarIdentifier;
    cellData.cellClass = [SearchNewCarTableCell class];
    cellData.height = 138;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = discoverIdentifier;
    cellData.cellClass = [DiscoverCarsTableCell class];
    cellData.height = 398;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = getFinalPriceIdentifier;
    cellData.cellClass = [GetFinalPriceTableCell class];
    cellData.height = 220;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
    
    cellData = [[CellMetaData alloc] init];
    cellData.identifier = latesUpdatesCellIdentifier;
    cellData.cellClass = [LatestUpdatesTableViewCell class];
    cellData.height = 425;
    cellData.cellType = NEWCAR;
    [cellMetaDataArray addObject:cellData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cellMetaDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellMetaData *cellData = [cellMetaDataArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData.identifier forIndexPath:indexPath];
    if(cell == nil){
        cell = [[cellData.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellData.identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellMetaData *cellData = [cellMetaDataArray objectAtIndex:indexPath.row];
    return cellData.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
