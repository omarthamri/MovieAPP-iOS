//
//  MovieCategory.swift
//  MovieApp
//
//  Created by MACBOOK PRO RETINA on 19/06/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit


class MovieCategory: NSObject {
    
    var name: String?
    var apps: [Movie]?
    var type: String?
    
    static func fetchMovies(completionHandler: @escaping ([MovieCategory]) -> ()) {
        let urlString = "http://localhost/movies.json"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data,response,error) -> Void in
            if error != nil {
                print(error)
                return
            }
            do {
                let json = try (JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! Dictionary<String,AnyObject>
                var appCategories = [MovieCategory]()
                for dict in json["categories"]! as! [[String:Any]] {
                    let appCategory = MovieCategory()
                    print(dict["name"]!)
                    print(dict["apps"]!)
                    var apps = [Movie]()
                    appCategory.name = dict["name"]! as! String
                    for dictio in dict["apps"]! as! [[String:Any]] {
                        print(dictio)
                        let app = Movie()
                        if dictio["Category"] != nil {
                            app.category = dictio["Category"] as! String
                        }
                        if dictio["Id"] != nil {
                            //let id = dictio["Id"] as! String
                            app.id = dictio["Id"] as! NSNumber // NSNumber(value: Float(id)!)
                        }
                        if dictio["Name"] != nil {
                            app.name = dictio["Name"] as! String
                        }
                        if dictio["Desc"] != nil {
                            app.desc = dictio["Desc"] as! String
                        }
                        if dictio["Release"] != nil {
                            app.release = dictio["Release"] as! String
                        }
                        if dictio["Producer"] != nil {
                            app.prod = dictio["Producer"] as! String
                        }
                        if dictio["Nationality"] != nil {
                            app.nationality = dictio["Nationality"] as! String
                        }
                        if dictio["ImageName"] != nil {
                            app.imageName = dictio["ImageName"] as! String
                        }
                        apps.append(app)
                    }
                    appCategory.apps = apps
                    appCategories.append(appCategory)
                }
                DispatchQueue.main.async {
                    completionHandler(appCategories )
                }
                
            } catch let err {
                print(err)
            }
            
            
            }.resume()
    }
    
}
