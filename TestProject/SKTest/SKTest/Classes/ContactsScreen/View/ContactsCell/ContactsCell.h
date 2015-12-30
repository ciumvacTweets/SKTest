//
//  ContactsCell.h
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *contactImageMask;
@property (weak, nonatomic) IBOutlet UIView *contactImageBackground;
@property (weak, nonatomic) IBOutlet UILabel *contactImageLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

-(void)setData:(NSDictionary *)dataDictionary;


@end
