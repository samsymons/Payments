//
//  SendPaymentIntentHandler.swift
//  Payments
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Intents
import PaymentsCore

class SendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling {
  // MARK: - INSendPaymentIntentHandling
  
  func handle(sendPayment intent: INSendPaymentIntent, completion: (INSendPaymentIntentResponse) -> Swift.Void) {
    if let _ = intent.payee, let _ = intent.currencyAmount {
      completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
    }
    else {
      completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
    }
  }
  
  func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: (INPersonResolutionResult) -> Swift.Void) {
    if let payee = intent.payee {
      let contacts = PaymentsContact.allContacts()
      var resolutionResult: INPersonResolutionResult?
      var matchedContacts: [PaymentsContact] = []
      
      print(contacts)
      
      for contact in contacts {
        print("Checking '\(contact.name)' against '\(payee.displayName)'")
        
        if contact.name == payee.displayName {
          matchedContacts.append(contact)
        }
      }
      
      switch matchedContacts.count {
      case 2 ... Int.max:
        completion(INPersonResolutionResult.needsValue())
        
        /*
        let disambiguationOptions: [INPerson] = matchingContacts.map { contact in
          return contact.inPerson()
        }
        
        resolutionResult = INPersonResolutionResult.disambiguation(with: disambiguationOptions)
         */
      case 1:
        let recipientMatched = matchedContacts[0].inPerson()
        print("Matched a recipient: \(recipientMatched.displayName)")
        resolutionResult = INPersonResolutionResult.success(with: recipientMatched)
      case 0:
        print("This is unsupported")
        resolutionResult = INPersonResolutionResult.unsupported(with: INIntentResolutionResultUnsupportedReason.none)
      default:
        break
      }
      
      completion(resolutionResult!)
    } else {
      completion(INPersonResolutionResult.needsValue())
    }
  }
}
