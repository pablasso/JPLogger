#import "JPLog.h"

@implementation JPLog

+ (JPLog *)logWithLevel:(JPLogLevel)level {
    JPLog *log = [[JPLog alloc] init];
    log.level = level;
    return log;
}

@end
