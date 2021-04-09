//
//  GMDashLineView.h
//  Gengmei
//
//  Created by lwq on 2021/2/4.
//  Copyright © 2021 更美互动信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GMDashLineView : UIView
- (instancetype)initWithFrame:(CGRect)frame withLineLength:(NSInteger)lineLength withLineSpacing:(NSInteger)lineSpacing withLineColor:(UIColor *)lineColor;
@end

NS_ASSUME_NONNULL_END
