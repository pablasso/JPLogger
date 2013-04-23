#import <Foundation/Foundation.h>

@class JPLoggerStore;
@class JPLoggerFormatter;
@class JPLoggerUpstream;

@interface JPLogger : NSObject

+ (id)sharedInstance;
- (void)setStore:(JPLoggerStore *)store;
- (void)setFormatter:(JPLoggerFormatter *)formatter;
- (void)setUpstream:(JPLoggerUpstream *)upstream;

- (void)debug:(NSString *)message;
- (void)info:(NSString *)message;
- (void)error:(NSString *)message;
- (void)fatal:(NSString *)message;

@end
