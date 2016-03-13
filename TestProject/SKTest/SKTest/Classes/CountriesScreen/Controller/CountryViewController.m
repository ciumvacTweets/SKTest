//
//  CountryViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "CountryViewController.h"
#import "CountryModel.h"
#import "CountryView.h"

@interface CountryViewController () <CountryViewDelegate, CountryModelDelegate>
{
    
    CountryModel *_model;
    
}

@property (readonly) CountryView *countryView;

@end

@implementation CountryViewController


-(instancetype)initWithModel:(CountryModel *)model {
    
    if (!self) {
        
        self = [super initWithNibName:@"CountryView" bundle:nil];
        
    }
    
    _model = model;
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.countryView.delegate = self;
    [self.countryView viewSetup];
    
    _model.delegate = self;

    

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_model requestCountryList];
}
-(CountryView *)countryView {
    
    return (CountryView *)self.view;
    
}

#pragma mark -- CountryViewDelegate --

-(void)popView {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)ShowAlert:(UIAlertController *)alert {
    
    [self presentViewController:alert animated:YES completion:^{ }];
}

#pragma mark -- Model Delegate --

-(void)didReceiveIndexedCountryList:(NSDictionary *)indexedCountryList{
    
    [self.countryView receiveIndexedCountryList:indexedCountryList];
}

-(void)didFailWithError:(NSString *)errorString {
    
    [self.countryView showError:errorString];
    
}
#pragma mark -- memory management --
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
