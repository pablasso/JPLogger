#import "JPLoggerUpstream.h"
#import <AFNetworking/AFNetworking.h>

@interface JPLoggerUpstreamRest : JPLoggerUpstream

@property (nonatomic, strong) NSString *url;
@property (nonatomic) AFHTTPClientParameterEncoding parameterEncoding;

+ (JPLoggerUpstreamRest *)upstreamWithURLString:(NSString *)urlString;
- (void)setDefaultHeader:(NSString *)header value:(NSString *)value;
    
@end
