//
//  ViewController.m
//  CardCollect
//
//  Created by yangming on 2019/5/24.
//  Copyright © 2019 AL. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionViewFlowLayout.h"
#import "DemoCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CardCollectionViewFlowLayout *layout = [[CardCollectionViewFlowLayout alloc] init];
    CGFloat itemWidth = 130;
    layout.itemSize = CGSizeMake(itemWidth, self.collectionView.bounds.size.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(0, (screenWidth-itemWidth)/2, 0, (screenWidth-itemWidth)/2);
    
    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DemoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DemoCollectionViewCell"];
    
    self.dataArray = @[@{@"title":@"1"},
                        @{@"title":@"2"},
                        @{@"title":@"3"},
                        @{@"title":@"4"},
                        @{@"title":@"5"},
                        @{@"title":@"6"},
                        @{@"title":@"7"},
                        @{@"title":@"8"},
                        @{@"title":@"9"},
                        @{@"title":@"10"},
                        @{@"title":@"11"},];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}


@end
