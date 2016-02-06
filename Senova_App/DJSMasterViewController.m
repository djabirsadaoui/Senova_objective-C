//
//  ViewController.m
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import "DJSMasterViewController.h"

@interface DJSMasterViewController ()

@end
NSString *ID_CLIENT=@"f9d55b59-66db-4e8f-8674-1b00df140b2c";
NSString *CLIENT_SECRET=@"7897d5c8-62a1-41eb-a366-c127fe4756a9";
NSString *access_token,*refresh_token;
NSURL *baseURL;
@implementation DJSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _httpManager = [[DJSHttpManager alloc] init];
    [_httpManager setDelegate:self];
    baseURL = [NSURL URLWithString:@"https://apidalkia.hubintent.com/api/datahub/v1"];
     NSDictionary *params = @{@"client_secret":CLIENT_SECRET,@"grant_type":@"client_credentials", @"client_id":ID_CLIENT};
    [_httpManager getToken:params path:@"token"];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)didRecieveToken:(id)token{
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:token options: NSJSONReadingMutableContainers error: nil];
    access_token = jsonObject[@"access_token"];
    refresh_token = jsonObject[@"refresh_token"];
    access_token = [NSString stringWithFormat:@"Bearer %@",access_token];
    //get last temps
    [_httpManager sendRequestIntent:baseURL withTocken:access_token path:@"parts/TH-PART-00084/activities/AirTemp/snapshot?startTime=2015-01-02&endTime=2015-01-08&page=1&countByPage=30"];
    
}
-(void)didFailRequestToken:(NSError *)error{
    NSLog(@"################ ERROR :%@",error.userInfo);
}
-(void)didRecieveQuestion:(id)question{
    
}
-(void)didRecieveData:(id)question{
   NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:question options: NSJSONReadingMutableContainers error: nil];
    NSArray *array = jsonObject[@"data"];
    NSDictionary *entity = [array lastObject];
    NSString *temp = [NSString stringWithFormat:@"%@ C°",entity[@"value"]];
    [[_temperatureView tempAppart] setText:temp];
    
}
-(void)didFailRequestData:(NSError *)error{
    
}
-(void)didFailRequestQuestion:(NSError *)error{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)informeTechnicien:(id)sender {
}
@end
