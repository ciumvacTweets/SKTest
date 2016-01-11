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
    self.contactImageLabel.text = @"";
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"Check-128unchecked"] forState:UIControlStateNormal];
    [self.contactImageBackground setBackgroundColor:[UIColor colorWithRed:88/255.f green:169/255.f blue:175/255.f alpha:0.7]];
    [self.contactImageBackground setContentMode:UIViewContentModeScaleToFill];
    self.contactImageBackground.autoresizingMask =
    ( UIViewAutoresizingFlexibleBottomMargin
     | UIViewAutoresizingFlexibleHeight
     | UIViewAutoresizingFlexibleLeftMargin
     | UIViewAutoresizingFlexibleRightMargin
     | UIViewAutoresizingFlexibleTopMargin
     | UIViewAutoresizingFlexibleWidth );
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

-(void)setData:(NSDictionary *)dataDictionary {
    
    [self setupSubviews];
    self.NameLabel.text = [dataDictionary objectForKey:@"fullName"];
    NSString *firstLetter;
    NSString *secondLetter;
    
    if ([[dataDictionary objectForKey:@"firstName"] length] > 0){
     firstLetter = [[dataDictionary objectForKey:@"firstName"] substringToIndex:1];
    }
    
    if ([[dataDictionary objectForKey:@"firstName"] length] > 0){
     secondLetter = [[dataDictionary objectForKey:@"lastName"] substringToIndex:1];
    }
    NSMutableString *initials = [[NSMutableString alloc] init];
    
    if (firstLetter) {
        [initials appendString:firstLetter];
    }
    if (secondLetter) {
        [initials appendString:secondLetter];
    }
    
    
    if ([[dataDictionary objectForKey:@"hasImage"] boolValue]) {
        
        UIImage *image = [dataDictionary objectForKey:@"image"];
        
        [self.contactImageBackground setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
        
    } else {
        
    self.contactImageLabel.text = initials;
    
    }
    self.phoneNumberLabel.text = [dataDictionary objectForKey:@"phone"];
    
}

@end
