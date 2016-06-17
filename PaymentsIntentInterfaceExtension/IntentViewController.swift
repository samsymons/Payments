//
//  IntentViewController.swift
//  PaymentsIntentInterfaceExtension
//
//  Created by Sam Symons on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - INUIHostedViewControlling
  
  func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
    if let completion = completion {
      completion(self.desiredSize)
    }
  }
  
  /// Siri should always use the largest possible size here. This makes it
  /// easy for us to display our UI, since we don't need to do any height
  /// calculation of any kind. Auto Layout in the returned view controller
  /// will make sure that everything looks good.
  var desiredSize: CGSize {
    return self.extensionContext!.hostedViewMaximumAllowedSize
  }
  
}
