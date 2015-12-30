//
//  ContactsView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContactsViewDelegate <NSObject>

-(void)popView;
-(void)searchText:(NSString *)text;


@end

@interface ContactsView : UIView

@property (weak, nonatomic) id<ContactsViewDelegate>delegate ;

-(void)loadContacts:(NSArray *)contactsArray;


@end
