//
//  IntentViewController.swift
//  PaymentsIntentInterfaceExtension
//
//  Created by Symons, Sam(AWF) on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

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
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
}
