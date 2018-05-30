//
//  Blockchain.m
//  区块链
//
//  Created by cython on 2018/5/29.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "Blockchain.h"
#import "NSString+Hash.h"

@interface Blockchain()

@property (nonatomic,strong) NSMutableArray <Block*> *blockArray;

@end

static Blockchain *blockChain;

@implementation Blockchain

- (NSMutableArray *)blockArray{
    if (!_blockArray) {
        _blockArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _blockArray;
}

+ (instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        blockChain = [[Blockchain alloc]init];
    });
    
    return blockChain;
}

- (id)initWithGenesisBlock:(Block *)block{
    self = [super init];
    if (self) {
        [self addBlock:block];
    }
    return self;
}

/**添加块区*/
- (void)addBlock:(Block *)block{
    /**添加第一个块区*/
    if (_blockArray.count==0) {
        /**没有块区所以前一个块区的hash值为0*/
        block.previousHash = @"0";
        block.hashValue = [self generateHash:block];
    }else{
        Block *previousBlock = [self getPreviousBlock];
        block.previousHash = previousBlock.hashValue;
        block.index = _blockArray.count;
        block.hashValue = [self generateHash:block];
    }
    
    [self.blockArray addObject:block];
    if ([block.hashValue hasPrefix:@"00"]) {
        [self descriptionBlock:block];
    }
}

/**计算hash值*/
- (NSString *)generateHash:(Block *)block{
    NSString *hash = block.key.sha1;
    if ([hash hasPrefix:@"00"]) {
        block.nonce += 1;
        hash = block.key.sha1;
    }
    return hash;
}

- (Block *)getPreviousBlock{
    if (_blockArray.count>0) {
        return _blockArray.lastObject;
    }else{
        return nil;
    }
}


- (void)descriptionBlock:(Block *)block{
    NSLog(@"---第%ld个block-----",block.index);
    NSLog(@"---创建时间:%@-----",block.dateCreated);
    NSLog(@"---交易数据:%@-----",block.data);
    NSLog(@"-------nonce:%ld-----------",block.nonce);
    NSLog(@"---当前区块hash值:%@-----",block.hashValue);
    NSLog(@"---前一区块hash值:%@-----",block.previousHash);
    
}

@end
