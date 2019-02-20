//
//  AViewController.m
//  AUpdater
//
//  Created by roger_ren@qq.com on 02/20/2019.
//  Copyright (c) 2019 roger_ren@qq.com. All rights reserved.
//

#import "AViewController.h"
#import <AUpdater/AUpdater.h>

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AUpdateItemFir* request = [AUpdateItemFir new];
    request.token = @"e9bf520535dbb08e8aef052cf6aa5558";
    
    AUpdateItemPyger* request1 = [AUpdateItemPyger new];
    request1.token = @"ef88ab8f8e7d3eca95595348d9f9e40f";
    ((AUpdateItemPyger *)request1).appKey = @"29389c0ae8225bb3117d016a02042666";
    
    
    [AUpdater updateBy:request1 response:^(AUpdateItem * _Nonnull item) {
        NSLog(@"%@",item.needUpdate?@"需要更新":@"不需要更新");
        NSLog(@"%@",item.description);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
