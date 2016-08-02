//
//  MyScene.m
//  testSK
//
//  Created by Phanit Pollavith on 8/1/16.
//  Copyright © 2016 iffytheperfect. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        myLabel.text = @"Hello, World!";
//        myLabel.fontSize = 30;
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                       CGRectGetMidY(self.frame));
//        
//        [self addChild:myLabel];
        
        SKEmitterNode *explosionNode = [self newExplosion:CGRectGetMidX(self.frame) :CGRectGetMidY(self.frame)];
        [self addChild:explosionNode];
        
    }
    return self;
}

//particle explosion - uses MyParticle.sks
- (SKEmitterNode *) newExplosion: (float)posX : (float) posy
{
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"]];
    emitter.position = CGPointMake(posX,posy);
    emitter.name = @"explosion";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        //add effect at touch location
        [self addChild:[self newExplosion:location.x : location.y]];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
