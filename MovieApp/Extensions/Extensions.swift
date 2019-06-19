//
//  Extensions.swift
//  AppStoreApp
//
//  Created by MACBOOK PRO RETINA on 19/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String,views: UIView...) {
        var viewsDictionnary = [String: UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionnary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionnary))
    }
}
