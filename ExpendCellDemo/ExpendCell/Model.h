//
//  Model.h
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

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
