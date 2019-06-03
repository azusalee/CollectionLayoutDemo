//
//  SinCollectionViewFlowLayout.m
//  CardCollect
//
//  Created by yangming on 2019/6/3.
//  Copyright © 2019 AL. All rights reserved.
//

#import "SinCollectionViewFlowLayout.h"

@implementation SinCollectionViewFlowLayout



- (instancetype)init{
    if (self = [super init]) {
        _minScale = 0.8;
        _maxScale = 1.0;
    }
    return self;

}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (int i = 0; i < attributes.count; i++) {
        UICollectionViewLayoutAttributes *attrs = attributes[i];
        // cell的中心点x 和 collectionView最中心点的x值 的间距
        CGFloat delta = attrs.center.x - centerX;
        // 根据间距值 计算 cell的缩放比例
        float zoomFactory = self.collectionView.frame.size.width;
        CGFloat scale = 1-((1-self.minScale)*(ABS(delta)/zoomFactory));
        scale = MAX(self.minScale, scale);
        scale = MIN(self.maxScale, scale);
        
        // 设置缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        // 设置偏移
//        CGFloat cardHeight = self.cardHeight;
//        CGFloat cellHeight = self.cellHeight;
//        CGFloat offsetToCenter = cellHeight/2-(cardHeight+40);
//        attrs.transform = CGAffineTransformTranslate(attrs.transform, 0, -(cardHeight+offsetToCenter)*(1-scale)/2);

        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            attrs.transform = CGAffineTransformTranslate(attrs.transform, -delta*(1-scale), 0);
            attrs.transform = CGAffineTransformTranslate(attrs.transform, 0, -sin(M_PI_2*(2*delta/zoomFactory))*50);
        }
        
        //设置显示优先级
        attrs.zIndex = scale*1000;
        
        //其它设置
        attrs.alpha = scale;
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
    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        NSInteger index = (NSInteger)((proposedContentOffset.x)/self.itemSize.width);
        
        CGFloat offsetX =  index*self.itemSize.width;
        
        return CGPointMake(offsetX, proposedContentOffset.y);
    }
    
    return proposedContentOffset;
}

@end
