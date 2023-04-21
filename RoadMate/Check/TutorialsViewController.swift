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
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 1, image: UIImage(named: "frontToFront")!, title: "Poner ambos vehiculos de frente", descrip: "Alínea ambos vehículos para que las baterías estén los más cerca posible entre sí. Las baterías comúnmente se encuentran cerca del motor")
        return tutorialView
    }()
    
    let tutorialStep2: TutorialView = {
        let view = TutorialView()
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 2, image: UIImage(named: "poloPositivo")!, title: "A: Ubicar y conectar polo positivo", descrip: "Ubica el polo positivo en el vehículo sin corriente y coloca el cable positivo (rojo).")
        return tutorialView
    }()
    
    let tutorialStep3: TutorialView = {
        let view = TutorialView()
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 3, image: UIImage(named: "poloPostivitoB")!, title: "B: Ubicar y conectar polo positivo", descrip: "Coloca el otro extremo del cable rojo en el polo positivo de la batería del auto con carga.")
        return tutorialView
    }()
    
    let tutorialStep4: TutorialView = {
        let view = TutorialView()
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 4, image: UIImage(named: "poloNegativo")!, title: "A: Ubicar y conectar polo Negativo", descrip: "Ubica el polo negativo en la batería que brindará corriente y coloca el cable negro.")
        return tutorialView
    }()
    
    let tutorialStep5: TutorialView = {
        let view = TutorialView()
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 5, image: UIImage(named: "poloNegativoB")!, title: "B: Ubicar y conectar polo Negativo", descrip: "Sitúa el otro extremo del cable negativo (negro) en alguna parte metálica del vehículo sin corriente, ya sea el propio motor o la carrocería.")
        return tutorialView
    }()
    
    let tutorialStep6: TutorialView = {
        let view = TutorialView()
        let tutorialView = view.loadViewFromXib(withClassName: TutorialView.self)
        tutorialView.setText(step: 6, image: UIImage(named: "startEngine")!, title: "Encender Vehiculo sin corriente", descrip: "Enciende el vehículo sin corriente. Permite que el motor trabaje varios minutos para que el alternador pueda cargar la batería. ")
        return tutorialView
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
        stackViewContainer.addArrangedSubview(tutorialStep5)
        stackViewContainer.addArrangedSubview(tutorialStep6)
        
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
        
        tutorialStep5.snp.makeConstraints { make in
             make.width.equalTo(contentView)
        }
         
        tutorialStep6.snp.makeConstraints { make in
             make.width.equalTo(contentView)
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
