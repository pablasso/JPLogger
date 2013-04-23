#import <Foundation/Foundation.h>

typedef enum {
    JPLogLevelDebug,
    JPLogLevelInfo,
    JPLogLevelError,
    JPLogLevelFatal
} JPLogLevel;

@interface JPLog : NSObject

@property (nonatomic) JPLogLevel level;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSDate *date;

@end
