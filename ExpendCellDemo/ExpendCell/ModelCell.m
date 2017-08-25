//
//  ModelCell.m
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "ModelCell.h"
#import "Model.h"

#define kScreen_W [UIScreen mainScreen].bounds.size.width
#define kScreen_H [UIScreen mainScreen].bounds.size.height

@interface ModelCell ()
@property (nonatomic, strong) UILabel  *normalLabel;
@property (nonatomic, strong) UILabel  *expendLabel;
@property (nonatomic, strong) UIView   *line;
@property (nonatomic, strong) UIView   *stateView;
@end

@implementation ModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self buildSubviews];
    }
    return self;
}

- (void)buildSubviews {
    self.line                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 0.5f)];
    self.line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [self.contentView addSubview:self.line];
    
    self.stateView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 13, 2, 15)];
    self.stateView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.stateView];
    
    self.normalLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreen_W - 20, 0)];//高度为0
    self.normalLabel.numberOfLines = 3.f;
    self.normalLabel.textColor     = [UIColor grayColor];
    self.normalLabel.font          = [UIFont fontWithName:@"Heiti SC" size:14.f];
    [self.contentView addSubview:self.normalLabel];
    
    self.expendLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreen_W - 20, 0)];
    self.expendLabel.numberOfLines = 0;
    self.expendLabel.textColor     = [UIColor blackColor];
    self.expendLabel.font          = [UIFont fontWithName:@"Heiti SC" size:14.f];
    [self.contentView addSubview:self.expendLabel];
}

- (void)setModel:(Model *)model {
    
    _model = model;
    
    if (model.cellType == kShowTextCellNormalType) {
        
        self.normalLabel.text  = model.text;
        self.normalLabel.frame = CGRectMake(10, 10, kScreen_W - 20, 0);
        self.normalLabel.alpha = 1;
        [self.normalLabel sizeToFit];
        
        self.expendLabel.text  = model.text;
        self.expendLabel.frame = CGRectMake(10, 10, kScreen_W - 20, 0);
        self.expendLabel.alpha = 0;
        [self.expendLabel sizeToFit];
        
        self.stateView.backgroundColor = [UIColor grayColor];
        
    } else {
        
        self.normalLabel.text  = model.text;
        self.normalLabel.frame = CGRectMake(10, 10, kScreen_W - 20, 0);
        self.normalLabel.alpha = 0;
        [self.normalLabel sizeToFit];
        
        self.expendLabel.text  = model.text;
        self.expendLabel.frame = CGRectMake(10, 10, kScreen_W - 20, 0);
        self.expendLabel.alpha = 1;
        [self.expendLabel sizeToFit];
        
        self.stateView.backgroundColor = [UIColor redColor];
    }
    
}

- (void)changeState {
    
    if (_model.cellType == kShowTextCellNormalType) {
        
        _model.cellType = kShowTextCellExpendType;
        _model.cellHeight = _model.expendStringHeight;
        [self expendState];
        
    } else {
        
        _model.cellType = kShowTextCellNormalType;
        _model.cellHeight = _model.normalStringHeight;
        [self normalState];
    }
    
}

- (void)normalState {
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.normalLabel.alpha         = 1;
        self.expendLabel.alpha         = 0;
        self.stateView.backgroundColor = [UIColor grayColor];
    }];
}

- (void)expendState {
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.normalLabel.alpha         = 0;
        self.expendLabel.alpha         = 1;
        self.stateView.backgroundColor = [UIColor redColor];
    }];
}

- (void)selectedEvent {
    
    [self changeState];
}

@end
