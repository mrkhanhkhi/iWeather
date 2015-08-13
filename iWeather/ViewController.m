//
//  ViewController.m
//  iWeather
//
//  Created by Admin on 8/11/15.
//  Copyright (c) 2015 Nguyen Duy Khanh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *typeoftemp;



@end

@implementation ViewController
{
    NSArray *type;
    NSArray *quotes;
    NSArray *locations;
    NSArray *photoFiles;
    NSArray *temp;
    int doC;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim",@"Cá không ăn muối cá ươn",@"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"Sydney.Australia", @"Ha Noi, Viet Nam",@"New York, USA",@"Bangkok, Thailand"];
    photoFiles = @[@"Rainy",@"Sunny",@"Snowy",@"Thunder"];
    type = @[@"C",@"F"];
    
}

- (IBAction)updateWeather:(id)sender {
    self.typeoftemp.text = type[0];
    NSUInteger quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%lu", (unsigned long)quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    NSUInteger photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSUInteger locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    NSString *string = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}

- (IBAction)convert:(id)sender {
    doC = doC == 0 ? 1 : 0;
    self.typeoftemp.text = type[doC];
    if (doC == 1) {
    [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f",[self converter]] forState:UIControlStateNormal];
    } else {
        [self.temperature setTitle:[NSString stringWithFormat:@"%2.1f",[self deconverter]] forState:UIControlStateNormal];
    }
}


-(float) getTemperature
{
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}

-(float) converter
{
    float celsius = [self.temperature.titleLabel.text floatValue];
    return celsius * 1.8 + 32;
}

-(float) deconverter
{
    float fahrenheit = [self.temperature.titleLabel.text floatValue];
    return (fahrenheit - 32) / 1.8;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
