//
//  IntentHandler.swift
//  PaymentsIntentExtension
//
//  Created by Sam Symons on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
  
  /// This is a basic handler to verify that we can handle the intent correctly.
  /// We don't need to do anything more than check the intent type here, and
  /// instantiate the true payment handler if the type is correct.
  override func handler(for intent: INIntent) -> AnyObject? {
    if intent is INSendPaymentIntent {
      return SendPaymentIntentHandler()
    }
    
    return nil
  }
  
}
