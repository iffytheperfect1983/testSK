//
//  ViewController.m
//  testSK
//
//  Created by Phanit Pollavith on 8/1/16.
//  Copyright © 2016 iffytheperfect. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure the SKView
//    SKView * skView = _skView;
    self.skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:self.skView.bounds.size];
//    SKScene *scene = [MyScene sceneWithSize:CGSizeMake(100, 100)];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [self.skView presentScene:scene];
    [self.view addSubview:self.skView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
