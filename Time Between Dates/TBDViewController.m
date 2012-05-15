//
//  TBDViewController.m
//  Time Between Dates
//
//  Created by udo oji on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TBDViewController.h"

@implementation TBDViewController
@synthesize fromDateLabel;
@synthesize toDateLabel;
@synthesize dateResultLabel;
@synthesize dateTimePicker;
@synthesize fromDate;
@synthesize toDate;


- (NSDate *)returnBaseDate {
    // set picker to project start date
    NSDateComponents    *comps  = [[NSDateComponents alloc] init];
    [comps setDay:1];
    [comps setMonth:4];
    [comps setYear:2012];
    
    NSCalendar  *gregorian  = [[NSCalendar alloc]
                               initWithCalendarIdentifier:NSGregorianCalendar];

    return [gregorian dateFromComponents:comps];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dateTimePicker.date     = [self returnBaseDate];
}

- (void)viewDidUnload
{
    [self setFromDateLabel:nil];
    [self setToDateLabel:nil];
    [self setDateResultLabel:nil];
    [self setDateTimePicker:nil];
    [self setFromDate:nil];
    [self setToDate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)buttonPressed:(UIButton *)sender {
    NSDate          *theDate    = [dateTimePicker date];
    NSString        *dateString = [[NSString alloc] initWithFormat:@"%@",theDate];
        
    
    // which button has been pressed
    if (sender.tag == 2) {
        fromDate                = [self returnBaseDate];
        toDate                  = [NSDate date];
        fromDateLabel.text      = [[NSString alloc] initWithFormat:@"%@",fromDate];
        toDateLabel.text        = [[NSString alloc] initWithFormat:@"%@",toDate];
        dateTimePicker.date     = [NSDate date];
    } else {
        if (sender.tag == 0) {
            fromDate            = theDate;
            fromDateLabel.text  = dateString;
        } else {
            toDate              = theDate;
            toDateLabel.text    = dateString;
        }
    }
    if ((fromDate != nil) && (toDate != nil)) {
        NSTimeInterval  seconds = [toDate timeIntervalSinceDate:fromDate];
        int             days    = seconds / 60 / 60 / 24;
        dateResultLabel.text    = [[NSString alloc] 
                                   initWithFormat:@"There has been %d days since From date",days];
    }
}
@end
