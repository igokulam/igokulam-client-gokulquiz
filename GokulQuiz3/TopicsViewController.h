//
//  TopicsViewController.h
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicsViewController : UIViewController {
    IBOutlet UITableView *topicsTableView;
    NSString             *level;
    NSArray              *topics;
}

@property (nonatomic, copy) NSArray *topics;
@property (nonatomic, copy) NSString *level;

@end
