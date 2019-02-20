//
//  AUpdateItemPyger.m
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdateItemPyger.h"

@implementation AUpdateItemPyger

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = AUpdaterTypePyger;
    }
    return self;
}

- (instancetype)itemWith:(NSDictionary *)dictionary
{
    if (!dictionary) return self;
    
    dictionary = dictionary[@"data"];
    self.dictionary = dictionary;
    @try {
        self.build = dictionary[@"buildVersionNo"];
        self.changelog = dictionary[@"buildUpdateDescription"];
        self.update_url = dictionary[@"downloadURL"];
        self.version = dictionary[@"buildVersion"];
        
        NSString *currentBuild = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        
        if ([self.build  integerValue] > [currentBuild integerValue]) {
            self.needUpdate = YES;
        }
    }@catch(NSException* exception) {
        self.needUpdate = NO;
        self.build = @"";
        self.changelog = @"";
        self.update_url = @"";
        self.version = @"";
    }@finally {
        return self;
    }
}

- (void)doRequestBy:(AUpdaterRequest *)request response:(AUpdaterResponse)responseObj {
    if (request) {
        __block AUpdaterRequest* obj = request;
        
        NSDictionary *headers = @{ @"Content-Type": @"application/x-www-form-urlencoded"};
        
        NSMutableData *postData = [[NSMutableData alloc] initWithData:[[NSString stringWithFormat:@"_api_key=%@",request.token] dataUsingEncoding:NSUTF8StringEncoding]];
        [postData appendData:[[NSString stringWithFormat:@"&appKey=%@",((AUpdateItemPyger *)request).appKey] dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"%@",request.token);
        NSLog(@"%@",((AUpdateItemPyger *)request).appKey);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.pgyer.com/apiv2/app/check"]
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:10.0];
        [request setHTTPMethod:@"POST"];
        [request setAllHTTPHeaderFields:headers];
        [request setHTTPBody:postData];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if (error) {
                                                            NSLog(@"%@", error);
                                                        } else {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                            
                                                            if (httpResponse.statusCode == 200) {
                                                                NSError *jsonError = nil;
                                                                id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                                                if (!jsonError && [object isKindOfClass:[NSDictionary class]]) {
                                                                    
                                                                    obj = [obj itemWith:object];
                                                                    responseObj(obj);
                                                                    
                                                                    if (obj.needUpdate) {
                                                                        [obj showAlert];
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }];
        [dataTask resume];
    }
}

@end
