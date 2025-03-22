//
//  NetworkManager.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    
    // MARK: API'S
    
    func fetchImagesListAPI(url: URL, completion: @escaping ((Data) -> Void)) { //Fetch images from open api
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
    
}
