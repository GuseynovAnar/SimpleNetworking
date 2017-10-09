//
//  TableViewCell.h
//  SimpleNetworking
//
//  Created by Anar on 10.10.17.
//  Copyright © 2017 Anar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel * currency;
@property (weak,nonatomic) IBOutlet UILabel * value;

@end
