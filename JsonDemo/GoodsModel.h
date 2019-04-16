//
//  GoodsModel.h
//  JsonDemo
//
//  Created by evonn iw on 2019/4/16.
//  Copyright © 2019 iwevonn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsModel : NSObject


/*        "id": "496",
 "isSelect": true,
 "pName": "颜色",
 "level": "4",
 "createTime": "2019-03-28 13:53:28",
 "pid": "490",
 "name": "红色",
 "updateTime": "2019-03-28 13:53:28"
 */
@property (nonatomic, copy) NSString *_id;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *updateTime;

+ (instancetype)modelWithDict:(NSDictionary *)dict;


+ (NSArray *)enumerateObjects:(NSArray <NSArray <GoodsModel *>*>*)arr;

@end

NS_ASSUME_NONNULL_END
