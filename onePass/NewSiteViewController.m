//
//  NewSiteViewController.m
//  onePass
//
//  Created by Le Cong on 10/9/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "NewSiteViewController.h"
#import "Site.h"
#import "AppDelegate.h"

@interface NewSiteViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation NewSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    //-----------------------------------------------------------------------------------------------------
    
    self.title = @"NewSite";
    
    //-----------------------------------------------------------------------------------------------------
    
    UIBarButtonItem *rigntBarbtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(performRightBarbutton)];
    self.navigationItem.rightBarButtonItem = rigntBarbtn;
    
    //-----------------------------------------------------------------------------------------------------
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    self.managedObjectContext = appDelegate.managedObjectContext;

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)performRightBarbutton {
    [self saveAndBack];
}

- (void)saveAndBack {
    [self saveSite];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveSite {
    //  1
    Site *site = [NSEntityDescription insertNewObjectForEntityForName:@"Site" inManagedObjectContext:self.managedObjectContext];
    //  2
    site.userName = self.emailFieldValue;
    site.passWord = self.passwordFieldValue;
    site.siteURL  = self.siteFieldValue;
    //  3
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

#pragma mark - Tableview Datasource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == kUserCell) {
        UserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
        cell.txtUserName.delegate = self;
        return cell;
    } else if (indexPath.row == kPasswordCell) {
        PassWordViewCell *passCell = [tableView dequeueReusableCellWithIdentifier:@"passwordCell" forIndexPath:indexPath];
        passCell.txtPassword.delegate = self;
        return passCell;
    } else if (indexPath.row == kSiteCell) {
        SiteViewCell *siteCell = [tableView dequeueReusableCellWithIdentifier:@"siteCell" forIndexPath:indexPath];
        siteCell.txtSite.delegate = self;
        return siteCell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSIndexPath *indexPath = [self.tbl indexPathForCell:(UITableViewCell*)[[textField superview] superview]];
    
    if (indexPath.row == kUserCell)
        self.emailFieldValue = textField.text;
    if (indexPath.row == kPasswordCell)
        self.passwordFieldValue = textField.text;
    if (indexPath.row == kSiteCell)
        self.siteFieldValue = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSIndexPath *indexPath = [self.tbl indexPathForCell:(UserViewCell*)[[textField superview] superview]];
    if (indexPath.row == kUserCell) {
        NSIndexPath *sibling = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        PassWordViewCell *cell = (PassWordViewCell*)[self.tbl cellForRowAtIndexPath:sibling];
        [cell.txtPassword becomeFirstResponder];
    } else if (indexPath.row == kPasswordCell) {
        NSIndexPath *sibling = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        SiteViewCell *cell = (SiteViewCell*)[self.tbl cellForRowAtIndexPath:sibling];
        [cell.txtSite becomeFirstResponder];
    } else if (indexPath.row == kSiteCell) {
        [self saveAndBack];
    }
    
    return YES;
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

@implementation UserViewCell

@end

@implementation PassWordViewCell

- (IBAction)genrePassword:(id)sender {
    int lengt = kPassworkLength;
    NSString *pass = [Utils randomStringWithLength:lengt];
    self.txtPassword.text = pass;
}


@end

@implementation SiteViewCell

@end
