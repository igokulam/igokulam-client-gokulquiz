//
//  BooksViewController.h
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksViewController : UIViewController {
    IBOutlet UITableView *booksTableView;
    
    NSArray       *books;
    NSMutableData *data;
    NSString      *level;
}

@property (nonatomic, copy) NSString *level;

@end
