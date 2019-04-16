
#import <Foundation/Foundation.h>

@implementation NSObject (Log)
//将obj转换成json字符串。如果失败则返回nil.
- (NSString *)convertToJsonString {
    //先判断是否能转化为JSON格式
    if (![NSJSONSerialization isValidJSONObject:self])  return nil;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
    if (error || !jsonData) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end


@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale {
    return [self convertToJsonString];
}
@end


@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale {
    return [self convertToJsonString];
}
@end
