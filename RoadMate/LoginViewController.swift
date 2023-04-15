//
//  ViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 12/04/23.
//

import UIKit
import AVKit

class LoginViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.text = "usertest@gmail.com"
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.text = "PasswordTest"
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
     
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newRootViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
        self.window?.rootViewController = newRootViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackgroundVideo()
    }

    func loadBackgroundVideo() {
        guard let path = Bundle.main.path(forResource: "roadMateVideo", ofType: "mp4") else { return }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerView.layer.addSublayer(playerLayer)
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        player.play()
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
    }
}

