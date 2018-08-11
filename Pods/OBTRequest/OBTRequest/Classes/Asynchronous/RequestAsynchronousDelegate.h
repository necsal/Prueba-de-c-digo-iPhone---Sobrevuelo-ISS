
#import <UIKit/UIKit.h>

@class Request;

@protocol RequestAsynchronousDelegate <NSObject>

- (void) request:(Request*)req withTag:(id)tag didFinishedWithResult:(NSData *)result;
- (void) request:(Request*)req withTag:(id)tag didFinishedWithError:(NSError *) error;

@end
