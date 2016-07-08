//
//  IntentViewController.swift
//  PaymentsIntentInterfaceExtension
//
//  Created by Sam Symons on 15/06/16.
//  Copyright © 2016 Sam Symons. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
  @IBOutlet var avatarView: UIView!
  @IBOutlet var nameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    avatarView.layer.cornerRadius = 40
    avatarView.layer.masksToBounds = true
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.bounds = self.view.bounds
    gradientLayer.position = self.view.layer.position
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    gradientLayer.colors = [#colorLiteral(red: 0, green: 0.2705882353, blue: 0.4862745098, alpha: 1), #colorLiteral(red: 0, green: 0.4745098039, blue: 0.7568627451, alpha: 1)].map { $0.cgColor }
    
    self.view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  // MARK: - INUIHostedViewControlling
  
  func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
    if let sendIntent = interaction.intent as? INSendPaymentIntent {
      if let payee = sendIntent.payee {
        nameLabel.text = payee.displayName
      }
      
      completion(self.desiredSize)
    }
    else {
      completion(self.desiredSize)
    }
  }
  
  /// Siri should always use the largest possible size here. This makes it
  /// easy for us to display our UI, since we don't need to do any height
  /// calculation of any kind. Auto Layout in the returned view controller
  /// will make sure that everything looks good.
  var desiredSize: CGSize {
    return self.extensionContext!.hostedViewMinimumAllowedSize
  }
  
}
