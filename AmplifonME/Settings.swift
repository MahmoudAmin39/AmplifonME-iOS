//
//  Settings.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/7/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation

struct Settings {
    
    static var shared = Settings()
    
    var appLanguage: String = "en"
    
    init() {
        self.appLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage") ?? "en"
    }
}
