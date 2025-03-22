//
//  ImageListVM.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

class ImageListVM {
    
    var delegate : SuccessAndErrorHandling?
    fileprivate var imageList = [ImageList]()

    //MARK: - Getter Methods
    func getImageList() -> [ImageList]{
        return imageList
    }
    func getImageInfoCount() -> Int {
        return imageList.count
    }

    //MARK: - APIs

    func fetchList(inputView: UIViewController) {
        
        if !HELPER.isConnectedToNetwork() {
            HELPER.showDefaultAlertViewController(alertTitle: APP_NAME, aStrMessage: "Oops!! Itseems like you are not connected to internet")
            return
        }

        let url = "\(API_BASE_URL)=\(ACCESS_KEY)&order_by=ORDER&per_page=30"
        
        debugPrint(url)

        if let url = URL(string: url) {
            
            NETWORKMANAGER.fetchImagesListAPI(url: url) { data in
                do{
                    let item = try JSONDecoder().decode([ImageList].self, from: data)
                    self.imageList.append(contentsOf: item)
                    self.delegate?.successWithData(for: 200, index: 0, message: "")
                }catch {
                    self.delegate?.successWithData(for: 200, index: 0, message: error.localizedDescription)
                }
            }
        }

    }
}
