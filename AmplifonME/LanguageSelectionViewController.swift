//
//  ViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/1/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class LanguageSelectionViewController: UIViewController {
    
    let buttonWidth = 150
    let buttonHeight = 50
    
    let background: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "bg_main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let englishButton: UIButton = {
        let image = UIImage(named: "button_bg_english")
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        return button
    }()
    
    let arabicButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "button_bg_arabic")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // Adding the background image
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            background.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0),
            background.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            background.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 0)])
        
        // Adding the English button
        view.addSubview(englishButton)
        NSLayoutConstraint.activate([
            englishButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
            englishButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeight)),
            englishButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            englishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
        
        // Adding the Arabic button
        view.addSubview(arabicButton)
        NSLayoutConstraint.activate([
            arabicButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
            arabicButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeight)),
            arabicButton.topAnchor.constraint(equalTo: englishButton.topAnchor),
            arabicButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

