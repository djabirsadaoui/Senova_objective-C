//
//  DJSHttpManager.h
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import <AFNetworking.h>
#import <AFHTTPRequestOperation.h>

//#import <AFHTTPRequestOperationManager.h>
//#import <AFHTTPSessionManager.h>
//#import <AFURLConnectionOperation.h>
//#import <AFURLRequestSerialization.h>
//#import <AFURLSessionManager.h>

@class DJSMasterViewController;

/***** define the protocols delegation ****/
@protocol DJSHttpManagerDelegate <NSObject>
-(void)didRecieveToken:(id)token;
-(void)didFailRequestToken:(NSError*)error;
-(void)didRecieveQuestion:(id)question;
-(void)didFailRequestQuestion:(NSError*)error;
-(void)didRecieveData:(id)question;
-(void)didFailRequestData:(NSError*)error;
@end


@interface DJSHttpManager : NSObject
@property (nonatomic,weak) id<DJSHttpManagerDelegate>     delegate;
-(void)getToken:(NSDictionary *)params path:(NSString *)webServicePath;
-(void)sendRequestIntent:(NSURL *)url withTocken:(NSString *)tocken path:(NSString *)webServicePath;
-(void)sendRequestServer:(NSURL *)url options:(NSDictionary *)params ;

@end
