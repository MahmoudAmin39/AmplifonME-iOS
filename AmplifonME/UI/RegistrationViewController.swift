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
        label.textColor = UIColor(named: "jazzberry_jam")
        return label
    }()
    
    let phoneNumberText: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        if Settings.shared.appLanguage == "ar" {
            textField.textAlignment = NSTextAlignment.right
        } else if Settings.shared.appLanguage == "en" {
            textField.textAlignment = NSTextAlignment.left
        }
        let attributedPlaceholder = NSAttributedString(string: "Phone_No".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "jazzberry_jam") ?? .red])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textColor = UIColor(named: "jazzberry_jam")
        textField.background = UIImage(named: "bg_text_field")
        return textField
    }()
    
    let textLabel: UILabel = {
        var textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = UIColor(named: "jungle_green")
        textLabel.text = "notAmember".localized()
        return textLabel
    }()
    
    let guestTextLabel: UILabel = {
        var textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "guestLogin".localized()
        textLabel.textColor = UIColor(named: "jazzberry_jam")
        // Register Tap event
        textLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToHome))
        tapGesture.numberOfTapsRequired = 1
        textLabel.addGestureRecognizer(tapGesture)
        return textLabel
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
        // Adding the StackView
        let stackView = UIStackView(arrangedSubviews: [textLabel, guestTextLabel])
        stackView.setCustomSpacing(CGFloat(integerLiteral: 4), after: textLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = true
        view.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 100)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func register() {
        do {
            let phoneNumber = try checkPhoneNumber()
            let otpVC = OTPViewController()
            otpVC.imageName = "image_verify"
            otpVC.phoneNumber = phoneNumber
            navigationController?.pushViewController(otpVC, animated: true)
        } catch let error {
            var message = ""
            if let error = error as? PhoneNumberError {
                switch error {
                case .notANumber:
                    message = "notANumber".localized()
                case .firstThreeDigitsWrong:
                    message = "firstThreeDigitsWrong".localized()
                case .notElevenDigits:
                    message = "notElevenDigits".localized()
                }
            }
            let alertViewController  = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok".localized(), style: .default)
            alertViewController.addAction(alertAction)
            present(alertViewController, animated: true, completion: nil)
        }
    }
    
    func checkPhoneNumber() throws -> String {
        if let phoneNumber = phoneNumberText.text {
            guard Int(phoneNumber) != nil else {
                throw PhoneNumberError.notANumber
            }
            if phoneNumber.count != 11 {
                throw PhoneNumberError.notElevenDigits
            }
            let firstThreeDigits = phoneNumber.prefix(3).description
            if !(firstThreeDigits == "010" || firstThreeDigits == "011" || firstThreeDigits == "012" || firstThreeDigits == "015") {
                throw PhoneNumberError.firstThreeDigitsWrong
            }
            return phoneNumber
        } else {
            throw PhoneNumberError.notANumber
        }
    }
    
    @objc func goToHome() {
        print("Label pressed")
        navigationController?.pushViewController(BackgroundWithLogoViewController(), animated: true)
    }
}

enum PhoneNumberError: Error {
    case notANumber
    case firstThreeDigitsWrong
    case notElevenDigits
}
