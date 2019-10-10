//
//  BackgroundWithLogoViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/10/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class BackgroundWithLogoViewController: BackgroundViewController {
    
    let logoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_small")
        return imageView
    }()
    
    override func loadView() {
        super.loadView()
        // Adding the logo imageView
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
             logoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
             logoImageView.widthAnchor.constraint(equalToConstant: 128),
             logoImageView.heightAnchor.constraint(equalToConstant: 30)])
    }
}
