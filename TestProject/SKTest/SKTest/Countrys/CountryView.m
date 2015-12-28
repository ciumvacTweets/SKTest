//
//  CountryView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "CountryView.h"
@interface CountryView () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@end


@implementation CountryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
// 
//    return [UITableViewCell class]; // delete when implement
//    
//}

@end
