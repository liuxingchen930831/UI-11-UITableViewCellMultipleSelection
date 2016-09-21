# UI-11-UITableViewCellMultipleSelection
## 多行数据删除
- 在- (void)viewDidLoad方法中实现
    - // 允许在编辑模式进行多选操作
self.tableView.allowsMultipleSelectionDuringEditing = YES;

-  编辑模式取反    
    - [self.tableView setEditing:!self.tableView.editing animated:YES];
- 操作数据
    - //获得所有被选中的行
     
    NSArray *indexArrayS = [self.tableView indexPathsForSelectedRows];
    
    - //遍历所有行号
    
    NSMutableArray *deletDeals =[NSMutableArray array];
    for (NSIndexPath *path in indexArrayS) {
        [deletDeals addObject:self.deals[path.row]];
    }
    
    - //删除模型中选中的行号
    
    [self.deals removeObjectsInArray:deletDeals];
    
    - //数据处理完，刷新表格
    
    [self.tableView reloadData];
