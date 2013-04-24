#import "JPLoggerStore.h"

@implementation JPLoggerStore

#pragma mark - Public

- (void)writeLog:(JPLog *)log {}
- (void)deleteLog:(JPLog *)log {}
- (NSArray *)logs { return @[]; }

@end
