//
//  RegistrationBackgroundViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/2/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class RegistrationBackgroundViewController: BackgroundWithLogoViewController {
    
    var imageName: String?
    
    let boxImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_login")
        return imageView
    }()
    
    var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func loadView() {
        super.loadView()
        // Adding the box view
        view.addSubview(boxImageView)
        NSLayoutConstraint.activate([boxImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 146),             boxImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -184),
             boxImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             boxImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)])
        
        // Adding the ImageView
        view.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.topAnchor.constraint(equalTo: boxImageView.topAnchor, constant: -20)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = imageName {
            self.imageView.image = UIImage(named: imageName)
        }
    }
}
