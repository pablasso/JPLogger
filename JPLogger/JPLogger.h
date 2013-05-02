#import <Foundation/Foundation.h>

@class JPLoggerStore;
@class JPLoggerUpstream;

@interface JPLogger : NSObject

+ (void)debug:(NSString *)message;
+ (void)debug:(NSString *)message withInfo:(NSDictionary *)info;
+ (void)info:(NSString *)message store:(JPLoggerStore *)store upstream:(JPLoggerUpstream *)upstream;
+ (void)info:(NSString *)message withInfo:(NSDictionary *)info store:(JPLoggerStore *)store upstream:(JPLoggerUpstream *)upstream;
+ (void)error:(NSString *)message;
+ (void)error:(NSString *)message withInfo:(NSDictionary *)info;
+ (void)fatal:(NSString *)message;
+ (void)fatal:(NSString *)message withInfo:(NSDictionary *)info;

@end
