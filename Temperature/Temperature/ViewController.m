//
//  ViewController.m
//  Temperature
//
//  Created by Paul Solt on 4/19/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"
#import "SliderView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SliderView *farenheitSlider;
@property (weak, nonatomic) IBOutlet SliderView *celciusSlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)celciusValueChanged:(id)sender {
    
    double result = self.celciusSlider.number * 9 / 5.0 + 32;
    
    self.farenheitSlider.number = result;
}

- (IBAction)fahrenheitValueChanged:(id)sender {
    
    double result = (self.farenheitSlider.number - 32) * 5 / 9.0;
 
    self.celciusSlider.number = result;
}


@end
