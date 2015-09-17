//
//  ViewController.m
//  canvas
//
//  Created by Guanqun Mao on 9/17/15.
//  Copyright (c) 2015 Guanqun Mao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property CGPoint trayDown;
@property CGPoint trayUp;
@property (strong, nonatomic) UIImageView *newlyCreatedFace;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.trayUp = self.trayView.center;
    self.trayDown = CGPointMake(self.trayView.center.x, self.trayView.center.y + CGRectGetHeight(self.trayView.bounds)/5*4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onImgPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIImageView *imageView = (UIImageView *)sender.view;
        self.newlyCreatedFace = [[UIImageView alloc] initWithImage:imageView.image];
        [self.view addSubview:self.newlyCreatedFace];
        self.newlyCreatedFace.center = point;
        NSLog(@"------x=%f y=%f", point.x, point.y );
    }else if(sender.state == UIGestureRecognizerStateChanged){
        self.newlyCreatedFace.center = point;
        NSLog(@"------end");
    }
}

- (IBAction)onTrayPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    self.trayOriginalCenter = self.trayView.center;
    //NSLog(@"==========x=%f y=%f", point.x, point.y );
    self.trayView.center = CGPointMake(self.trayOriginalCenter.x, point.y);
    CGPoint velocity = [sender velocityInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        //NSLog(@"begin");
    }else if(sender.state == UIGestureRecognizerStateChanged){
        //NSLog(@"change");
    }else if(sender.state == UIGestureRecognizerStateEnded){
        //NSLog(@"end");
        if(velocity.y > 0){
            self.trayView.center = self.trayDown;
        }else{
            self.trayView.center = self.trayUp;
        }
    }
    
}
@end
