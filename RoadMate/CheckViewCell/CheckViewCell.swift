//
//  CheckViewCell.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 13/04/23.
//

import UIKit

class CheckViewCell: UICollectionViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(imageName: String, cellName: String) {
        cellTitle.text = cellName
        
        if let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }

}
