//
//  Extensions.swift
//  AmplifonME
//
//  Created by Mahmoud on 10/7/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation

extension String {
    func localized(_ lang:String) ->String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
