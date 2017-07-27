//
//  ViewController.h
//  RecipeBook2
//
//  Created by 111 on 21.07.17.
//  Copyright © 2017 Vsevolod Onishchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) IBOutlet UITableView *tableView;

@end

