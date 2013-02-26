//
//  ViewController.m
//  StepperByMonaka
//
//  Created by kizusuMac on 13/02/26.
//  Copyright (c) 2013年 kizusuMac. All rights reserved.
//

#import "ViewController.h"
#import "Konashi.h"

#define motor_pin_1 PIO1
#define motor_pin_2 PIO2
#define motor_pin_3 PIO3
#define motor_pin_4 PIO4
#define delaySpeed

@interface ViewController (){
    NSTimer *_updateTimer;
    int i;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [Konashi initialize];
    
    [Konashi addObserver:self selector:@selector(connected) name:KONASHI_EVENT_CONNECTED];
    [Konashi addObserver:self selector:@selector(ready) name:KONASHI_EVENT_READY];
    
    i = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)serch:(id)sender {
    [Konashi find];
}


- (IBAction)start:(id)sender {
    NSLog(@"writeSetting");
    if (!_updateTimer) {
		_updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f
                                                        target:self
                                                      selector:@selector(updateMonaka:)
                                                      userInfo:nil
                                                       repeats:YES];
	}
}


-(void)updateMonaka:(NSTimer*)timer{
    
    if (i == 1) {
        [self posision1];
    }else if(i == 2){
        [self posision2];
    }else if(i == 3){
        [self posision3];
    }else if(i == 4){
        [self posision4];
    }else if(i == 5){
        [self posision5];
    }else if(i == 6){
        [self posision6];
    }else if(i == 7){
        [self posision7];
    }else if(i == 8){
        [self posision8];
    }
    
    i++;
    
    if (i == 9) {
        i = 1;
    }
    
    NSLog(@"%d", i);
    
}

-(void)posision1{
    [Konashi digitalWrite:motor_pin_1 value:HIGH];
    [Konashi digitalWrite:motor_pin_2 value:LOW];
    [Konashi digitalWrite:motor_pin_3 value:HIGH];
    [Konashi digitalWrite:motor_pin_4 value:LOW];
    NSLog(@"posision1");
}

-(void)posision2{
    [Konashi digitalWrite:motor_pin_1 value:LOW];
    [Konashi digitalWrite:motor_pin_2 value:LOW];
    [Konashi digitalWrite:motor_pin_3 value:HIGH];
    [Konashi digitalWrite:motor_pin_4 value:LOW];
    NSLog(@"posision2");
}

-(void)posision3{
    [Konashi digitalWrite:motor_pin_1 value:LOW];
    [Konashi digitalWrite:motor_pin_2 value:HIGH];
    [Konashi digitalWrite:motor_pin_3 value:HIGH];
    [Konashi digitalWrite:motor_pin_4 value:LOW];
    NSLog(@"posision3");
}

-(void)posision4{
    [Konashi digitalWrite:motor_pin_1 value:LOW];
    [Konashi digitalWrite:motor_pin_2 value:HIGH];
    [Konashi digitalWrite:motor_pin_3 value:LOW];
    [Konashi digitalWrite:motor_pin_4 value:LOW];
    NSLog(@"posision4");
}

-(void)posision5{
    [Konashi digitalWrite:motor_pin_1 value:LOW];
    [Konashi digitalWrite:motor_pin_2 value:HIGH];
    [Konashi digitalWrite:motor_pin_3 value:LOW];
    [Konashi digitalWrite:motor_pin_4 value:HIGH];
    NSLog(@"posision5");
}

-(void)posision6{
    [Konashi digitalWrite:motor_pin_1 value:LOW];
    [Konashi digitalWrite:motor_pin_2 value:LOW];
    [Konashi digitalWrite:motor_pin_3 value:LOW];
    [Konashi digitalWrite:motor_pin_4 value:HIGH];
    NSLog(@"posision6");
}

-(void)posision7{
    [Konashi digitalWrite:motor_pin_1 value:HIGH];
    [Konashi digitalWrite:motor_pin_2 value:LOW];
    [Konashi digitalWrite:motor_pin_3 value:LOW];
    [Konashi digitalWrite:motor_pin_4 value:HIGH];
    NSLog(@"posision7");
}

-(void)posision8{
    [Konashi digitalWrite:motor_pin_1 value:HIGH];
    [Konashi digitalWrite:motor_pin_2 value:LOW];
    [Konashi digitalWrite:motor_pin_3 value:LOW];
    [Konashi digitalWrite:motor_pin_4 value:LOW];
    NSLog(@"posision8");
}



- (void)connected
{
    NSLog(@"connected");
}

- (void)ready
{
    NSLog(@"READY");
    [Konashi pinModeAll:0xFF];
}
@end