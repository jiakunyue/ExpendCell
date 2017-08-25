//
//  ViewController.m
//  ExpendCell
//
//  Created by Justin on 2017/8/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "Model.h"
#import "ModelCell.h"

#define kScreen_W [UIScreen mainScreen].bounds.size.width
#define kScreen_H [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
/** tableview */
@property (nonatomic, strong) UITableView *tableview;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray <Model *>* models;
/** 任务管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation ViewController
#pragma mark - 懒加载
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSMutableArray <Model *>*)Models {
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    [self loadData];
}

#pragma mark - 网络数据
- (void)loadData {
    // 取消所有的请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(29);
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        weakSelf.models = [Model mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [weakSelf.tableview reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error.description);
    }];
}

#pragma mark - UI
- (void)configUI {
    self.title = @"Cell展开";
    [self setupTableview];
}

- (void)setupTableview {
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[ModelCell class] forCellReuseIdentifier:NSStringFromClass([ModelCell class])];
    [self.view addSubview:tableview];
    
    self.tableview = tableview;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ModelCell class])];
    cell.model = self.models[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.models[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [(ModelCell *)[tableView cellForRowAtIndexPath:indexPath] selectedEvent];
    [_tableview beginUpdates];
    [_tableview endUpdates];
}
@end
