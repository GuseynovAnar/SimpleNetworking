//
//  Networking.h
//  SimpleNetworking
//
//  Created by Anar on 10.10.17.
//  Copyright © 2017 Anar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Networking : NSObject

typedef void (^RequestCallback)(id);

typedef enum {
    GET, POST , PUT
} HTTPMethod;

- (void) downloadCurrencyFromURL:(NSString *) url withMethod: (HTTPMethod) method callback:(RequestCallback) callback;

@end
