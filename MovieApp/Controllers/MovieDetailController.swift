//
//  MovieDetailController.swift
//  AppStoreApp
//
//  Created by MACBOOK PRO RETINA on 17/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class MovieDetailController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let cellId = "cellId"
    let detailDescriptionId = "detailDescriptionId"
    var app: Movie? {
        didSet {
            navigationItem.title = app?.name
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MovieDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(ScreenShotsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(MovieDetailDescriptionCell.self, forCellWithReuseIdentifier: detailDescriptionId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailDescriptionId, for: indexPath) as! MovieDetailDescriptionCell
            cell.textView.attributedText = descriptionAttributedText()
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotsCell
        cell.app = app
        return cell
    }
    
    func descriptionAttributedText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Overview\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17)])
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let range = NSMakeRange(0, attributedText.string.characters.count)
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: range)
        if let desc = app?.desc {
            attributedText.append(NSAttributedString(string: desc, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
        }
        return attributedText
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250 )
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MovieDetailHeader
        header.app = app
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    
}










