//
//  DJSQuesitonViewController.h
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "informationView.h"
@class DJSWaitViewController;
@interface DJSQuesitonViewController : UIViewController
@property(nonatomic)NSArray *questions;
@property (nonatomic) IBOutlet UITextView *questionText;
- (IBAction)responseNon:(UIButton *)sender;
- (IBAction)responseOui:(id)sender;
@property(nonatomic,weak)DJSWaitViewController *waitController;
@property(nonatomic,weak)IBOutlet informationView *infoView;
@end
