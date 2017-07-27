//
//  RecipeCellTableViewCell.h
//  RecipeBook2
//
//  Created by 111 on 24.07.17.
//  Copyright © 2017 Vsevolod Onishchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellName;
@property (weak, nonatomic) IBOutlet UILabel *cellDetails;

@end
