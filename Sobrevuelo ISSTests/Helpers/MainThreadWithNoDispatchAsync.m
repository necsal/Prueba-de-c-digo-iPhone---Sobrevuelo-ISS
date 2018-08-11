//
//  MainThread.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 30/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "MainThreadWithNoDispatchAsync.h"

@implementation MainThreadWithNoDispatchAsync
- (void)post:(main_thread_block_t)blockToMainThread {
    blockToMainThread();
}
@end
