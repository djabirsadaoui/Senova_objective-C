//
//  DJSHttpManager.m
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import "DJSHttpManager.h"

@interface DJSHttpManager ()

@end
NSMutableURLRequest *request1,*request;
@implementation DJSHttpManager

//NSData *requestData = [@"name=testname&suggestion=testing123" dataUsingEncoding:NSUTF8StringEncoding];
/**************** retrieve token from intent streams that allows to acces to DB  **********************/
-(void)getToken:(NSDictionary *)params path:(NSString *)webServicePath {
    NSURL *url = [NSURL URLWithString:@"https://apidalkia.hubintent.com/oauth"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
    [httpClient setStringEncoding:NSUTF8StringEncoding];
    [httpClient setDefaultHeader:@"Accept" value:@"application/json"];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:webServicePath parameters:params];
    
        NSLog(@"request : %@", request.description);
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self.delegate didRecieveToken:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       [self.delegate didFailRequestToken:error];
    }];
    [operation start];
    
}

/**************** send GET request to web service **********************/
-(void)sendRequestIntent:(NSURL *)url withTocken:(NSString *)tocken path:(NSString *)webServicePath
{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:webServicePath parameters:nil];
    NSLog(@"%@", request);
    [request addValue:tocken forHTTPHeaderField:@"Authorization"];
    [httpClient setAuthorizationHeaderWithToken:tocken];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.delegate didRecieveData:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    [self.delegate didFailRequestData:error];    }];
    [operation start];
    
}
/**************** send response to server and retrieve the next quesiton **********************/
-(void)sendRequestServer:(NSURL *)url options:(NSDictionary *)params {
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:nil parameters:params];
    NSLog(@"%@", request);
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
                                         {
                                             [self.delegate didRecieveQuestion:JSON];
                                         }
                                         
                                        failure:^(NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON)
                                         {
                                             [self.delegate didFailRequestQuestion:error];
                                             
                                         }];
    [operation start];
}


@end
