//
//  SliderView.m
//  DemoApp
//
//  Created by Paul Solt on 4/18/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "SliderView.h"
#import "FingerPad.h"


@interface SliderView() {
    
    FingerPad *_fingerPad;
    int _fingerXCoordinate;
    UIDynamicAnimator *_animator;
}
@end

@implementation SliderView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        // 1 Load from .xib files
        
        [[NSBundle mainBundle] loadNibNamed:@"SliderView" owner:self options:nil];
        
        // 2. Add subview
        [self addSubview:self.view];
        
        // 3. Add gestures
        UIPanGestureRecognizer *numberPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleNumberPanGesture:)];
        [self addGestureRecognizer:numberPanGesture];
        
        // 4. Create a finger pad
        _fingerPad = [[FingerPad alloc] init];
        [self addSubview:_fingerPad];
        [self bringSubviewToFront:_fingerPad];
        _fingerPad.alpha = 0;
        
        _animator = [[UIDynamicAnimator alloc] init];
    }
    return self;
}

- (void)handleNumberPanGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint location = [gesture locationInView:self];

    if(UIGestureRecognizerStateBegan == gesture.state) {
        [_animator removeAllBehaviors];
        
        _fingerXCoordinate = location.x;
        
        _fingerPad.center = CGPointMake(_fingerXCoordinate, location.y - 60);
        _fingerPad.alpha = 1;

    } else if(UIGestureRecognizerStateChanged == gesture.state) {
        CGPoint translation = [gesture translationInView:gesture.view];
        [gesture setTranslation:CGPointZero inView:gesture.view];
        NSLog(@"Gesture: %@", NSStringFromCGPoint(translation));
        
        
        _number += -translation.y / 10;
        
        self.numberLabel.text = [@((int)_number) stringValue];
        _fingerPad.numberLabel.text = self.numberLabel.text;
        
        _fingerPad.center = CGPointMake(_fingerXCoordinate, location.y - 60);
        _fingerPad.alpha = 1;
    } else if(UIGestureRecognizerStateEnded == gesture.state ||
              UIGestureRecognizerStateCancelled == gesture.state ||
              UIGestureRecognizerStateFailed == gesture.state) {

        [UIView animateWithDuration:.5 animations:^ {
            _fingerPad.alpha = 0;
        }];

        [self addGravity];
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (void)addGravity {
    
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_fingerPad]];
    [_animator addBehavior:gravityBehavior];

    
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_fingerPad]];
    elasticityBehavior.elasticity = .4;
    [_animator addBehavior:elasticityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_fingerPad]];
    [collisionBehavior addBoundaryWithIdentifier:@"Edge" fromPoint:CGPointMake(0, 330)
                                         toPoint:CGPointMake(320, 330)];
    
    [_animator addBehavior:collisionBehavior];
    
}

- (void)setNumber:(double)number {
    _number = number;
    
    _numberLabel.text = [@(round(_number)) stringValue];
    _fingerPad.numberLabel.text = _numberLabel.text;
}
@end
