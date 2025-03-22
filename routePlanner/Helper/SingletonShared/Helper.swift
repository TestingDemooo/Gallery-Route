//
//  Helper.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

class Helper: NSObject {
    static let sharedInstance: Helper = {
        let instance = Helper()
        return instance
    }()
    
    // MARK: Check Network Connection

    func isConnectedToNetwork() -> Bool {
        
        if Reachability.isConnectedToNetwork() == true {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Alert VC

    func showDefaultAlertViewController(aViewController : UIViewController = UIViewController(), alertTitle: String, aStrMessage : String)  {
        
        var viewVC = UIViewController()
        if let topController = UIApplication.topViewController() {
            viewVC = topController
        }
        
        let aAlertController = UIAlertController(title: alertTitle, message: aStrMessage, preferredStyle: UIAlertController.Style.alert)
        aAlertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewVC.present(aAlertController, animated: true, completion: nil)
    }
}
//MARK: -  Application extension

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
