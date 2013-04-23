#import <Foundation/Foundation.h>

@class JPLog;

@interface JPLoggerStore : NSObject

- (void)writeLog:(JPLog *)log;
- (void)deleteLog:(JPLog *)log;
- (NSArray *)logs;

@end
