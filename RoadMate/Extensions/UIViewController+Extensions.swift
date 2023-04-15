//
//  UIViewController+Extensions.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 13/04/23.
//

import UIKit

extension UIViewController {
    var window: UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
               return window
    }
}
