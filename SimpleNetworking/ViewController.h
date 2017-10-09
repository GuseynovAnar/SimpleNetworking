//
//  ViewController.h
//  SimpleNetworking
//
//  Created by Anar on 10.10.17.
//  Copyright © 2017 Anar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//typedef void (^RequestCallback)(NSDictionary *);

@property (weak,nonatomic) IBOutlet UITableView * tableView;

//- (void) clientRequest: (NSString *) urlString withCallback: (RequestCallback) callback;

@end

