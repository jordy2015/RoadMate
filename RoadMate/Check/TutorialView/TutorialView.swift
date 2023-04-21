//
//  TutorialView.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 4/17/23.
//

import UIKit

class TutorialView: UIView {
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var exampleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setText(step: Int, image: UIImage, title: String, descrip: String) {
        stepLabel.text = "Paso No. \(step)"
        exampleImage.image = image
        titleLabel.text = title
        descriptionText.text = descrip
    }
}
