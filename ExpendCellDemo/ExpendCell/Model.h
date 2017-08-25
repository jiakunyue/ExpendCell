//
//  Model.h
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//
// 也可以在模型中加一个 bool 值来存储cell是否为打开状态来判断高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject
/** 内容 */
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSInteger cellType;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat expendStringHeight;
@property (nonatomic, assign) CGFloat normalStringHeight;
@end
