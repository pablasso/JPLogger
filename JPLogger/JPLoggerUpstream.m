#import "JPLoggerUpstream.h"

@implementation JPLoggerUpstream

- (void)submit:(JPLog *)log completionBlock:(void (^)(BOOL success))block {
    block(NO);
}

@end
