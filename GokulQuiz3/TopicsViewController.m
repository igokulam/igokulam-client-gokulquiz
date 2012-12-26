//
//  TopicsViewController.m
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import "TopicsViewController.h"
#import "QuestionsViewController.h"

@interface TopicsViewController ()

@end

@implementation TopicsViewController

@synthesize topics, level;

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
    self.title = @"Topics";
    [topicsTableView reloadData];
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [topics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicsCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TopicsCell"];
    }
    
    cell.textLabel.text = [[topics objectAtIndex:indexPath.row] objectForKey:@"TOPIC_NAME"];
    cell.detailTextLabel.text = [[topics objectAtIndex:indexPath.row] objectForKey:@"TOPIC_NAME"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionsViewController *qnsViewController = [[QuestionsViewController alloc] initWithNibName:@"QuestionsViewController" bundle:nil];
    qnsViewController.title   = [[topics objectAtIndex:indexPath.row] objectForKey:@"TOPIC_NAME"];
    qnsViewController.topicId = [[topics objectAtIndex:indexPath.row] objectForKey:@"TOPIC_ID"];
    qnsViewController.level   = level;
    [self.navigationController pushViewController:qnsViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
