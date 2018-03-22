# 日常DEMO
### XLTable
#### 1.用法
```
self.items = @[
[XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model1 cellType:XLCellTypeTitle],
[XLTableViewItem initItemWithCellReuseIdentifier:kImageCellReuseIdentifier model:model2 cellType:XLCellTypeImage],
[XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model3 cellType:XLCellTypeTitle],
[XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model1 cellType:XLCellTypeTitle],
[XLTableViewItem initItemWithCellReuseIdentifier:kImageCellReuseIdentifier model:model2 cellType:XLCellTypeImage],
[XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model3 cellType:XLCellTypeTitle]
];
```

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
XLTableViewItem *item = self.items[indexPath.row];
XLBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellReuseIdentifier forIndexPath:indexPath];
cell.item = item;
return cell;
}
```
#### 主要的类
- XLTableViewItem

主要用来包装数据，将原始的数据模型包装成XLTableViewItem。

#### 编不下去了。。。。。。
