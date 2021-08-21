//
//  ReactNativeEventEmitter.swift
//  ImpactPOCProject
//
//  Created by Akash on 21/08/21.
//

import Foundation
import React



@objc(ReactNativeEventEmitter)
open class ReactNativeEventEmitter: RCTEventEmitter {
  
  public static var emitter: ReactNativeEventEmitter?
    override init() {
        super.init()
//        EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
      ReactNativeEventEmitter.emitter = self
    }
    
  @objc override public static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
//    @objc open override func supportedEvents() -> [String] {
//        return EventEmitter.sharedInstance.allEvents
//    }
  
  


    open override func supportedEvents() -> [String] {
      ["Test", "onPending", "onFailure"]      // etc.
    }
    
}
