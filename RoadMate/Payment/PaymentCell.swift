//
//  PaymentCell.swift
//  Community
//
//  Created by Jordy Gonzalez on 11/2/19.
//  Copyright © 2019 Jordy Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class PaymentCell: UITableViewCell {
  
  @IBOutlet weak var providerLogo: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var tarjetNum: UILabel!
  @IBOutlet weak var dateE: UILabel!
  
  override class func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func setupUI(isVisa: Bool) {
      if isVisa {
          providerLogo.image = UIImage(named: "visa")
      } else {
          providerLogo.image = UIImage(named: "mastercard")
      }
  }
  
}
