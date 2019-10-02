//
//  ViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/1/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class LanguageSelectionViewController: BackgroundViewController {
    
    let buttonWidth = 150
    let buttonHeight = 50
    
    let logoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "logo_big")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let englishButton: UIButton = {
        let image = UIImage(named: "button_bg_english")
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(englishSelected), for: .touchUpInside)
        return button
    }()
    
    let arabicButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "button_bg_arabic")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(arabicSelected), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        // Adding the Logo ImageView
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)])
        
        // Adding the English button
        view.addSubview(englishButton)
        NSLayoutConstraint.activate([
            englishButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
            englishButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeight)),
            englishButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 175),
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

    @objc func englishSelected() {
        selected(language: "en")
    }
    
    @objc func arabicSelected() {
        selected(language: "ar")
    }
    
    func selected(language code: String) {
        UserDefaults.standard.set(code, forKey: "SelectedLanguage")
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
