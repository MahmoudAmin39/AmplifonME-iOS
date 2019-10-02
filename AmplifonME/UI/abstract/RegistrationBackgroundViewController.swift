//
//  RegistrationBackgroundViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/2/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class RegistrationBackgroundViewController: BackgroundViewController {
    
    let boxImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_login")
        return imageView
    }()

    override func loadView() {
        super.loadView()
        // Adding the box view
        view.addSubview(boxImageView)
        NSLayoutConstraint.activate([boxImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 146),             boxImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -146),
             boxImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             boxImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
