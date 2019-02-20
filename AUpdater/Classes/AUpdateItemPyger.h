//
//  AUpdateItemPyger.h
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdateItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AUpdateItemPyger : AUpdateItem

/** Requst参数: 蒲公英的AppKey */
@property (nonatomic, copy) NSString* appKey;

- (instancetype)itemWith:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
