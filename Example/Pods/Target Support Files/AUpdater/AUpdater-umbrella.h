#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AUpdateItem.h"
#import "AUpdateItemFir.h"
#import "AUpdateItemPyger.h"
#import "AUpdater.h"

FOUNDATION_EXPORT double AUpdaterVersionNumber;
FOUNDATION_EXPORT const unsigned char AUpdaterVersionString[];

