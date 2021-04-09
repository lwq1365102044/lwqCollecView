//
//  LWFixHeightAutoWidthLayout.m
//  LWCollectionView
//
//  Created by lwq on 2021/2/1.
//

#import "LWFixHeightAutoWidthLayout.h"

@implementation LWFixHeightAutoWidthLayout

-(void)prepareLayout
{
    [super prepareLayout];

    _currentX = self.sectionInset.left;
    _currentY = self.sectionInset.top;
    
    _atters = [[NSMutableArray alloc] init];
    _row = 1;
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i< count; i++) {
        UICollectionViewLayoutAttributes *atter = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [_atters addObject:atter];
    }
    
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atter = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat maxContent = self.collectionView.frame.size.width - _sectionInset.left - _sectionInset.right;
    
    CGSize size ;
    
    size.height = _fixHeight;
    
    if (self.getWidthWithDataBlock) {
        
        size.width =   self.getWidthWithDataBlock(indexPath, _fixHeight);
        if (size.width > maxContent) {
            size.width = maxContent;
        }
    }else{
        size.width = 100;
    }

    atter.size = size;
    
    if (_currentX + size.width > maxContent) {
        _currentX = _sectionInset.left;
        _currentY = _currentY + _fixHeight + _lineSpace;
        ++_row;
    }
    
    atter.frame = CGRectMake(_currentX, _currentY, size.width, size.height);
    
    _currentX+= size.width + _itemSpace;
    
    return atter;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.atters;
}
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(1, _row * _fixHeight + _sectionInset.top + _sectionInset.bottom + _row*_lineSpace);
}
@end
