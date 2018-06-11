//
//  TestVC.m
//  EWaterFallView
//
//  Created by Easy on 2018/6/11.
//  Copyright © 2018年 Easy. All rights reserved.
//

#import "TestVC.h"
#import "EWaterFallView.h"

#define RGBColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TestVC ()
@property(nonatomic,strong)EWaterFallView *fview;
@property(nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self fview];
    // Do any additional setup after loading the view.
}

- (EWaterFallView *)fview{
    if (_fview == nil) {
        __weak TestVC *weakSelf = self;
        _fview = [[EWaterFallView alloc] init];
        
        //注册cell,默认 UICollectionViewCell
        _fview.registerClassCell = @"TestCell";
        
        //设置参数
        _fview.setParamBlock = ^(EWaterFallLayout *layout) {
            //设置三列
            layout.columnCount = 3;
            //设置间距
            layout.rowSpacing = 5;
            layout.columnSpacing = 5;
            //设置偏移
            layout.sectionInset = UIEdgeInsetsZero;
        };
        
        //返回每个item的高度
        _fview.itemHeightBlock = ^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
            return [weakSelf.dataArray[indexPath.row][@"ratio"] floatValue] *itemWidth + 20;
        };
        
        //返回总个数
        _fview.numberOfRowsBlock = ^NSInteger{
            return weakSelf.dataArray.count;
        };
        
        //返回设置cell
        _fview.cellDataBlock = ^id(UICollectionViewCell *cell, NSIndexPath *indexPath) {
            /*
                1.直接设置cell
             或者
                2.也可以在cell遵循协议执行方法：
                - (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath;
             */
            return weakSelf.dataArray[indexPath.row];
        };
        
        //点击cell
        _fview.didSelectAtIndexPathBlock = ^(NSIndexPath *indexPath) {
            NSLog(@"%ld",indexPath.row);
        };
        
        [self.view addSubview:_fview];
        
        //获取数据后刷新
        [_fview reloadData];
    }
    return _fview;
}



- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
        
        NSArray *colors = @[RGBColor(0xFFF68F),
                            RGBColor(0xFFC1C1),
                            RGBColor(0xFFB90F),
                            RGBColor(0xFF83FA),
                            RGBColor(0xC1FFC1),
                            RGBColor(0x8B864E),
                            RGBColor(0x71C671),
                            RGBColor(0xEECFA1),
                            RGBColor(0xCDCD00)];
        for (int i = 0; i < 100; ++i) {
            int index = arc4random()%9;
            float ratio = ((arc4random() % 13) + 3.0) / 10.0;
            [self.dataArray addObject:@{@"title":[NSString stringWithFormat:@"第%d个",i],
                                        @"image":colors[index],
                                        @"ratio":[NSString stringWithFormat:@"%f",ratio]}];
        }
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
@end



/******************************** cell *****************************************/

@implementation TestCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}
- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath{
    NSDictionary *dc = data;

    self.imageView.backgroundColor = dc[@"image"];
    self.titleLabel.text = dc[@"title"];
    
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20);
    self.titleLabel.frame = CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20);
    
    
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end





