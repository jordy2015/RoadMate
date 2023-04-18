//
//  TutorialsViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 4/17/23.
//

import UIKit
import SnapKit

class TutorialsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    fileprivate let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.bounces = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tutorialStep1: TutorialView = {
        let view = TutorialView()
        return view.loadViewFromXib(withClassName: TutorialView.self)
    }()
    
    let tutorialStep2: TutorialView = {
        let view = TutorialView()
        return view.loadViewFromXib(withClassName: TutorialView.self)
    }()
    
    let tutorialStep3: TutorialView = {
        let view = TutorialView()
        return view.loadViewFromXib(withClassName: TutorialView.self)
    }()
    
    let tutorialStep4: TutorialView = {
        let view = TutorialView()
        return view.loadViewFromXib(withClassName: TutorialView.self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margins = view.layoutMarginsGuide
        contentView.addSubview(scrollView)
        scrollView.addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(tutorialStep1)
        stackViewContainer.addArrangedSubview(tutorialStep2)
        stackViewContainer.addArrangedSubview(tutorialStep3)
        stackViewContainer.addArrangedSubview(tutorialStep4)
        
         scrollView.snp.makeConstraints { make in
             make.leading.trailing.equalTo(contentView)
             make.top.bottom.equalTo(margins)
         }
         
         stackViewContainer.snp.makeConstraints { make in
             make.top.bottom.leading.trailing.height.equalTo(scrollView)
         }
         
        tutorialStep1.snp.makeConstraints { make in
             make.width.equalTo(contentView)
         }
         
        tutorialStep2.snp.makeConstraints { make in
             make.width.equalTo(contentView)
         }
        
        tutorialStep3.snp.makeConstraints { make in
             make.width.equalTo(contentView)
         }
         
        tutorialStep4.snp.makeConstraints { make in
             make.width.equalTo(contentView)
         }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
