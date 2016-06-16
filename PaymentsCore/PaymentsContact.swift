//
//  PaymentsContact.swift
//  Payments
//
//  Created by Sam Symons on 16/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import Foundation
import Intents

public class PaymentsContact {
  public let name: String
  public let emailAddress: String
  
  public init(name: String, emailAddress: String) {
    self.name = name
    self.emailAddress = emailAddress
  }
  
  public func inPerson() -> INPerson {
    let nameFormatter = PersonNameComponentsFormatter()
    
    if let nameComponents = nameFormatter.personNameComponents(from: name) {
      return INPerson(handle: emailAddress, nameComponents: nameComponents, contactIdentifier: nil)
    }
    else {
      return INPerson(handle: emailAddress, displayName: name, contactIdentifier: nil)
    }
  }
  
  public class func allContacts() -> [PaymentsContact] {
    return [
      PaymentsContact(name: "Tim Cook", emailAddress: "tim@apple.com"),
      PaymentsContact(name: "Craig Federighi", emailAddress: "craig@apple.com"),
      PaymentsContact(name: "Phil Schiller", emailAddress: "phil@apple.com"),
    ]
  }
}
