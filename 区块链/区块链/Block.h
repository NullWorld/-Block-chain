//
//  Block.h
//  区块链
//
//  Created by cython on 2018/5/29.
//  Copyright © 2018年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

/**表示第几个块区*/
@property (nonatomic) NSInteger index;
/**递增数字类似与数据库中的主键*/
@property (nonatomic) NSInteger nonce;
/**当前块区创建时间*/
@property (nonatomic,strong) NSString *dateCreated;
/**前一个块区的hash值*/
@property (nonatomic,strong) NSString *previousHash;
/**当前块区hash值*/
@property (nonatomic,strong) NSString *hashValue;
/**任意有价值的信息。可以是金钱、医疗信息和房地产信息等等*/
@property (nonatomic,strong) NSString *data;
/**计算属性，提供给产生哈希值的函数*/
@property (nonatomic,strong) NSString *key;

@end
