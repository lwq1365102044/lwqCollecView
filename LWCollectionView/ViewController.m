//
//  ViewController.m
//  Test3DTouch
//
//  Created by lwq on 2020/9/7.
//  Copyright © 2020 lwq. All rights reserved.
//

#import "ViewController.h"
#import "LWCircleLayout.h"
#import "LWFlowLayout.h"
#import "LWFixHeightAutoWidthLayout.h"
#import "LWFixWidthAutoHeightLayout.h"
#import "GMDashLineView.h"

@interface LWCollectViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *lable;

@end

@implementation LWCollectViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lable = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _lable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lable];
    }
    return self;
}

@end

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) LWFixHeightAutoWidthLayout *fixHeightLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    
    LWCircleLayout *circleLayout = [[LWCircleLayout alloc] init];
    LWFlowLayout *flowLayout = [[LWFlowLayout alloc] init];
    LWFixHeightAutoWidthLayout *fixHeightLayout = [[LWFixHeightAutoWidthLayout alloc] init];
    fixHeightLayout.fixHeight = 30;
    fixHeightLayout.getWidthWithDataBlock = ^CGFloat(NSIndexPath * _Nonnull indexpath, CGFloat fixHeight) {
        return 20 +  (arc4random() % 101);
    };
    fixHeightLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    fixHeightLayout.itemSpace = 15;
    fixHeightLayout.lineSpace = 20;
    
    
    LWFixWidthAutoHeightLayout *fixWidthLayout = [[LWFixWidthAutoHeightLayout alloc] init];
    fixWidthLayout.getHeightBlock = ^CGFloat(NSIndexPath * _Nonnull indexpath, CGFloat fixWidth) {
        return 20 +  (arc4random() % 101);
    };
    fixWidthLayout.lineSpace = 10;
    fixWidthLayout.itemSpace = 10;
    fixWidthLayout.colsCount = 4;
    fixWidthLayout.sectionInsets = UIEdgeInsetsMake(30, 15, 30, 15 );
    _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500) collectionViewLayout:fixWidthLayout];
    [_collectView registerClass:[LWCollectViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [self.view addSubview:self.collectView];
    _count = 244;
    
//    CGFloat ShareImageHeight = 500;
//
//    CGFloat dashY = ShareImageHeight - 44 - 19;
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextBeginPath(context);
//    CGContextSetLineWidth(context, 20.0);
//    CGContextSetStrokeColorWithColor(context, UIColor.redColor.CGColor);
//    CGFloat lengths[] = {10,10};
//    CGContextSetLineDash(context, 0, lengths,2);
//    CGContextMoveToPoint(context, 0, 300);
//    CGContextAddLineToPoint(context, 400,300);
//    CGContextStrokePath(context);
//    CGContextClosePath(context);
    
//            GMDashLineView *verticalDashLine = [[GMDashLineView alloc] initWithFrame:CGRectMake(0, 100, 300, 1) withLineLength:3 withLineSpacing:3 withLineColor:UIColor.redColor];
//            [self.view addSubview:verticalDashLine];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LWCollectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.redColor;
    cell.lable.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectView deleteItemsAtIndexPaths:@[indexPath]];
    --_count;
}

@end
