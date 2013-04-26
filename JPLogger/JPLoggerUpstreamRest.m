#import "JPLoggerUpstreamRest.h"
#import <AFNetworking/AFNetworking.h>
#import "JPLog.h"

@implementation JPLoggerUpstreamRest

- (void)submit:(JPLog *)log completionBlock:(void (^)(BOOL))block {
    [self submit:log toURLString:self.url completionBlock:block];
}

#pragma mark - Public

+ (JPLoggerUpstreamRest *)upstreamWithURLString:(NSString *)urlString {
    JPLoggerUpstreamRest *upstream = [[JPLoggerUpstreamRest alloc] init];
    upstream.url = urlString;
    return upstream;
}

- (void)submit:(JPLog *)log toURLString:(NSString *)urlString completionBlock:(void (^)(BOOL success))block {
    NSURL *fullURL = [NSURL URLWithString:urlString];
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@:%@", fullURL.scheme, fullURL.host, fullURL.port]];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (log.message && log.message.length > 0) {
        [params setObject:log.message forKey:@"message"];
    }
    if (log.info && [[log.info allKeys] count] > 0) {
        [params setValuesForKeysWithDictionary:log.info];
    }
    
    NSArray *pathComponents = [fullURL pathComponents];
    NSRange range;
    range.location = [pathComponents count] > 0 ? 1 : 0;
    range.length = [pathComponents count] - range.location;
    NSString *path = [NSString stringWithFormat:@"/%@", [[pathComponents subarrayWithRange:range] componentsJoinedByString:@","]];
    
    [httpClient postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"JPLogger request error: %@", error.localizedDescription);
    }];
}

@end
