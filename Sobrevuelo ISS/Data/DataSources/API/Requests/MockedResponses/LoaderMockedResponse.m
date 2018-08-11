//
//  LoaderMockedResponse.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 18/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "LoaderMockedResponse.h"

@implementation LoaderMockedResponse
+ (NSString *)mockedResponseForRequest:(NSString *)requestName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:requestName ofType:@"json"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    return fileContent;
}
@end
