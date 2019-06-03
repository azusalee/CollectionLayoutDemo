//
//  CircleCollectionViewLayout.h
//  CardCollect
//
//  Created by yangming on 2019/6/3.
//  Copyright © 2019 AL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat minScale;
@property (nonatomic, assign) CGFloat maxScale;

@property (nonatomic, assign) CGSize itemSize; 

@end

NS_ASSUME_NONNULL_END
