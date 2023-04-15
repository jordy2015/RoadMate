//
//  CheckView.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 13/04/23.
//

import UIKit

class CheckView: UIView {

    @IBOutlet weak var sectionTitle: UILabel!
    weak var delegate: CheckViewProtocol?
    
    var data: [Vehicle] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CheckViewCell", bundle: nil), forCellWithReuseIdentifier: "CheckViewCell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
}

extension CheckView: UICollectionViewDelegate {
    
}

extension CheckView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckViewCell", for: indexPath) as! CheckViewCell
        let object = data[indexPath.row]
        cell.configureCell(imageName: object.imageName, cellName: object.supportTitle)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = data[indexPath.row]
        delegate?.didTapOnCell(vehicle: object)
    }
}

extension CheckView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height - 10
        let width = height * 0.80
        return CGSize(width: width, height: height)
    }
}
