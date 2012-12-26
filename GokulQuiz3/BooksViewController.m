//
//  BooksViewController.m
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import "BooksViewController.h"
#import "TopicsViewController.h"

@interface BooksViewController ()

@end

@implementation BooksViewController

@synthesize level;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Books";
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://igokulam.gokulbhajan.com/getBookTopics.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [data appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    books = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    [booksTableView reloadData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The download could not complete - please make sure you're connected to either 3G or Wi-Fi." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [errorView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BooksCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BooksCell"];
    }
    
    cell.textLabel.text = [[books objectAtIndex:indexPath.row] objectForKey:@"BOOK_NAME"];
    cell.detailTextLabel.text = [[books objectAtIndex:indexPath.row] objectForKey:@"BOOK_AUTHOR"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicsViewController *topicsViewController = [[TopicsViewController alloc] initWithNibName:@"TopicsViewController" bundle:nil];
    topicsViewController.title  = [[books objectAtIndex:indexPath.row] objectForKey:@"BOOK_NAME"];
    topicsViewController.topics = [[books objectAtIndex:indexPath.row] objectForKey:@"Topics"];
    topicsViewController.level = level;
    [self.navigationController pushViewController:topicsViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
