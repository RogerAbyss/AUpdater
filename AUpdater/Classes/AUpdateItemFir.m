//
//  AUpdateItemFir.m
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdateItem.h"
#import "AUpdateItemFir.h"

@implementation AUpdateItemFir

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = AUpdaterTypeFir;
    }
    return self;
}

- (NSString *)bundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
}

- (instancetype)itemWith:(NSDictionary *)dictionary
{
    if (!dictionary) return self;
    
    self.dictionary = dictionary;
    @try {
        self.build = dictionary[@"build"];
        self.changelog = dictionary[@"changelog"];
        self.update_url = dictionary[@"update_url"];
        self.version = dictionary[@"version"];
        
        NSString *currentBuild = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        if ([self.build  integerValue] > [currentBuild integerValue]) {
            self.needUpdate = YES;
        }
    }@catch(NSException* exception) {
        self.build = @"";
        self.changelog = @"";
        self.update_url = @"";
        self.version = @"";
        self.needUpdate = NO;
    }@finally {
        return self;
    }
    
}

- (void)doRequestBy:(AUpdaterRequest *)request response:(AUpdaterResponse)responseObj {
    if (request) {
        __block AUpdaterRequest* obj = request;
        
        NSString* api = [NSString stringWithFormat:@"http://api.fir.im/apps/latest/%@?api_token=%@&type=ios",((AUpdateItemFir *)request).bundleID?:@"",request.token];
        
        NSURL *url = [NSURL URLWithString:api];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
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
