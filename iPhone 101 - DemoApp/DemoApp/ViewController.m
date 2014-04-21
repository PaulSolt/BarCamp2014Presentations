//
//  ViewController.m
//  DemoApp
//
//  Created by Paul Solt on 4/18/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"
#import "SliderView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SliderView *fahrenheitSlider;
@property (weak, nonatomic) IBOutlet SliderView *celciusSlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Option + Shift 8 (Option + *)
    _fahrenheitSlider.unitLabel.text = @"°F";
    _celciusSlider.unitLabel.text = @"°C";
    
    _fahrenheitSlider.number = 32;
    _celciusSlider.number = 0;
}

- (double)fahrenheitToCelcius:(double)farhenheit {
    return (farhenheit - 32) * 5.0/9;
}

- (double)celciusToFahrenheit:(double)celcius {
    return celcius * 9.0/5 + 32;
}

- (IBAction)fahrenheitValueChanged:(id)sender {
    
    _celciusSlider.number = [self fahrenheitToCelcius:_fahrenheitSlider.number];;
}

- (IBAction)celciusValueChanged:(id)sender {
    
    _fahrenheitSlider.number = [self celciusToFahrenheit:_celciusSlider.number];
    
}
@end
