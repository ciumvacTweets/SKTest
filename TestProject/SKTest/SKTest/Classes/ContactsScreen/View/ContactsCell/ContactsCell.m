//
//  ContactsCell.m
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "ContactsCell.h"
@interface ContactsCell () {
    
    BOOL _selected;
    
}

@end

@implementation ContactsCell

- (void)awakeFromNib {
    // Initialization code
    [self setupSubviews];
}

-(void)setupSubviews {
    self.contactImageBackground.layer.cornerRadius = self.contactImageBackground.layer.bounds.size.width/2;
    self.contactImageMask.layer.cornerRadius = self.contactImageMask.layer.bounds.size.width/2;
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.08]];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"Check-128unchecked"] forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

-(void)setData:(NSDictionary *)dataDictionary {
    
    [self setupSubviews];
    self.NameLabel.text = [dataDictionary objectForKey:@"fullName"];
    
    NSString *firstLetter = [[dataDictionary objectForKey:@"firstName"] substringToIndex:1];
    NSString *secondLetter = [[dataDictionary objectForKey:@"lastName"] substringToIndex:1];
    
    self.contactImageLabel.text = [NSString stringWithFormat:@"%@%@", firstLetter, secondLetter];
    
    self.phoneNumberLabel.text = [dataDictionary objectForKey:@"phone"];
    
}

@end
