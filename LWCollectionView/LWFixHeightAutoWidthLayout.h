//
//  LWFixHeightAutoWidthLayout.h
//  LWCollectionView
//
//  Created by lwq on 2021/2/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGFloat(^GetWidthBlock)(NSIndexPath * indexpath,CGFloat fixHeight);

@interface LWFixHeightAutoWidthLayout : UICollectionViewLayout
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) CGFloat fixHeight;
@property (nonatomic, assign) CGFloat currentX;
@property (nonatomic, assign) CGFloat currentY;
@property (nonatomic, strong) NSMutableArray *atters;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, assign) CGFloat itemSpace;

@property (nonatomic, copy) GetWidthBlock getWidthWithDataBlock;

@end

NS_ASSUME_NONNULL_END
