//
//  Networking.m
//  SimpleNetworking
//
//  Created by Anar on 10.10.17.
//  Copyright © 2017 Anar. All rights reserved.
//

#import "Networking.h"

@interface Networking()
- (NSString *) httpMethodToString:(HTTPMethod) method;
- (id) parseJSON : (NSData *) jsonData;
@end

@implementation Networking

- (NSString *) httpMethodToString:(HTTPMethod)method {
    switch (method) {
        case POST: return @"POST";
            break;
        case PUT: return  @"PUT";
            break;
        case GET: return  @"GET";
    }
}

- (void) downloadCurrencyFromURL:(NSString *)url withMethod:(HTTPMethod)method callback:(RequestCallback)callback{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:[self httpMethodToString:GET]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:request
                                                 completionHandler:^(NSData *  data,
                                                                     NSURLResponse *  response,
                                                                     NSError *  error)
    {
         if (data == nil) {
             callback(error);
         } else {
             callback([self parseJSON:data]);
         }
    }];
    [dataTask resume];
}

- (id) parseJSON:(NSData *)jsonData {
    NSError * error = nil;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    return json[@"rates"];
}

@end
