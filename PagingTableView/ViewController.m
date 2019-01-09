//
//  ViewController.m
//  PagingTableView
//
//  Created by PASHA on 09/01/19.
//  Copyright © 2019 Reatchall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setElements];
  // Do any additional setup after loading the view, typically from a nib.
}

-(void)setElements
{
  self.pagingTBV.delegate =self;
  self.pagingTBV.dataSource =self;
  self.pagingTBV.backgroundColor = [UIColor yellowColor];
  self.pagingTBV.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
  self.dataARR = [[NSMutableArray alloc]init];
  self.limit =10;
  self.TotalEntries = 100;
  
  int i=0;
  while (i<self.limit) {
    [self.dataARR addObject:[NSString stringWithFormat:@"%i",i]];
     i = i+1;
  }
 // self.pagingTBV.decelerationRate = UIScrollViewDecelerationRateFast;

 
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
//                     withVelocity:(CGPoint)velocity
//              targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//  int tomove = ((int)targetContentOffset->y % (int)self.pagingTBV.rowHeight);
//  if(tomove < self.pagingTBV.rowHeight/2)
//    targetContentOffset->y -= tomove;
//  else
//    targetContentOffset->y += (self.pagingTBV.rowHeight-tomove);
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.dataARR.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell==nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }
  cell.textLabel.textAlignment = NSTextAlignmentCenter;
  cell.textLabel.text = [NSString stringWithFormat:@"row : %lu",indexPath.row + 1];
  return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return  60;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == self.dataARR.count-1) {
    
    if (self.dataARR.count < self.TotalEntries) {
      long index = self.dataARR.count ;
      self.limit = index + 10 ;
      while (index < self.limit) {
        [self.dataARR addObject:[NSString stringWithFormat:@"%lu",index]];
        index = index + 1;
      }
      [self performSelector:@selector(loadTable) withObject:nil afterDelay:2.0];
    }
  }
}
-(void)loadTable
{
  [self.pagingTBV reloadData];
}
@end
