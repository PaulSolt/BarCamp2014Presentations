//
//  SliderView.m
//  Temperature
//
//  Created by Paul Solt on 4/19/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        
        [[NSBundle mainBundle] loadNibNamed:@"SliderView" owner:self options:nil];
        
        self.bounds = self.view.bounds;
        
        [self addSubview:self.view];
        
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:panGesture];
        
        
    }
    
    return self;
}


- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    
    _number = [gesture translationInView:gesture.view].y;
    
    
//    NSLog(@"Gesture: %f", y);
    
    
    
    self.numberLabel.text = [@(round(_number)) stringValue];
    
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}

- (void)setNumber:(double)number {
    _number = number;
    
    self.numberLabel.text = [@(round(_number)) stringValue];
    
}






@end
