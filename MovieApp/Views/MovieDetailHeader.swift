//
//  MovieDetailHeader.swift
//  MovieApp
//
//  Created by MACBOOK PRO RETINA on 19/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class MovieDetailHeader: BaseCell {
    
    var app: Movie? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            nameLabel.text = app?.name
            if let category = app?.category {
                GenresLabelValue.text = "\(category)"
            }
            if let nationality = app?.nationality {
                NationalityLabelValue.text = "\(nationality)"
            }
            if let prod = app?.prod {
                RealisatorLabelValue.text = "\(prod)"
            }
            if let release = app?.release {
                releaseDateLabelValue.text = "\(release)"
            }
            
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Info","Cast","Trailer"])
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Release date:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let releaseDateLabelValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let RealisatorLabel: UILabel = {
        let label = UILabel()
        label.text = "By:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let RealisatorLabelValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let GenresLabel: UILabel = {
        let label = UILabel()
        label.text = "Genres:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let GenresLabelValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let NationalityLabel: UILabel = {
        let label = UILabel()
        label.text = "Nationality:"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let NationalityLabelValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(dividerLineView)
        addSubview(releaseDateLabel)
        addSubview(RealisatorLabel)
        addSubview(GenresLabel)
        addSubview(NationalityLabel)
        addSubview(NationalityLabelValue)
        addSubview(GenresLabelValue)
        addSubview(RealisatorLabelValue)
        addSubview(releaseDateLabelValue)
        addConstraintsWithFormat(format: "H:|-14-[v0(100)]-8-[v1]-5-[v2]", views: imageView,releaseDateLabel,releaseDateLabelValue)
        addConstraintsWithFormat(format: "H:|-122-[v0]-5-[v1]", views: RealisatorLabel,RealisatorLabelValue)
        addConstraintsWithFormat(format: "H:|-122-[v0]-5-[v1]", views: GenresLabel,GenresLabelValue) //
        addConstraintsWithFormat(format: "H:|-122-[v0]-5-[v1]", views: NationalityLabel,NationalityLabelValue)
        addConstraintsWithFormat(format: "V:|-14-[v0(100)]", views: imageView)
        addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedControl)
        addConstraintsWithFormat(format: "V:[v0(34)]-8-|", views: segmentedControl)
        addConstraintsWithFormat(format: "V:|-14-[v0(20)]", views: releaseDateLabel)
        addConstraintsWithFormat(format: "V:|-14-[v0(20)]", views: releaseDateLabelValue)
        addConstraintsWithFormat(format: "V:|-38-[v0(20)]", views: RealisatorLabel)
        addConstraintsWithFormat(format: "V:|-38-[v0(20)]", views: RealisatorLabelValue)
        addConstraintsWithFormat(format: "V:|-62-[v0(20)]", views: GenresLabel)
        addConstraintsWithFormat(format: "V:|-62-[v0(20)]", views: GenresLabelValue)
        addConstraintsWithFormat(format: "V:|-86-[v0(20)]", views: NationalityLabel)
        addConstraintsWithFormat(format: "V:|-86-[v0(20)]", views: NationalityLabelValue)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(0.5)]|", views: dividerLineView)
        
    }
    
}
