#import "JPLoggerUpstream.h"

@interface JPLoggerUpstreamRest : JPLoggerUpstream

@property (nonatomic, strong) NSString *url;

+ (JPLoggerUpstreamRest *)upstreamWithURLString:(NSString *)urlString;
- (void)submit:(JPLog *)log toURLString:(NSString *)urlString completionBlock:(void (^)(BOOL success))block;

@end
