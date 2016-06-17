//
//  AppDelegate.swift
//  Payments
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import UIKit
import Intents
import PaymentsCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func applicationDidFinishLaunching(_ application: UIApplication) {
    let names = PaymentsContact.allContacts().map { $0.name }
    INVocabulary.shared().setVocabularyStrings(OrderedSet(array: names), of: .contactName)
  }
  
  func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
    if let userInfo = userActivity.userInfo, let _ = userActivity.interaction {
      let value = userInfo["currencyAmount"]
      print("Continuing payments with currency amount: \(value)")
    }
    
    return true
  }
}

