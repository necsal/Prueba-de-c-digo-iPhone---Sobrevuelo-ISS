//
//  MainThreadExecutor.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 30/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "MainThreadExecutor.h"

@interface MainThreadExecutor () {
    __strong id<Interactor> _strongInteractor;
}

@end

@implementation MainThreadExecutor
- (void)run:(id<Interactor>)interactor {
    _strongInteractor = interactor;
    [interactor run];
}
- (void)runTask:(void (^)(void))taskBlock {
    taskBlock();
}

@end
