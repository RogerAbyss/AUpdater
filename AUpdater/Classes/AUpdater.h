//
//  AUpdater.h
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import <Foundation/Foundation.h>
#import "AUpdateItem.h"
#import "AUpdateItemFir.h"
#import "AUpdateItemPyger.h"

NS_ASSUME_NONNULL_BEGIN

/**
 # AUpdater
 
 ```
 AUpdater帮助App在内测的时候, 提供更新服务
 支持fir.im/pyger/服务器自定义
 ```
 
 ** 三方上传安装可能会被AppStore拒绝, 请在内测时使用 **
 ``pod 'AUpdater', :configuration => ['Debug']``
 */
@interface AUpdater : NSObject

/**
 从服务器获取最新版本并提示是否更新
 
 * request:   三方平台请求信息
 * response:  返回信息
 */
+ (void)updateBy:(AUpdaterRequest *)request response:(AUpdaterResponse)response;
@end

NS_ASSUME_NONNULL_END
