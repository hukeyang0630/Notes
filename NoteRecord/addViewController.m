//
//  addViewController.m
//  NoteRecord
//
//  Created by Chipe on 16/5/31.
//  Copyright © 2016年 Chipe. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
}
- (IBAction)save:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
