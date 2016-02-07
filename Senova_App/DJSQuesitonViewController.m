//
//  DJSQuesitonViewController.m
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import "DJSQuesitonViewController.h"
#import "DJSWaitViewController.h"

@interface DJSQuesitonViewController ()

@end
int numQuestion;
NSArray *ques,*infos;

@implementation DJSQuesitonViewController

- (void)viewDidLoad {
    numQuestion =0;
    [super viewDidLoad];
    ques = _questions[1];
    infos = _questions[0];
    [_infoView.infoText setText:infos[numQuestion]];
    [_questionText setText:ques[numQuestion]];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)responseNon:(UIButton *)sender {
    [_waitController setValReturn:@"merci"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)responseOui:(id)sender {
    numQuestion++;
    
        if ([infos[numQuestion]isEqualToString:@"v1"]||[infos[numQuestion]isEqualToString:@"v2"]) {
            [_infoView setHidden:YES];
//            _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
//            [_messageView setTextAlignment:(NSTextAlignmentCenter)];
//            [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
            _questionText.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
            [_questionText setTextAlignment:(NSTextAlignmentCenter)];
            [_questionText setTextColor:[UIColor whiteColor]];
            [_questionText setText:ques[numQuestion]];
            
        }else if ([ques[numQuestion]isEqualToString:@"fin"]){
            if ([infos[numQuestion]isEqualToString:@"Si vous blockez vos bouches d'aération, l'air ne peut se renouveler et l'humidité s'accumule dans votre appartement."]) {
                [_waitController setValReturn:@"Cmerci"];
            }else{
            [_waitController setValReturn:@"Fmerci"];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [_infoView.infoText setText:infos[numQuestion]];
            _infoView.infoText.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
            [_infoView.infoText setTextAlignment:(NSTextAlignmentCenter)];
            [_infoView.infoText setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
            
            _questionText = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
            [_questionText setTextAlignment:(NSTextAlignmentCenter)];
            [_questionText setTextColor:[UIColor whiteColor]];
            [_questionText setText:ques[numQuestion]];
            
        }
    
    
        
    
}
@end
