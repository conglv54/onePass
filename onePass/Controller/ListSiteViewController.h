//
//  ListSiteViewController.h
//  onePass
//
//  Created by Lê Công on 10/8/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "BaseViewController.h"

@interface ListSiteViewController : BaseViewController

@end

#pragma -mark Cell

@interface userCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_title;

@end

//----------------------------------------------------------------------
