//
//  ViewController.swift
//  Payments
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    INPreferences.requestSiriAuthorization() { (status) in
      print("New status: \(status)")
    }
  }
}
