//
//  Recipe.h
//  RecipeBook2
//
//  Created by 111 on 24.07.17.
//  Copyright © 2017 Vsevolod Onishchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *prepTime;
@property (nonatomic, strong) NSString *imageFile;
@property (nonatomic, strong) NSArray *ingredients;

@end
