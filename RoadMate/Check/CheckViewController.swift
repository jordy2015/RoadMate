//
//  CheckViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 13/04/23.
//

import UIKit

class CheckViewController: UIViewController {
    
    private var vehicleSelected: Vehicle?
    
    let carSection: CheckView = {
        let view = CheckView()
        return view.loadViewFromXib(withClassName: CheckView.self)
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let sectionOne: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        let checkView = CheckView().loadViewFromXib(withClassName: CheckView.self)
        checkView.sectionTitle.text = "Automovil"
        checkView.data = Data.default.getCarData()
        view.addSubview(checkView)
        checkView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        checkView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        checkView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        checkView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()

    let sectionTwo: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        let checkView = CheckView().loadViewFromXib(withClassName: CheckView.self)
        checkView.data = Data.default.getMotoData()
        checkView.sectionTitle.text = "Motocicleta"
        view.addSubview(checkView)
        checkView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        checkView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        checkView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        checkView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return view
    }()

    let sectionThree: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        let checkView = CheckView().loadViewFromXib(withClassName: CheckView.self)
        checkView.sectionTitle.text = "Trailer"
        checkView.data = Data.default.getTrailerData()
        view.addSubview(checkView)
        checkView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        checkView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        checkView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        checkView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vehicle = self.vehicleSelected {
            (segue.destination as? ServicesViewController)?.serviceType = vehicle.supportType
            self.vehicleSelected = nil
        }
    }

    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(sectionOne)
        sectionOne.subviews.forEach { subView in
            if let subV = subView as? CheckView {
                subV.delegate = self
            }
        }
        scrollViewContainer.addArrangedSubview(sectionTwo)
        sectionTwo.subviews.forEach { subView in
            if let subV = subView as? CheckView {
                subV.delegate = self
            }
        }
        scrollViewContainer.addArrangedSubview(sectionThree)
        sectionThree.subviews.forEach { subView in
            if let subV = subView as? CheckView {
                subV.delegate = self
            }
        }
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}

extension CheckViewController: CheckViewProtocol {
    func didTapOnCell(vehicle: Vehicle) {
        vehicleSelected = vehicle
        performSegue(withIdentifier: "SegueToService", sender: nil)
    }
}
