//
//  Model.m
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "Model.h"

#define kScreen_W [UIScreen mainScreen].bounds.size.width
#define kScreen_H [UIScreen mainScreen].bounds.size.height

@implementation Model

- (CGFloat)cellHeight {
    
    CGFloat totalStringHeight = [self.text boundingRectWithSize:CGSizeMake(kScreen_W - 20, MAXFLOAT)
                                                        options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                                 NSStringDrawingUsesFontLeading
                                                     attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Heiti SC" size:14.f]}
                                                        context:nil].size.height;
    CGFloat oneLineHeight     = [@"One" boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
                                                     options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                                 NSStringDrawingUsesFontLeading
                                                  attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Heiti SC" size:14.f]}
                                                     context:nil].size.height;
    CGFloat normalTextHeight  = totalStringHeight >= 3 * oneLineHeight ? 3 * oneLineHeight : totalStringHeight;
    
    // Expend string height.
    _expendStringHeight = 10 + totalStringHeight + 10;
    
    // One line height.
    _normalStringHeight = 10 + normalTextHeight + 10;
    
    if (_cellType == kShowTextCellNormalType) {
        
        return _normalStringHeight;
    } else {
        return _expendStringHeight;
    }
    
}

@end
