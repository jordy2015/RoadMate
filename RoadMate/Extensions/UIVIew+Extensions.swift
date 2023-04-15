//
//  UIVIew+Extensions.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 13/04/23.
//
import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        
        mask.path = path.cgPath
        clipsToBounds = true
        layer.mask = mask
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.maskedCorners = corners
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
    }
    
    func roundCorners(corners:CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func round(_ radius: CGFloat, _ borderColor: UIColor, _ borderWidth: CGFloat) {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
        layer.masksToBounds = true
    }
    
    func loadViewFromXib(withClassName className: AnyClass) -> Self {
        let bundleName = Bundle(for: className)
        let nibName = String(describing: className)
        let nib = UINib(nibName: nibName, bundle: bundleName)
        let viewFromNib = nib.instantiate(withOwner: nil, options: nil).first as! Self
        return viewFromNib
    }
}
