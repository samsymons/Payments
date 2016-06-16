//
//  IntentHandler.swift
//  PaymentsIntentExtension
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
  override func handler(for intent: INIntent) -> AnyObject? {
    if intent is INSendPaymentIntent {
      return SendPaymentIntentHandler()
    }
    
    return nil
  }
}
