//
//  CacheManager.h
//  Salamanca24h
//
//  Created by Cristina Folgueral Gutiérrez on 04/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CachingStrategy.h"

@interface CacheManager : NSObject {
    NSMutableDictionary *_cacheMap;
}

+ (CacheManager *) defaultManager;
- (NSData *) getCachedDataWithName:(NSString *) name andCachingStrategy:(id<CachingStrategy>) cachingStrategy;
- (BOOL) saveData:(NSData *) data withName:(NSString *) name;
- (BOOL) removeCacheByName:(NSString*)name;
- (void) freeCacheData;
@end
