//
//  CacheManager.m
//  Salamanca24h
//
//  Created by Cristina Folgueral Gutiérrez on 04/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CacheManager.h"

#define DEFAULT_CACHE_MANAGER_DIRECTORY @"cachemanagerdirectory"
#define DISC_CACHE_DIC_KEY @"disk_cache_dic_key"

static CacheManager *_defaultManager;

@implementation CacheManager

+ (CacheManager*) defaultManager{
    if(!_defaultManager){
        _defaultManager = [[self alloc] init];
    }
    return _defaultManager;
}

- (id) init{
    self = [super init];
    if(self){
        _cacheMap = [[NSMutableDictionary alloc] initWithDictionary:[self getSavedCacheMap]];
    }
    return self;
}

- (NSDictionary *) getSavedCacheMap{
    return [[NSUserDefaults standardUserDefaults] objectForKey:DISC_CACHE_DIC_KEY];
}

- (void) saveCacheMap{
    //Ha cambiado el diccionario de objectos de caché, lo guardamos en disco
    [[NSUserDefaults standardUserDefaults] setObject:_cacheMap forKey:DISC_CACHE_DIC_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *) getCachePath{
	NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cacheDirectory = [[arrayPaths objectAtIndex:0] stringByAppendingPathComponent:DEFAULT_CACHE_MANAGER_DIRECTORY];
	NSFileManager *fileManager= [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
	return cacheDirectory;
}

- (NSString *) stringWithEscapingSlashes:(NSString *) s{
    return [s stringByReplacingOccurrencesOfString:@"/" withString:@"**"];
}

/*Request functions*/

- (NSTimeInterval) getPersistTimeForName:(NSString *) name{
    NSDate *persistedDate = [_cacheMap objectForKey:name];
    return [persistedDate timeIntervalSince1970];
}


- (NSData *) getCachedDataWithName:(NSString *) name andCachingStrategy:(id<CachingStrategy>) cachingStrategy{
    name = [self stringWithEscapingSlashes:name];
    NSData *data = [self getCachedDataForName:name];
    if([cachingStrategy isObjectValid:data withPersistedTime:[self getPersistTimeForName:name]]){
        return data;
    }else{
        return nil;
    }
}


- (NSData *) getCachedDataForName:(NSString *) name{
    name = [self stringWithEscapingSlashes:name];
    if([_cacheMap objectForKey:name]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [[self getCachePath] stringByAppendingPathComponent:name];
        BOOL isDir;
        if([fileManager fileExistsAtPath:path isDirectory:&isDir]){
            if(!isDir){
                NSData *data = [NSData dataWithContentsOfFile:path];
                return data;
            }
        }
    }
    return nil;
}

- (BOOL) removeCacheByName:(NSString*)name{
    name = [self stringWithEscapingSlashes:name];
    NSString *path = [[self getCachePath] stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL removed = [fileManager removeItemAtPath:path error:nil];
    if(removed){
        [_cacheMap removeObjectForKey:name];
        [self saveCacheMap];
        return YES;
        
    }
    return NO;
}


- (BOOL) saveData:(NSData *) data withName:(NSString *) name{
    if(!data){
        return NO;
    }
    //Guardamos el nuevo elemento en la caché
    name = [self stringWithEscapingSlashes:name];
    NSString *path = [[self getCachePath] stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL created = [fileManager createFileAtPath:path contents:data attributes:nil];
    if(created){
        [_cacheMap setObject:[NSDate date] forKey:name];
        [self saveCacheMap];
        return YES;
    }
    return NO;
}


- (void) freeCacheData{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:[self getCachePath] error:nil];
    [_cacheMap removeAllObjects];
    [self saveCacheMap];
}

@end
