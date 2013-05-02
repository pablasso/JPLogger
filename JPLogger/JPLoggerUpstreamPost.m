#import "JPLoggerUpstreamPost.h"
#import "JPLog.h"

@interface JPLoggerUpstreamPost ()

@property (nonatomic, strong) NSMutableDictionary *headers;

@end

@implementation JPLoggerUpstreamPost

- (id)init {
    if (self = [super init]) {
        self.headers = [[NSMutableDictionary alloc] init];
        self.parameterEncoding = AFFormURLParameterEncoding;
    }
    return self;
}

- (void)submit:(JPLog *)log completionBlock:(void (^)(BOOL))block {
    [self submit:log toURLString:self.url completionBlock:block];
}

#pragma mark - Public

+ (JPLoggerUpstreamPost *)upstreamWithURLString:(NSString *)urlString {
    JPLoggerUpstreamPost *upstream = [[JPLoggerUpstreamPost alloc] init];
    upstream.url = urlString;
    return upstream;
}

- (void)setDefaultHeader:(NSString *)header value:(NSString *)value {
    if (header && value) {
        [self.headers setObject:value forKey:header];
    }
}

#pragma mark - Private

- (void)submit:(JPLog *)log toURLString:(NSString *)urlString completionBlock:(void (^)(BOOL success))block {
    NSURL *fullURL = [NSURL URLWithString:urlString];
    NSString *port = fullURL.port ? [NSString stringWithFormat:@":%@", fullURL.port] : @"";
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", fullURL.scheme, fullURL.host, port]];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    for (NSString *key in [self.headers allKeys]) {
        [httpClient setDefaultHeader:key value:self.headers[key]];
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (log.message && log.message.length > 0) {
        [params setObject:log.message forKey:@"message"];
    }
    if (log.info && [[log.info allKeys] count] > 0) {
        [params setValuesForKeysWithDictionary:log.info];
    }

    NSString *path = [self pathFromURL:fullURL];
    [httpClient postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"JPLogger request error: %@", error.localizedDescription);
    }];
}

- (NSString *)pathFromURL:(NSURL *)url {
    NSArray *pathComponents = [url pathComponents];
    NSRange range;
    range.location = [pathComponents count] > 0 ? 1 : 0;
    range.length = [pathComponents count] - range.location;
    return [NSString stringWithFormat:@"/%@", [[pathComponents subarrayWithRange:range] componentsJoinedByString:@"/"]];
}

@end
