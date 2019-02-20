//
//  AUpdater.m
//  AUpdater
//
//  Created by 任超 on 2019/2/20.
//

#import "AUpdater.h"

@implementation AUpdater

+ (void)updateBy:(AUpdaterRequest *)request response:(AUpdaterResponse)response {
    [request doRequestBy:request response:response];
}

@end
