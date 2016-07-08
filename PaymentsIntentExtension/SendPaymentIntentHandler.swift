//
//  SendPaymentIntentHandler.swift
//  Payments
//
//  Created by Sam Symons on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Intents
import PaymentsCore

class SendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling {
  let paymentThreshold: Int = 50
  
  // MARK: - INSendPaymentIntentHandling
  
  func handle(sendPayment intent: INSendPaymentIntent, completion: (INSendPaymentIntentResponse) -> Swift.Void) {
    if let _ = intent.payee, let currencyAmount = intent.currencyAmount {
      if Int(currencyAmount.amount!) >= paymentThreshold {
        let userActivity = NSUserActivity()
        userActivity.userInfo = ["currencyAmount": Int(currencyAmount.amount!)]
        
        // By providing a userActivity to the intent response, Siri will open
        // up the app and continue the payment there. This is handled by a delegate
        // method in AppDelegate.swift.
        completion(INSendPaymentIntentResponse.init(code: .success, userActivity: userActivity))
      }
      else {
        completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
      }
    }
    else {
      completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
    }
  }
  
  /// This function takes what Siri believes to be the intended recipient of the
  /// payment and determines whether it is valid or not. Here, the app needs to
  /// check the payee against the list of contacts and determine whether there
  /// is a match. It also needs to make sure that multiple contacts don't match
  /// the name. If so, it passes back the `disambiguation` option.
  func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: (INPersonResolutionResult) -> Swift.Void) {
    if let payee = intent.payee {
      let contacts = PaymentsContact.allContacts()
      var resolutionResult: INPersonResolutionResult?
      var matchedContacts: [PaymentsContact] = []
      
      for contact in contacts {
        print("Checking '\(contact.name)' against '\(payee.displayName)'")
        
        if contact.name == payee.displayName {
          matchedContacts.append(contact)
        }
      }
      
      switch matchedContacts.count {
      case 2 ... Int.max:
        let disambiguationOptions: [INPerson] = matchedContacts.map { contact in
          return contact.inPerson()
        }
        
        resolutionResult = INPersonResolutionResult.disambiguation(with: disambiguationOptions)
      case 1:
        let recipientMatched = matchedContacts[0].inPerson()
        print("Matched a recipient: \(recipientMatched.displayName)")
        resolutionResult = INPersonResolutionResult.success(with: recipientMatched)
      default:
        break
      }
      
      completion(resolutionResult!)
    } else {
      completion(INPersonResolutionResult.needsValue())
    }
  }
  
}
