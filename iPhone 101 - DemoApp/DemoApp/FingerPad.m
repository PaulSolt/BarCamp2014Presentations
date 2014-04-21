//
//  FingerPad.m
//  DemoApp
//
//  Created by Paul Solt on 4/18/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "FingerPad.h"

@implementation FingerPad

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        
        // Load from .xib file
        [[NSBundle mainBundle] loadNibNamed:@"FingerPad" owner:self options:nil];
        
        // setup bounds
        self.bounds = self.view.bounds;
        
        // Add subview to show UI
        [self addSubview:self.view];
        
        
        self.layer.shadowOpacity = .5;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(2, 2);
    }
    return self;
}

@end
