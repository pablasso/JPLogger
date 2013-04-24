#import "JPLoggerUpstreamRest.h"
#import <AFNetworking/AFNetworking.h>

@implementation JPLoggerUpstreamRest

- (void)submit:(JPLog *)log completionBlock:(void (^)(BOOL))block {
    [self submit:log toURLString:self.url completionBlock:block];
}

#pragma mark - Public

- (void)submit:(JPLog *)log toURLString:(NSString *)urlString completionBlock:(void (^)(BOOL success))block {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"json:%@", JSON);
    } failure:nil];
    [operation start];
}

@end
