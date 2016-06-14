//
//  MasterController.m
//  NoteRecord
//
//  Created by Chipe on 16/5/30.
//  Copyright © 2016年 Chipe. All rights reserved.
//

#import "MasterController.h"
#import "Note.h"
#import "noteBL.h"

@interface MasterController ()
@property(nonatomic,strong)NSMutableArray *listData;

@end

@implementation MasterController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Notes" ofType:@"json"];
    
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    
    NSError *error;
    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonObj) {
        NSLog(@"解码失败");
    }
    else{
    
        self.objects = [jsonObj objectForKey:@"Record"];
        
        NSLog(@"-----------Record：%@",self.objects);
    }
        
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
   // noteBL *bl = [[noteBL alloc] init];
    
   // self.listData = self.objects;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   // Note *note = self.listData[indexPath.row];
    NSMutableDictionary *dict = self.objects[indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"Content"];
  //  cell.detailTextLabel.text = [dict objectForKey:@"CDate"];
    cell.detailTextLabel.text = [dict objectForKey:@"CDate"];
    NSLog(@"....");
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Note *note = self.listData[indexPath.row];
        
        noteBL *bl = [[noteBL alloc] init];
        
        [bl deleteNote:note];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
