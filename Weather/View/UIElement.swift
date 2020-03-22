//
//  UIElement.swift
//  Weather
//
//  Created by Mehdi Abdi on 3/18/20.
//  Copyright © 2020 Mehdi Abdi. All rights reserved.
//

import UIKit

class UIElement {
    // Set up image for background
    let setUpBackgroundImage: UIImageView = {
        let bgImage = UIImageView()
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.image = UIImage(named: "Background.jpg")
        bgImage.contentMode = .scaleAspectFill
        
        return bgImage
    }()
    
    // Create blur for background image
    let backgroundBlur: UIVisualEffectView = {
        let bgBlur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        bgBlur.translatesAutoresizingMaskIntoConstraints = false
        
        return bgBlur
    }()
    
    // Create image condition
    var imageCondition: UIImageView = {
        var imagecondition = UIImageView()
        imagecondition.translatesAutoresizingMaskIntoConstraints = false
        imagecondition.image = UIImage(named: "cloud.png")
        imagecondition.contentMode = .scaleAspectFit
        
        return imagecondition
    }()
    
    // Create temperature label
    var temperatureLabel: UILabel = {
        var temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.systemFont(ofSize: 40)
        temp.textAlignment = .center
        temp.textColor = UIColor(named: "textColor")
        temp.text = "00"
        
        return temp
    }()
    // Create location label
    var locationLabel: UILabel = {
        var location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.textAlignment = .center
        location.font = UIFont.systemFont(ofSize: 40)
        location.textColor = UIColor(named: "textColor")
        location.text = "Location"
        
        return location
    }()
    
    // Create stack view for location and temperature label
    let LTStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 50
        
        return stackView
    }()
}
