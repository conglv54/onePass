//
//  NewSiteViewController.h
//  onePass
//
//  Created by Le Cong on 10/9/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "BaseViewController.h"

#define kUserCell 0
#define kPasswordCell 1
#define kSiteCell 2

#define kPassworkLength 20

@interface NewSiteViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tbl;
@property (strong, nonatomic) NSString *emailFieldValue;
@property (strong, nonatomic) NSString *passwordFieldValue;
@property (strong, nonatomic) NSString *siteFieldValue;

@end

#pragma mark - Cell

@interface UserViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@end

@interface PassWordViewCell : UITableViewCell

//--------------------------------------------------------------------------------------------------------

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnGenPass;

//--------------------------------------------------------------------------------------------------------

- (IBAction)genrePassword:(id)sender;

//--------------------------------------------------------------------------------------------------------

@end

@interface SiteViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *txtSite;
@end