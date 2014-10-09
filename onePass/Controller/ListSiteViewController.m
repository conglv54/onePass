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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
    cell.imageView.image = [UIImage imageNamed:@"Account"];
    cell.textLabel.text  = @"Test";
    return cell;
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
