//
//  MovieDetailDescriptionCell.swift
//  MovieApp
//
//  Created by MACBOOK PRO RETINA on 19/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class MovieDetailDescriptionCell: BaseCell {
    
    let textView : UITextView = {
        let tv = UITextView()
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textView )
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: textView)
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: textView)
    }
    
}
