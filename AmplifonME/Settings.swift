//
//  Settings.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/7/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

struct Settings {
    
    static var shared = Settings()
    
    var appLanguage: String {
        didSet {
            if appLanguage == "ar" {
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            } else if appLanguage == "en" {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            }
        }
    }
    
    init() {
        self.appLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage") ?? "en"
    }
}
