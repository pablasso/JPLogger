#import "JPLoggerUpstreamRest.h"
#import <AFNetworking/AFNetworking.h>

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
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        if (response.statusCode == 200) {
            block(YES);
        }
        else {
            block(NO);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"JPLogger failure:%@", error);
    }];
    [operation start];
}

@end
