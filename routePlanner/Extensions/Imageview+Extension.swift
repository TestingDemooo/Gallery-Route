//
//  Imageview+Extension.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
var imgUrl: String?

extension UIImageView { //Cache and display the image in collectionview
    
    func loadImages(strURL: String, collectionView: UICollectionView, indexpath: IndexPath) {
        imgUrl = strURL
        if let url = URL(string: strURL) {
            image = nil
            if let imageFromCache = imageCache.object(forKey: strURL as AnyObject) as? UIImage {
                self.image = imageFromCache
                return
            }
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil{
                    return
                }
                DispatchQueue.main.async(execute: {
                    if let imgData = data {
                        if let imgDataCache = UIImage(data: imgData){
                            if imgUrl == strURL {
                                self.image = imgDataCache
                            }
                            imageCache.setObject(imgDataCache, forKey: strURL as AnyObject)
                            collectionView.reloadItems(at: [indexpath])
                        }
                    }
                })
            }) .resume()
        }
    }
    func loadImgDetail(strURL: String) { //Display the data in detail screen
        if let url = URL(string: strURL) {
            image = nil
            if let imageFromCache = imageCache.object(forKey: strURL as AnyObject) as? UIImage {
                self.image = imageFromCache
                return
            }
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil{
                    return
                }
                DispatchQueue.main.async(execute: {
                    if let imgData = data {
                        if let imgDataCache = UIImage(data: imgData){
                            self.image = imgDataCache
                            imageCache.setObject(imgDataCache, forKey: strURL as AnyObject)
                        }
                    }
                })
            }) .resume()
        }
    }
}
