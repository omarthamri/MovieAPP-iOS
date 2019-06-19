//
//  ScreenshotImageCell.swift
//  MovieApp
//
//  Created by MACBOOK PRO RETINA on 19/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ScreenshotImageCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.green
        return iv
    }()
    override func setupViews() {
        super.setupViews()
        layer.masksToBounds = true
        addSubview(imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: imageView )
        backgroundColor = UIColor.yellow
    }
}
