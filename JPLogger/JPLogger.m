#import "JPLogger.h"
#import "JPLoggerStore.h"
#import "JPLoggerUpstream.h"
#import "JPLog.h"

@implementation JPLogger

#pragma mark - Public

+ (void)debug:(NSString *)message {
    [self debug:message withInfo:nil];
}
+ (void)debug:(NSString *)message withInfo:(NSDictionary *)info {}

+ (void)info:(NSString *)message store:(JPLoggerStore *)store upstream:(JPLoggerUpstream *)upstream {
    [self info:message withInfo:nil store:store upstream:upstream];
}
+ (void)info:(NSString *)message withInfo:(NSDictionary *)info store:(JPLoggerStore *)store upstream:(JPLoggerUpstream *)upstream {
    JPLog *log = [JPLog logWithLevel:JPLogLevelInfo];
    log.message = message;
    log.info = info;
    log.date = [NSDate date];
    [self processLog:log withStore:store andUpstream:upstream];
}

+ (void)error:(NSString *)message {
    [self error:message withInfo:nil];
}
+ (void)error:(NSString *)message withInfo:(NSDictionary *)info {}

+ (void)fatal:(NSString *)message {
    [self fatal:message withInfo:nil];
}
+ (void)fatal:(NSString *)message withInfo:(NSDictionary *)info {}

#pragma mark - Private

+ (void)processLog:(JPLog *)log withStore:(JPLoggerStore *)store andUpstream:(JPLoggerUpstream *)upstream {
    [upstream submit:log completionBlock:^(BOOL success){}];
}

@end
