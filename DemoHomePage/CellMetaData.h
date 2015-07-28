//
//  cellMetaData.h
//  DemoHomePage
//
//  Created by Piyush Sharma on 27/07/15.
//  Copyright (c) 2015 Piyush Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    NEWCAR = 0,
    USEDCAR = 1,
} CellType;

@interface CellMetaData : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) Class cellClass;
@property (nonatomic) NSInteger height;
@property (nonatomic) CellType cellType;

@end
