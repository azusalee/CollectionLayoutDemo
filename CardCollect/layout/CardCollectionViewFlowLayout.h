//
//  CardCollectionViewFlowLayout.h
//  CardCollect
//
//  Created by yangming on 2019/5/24.
//  Copyright © 2019 AL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat minScale;
@property (nonatomic, assign) CGFloat maxScale;

@end

NS_ASSUME_NONNULL_END
