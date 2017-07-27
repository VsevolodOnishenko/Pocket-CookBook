//
//  ViewController.m
//  RecipeBook2
//
//  Created by 111 on 21.07.17.
//  Copyright © 2017 Vsevolod Onishchenko. All rights reserved.
//

#import "ViewController.h"
#import "RecipeDetailViewController.h"
#import "Recipe.h"
#import "RecipeCellTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    NSArray *recipes;
    NSArray *searchResults;
}

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    Recipe *recipe1 = [Recipe new];
    recipe1.name = @"Egg Benedict";
    recipe1.prepTime = @"30 min";
    recipe1.imageFile = @"egg_benedict.jpg";
    recipe1.ingredients = [NSArray arrayWithObjects:@"2 fresh English muffins", @"4 eggs", @"4 rashers of back bacon", @"2 egg yolks", @"1 tbsp of lemon juice", @"125 g of butter", @"salt and pepper", nil];
    
    Recipe *recipe2 = [Recipe new];
    recipe2.name = @"Mushroom Risotto";
    recipe2.prepTime = @"30 min";
    recipe2.imageFile = @"mushroom_risotto.jpg";
    recipe2.ingredients = [NSArray arrayWithObjects:@"1 tbsp dried porcini mushrooms", @"2 tbsp olive oil", @"1 onion, chopped", @"2 garlic cloves", @"350g/12oz arborio rice", @"1.2 litres/2 pints hot vegetable stock", @"salt and pepper", @"25g/1oz butter", nil];
    
    
    Recipe *recipe3 = [Recipe new];
    recipe3.name = @"Full Breakfast";
    recipe3.prepTime = @"20 min";
    recipe3.imageFile = @"full_breakfast.jpg";
    recipe3.ingredients = [NSArray arrayWithObjects:@"2 sausages", @"100 grams of mushrooms", @"2 rashers of bacon", @"2 eggs", @"150 grams of baked beans", @"Vegetable oil", nil];
    
    
    Recipe *recipe4 = [Recipe new];
    recipe4.name = @"Hamburger";
    recipe4.prepTime = @"30 min";
    recipe4.imageFile = @"hamburger.jpg";
    recipe4.ingredients = [NSArray arrayWithObjects:@"400g of ground beef", @"1/4 onion (minced)", @"1 tbsp butter", @"hamburger bun", @"1 teaspoon dry mustard", @"Salt and pepper", nil];
    
    recipes = [NSArray arrayWithObjects: recipe1, recipe2, recipe3, recipe4, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ( tableView == self.searchDisplayController.searchResultsTableView ) {
        return [searchResults count];
    } else {
        return [recipes count];
    }
}

#pragma mark TableView Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    RecipeCellTableViewCell *cell = (RecipeCellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[RecipeCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
        
    Recipe *recipe = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView ) {
        recipe = [searchResults objectAtIndex:indexPath.row];

    } else {
        recipe = [recipes objectAtIndex:indexPath.row];
        
    }
    
    cell.cellImage.image = [UIImage imageNamed:recipe.imageFile];
    cell.cellName.text = recipe.name;
    cell.cellDetails.text = recipe.prepTime;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

#pragma mark Search Methods

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name beginswith[c] %@", searchText];
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

#pragma mark Segue

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = nil;
        Recipe *recipe = nil;
        
        if ( self.searchDisplayController.isActive) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            //recipe = [searchResults objectAtIndex:indexPath.row];
            RecipeDetailViewController *destViewController = segue.destinationViewController;
            destViewController.recipe = [searchResults objectAtIndex:indexPath.row];
        
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            //recipe = [recipes objectAtIndex:indexPath.row];
            RecipeDetailViewController *destViewController = segue.destinationViewController;
            destViewController.recipe = [recipes objectAtIndex:indexPath.row];
        }
        
       // RecipeDetailViewController *destViewController = segue.destinationViewController;
       // destViewController.title = recipe.name;
    }
}

@end
