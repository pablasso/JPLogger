#import "JPLogger.h"
#import "JPLoggerUpstream.h"
#import "JPLog.h"

@interface JPLogger ()

@property (nonatomic, strong) JPLoggerStore *store;
@property (nonatomic, strong) JPLoggerUpstream *upstream;

@end

@implementation JPLogger

- (id)init {
    if (self = [super init]) {
        // someday this will be some sick defaults, someday.
        self.store = nil;
        self.upstream = nil;
    }
    return self;
}

+ (id)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public

- (void)setupWithStore:(JPLoggerStore *)store {
    self.store = store;
}

- (void)setupWithUpstream:(JPLoggerUpstream *)upstream {
    self.upstream = upstream;
}

- (void)debug:(NSString *)message {
    [self debug:message withInfo:nil];
}
- (void)debug:(NSString *)message withInfo:(NSDictionary *)info {}

- (void)info:(NSString *)message {
    [self info:message withInfo:nil];
}
- (void)info:(NSString *)message withInfo:(NSDictionary *)info {
    JPLog *log = [JPLog logWithLevel:JPLogLevelInfo];
    log.info = info;
    log.date = [NSDate date];
    [self processLog:log];
}

- (void)error:(NSString *)message {
    [self error:message withInfo:nil];
}
- (void)error:(NSString *)message withInfo:(NSDictionary *)info {}

- (void)fatal:(NSString *)message {
    [self fatal:message withInfo:nil];
}
- (void)fatal:(NSString *)message withInfo:(NSDictionary *)info {}

#pragma mark - Private

- (void)processLog:(JPLog *)log {
    [self.upstream submit:log completionBlock:^(BOOL success){
    }];
}

@end
