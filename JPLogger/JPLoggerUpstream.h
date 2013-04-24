#import <Foundation/Foundation.h>

@class JPLog;

@interface JPLoggerUpstream : NSObject

- (void)submit:(JPLog *)log completionBlock:(void (^)(BOOL success))block;

@end
