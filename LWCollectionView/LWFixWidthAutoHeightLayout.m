//
//  LWFixWidthAutoHeightLayout.m
//  LWCollectionView
//
//  Created by lwq on 2021/2/2.
//

#import "LWFixWidthAutoHeightLayout.h"

@interface LWFixWidthAutoHeightLayout ()
@property (nonatomic, strong) NSMutableArray *atters;
@property (nonatomic, strong) NSMutableArray *heightArray;

@end

@implementation LWFixWidthAutoHeightLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    _atters = [[NSMutableArray alloc] init];
    
    _heightArray = [[NSMutableArray alloc] init];
    
    _fixItemWidth = (self.collectionView.frame.size.width - _sectionInsets.left - _sectionInsets.right - (_colsCount-1)*_itemSpace)/_colsCount;
    
    for (int i = 0; i<_colsCount; i++) {
        [_heightArray addObject:@(_sectionInsets.top)];
    }
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0 ; i < count ; i++) {
        UICollectionViewLayoutAttributes *atter = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.atters addObject:atter];
    }
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.atters;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atter = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat itemHeight = 100;
    if (self.getHeightBlock) {
        itemHeight = self.getHeightBlock(indexPath,_fixItemWidth);
    }
    atter.size = CGSizeMake(_fixItemWidth, itemHeight);
    
    CGFloat itemY = 0;
    
    CGFloat itemX = _sectionInsets.left;

    CGFloat minHeight = [_heightArray[0] floatValue];
    
    NSInteger minCols = 0;
    
    for (int i = 0; i<_heightArray.count; i++) {
        if ([_heightArray[i] floatValue] < minHeight) {
            minHeight = [_heightArray[i] floatValue];
            minCols = i;
        }
    }
    
    itemX = _sectionInsets.left + _fixItemWidth * minCols + _itemSpace * minCols;
    
    itemY = [_heightArray[minCols] floatValue];
    
    _heightArray[minCols] = @(itemY + itemHeight + _lineSpace);

    atter.frame = CGRectMake(itemX, itemY, _fixItemWidth, itemHeight);
    
    return atter;
}

-(CGSize)collectionViewContentSize
{
    CGFloat maxHeight = [_heightArray[0] floatValue];
    if ([_heightArray[0] floatValue] < [_heightArray[1] floatValue]) {
        maxHeight = [_heightArray[1] floatValue];
    }
    return CGSizeMake(1, maxHeight+_sectionInsets.bottom);
}

@end
