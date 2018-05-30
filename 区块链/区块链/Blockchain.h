//
//  Blockchain.h
//  区块链
//
//  Created by cython on 2018/5/29.
//  Copyright © 2018年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

@interface Blockchain : NSObject

+ (instancetype)shareManager;

- (id)initWithGenesisBlock:(Block *)block;

- (void)addBlock:(Block *)block;


@end
