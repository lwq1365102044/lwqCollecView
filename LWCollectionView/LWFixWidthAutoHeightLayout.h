//
//  LWFixWidthAutoHeightLayout.h
//  LWCollectionView
//
//  Created by lwq on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGFloat(^GetItemHeightBlock)(NSIndexPath *indexpath,CGFloat fixWidth);

@interface LWFixWidthAutoHeightLayout : UICollectionViewLayout
@property (nonatomic, assign) CGFloat fixItemWidth;
@property (nonatomic, assign) CGFloat itemSpace;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, assign) UIEdgeInsets sectionInsets;
@property (nonatomic, assign) NSInteger colsCount;

@property (nonatomic, copy) GetItemHeightBlock getHeightBlock;

@end

NS_ASSUME_NONNULL_END
