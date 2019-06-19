//
//  ViewController.swift
//  AppStoreApp
//
//  Created by MACBOOK PRO RETINA on 10/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ListMoviesViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var appCategories: [MovieCategory]?
    let searchBarButton: UIBarButtonItem = {
        let sbb = UIBarButtonItem(image: UIImage(named: "search"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        return sbb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MovieApp"
        navigationItem.rightBarButtonItem = searchBarButton
        MovieCategory.fetchMovies{(appCategories) -> () in
            self.appCategories = appCategories
            self.collectionView?.reloadData()
        }
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func showAppDetailForApp(app: Movie) {
        let layout = UICollectionViewFlowLayout()
        let movieDetailController = MovieDetailController(collectionViewLayout: layout)
        movieDetailController.app = app
        navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.appCategory = appCategories?[indexPath.item]
        cell.listMoviesViewController = self
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

}



