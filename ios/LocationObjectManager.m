//
//  LocationObjectManager.m
//  ImpactPOCProject
//
//  Created by Akash on 18/08/21.
//

#import <Foundation/Foundation.h>

NSArray *imageList = @[@"http://foo.com/bar1.png",
                       @"http://foo.com/bar2.png"];

NSDictionary *props = @{@"images" : imageList};

RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                 moduleName:@"ImageBrowserApp"
                                          initialProperties:props];
