//
//  DiscoverCarsTableCell.m
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import "DiscoverCarsTableCell.h"
#import "HomeCarsCollectionCell.h"

static NSString *discoverCarsCollectionIdentifier = @"homePageCars";
@implementation DiscoverCarsTableCell
@synthesize carsCollectionView = _carsCollectionView;

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"DiscoverCarsTableCell" owner:nil options:nil];
        self = [nibArray objectAtIndex:0];
        _carsCollectionView.delegate = self;
        _carsCollectionView.dataSource = self;
        [_carsCollectionView registerClass:[HomeCarsCollectionCell class] forCellWithReuseIdentifier:discoverCarsCollectionIdentifier];
    }
    return self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:discoverCarsCollectionIdentifier forIndexPath:indexPath];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width - 36, _carsCollectionView.frame.size.height - 40);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
