//
//  LWFlowLayout.m
//  LWCollectionView
//
//  Created by lwq on 2021/2/1.
//

#import "LWFlowLayout.h"

@interface LWFlowLayout ()

@property (nonatomic, strong) NSMutableArray *atters;

@end

@implementation LWFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    _atters = [[NSMutableArray alloc] init];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //    self.minimumLineSpacing = 20;
    //    self.minimumInteritemSpacing = 40;
    
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
    self.itemSize = CGSizeMake(80, 80);
}

// 滚动停止时的位置
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect ;
    rect.size = self.collectionView.frame.size;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;

    NSArray *atters = [super layoutAttributesForElementsInRect:rect];

    // 计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;

    CGFloat minX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *atter in atters) {

        if (ABS(minX) > ABS(atter.center.x - centerX)) {

            minX = atter.center.x - centerX;

        }
    }

    proposedContentOffset.x+= minX;

    return proposedContentOffset;
}

// 当前rect内的所有cell的描述
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *atters = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat collectX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *atter in  atters) {
        
        CGFloat delta = ABS(atter.center.x - collectX);
        
        double scale = 1 - delta/self.collectionView.frame.size.width*0.5;
        
        atter.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    
    return atters;
}

//每次变动就刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
