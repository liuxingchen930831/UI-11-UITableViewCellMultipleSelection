//
//  ViewController.m
//  UITableView表格更新
//
//  Created by liuxingchen on 16/9/20.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "XCDeal.h"
#import "XCDealCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * deals ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 允许在编辑模式进行多选操作
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
}
-(NSMutableArray *)deals
{
    if (_deals ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"deal.plist" ofType:nil];
        NSMutableArray *arrayM =[NSMutableArray array];
        NSArray *dealArray =[NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dealArray) {
            XCDeal *deal = [XCDeal dealWithDict:dict];
            [arrayM addObject:deal];
        }
        _deals = arrayM;
    }
    return _deals;
}

- (IBAction)multiple
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (IBAction)remove:(id)sender
{   //获得所有被选中的行
    NSArray *indexArrayS = [self.tableView indexPathsForSelectedRows];
    //遍历所有行号
    NSMutableArray *deletDeals =[NSMutableArray array];
    for (NSIndexPath *path in indexArrayS) {
        [deletDeals addObject:self.deals[path.row]];
    }
    //删除模型中选中的行号
    [self.deals removeObjectsInArray:deletDeals];
    //数据处理完，刷新表格
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    XCDealCell *cell = [XCDealCell cellWithTableView:tableView];
    //获取模型数据
    cell.deal = self.deals[indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
