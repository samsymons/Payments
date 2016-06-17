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
}

