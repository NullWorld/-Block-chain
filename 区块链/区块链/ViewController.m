//
//  ViewController.m
//  区块链
//
//  Created by cython on 2018/5/29.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "ViewController.h"
#import "Block.h"
#import "Blockchain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Blockchain *blockChain = [Blockchain shareManager];
    
    
    for (int i = 0; i<1025; i++ ) {
        Block *block = [[Block alloc] init];
        block.data = @"数据";
        [blockChain addBlock:block];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
