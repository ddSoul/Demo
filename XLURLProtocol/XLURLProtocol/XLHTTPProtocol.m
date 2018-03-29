//
//  XLHTTPProtocol.m
//  XLURLProtocol
//
//  Created by ddSoul on 2018/3/26.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLHTTPProtocol.h"

static NSString * const RichURLProtocolHandledKey = @"RichURLProtocolHandledKey";

@interface XLHTTPProtocol()<NSURLSessionDelegate>

@property (atomic,strong,readwrite) NSURLSessionDataTask *task;
@property (nonatomic,strong) NSURLSession *session;

@end

@implementation XLHTTPProtocol

/**
 * 每次有一个请求的时候都会调用这个方法，在这个方法里面判断这个请求是否需要被处理拦截，如果返回YES就代表这个request需要被处理，反之就是不需要被处理
 */
+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    //只处理http和https请求
    NSString *scheme = [[request URL] scheme];
    if ( ([scheme caseInsensitiveCompare:@"http"] == NSOrderedSame ||
          [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame))
    {
        //        NSLog(@"====>%@",request.URL);
        
        //看看是否已经处理过了，防止无限循环
        if ([NSURLProtocol propertyForKey:RichURLProtocolHandledKey inRequest:request]) {
            return NO;
        }
        
        return YES;
    }
    return NO;
}

/**
 * 这个方法就是返回规范的request，一般使用就是直接返回request，不做任何处理的
 */
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    /** 可以在此处添加头等信息  */
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
    return mutableReqeust;
}

/**
 * 这个方法作用很大，把当前请求的request拦截下来以后，在这个方法里面对这个request做各种处理，比如添加请求头，重定向网络，使用自定义的缓存等。作用非常之大。下面就是一个重定向的例子。
 */
- (void)startLoading {
    
    NSString *url = [[NSUserDefaults standardUserDefaults] valueForKey:@"url"];
   
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    mutableReqeust.URL = [NSURL URLWithString:url];
    //打标签，防止无限循环
    [NSURLProtocol setProperty:@YES forKey:RichURLProtocolHandledKey inRequest:mutableReqeust];
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    self.session  = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:queue];
    self.task = [self.session dataTaskWithRequest:mutableReqeust];
    [self.task resume];
}


- (void)stopLoading {
    [self.session invalidateAndCancel];
    self.session = nil;

}

/**
 * 当然这里省略后的代码只会保证大多数情况下的正确执行，只是给你一个对获取响应数据粗略的认知，如果你需要更加详细的代码，我觉得最好还是查看一下 CustomHTTPProtocol 中对 HTTP 响应处理的代码，也就是 NSURLSessionDelegate 协议实现的部分。
 
 　　client 你可以理解为当前网络请求的发起者，所有的 client 都实现了 NSURLProtocolClient 协议，协议的作用就是在 HTTP 请求发出以及接受响应时向其它对象传输数据：
 */

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error != nil) {
        [self.client URLProtocol:self didFailWithError:error];
    }else
    {
        [self.client URLProtocolDidFinishLoading:self];
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    [self.client URLProtocol:self didLoadData:data];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask willCacheResponse:(NSCachedURLResponse *)proposedResponse completionHandler:(void (^)(NSCachedURLResponse * _Nullable))completionHandler
{
    completionHandler(proposedResponse);
}

//TODO: 重定向
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)newRequest completionHandler:(void (^)(NSURLRequest *))completionHandler
{
    NSMutableURLRequest*    redirectRequest;
    redirectRequest = [newRequest mutableCopy];
    [[self class] removePropertyForKey:RichURLProtocolHandledKey inRequest:redirectRequest];
    [[self client] URLProtocol:self wasRedirectedToRequest:redirectRequest redirectResponse:response];
    
    [self.task cancel];
    [[self client] URLProtocol:self didFailWithError:[NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil]];
}

//- (instancetype)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id<NSURLProtocolClient>)client
//{
//    
//    NSMutableURLRequest*    redirectRequest;
//    redirectRequest = [request mutableCopy];
//    
//    //添加认证信息
//    NSString *authString = [[[NSString stringWithFormat:@"%@:%@", kGlobal.userInfo.sAccount, kGlobal.userInfo.sPassword] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
//    authString = [NSString stringWithFormat: @"Basic %@", authString];
//    [redirectRequest setValue:authString forHTTPHeaderField:@"Authorization"];
//    NSLog(@"拦截的请求:%@",request.URL.absoluteString);
//    
//    self = [super initWithRequest:redirectRequest cachedResponse:cachedResponse client:client];
//    if (self) {
//        
//        // Some stuff
//    }
//    return self;
//}

//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
//
//    NSLog(@"自定义Protocol开始认证...");
//    NSString *authMethod = [[challenge protectionSpace] authenticationMethod];
//    NSLog(@"%@认证...",authMethod);
//
//    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//        NSURLCredential *card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
//        completionHandler(NSURLSessionAuthChallengeUseCredential,card);
//    }
//
//    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodNTLM]) {
//        if ([challenge previousFailureCount] == 0) {
//            NSURLCredential *credential = [NSURLCredential credentialWithUser:kGlobal.userInfo.sAccount password:kGlobal.userInfo.sPassword persistence:NSURLCredentialPersistenceForSession];
//            [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
//            completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//        }else{
//            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge,nil);
//        }
//    }
//
//    NSLog(@"自定义Protocol认证结束");
//}


@end
