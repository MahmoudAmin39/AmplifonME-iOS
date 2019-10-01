//
//  ViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/1/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class LanguageSelectionViewController: UIViewController {
    
    let background: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "bg_main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let englishButton: UIButton = {
        let frames = CGRect(x: 0, y: 0, width: 120, height: 40)
        let image = UIImage(named: "button_bg_english")
        var button = UIButton(frame: frames)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        return button
    }()
    
    let arabicButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "button_bg_arabic")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
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
            englishButton.widthAnchor.constraint(equalToConstant: 120),
            englishButton.heightAnchor.constraint(equalToConstant: 40),
            englishButton.topAnchor.constraint(equalToSystemSpacingBelow: background.topAnchor, multiplier: 100),
            englishButton.leadingAnchor.constraint(equalToSystemSpacingAfter: background.leadingAnchor, multiplier: 100)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

