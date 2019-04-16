//
//  main.m
//  JsonDemo
//
//  Created by evonn iw on 2019/4/16.
//  Copyright © 2019 iwevonn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsModel.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *json = @"[{\"id\":\"490\",\"description\":\"\",\"required\":false,\"childProperty\":[{\"id\":\"492\",\"isSelect\":true,\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:28\",\"pid\":\"490\",\"name\":\"200g\",\"updateTime\":\"2019-03-28 13:53:28\"},{\"id\":\"493\",\"isSelect\":true,\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:46\",\"pid\":\"490\",\"name\":\"100g\",\"updateTime\":\"2019-03-28 13:53:46\"}],\"level\":3,\"createTime\":\"2019-03-28 13:53:06\",\"pid\":\"482\",\"name\":\"重量\",\"updateTime\":\"2019-03-28 13:53:06\"},{\"id\":\"491\",\"description\":\"\",\"required\":false,\"childProperty\":[{\"id\":\"494\",\"isSelect\":true,\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:57\",\"pid\":\"491\",\"name\":\"20cm\",\"updateTime\":\"2019-03-28 13:53:57\"},{\"id\":\"495\",\"isSelect\":true,\"level\":\"4\",\"createTime\":\"2019-03-28 13:54:10\",\"pid\":\"491\",\"name\":\"10cm\",\"updateTime\":\"2019-03-28 13:54:10\"}],\"level\":3,\"createTime\":\"2019-03-28 13:53:17\",\"pid\":\"482\",\"name\":\"尺寸\",\"updateTime\":\"2019-03-28 13:53:17\"},{\"id\":\"491\",\"description\":\"\",\"required\":false,\"childProperty\":[{\"id\":\"492\",\"isSelect\":true,\"pName\":\"颜色\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:28\",\"pid\":\"490\",\"name\":\"红色\",\"updateTime\":\"2019-03-28 13:53:28\"},{\"id\":\"493\",\"isSelect\":true,\"pName\":\"颜色\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:46\",\"pid\":\"490\",\"name\":\"红色\",\"updateTime\":\"2019-03-28 13:53:46\"}],\"level\":3,\"createTime\":\"2019-03-28 13:53:06\",\"pid\":\"482\",\"name\":\"颜色\",\"updateTime\":\"2019-03-28 13:53:06\"},{\"id\":\"492\",\"description\":\"\",\"required\":false,\"childProperty\":[{\"id\":\"492\",\"isSelect\":true,\"pName\":\"形状\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:28\",\"pid\":\"490\",\"name\":\"方形\",\"updateTime\":\"2019-03-28 13:53:28\"},{\"id\":\"493\",\"isSelect\":true,\"pName\":\"形状\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:46\",\"pid\":\"490\",\"name\":\"圆形\",\"updateTime\":\"2019-03-28 13:53:46\"}],\"level\":3,\"createTime\":\"2019-03-28 13:53:06\",\"pid\":\"482\",\"name\":\"形状\",\"updateTime\":\"2019-03-28 13:53:06\"},{\"id\":\"499\",\"description\":\"\",\"required\":false,\"childProperty\":[{\"id\":\"492\",\"isSelect\":true,\"pName\":\"透明度\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:28\",\"pid\":\"490\",\"name\":\"不透明\",\"updateTime\":\"2019-03-28 13:53:28\"},{\"id\":\"493\",\"isSelect\":true,\"pName\":\"透明度\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:46\",\"pid\":\"490\",\"name\":\"透明\",\"updateTime\":\"2019-03-28 13:53:46\"},{\"id\":\"493\",\"isSelect\":true,\"pName\":\"透明度\",\"level\":\"4\",\"createTime\":\"2019-03-28 13:53:46\",\"pid\":\"490\",\"name\":\"半透明\",\"updateTime\":\"2019-03-28 13:53:46\"}],\"level\":3,\"createTime\":\"2019-03-28 13:53:06\",\"pid\":\"482\",\"name\":\"透明度\",\"updateTime\":\"2019-03-28 13:53:06\"}]";
        
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray <NSArray <GoodsModel *>*>*resultArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            NSArray *childArray = [dict objectForKey:@"childProperty"];
            if (childArray.count > 0) {
                NSMutableArray *tempArray = [NSMutableArray array];
                for (NSDictionary *modelDict in childArray) {
                    [tempArray addObject:[GoodsModel modelWithDict:modelDict]];
                }
                [resultArray addObject:tempArray];
            }
        }
        //遍历数据
        NSArray *rutArray = [GoodsModel enumerateObjects:resultArray];
        for (NSArray *result in rutArray) {
            NSMutableString *str = [NSMutableString string];
            for (GoodsModel *model in result) {
                [str appendString: model.name];
            }
            NSLog(@"%@", str);
        }
    }
    return 0;
}

