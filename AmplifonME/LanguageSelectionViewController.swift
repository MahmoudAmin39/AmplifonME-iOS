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
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        // Adding the English button
        view.addSubview(englishButton)
        NSLayoutConstraint.activate([
            englishButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
            englishButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeight)),
            englishButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            englishButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25)])
        
        // Adding the Arabic button
        view.addSubview(arabicButton)
        NSLayoutConstraint.activate([
            arabicButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
            arabicButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeight)),
            arabicButton.topAnchor.constraint(equalTo: englishButton.topAnchor),
            arabicButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

