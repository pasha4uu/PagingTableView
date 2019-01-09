//
//  ViewController.h
//  PagingTableView
//
//  Created by PASHA on 09/01/19.
//  Copyright © 2019 Reatchall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *pagingTBV;

@property NSMutableArray * dataARR;
@property long limit ;
@property int TotalEntries;
@end

