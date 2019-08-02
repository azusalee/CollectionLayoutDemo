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
#import "SinCollectionViewFlowLayout.h"
#import "CircleCollectionViewLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self changeLayout:self.segControl];
//    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
//    SinCollectionViewFlowLayout *layout = [[SinCollectionViewFlowLayout alloc] init];
//    CGFloat itemWidth = 130;
//    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    layout.minimumInteritemSpacing = 0;
//    layout.minimumLineSpacing = 0;
//    layout.sectionInset = UIEdgeInsetsMake(120, (screenWidth-itemWidth)/2, 120, (screenWidth-itemWidth)/2);
    
    
//    CircleCollectionViewLayout *layout = [[CircleCollectionViewLayout alloc] init];
//    self.collectionView.collectionViewLayout = layout;
    
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
                        @{@"title":@"11"},
                        @{@"title":@"12"},];
                        
    NSLog(@"测试");
    
    [self testCoverage];
    [self testCoverage2];
    [self testCoverage3];
    [self testCoverage4];
    [self testCoverage5];
}

- (void)testCoverage{
    int i = 1;
    int j = i+2;
    if (j > i) {
        NSLog(@"j > i");
    }else{
        NSLog(@"j <= i");
    }
}

- (void)testCoverage2{
    int i = 1;
    int j = i+2;
    NSLog(@"j > i");
}

- (void)testCoverage3{
    int j = 2;
    for (int i = 0; i < 10; ++i) {
        if (j == i) {
            NSLog(@"j == i");
        }else{
            NSLog(@"j != i");
        }
    }
}

- (void)testCoverage4{
    NSLog(@"测试4");
}

- (void)testCoverage5{
    if (1+1 > 2) {
        NSLog(@">2");
    }else{
        NSLog(@"<=2");
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    NSString *title = dict[@"title"];
    cell.nameLabel.text = title;
    NSLog(@"测试2");
    return cell;
}

- (IBAction)changeLayout:(UISegmentedControl *)sender {
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    if (sender.selectedSegmentIndex == 0) {
        CardCollectionViewFlowLayout *layout = [[CardCollectionViewFlowLayout alloc] init];
        CGFloat itemWidth = 130;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(120, (screenWidth-itemWidth)/2, 120, (screenWidth-itemWidth)/2);
        self.collectionView.collectionViewLayout = layout;
        [self.collectionView reloadData];
    }else if (sender.selectedSegmentIndex == 1){
        SinCollectionViewFlowLayout *layout = [[SinCollectionViewFlowLayout alloc] init];
        CGFloat itemWidth = 130;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(120, (screenWidth-itemWidth)/2, 120, (screenWidth-itemWidth)/2);
        self.collectionView.collectionViewLayout = layout;
        [self.collectionView reloadData];
    }else if (sender.selectedSegmentIndex == 2){
        CircleCollectionViewLayout *layout = [[CircleCollectionViewLayout alloc] init];
        self.collectionView.collectionViewLayout = layout;
        [self.collectionView reloadData];
    }
}

@end
