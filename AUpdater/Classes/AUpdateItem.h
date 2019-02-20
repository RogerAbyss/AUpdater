//
//  AUpdateItem.h
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AUpdaterType) {
    AUpdaterTypeCustom  = 0,
    
    AUpdaterTypeFir     = 1 << 0,
    AUpdaterTypePyger   = 1 << 1,
};


NS_ASSUME_NONNULL_BEGIN

@interface AUpdateItem : NSObject
typedef AUpdateItem AUpdaterRequest;
typedef void (^AUpdaterResponse) (AUpdateItem *item);

/** Requst参数: 请求类型 */
@property (nonatomic, assign) AUpdaterType type;
/** Requst参数: Token从三方获取 */
@property (nonatomic, copy) NSString* token;

/** build号 ,用于判断是否更新 */
@property (nonatomic, copy) NSString* build;
/** 版本号 */
@property (nonatomic, copy) NSString* version;
/** 更新日志 */
@property (nonatomic, copy) NSString* changelog;
/** 安装地址 */
@property (nonatomic, copy) NSString* update_url;

/** 返回数据 */
@property (nonatomic, strong) NSDictionary* dictionary;
/** 是否需要更新 */
@property (nonatomic, assign) BOOL needUpdate;

/** 子类实现,发出请求 */
- (void)doRequestBy:(AUpdaterRequest *)request response:(AUpdaterResponse)responseObj;
/** 子类实现,根据返回的NSDictionary构造对象 */
- (instancetype)itemWith:(NSDictionary *)dictionary;

/** 打印详细信息 */
- (NSString *)description;
/** 提示更新 */
- (void)showAlert;

@end
NS_ASSUME_NONNULL_END
