//
//  ViewController.m
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import "ViewController.h"
#import "BooksViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize level;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    level = @"1"; // default
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) showBooks:(id)sender {
    NSLog(@"In showBooks");
    BooksViewController *booksViewController = [[BooksViewController alloc] initWithNibName:@"BooksViewController" bundle:nil];
    booksViewController.title = @"Books";
    booksViewController.level = level;
    [self.navigationController pushViewController:booksViewController animated:YES];
}

@end
