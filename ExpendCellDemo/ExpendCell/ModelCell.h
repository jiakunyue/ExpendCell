//
//  ModelCell.h
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

typedef enum : NSUInteger {
    
    kShowTextCellNormalType,
    kShowTextCellExpendType,
    
} EShowTextCellType;

@interface ModelCell : UITableViewCell
@property (nonatomic, strong) Model *model;
@property (nonatomic, weak) NSIndexPath *indexPath;

- (void)selectedEvent;

@end
