//
//  BackgroundViewController.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/2/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    let background: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "bg_main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
