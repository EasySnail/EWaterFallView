# EWaterFallView  瀑布流

![image](https://github.com/EasySnail/EWaterFallView/blob/master/EWaterFallView/%E6%95%88%E6%9E%9C%E5%9B%BE/image.gif)

### pods引用
```objc
pod 'EWaterFallView', '~> 0.0.2'
```

### 使用
```objc
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

```
