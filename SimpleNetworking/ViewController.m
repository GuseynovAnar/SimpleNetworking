//
//  ViewController.m
//  SimpleNetworking
//
//  Created by Anar on 10.10.17.
//  Copyright © 2017 Anar. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Networking.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) NSDictionary * currency;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    Networking * network = [[Networking alloc] init];
    [network downloadCurrencyFromURL:@"https://api.fixer.io/latest"
                              withMethod:GET
                            callback:^(id data) {
        [self setCurrency:data];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Currency";
}

- (void)setCurrency:(NSDictionary *)currency {
    _currency = currency;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _currency.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell"
                                                owner:self
                                              options:nil];
    TableViewCell * cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:@"myCell"];
    cell = (TableViewCell *)[nib objectAtIndex:0];
    NSArray * dictionaryKey = [_currency allKeys];
    NSString * key = dictionaryKey[indexPath.row];
    cell.currency.text = key;
    cell.value.text =  [NSString stringWithFormat:@"%@",_currency[key]];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
