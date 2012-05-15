//
//  TBDViewController.h
//  Time Between Dates
//
//  Created by udo oji on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *fromDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateResultLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateTimePicker;
@property (strong, nonatomic) NSDate *fromDate;
@property (strong, nonatomic) NSDate *toDate;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
