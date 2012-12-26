//
//  ViewController.h
//  GokulQuiz3
//
//  Created by Bagavathikan Raj on 12/25/12.
//  Copyright (c) 2012 Bagavathikan Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIImageView *image;
    NSString             *level;
}

@property (nonatomic, copy) NSString *level;

- (IBAction) showBooks:(id)sender;

@end
