//
//  ViewController.swift
//  Weather
//
//  Created by Mehdi Abdi on 3/14/20.
//  Copyright © 2020 Mehdi Abdi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var uIElement = UIElement()
    var weatherService = WeatherService()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        weatherService.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
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

// MARK: - Location Manager Delegate Extension

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude =  location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            weatherService.fetchBaseURLKey(lat: latitude, lon: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

// MARK: - WeatherService Delegate Extension

extension ViewController: WeatherServiceDelegate {
    func didUpdateWeatherKey(_ data: WGeoPositionData) {
        weatherService.fetchBaseURLCondition(key: data.key)
        
        DispatchQueue.main.async {
            self.uIElement.locationLabel.text = data.localizedName
        }
    }
    
    func didUpdateWeatherCondition(_ data: WCurrentConditionData) {
        DispatchQueue.main.async {
            self.uIElement.temperatureLabel.text = data.temperatureInString
            self.uIElement.imageCondition.image = UIImage(named: data.imageCondition)
        }
    }
    
    func didFaildWithError(_ error: Error) {
        print(error)
    }
}
