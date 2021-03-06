//
//  IndexViewController.m
//  TOPageView
//
//  Created by Tony on 17/6/21.
//  Copyright © 2017年 Tony. All rights reserved.
//

#import "IndexViewController.h"
#import "ContentSettingsViewController.h"
#import "SizeViewController.h"
#import "TOPageViewController.h"
#import "ExampleViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"demo";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"TOPageViewController";
            break;
        case 1:
            cell.textLabel.text = @"TOPageTitleView";
            break;
        case 2:
            cell.textLabel.text = @"通过IB创建TOPageTitleView";
            break;
        
        
        default:
            break;
    }
    
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    switch (indexPath.row) {
        case 0:
        {
            TOPageViewController *temp = [[TOPageViewController alloc] init];
            temp.title = @"TOPageViewController";
            temp.edgesForExtendedLayout = UIRectEdgeNone;
            
            temp.itemList = @[
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"母婴"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"美妆"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"保健"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"服饰"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"食品"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"百货"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"数码"]],
                              [TOPageItem itemWithViewController:[[ExampleViewController alloc]initWithTitle:@"测试一下"]],
                              ];
            viewController = temp;
        }
            
            break;
        case 1:
            viewController = [[ContentSettingsViewController alloc] init];
            break;
        case 2:
            viewController = [[SizeViewController alloc] init];
            break;
        
        default:
            break;
    }
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
}

@end
