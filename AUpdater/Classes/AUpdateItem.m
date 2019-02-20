//
//  AUpdateItem.m
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdateItem.h"
#import "AUpdateItemFir.h"
#import "AUpdateItemPyger.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@interface AUpdateItem()<UIAlertViewDelegate>
@end
@implementation AUpdateItem

- (NSString *)description
{
    if (_dictionary) {
        return [_dictionary description];
    }
    
    return @"未获取到信息";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && self.update_url) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.update_url]];
    }
}

- (void)showAlert
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString* title = [NSString stringWithFormat:@"检测到新版本 v%@(%@)",self.version,self.build];
        NSString* detail = [NSString stringWithFormat:@"更新内容: \n%@",self.changelog];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:detail
                                                           delegate:self
                                                  cancelButtonTitle:@"暂不更新"
                                                  otherButtonTitles:@"前去更新", nil];

        [alertView show];
    });
}

@end
#pragma clang diagnostic pop
