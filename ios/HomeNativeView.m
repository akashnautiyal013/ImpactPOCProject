//
//  HomeNativeView.m
//  ImpactPOCProject
//
//  Created by Akash on 17/08/21.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>




@interface RCT_EXTERN_MODULE(HomeNativeView, NSObject)

//RCT_EXPORT_MODULE(HomeNativeView);
RCT_EXTERN_METHOD(showNativeController:(NSString *)data)
RCT_EXTERN_METHOD(setLocation:(NSNumber *)lat longt:(NSNumber *)longt speed:(NSNumber *)speed)
RCT_EXTERN_METHOD(getName: (RCTResponseSenderBlock *)successCallback)
@end


