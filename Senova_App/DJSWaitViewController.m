//
//  DJSQuestionControllerViewController.m
//  Senova_App
//
//  Created by djabir sadaoui on 06/02/2016.
//  Copyright © 2016 djabir. All rights reserved.
//

#import "DJSWaitViewController.h"
#import "DJSDelegate.h"
#import "DJSQuesitonViewController.h"
@interface DJSWaitViewController ()

@end

@implementation DJSWaitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *infoHot = [NSArray arrayWithObjects:@"Il y a un problème sur l'installation collective de chauffage. Nous prévenons le technicien pour qu'il intervienne au plus vite.",@"Merci pour votre implication, nous vous tiendrons informé de l'intervention du technicien", nil];
    NSArray *quesHot = [NSArray arrayWithObjects:@"En attendant, avez-vous coupé tout vos radiateurs ?",@"fin", nil];
    _hotQuestion = [NSArray arrayWithObjects:infoHot,quesHot, nil];
    NSArray *infoCold = [NSArray arrayWithObjects:@"A première vue cet inconfort n'est ressentie que dans votre appartement, essayons de régler le problème ensemble",@"v1",@"v2",@"Si vous blockez vos bouches d'aération, l'air ne peut se renouveler et l'humidité s'accumule dans votre appartement.", nil];
    NSArray *quesCold = [NSArray arrayWithObjects:@" Votre radiateur est-il ouvert à fond ?",@"Est-ce qu'il est bien chaud ?",@"Les bouches d'aération et la ventilation sont-ils obstrués ?",@"fin", nil];
    _coldQuestion = [NSArray arrayWithObjects:infoCold,quesCold, nil];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    if ([_state isEqualToString:@"Confortable"]) {
        _messageView.text= @"Nous vous remervions d'avoir pris le temps de nous faire part de votre satisfaction quant de votre appatement";
         _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [_messageView setTextAlignment:(NSTextAlignmentCenter)];
        [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
        [_progressNumber setHidden:YES];
        [_progressView setHidden:YES];
        [_settingImage setHidden:YES];
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(returnToMasterView)
                                       userInfo:nil
                                        repeats:NO];
    }else{
    sleep(3);
    [_progressView setProgress:0.6 animated:YES];
    [_progressNumber setText:@"50%"];

   _messageView.text= @"Je vérifie les températures et l'hygrométrie en différents points du bâtiment...";
    _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
    [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
    [_messageView setTextAlignment:(NSTextAlignmentCenter)];
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(showSecondeMessage)
                                   userInfo:nil
                                    repeats:NO];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    if ([_valReturn isEqualToString:@"merci"]) {
        _messageView.text= @"Nous vous remervions d'avoir pris le temps de nous faire part de votre satisfaction quant de votre appatement";
        _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [_messageView setTextAlignment:(NSTextAlignmentCenter)];
        [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
        [_progressNumber setHidden:YES];
        [_progressView setHidden:YES];
         [_settingImage setHidden:YES];
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(returnToMasterView)
                                       userInfo:nil
                                        repeats:NO];
    }else if ([_valReturn isEqualToString:@"Fmerci"]){
        _messageView.text= @"Nous vous remercions pour votre retour. Nous vous tenons informé dès l'intervention réalisée";
        _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [_messageView setTextAlignment:(NSTextAlignmentCenter)];
        [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
        [_progressNumber setHidden:YES];
        [_progressView setHidden:YES];
         [_settingImage setHidden:YES];
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(returnToMasterView)
                                       userInfo:nil
                                        repeats:NO];
        
    }else if([_valReturn isEqualToString:@"Cmerci"]){
        _messageView.text= @"Si vous obstruez vos bouches de ventilation, l'air intérieur ne peut pas se renouveler et l'humidité s'accumule dans votre appartement. En plus d'être inconfortable, cela peut nuire à votre santé. Nous vous conseillons d'enlever les obstructions et d'aérer votre appartement 10 minutes par jour.";
        _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [_messageView setTextAlignment:(NSTextAlignmentCenter)];
        [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
        [_progressNumber setHidden:YES];
        [_progressView setHidden:YES];
         [_settingImage setHidden:YES];
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(returnToMasterView)
                                       userInfo:nil
                                        repeats:NO];
        
    }
    
}

-(void)returnToMasterView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)showSecondeMessage{
    [_progressView setProgress:0.8 animated:YES];
    
    [_progressNumber setText:@"90%"];
    [_messageView setText:@"Je Controle le bon fonctionnement de l'installation de chauffage..."];
     _messageView.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
    [_messageView setTextColor:[UIColor colorWithRed:0.2 green:0.73 blue:0.3 alpha:1]];
     [_messageView setTextAlignment:(NSTextAlignmentCenter)];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(showQuestionViewController)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showQuestionViewController{
    _questionController = (DJSQuesitonViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginIdentifier"];
    [_questionController setWaitController:self];
   
    if ([_state isEqualToString:@"Trop froid"]) {
        [_questionController setQuestions:_coldQuestion];
    }else{
        [_questionController setQuestions:_hotQuestion];
    }
    
    [self presentViewController:_questionController animated:YES completion: nil];
    // DJSDelegate *app = [[UIApplication sharedApplication] delegate];
   
   
    
 
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
