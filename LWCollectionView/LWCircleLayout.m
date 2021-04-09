//
//  LWCircleLayout.m
//  Test3DTouch
//
//  Created by lwq on 2021/2/1.
//  Copyright © 2021 lwq. All rights reserved.
//

#import "LWCircleLayout.h"

@interface LWCircleLayout ()
@property (nonatomic, strong) NSMutableArray *atters;

@end

@implementation LWCircleLayout
- (NSMutableArray *)atters {
    if (!_atters) {
        _atters = [[NSMutableArray alloc] init];
    }
    return _atters;
}

-(void)prepareLayout
{
    [super prepareLayout];
    
    [self.atters removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *atter = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.atters addObject:atter];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atter = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    atter.size = CGSizeMake(50, 50);
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat radi = 70;
    CGFloat cirX = self.collectionView.frame.size.width * 0.5;
    CGFloat cirY = self.collectionView.frame.size.height * 0.5;
    
    double angle = (2 * M_PI / count) * indexPath.item;;
    CGFloat itemX = radi * sin(angle) + cirX;
    CGFloat itemY = radi * cos(angle) + cirY;
    
    atter.center = CGPointMake(itemX, itemY);
    
    [self.atters addObject:atter];
    return atter;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.atters;
}

@end
