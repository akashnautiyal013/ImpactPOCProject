//
//  HomeView.swift
//  ImpactPOCProject
//
//  Created by Akash on 17/08/21.
//


import Foundation
import UIKit
@objc(HomeNativeView)


class HomeNativeView:NSObject, RCTBridgeModule {
  static func moduleName() -> String! {
    return "HomeNativeView"
  }
  
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc func showNativeController(_ data:String) -> Void {
    let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
    DispatchQueue.main.async {
      guard let vc = storyboard.instantiateViewController(withIdentifier: "homeView") as? ViewController else {
        return print("no story board")
      }
      
      vc.data = data
      (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
    }
  
  }
  
  
  
  @objc func setLocation(_ lat:Double,longt:Double,speed:Double) -> Void {
    let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
    DispatchQueue.main.async {
      guard let vc = storyboard.instantiateViewController(withIdentifier: "homeView") as? ViewController else {
        return print("no story board")
      }
      let location = LocationPoint(lat: lat, long: longt, speed:speed, accuracy: nil, timeStamp: nil)
       vc.locationsP.append(location)
    }
  
  }
  
  
}
