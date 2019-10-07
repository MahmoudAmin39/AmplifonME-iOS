//
//  RegistrationViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/2/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class RegistrationViewController: RegistrationBackgroundViewController {
    
    let registrationButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "button_registration"), for: .normal)
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        return button
    }()
    
    let loginLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login".localized()
        label.textColor = .black
        return label
    }()
    
    let phoneNumberText: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone_No".localized()
        textField.background = UIImage(named: "bg_text_field")
        return textField
    }()
    
    override func loadView() {
        super.loadView()
        // Adding the Login label
        view.addSubview(loginLabel)
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 96),
            loginLabel.leadingAnchor.constraint(equalTo: boxImageView.leadingAnchor, constant: 32)])
        // Adding the TextField
        view.addSubview(phoneNumberText)
        NSLayoutConstraint.activate([phoneNumberText.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            phoneNumberText.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            phoneNumberText.trailingAnchor.constraint(equalTo: boxImageView.trailingAnchor, constant: -32),
            phoneNumberText.heightAnchor.constraint(equalToConstant: 56)])
        // Adding the Registration button
        view.addSubview(registrationButton)
        NSLayoutConstraint.activate([registrationButton.topAnchor.constraint(equalTo: phoneNumberText.bottomAnchor, constant: 56),
            registrationButton.leadingAnchor.constraint(equalTo: phoneNumberText.leadingAnchor),
            registrationButton.trailingAnchor.constraint(equalTo: phoneNumberText.trailingAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 56)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func register() {
        let otpVC = OTPViewController()
        otpVC.imageName = "image_verify"
        navigationController?.pushViewController(otpVC, animated: true)
    }
}
