//
//  ViewController.swift
//  Weather
//
//  Created by Mehdi Abdi on 3/14/20.
//  Copyright © 2020 Mehdi Abdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var uIElement = UIElement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uIElement.setUpBackgroundImage)
        view.addSubview(uIElement.backgroundBlur)
        view.addSubview(uIElement.imageCondition)
        view.addSubview(uIElement.LTStackView)
        
        setUpBGConstraint()
        setUpBlurConstraint()
        setUpConditionImageConstraint()
        setUpTLStackView()
    }
    
// MARK: - Set up constraints view
    func setUpBGConstraint() {
        uIElement.setUpBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        uIElement.setUpBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        uIElement.setUpBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        uIElement.setUpBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setUpBlurConstraint() {
        uIElement.backgroundBlur.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        uIElement.backgroundBlur.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        uIElement.backgroundBlur.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        uIElement.backgroundBlur.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setUpConditionImageConstraint() {
        uIElement.imageCondition.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        uIElement.imageCondition.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        uIElement.imageCondition.heightAnchor.constraint(equalToConstant: 240).isActive = true
        uIElement.imageCondition.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    func setUpTLStackView() {
        uIElement.LTStackView.addArrangedSubview(uIElement.locationLabel)
        uIElement.LTStackView.addArrangedSubview(uIElement.temperatureLabel)
        
        uIElement.LTStackView.topAnchor.constraint(equalTo: uIElement.imageCondition.bottomAnchor, constant: 50).isActive = true
        uIElement.LTStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        uIElement.LTStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
}

