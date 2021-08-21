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
  
  let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
  var vch : ViewController? = nil
 
  
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc func showNativeController(_ data:String) -> Void {
    let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
    DispatchQueue.main.async {
      guard let vc = storyboard.instantiateViewController(withIdentifier: "homeView") as? ViewController else {
        return print("no story board")
      }
      self.vch = vc
      vc.data = data
      (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
    }
  
  }
  
  
  
  @objc func setLocation(_ lat:Double,longt:Double,speed:Double) -> Void {
  
    DispatchQueue.main.async {
      guard let vc = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController as? ViewController else {
        return
      }
     
      let location = LocationPoint(lat: lat, long: longt, speed:speed, accuracy: nil, timeStamp: nil)
      vc.locationsP.append(location)
      DispatchQueue.main.async {
        vc.tableView.reloadData()
      }
      
    }
  
  }
  
  @objc func callbackFunction(_ id1:Int,completionHandler: ([Int]) -> Void){
     completionHandler([id1 + 10])
  }
  
  @objc func getName(_ successCallback:RCTResponseSenderBlock) { // Assume name comes from the any native API side
      successCallback(["SWIFT native Module"])
    }
  
  @objc func consolelog(){
     print("some *********** 0000")
  }
  
}
