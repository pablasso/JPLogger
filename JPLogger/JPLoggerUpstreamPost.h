#import "JPLoggerUpstream.h"
#import <AFNetworking/AFNetworking.h>

@interface JPLoggerUpstreamPost : JPLoggerUpstream

@property (nonatomic, strong) NSString *url;
@property (nonatomic) AFHTTPClientParameterEncoding parameterEncoding;

+ (JPLoggerUpstreamPost *)upstreamWithURLString:(NSString *)urlString;
- (void)setDefaultHeader:(NSString *)header value:(NSString *)value;
    
@end
