#import <Foundation/Foundation.h>

@class JPLoggerStore;
@class JPLoggerUpstream;

@interface JPLogger : NSObject

+ (id)sharedInstance;
- (void)setupWithStore:(JPLoggerStore *)store;
- (void)setupWithUpstream:(JPLoggerUpstream *)upstream;
- (void)debug:(NSString *)message;
- (void)debug:(NSString *)message withInfo:(NSDictionary *)info;
- (void)info:(NSString *)message;
- (void)info:(NSString *)message withInfo:(NSDictionary *)info;
- (void)error:(NSString *)message;
- (void)error:(NSString *)message withInfo:(NSDictionary *)info;
- (void)fatal:(NSString *)message;
- (void)fatal:(NSString *)message withInfo:(NSDictionary *)info;

@end
