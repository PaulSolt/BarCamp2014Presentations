//
//  SliderView.h
//  DemoApp
//
//  Created by Paul Solt on 4/18/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIControl

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;

@property (strong, nonatomic) IBOutlet UIView *view;


@property (assign, nonatomic) double number;



@end
