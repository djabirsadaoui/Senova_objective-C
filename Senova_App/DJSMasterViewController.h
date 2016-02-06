//
//  ViewController.h
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJSHttpManager.h"
#import "DJSApiManager.h"
#import "DJSTemperatureView.h"
@interface DJSMasterViewController : UIViewController<DJSHttpManagerDelegate>
- (IBAction)informeTechnicien:(id)sender;
@property (weak, nonatomic) IBOutlet DJSTemperatureView *temperatureView;
@property (weak, nonatomic) IBOutlet UIImageView *motionImage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stateSegement;
@property(nonatomic)DJSHttpManager *httpManager;
@property(nonatomic)DJSApiManager *apiManager;
@end

