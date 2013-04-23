#import "JPLogger.h"

@implementation JPLogger

+ (id)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public

- (void)setStore:(JPLoggerStore *)store {}
- (void)setFormatter:(JPLoggerFormatter *)formatter {}
- (void)setUpstream:(JPLoggerUpstream *)upstream {}

- (void)debug:(NSString *)message {}
- (void)info:(NSString *)message {}
- (void)error:(NSString *)message {}
- (void)fatal:(NSString *)message {}

@end
