//
//  CircleCollectionViewLayout.m
//  CardCollect
//
//  Created by yangming on 2019/6/3.
//  Copyright © 2019 AL. All rights reserved.
//

#import "CircleCollectionViewLayout.h"

@interface CircleCollectionViewLayout()

//@property (nonatomic, strong) NSArray *layoutAttributes;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger totalNum;
@property (nonatomic, assign) CGFloat pageSize;

@end

@implementation CircleCollectionViewLayout



- (instancetype)init{
    if (self = [super init]) {
        _minScale = 0.8;
        _maxScale = 1.0;
        _itemSize = CGSizeMake(60, 60);
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.bounds.size.width*10, self.collectionView.bounds.size
    .height);
}

- (void)prepareLayout{
    [super prepareLayout];
    self.totalNum = [self.collectionView numberOfItemsInSection:0];
    //NSMutableArray *layouts = [[NSMutableArray alloc] init];
    self.center = CGPointMake(self.collectionView.bounds.size.width/2, self.collectionView.bounds.size.height/2);
    self.radius = MIN(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)/3;
    self.pageSize = self.collectionView.bounds.size.width/self.totalNum;
//    for (int i = 0; i < self.totalNum; ++i) {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
//        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
//        [layouts addObject:attributes];
//    }
    //self.layoutAttributes = layouts.copy;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    attributes.size = self.itemSize;
//    CGFloat angle = 2*M_PI*indexPath.row/_totalNum;
//    attributes.center = CGPointMake(self.center.x+self.radius*cos(angle), self.center.y + self.radius*sin(angle));
    return attributes;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [[NSMutableArray alloc] init];
    
    // 计算collectionView最中心点的x值
    //CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (int i = 0; i < self.totalNum; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        attrs.size = self.itemSize;
        CGFloat angle = -2*M_PI*attrs.indexPath.row/_totalNum+M_PI*2*self.collectionView.contentOffset.x/self.collectionView.bounds.size.width+M_PI_2;
        attrs.center = CGPointMake(self.center.x+self.radius*cos(angle)+self.collectionView.contentOffset.x, self.center.y + self.radius*sin(angle));
        [attributes addObject:attrs];
    }
    
    return attributes;
    
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset{
//    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
//        NSInteger index = (self.collectionView.contentOffset.x+self.collectionView.frame.size.width * 0.5)/self.itemSize.width;
//        
//        return CGPointMake(index*self.itemSize.width-self.collectionView.frame.size.width/2+self.itemSize.width/2, proposedContentOffset.y);
//    }
//    
//    return proposedContentOffset;
//}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{

    CGFloat tagetX = ((NSInteger)(proposedContentOffset.x/self.pageSize+0.5))*self.pageSize;
    
    return CGPointMake(tagetX, proposedContentOffset.y);
}
@end
