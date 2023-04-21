//
//  TutorialsPlayerViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 4/17/23.
//

import UIKit
import AVKit

class TutorialsPlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "checkCarburador", ofType: "mp4") else { return }
        let tutorialsPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        self.player = tutorialsPlayer
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.player?.play()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        
    }

}
