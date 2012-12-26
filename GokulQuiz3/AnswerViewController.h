//
//  AnswerViewController.h
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController {
    
    UIPickerView *pickerView;
    
    IBOutlet UILabel     *qnTitle;
    IBOutlet UITextView  *qnText;
    IBOutlet UILabel     *score;
    
    NSArray           *qn;
    NSArray           *choices;
    NSDictionary      *selections;
    NSString          *level;
    
}

@property (nonatomic, copy) NSArray       *choices;
@property (nonatomic, copy) NSDictionary  *selections;
@property (nonatomic, copy) NSString      *level;
@property (nonatomic, copy) UILabel       *qnTitle;
@property (nonatomic, copy) UITextView    *qnText;

- (IBAction)okayPressed:(id)sender;

@end
