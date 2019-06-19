//
//  CategoryCell.swift
//  AppStoreApp
//
//  Created by MACBOOK PRO RETINA on 10/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var listMoviesViewController: ListMoviesViewController?
    var appCategory: MovieCategory? {
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    let cellId = "appCellId"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame:  .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = UIColor.clear
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let dividerLineView: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        backgroundColor = UIColor.clear
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel )
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellId)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsCollectionView,"v1":dividerLineView,"nameLabel":nameLabel]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if let count = appCategory?.apps?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        cell.movie = appCategory?.apps![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appCategory?.apps![indexPath.item] {
            listMoviesViewController?.showAppDetailForApp(app: app)
        }
    }
    
    
    
}



