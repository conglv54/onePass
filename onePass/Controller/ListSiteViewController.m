//
//  ListSiteViewController.m
//  onePass
//
//  Created by Lê Công on 10/8/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "ListSiteViewController.h"

@interface ListSiteViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ListSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Table view datasource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        userCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
        cell.lbl_title.text = @"Cong";
        return cell;
    } else if (indexPath.row == 1) {
        passCell *cell = [tableView dequeueReusableCellWithIdentifier:@"passCell"];
        [cell.btn setTitle:@"press" forState:UIControlStateNormal];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

#pragma mark - Cell

@implementation userCell

@end

@implementation passCell

@end