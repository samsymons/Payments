//
//  SendPaymentIntentHandler.swift
//  Payments
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Intents

class SendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling {
  // MARK: - INSendPaymentIntentHandling
  
  func handle(sendPayment intent: INSendPaymentIntent, completion: (INSendPaymentIntentResponse) -> Swift.Void) {
    if intent.payee != nil && intent.currencyAmount != nil {
      completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
    }
    else {
      completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
    }
  }
}
