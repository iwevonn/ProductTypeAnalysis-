//
//  GoodsModel.m
//  JsonDemo
//
//  Created by evonn iw on 2019/4/16.
//  Copyright © 2019 iwevonn. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

//model == > NSDictionary
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    GoodsModel *model = [[[self class] alloc] initWithDict:dict];
    return model;
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self._id = value;
    }
}


+ (NSArray *)enumerateObjects:(NSArray *)array {
    return [self combine:array];
}

+ (NSArray *)combine:(NSArray <NSArray *>*)arr {
     NSUInteger len = arr.count;
     // 当数组大于等于2个的时候
     if (len >= 2) {
         // 第一个数组的长度
         NSUInteger len1 = arr[0].count;
         // 第二个数组的长度
         NSUInteger len2 = arr[1].count;
         // 2个数组产生的组合数
         NSUInteger lenBoth = len1 * len2;
         //  申明一个新数组,做数据暂存
         NSMutableArray *items = [NSMutableArray array];
         for (int i=0; i<lenBoth -1; i++) {
             [items addObject:[NSMutableArray array]];
         }
         // 申明新数组的索引
         int index = 0;
         // 2层嵌套循环,将组合放到新数组中
         for(int i=0; i<len1; i++){
             for(int j=0; j<len2; j++){
                 id obj1 = arr[0][i];
                 id obj2 = arr[1][j];
                 if ([obj1 isKindOfClass:[NSArray class]]) {
                     NSMutableArray *arrM = [NSMutableArray array];
                     [arrM addObjectsFromArray:(NSArray *)obj1];
                     [arrM addObject:obj2];
                     items[index] = arrM;
                 } else {
                     items[index] = @[obj1, obj2];
                 }
                 index++;
             }
         }
         // 将新组合的数组并到原数组中
         NSMutableArray *newArr = [NSMutableArray array];
         for (int i=0; i<len -1; i++) {
             [newArr addObject:[NSArray array]];
         }
         
         for(int i=2;i<arr.count;i++){
             newArr[i-1] = arr[i];
         }
         newArr[0] = items;
         // 执行回调
         return [self combine:newArr];
     } else {
         return arr[0];
     }
}

- (NSString *)description {
    return self.name;
}

@end
