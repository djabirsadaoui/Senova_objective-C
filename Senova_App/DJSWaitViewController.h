//
//  DJSQuestionControllerViewController.h
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJSQuesitonViewController.h"
@interface DJSWaitViewController : UIViewController
@property(nonatomic)NSString *state,*valReturn;
@property (weak, nonatomic) IBOutlet UIImageView *settingImage;
@property (weak, nonatomic) IBOutlet UITextView *messageView;
@property (weak, nonatomic) IBOutlet UILabel *progressNumber;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property(nonatomic)DJSQuesitonViewController *questionController;
@property (nonatomic,)NSArray *coldQuestion;
@property(nonatomic)NSArray*hotQuestion;
@end
