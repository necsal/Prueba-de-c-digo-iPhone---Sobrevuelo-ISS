
#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "RequestCachingStrategy.h"

@protocol RequestAsynchronousDelegate;

typedef enum{
    RequestHTTPMethodGET,
    RequestHTTPMethodPOST,
    RequestHTTPMethodPUT,
    RequestHTTPMethodDELETE
}RequestHTTPMethod;

typedef enum{
    RequestLogLevelNone,
    RequestLogLevelInfo
}RequestLogLevel;

@interface Request : NSObject {
    
	NSURL* _url;
    NSMutableURLRequest *_request;
    NSHTTPURLResponse *_response;
	NSString *_server; // http://www.servidor.com suele estar en un define BASE_URL
    
    RequestCachingStrategy *_requestCachingStrategy;
}

@property (readonly) NSURL *url;

+ (void) setLogLevel:(RequestLogLevel) logLevel;
- (void) invalidateCache;

- (OrderedDictionary*) parameters;
- (RequestHTTPMethod) method;
- (BOOL) isResponseDataSafeForCaching; //si creemos que los datos son privados, no activar la caché en disco, pueden ser visibles desde el navegador de ficheros

@end

