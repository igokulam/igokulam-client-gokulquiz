//
//  QuestionsViewController.m
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import "QuestionsViewController.h"
#import "AnswerViewController.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

@synthesize topicId, level;

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
    self.title = @"Questions";
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *urlString = [NSString stringWithFormat:@"http://igokulam.gokulbhajan.com/getQuestionSet.php?topicId=%@&level=%@",topicId,level];
    NSURL *url = [NSURL URLWithString:urlString];
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
    
    qns = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    [qnsTableView reloadData];
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
    return [qns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QnsCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"QnsCell"];
    }
    
    cell.textLabel.text = [[qns objectAtIndex:indexPath.row] objectForKey:@"QN_TITLE"];
    cell.detailTextLabel.text = [[qns objectAtIndex:indexPath.row] objectForKey:@"QN_TEXT"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerViewController *answerViewController = [[AnswerViewController alloc] initWithNibName:@"AnswerViewController" bundle:nil];
    answerViewController.title   = [[qns objectAtIndex:indexPath.row] objectForKey:@"QN_TITLE"];
    answerViewController.choices = [[qns objectAtIndex:indexPath.row] objectForKey:@"Choices"];
    answerViewController.level = level;
    answerViewController.qnTitle    = [[qns objectAtIndex:indexPath.row] objectForKey:@"QN_TITLE"];
    answerViewController.qnText     = [[qns objectAtIndex:indexPath.row] objectForKey:@"QN_TEXT"];
    [self.navigationController pushViewController:answerViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
