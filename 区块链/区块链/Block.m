//
//  Block.m
//  区块链
//
//  Created by cython on 2018/5/29.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "Block.h"

@implementation Block

- (id)init{
    
    self = [super init];
    if (self) {
        self.dateCreated  = [self nowData];
        self.nonce = 0;
    }
    
    return self;
}

- (NSString *)nowData{
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:[NSDate new]];
}

- (NSString *)key{
    return [NSString stringWithFormat:@"%ld%@%@",_index,_dateCreated,_previousHash];
}

@end
