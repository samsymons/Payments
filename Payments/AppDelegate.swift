//
//  AppDelegate.swift
//  Payments
//
//  Created by Sam Symons on 15/06/16.
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
    if let interaction = userActivity.interaction, let intent = interaction.intent as? INSendPaymentIntent, let payee = intent.payee {
      print("Paying \(payee.displayName) \(intent.currencyAmount!.amount!)")
    }
    
    return true
  }
}

