//
//  GMDashLineView.m
//  Gengmei
//
//  Created by lwq on 2021/2/4.
//  Copyright © 2021 更美互动信息科技有限公司. All rights reserved.
//

#import "GMDashLineView.h"

@interface GMDashLineView ()
{
    NSInteger _lineLength;
    NSInteger _lineSpacing;
    UIColor * _lineColor;
    CGFloat _height;
    CGRect _rect;
}
@end

@implementation GMDashLineView

- (instancetype)initWithFrame:(CGRect)frame withLineLength:(NSInteger)lineLength withLineSpacing:(NSInteger)lineSpacing withLineColor:(UIColor *)lineColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lineLength = lineLength;
        _lineSpacing = lineSpacing;
        _lineColor = lineColor;
        _height = frame.size.height;
        _rect = frame;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context,1);
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    CGFloat lengths[] = {_lineLength,_lineSpacing};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context,_rect.size.width ,0);
    CGContextStrokePath(context);
    CGContextClosePath(context);
}

@end
