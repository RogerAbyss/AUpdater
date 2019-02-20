//
//  AUpdateItemFir.h
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdateItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AUpdateItemFir : AUpdateItem
/** Requst参数: 有默认的 */
@property (nonatomic, copy) NSString* bundleID;

- (instancetype)itemWith:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
