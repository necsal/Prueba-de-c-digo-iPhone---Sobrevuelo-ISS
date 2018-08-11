//
//  MainThread.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 30/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainThreadWithNoDispatchAsync.h"
#import "MainThread.h"

@interface MainThreadWithNoDispatchAsync : NSObject <MainThread>

@end
