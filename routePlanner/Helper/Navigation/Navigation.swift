//
//  Navigation.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit


class Navigation: NSObject {
    
    static let sharedInstance: Navigation = {
        let instance = Navigation()
        return instance
    }()

    // MARK: - Set Navigation Bar

    func setNavigationTitle(strTitle: String, aViewController: UIViewController) {
        setTitle(title: strTitle, viewController: aViewController)
        setNavigationBarProperties(viewController: aViewController)
    }

    func setNavigationBarProperties(viewController : UIViewController) {
        
        if #available(iOS 13.0, *) {
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()

            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor =  UIColor.yellow.withAlphaComponent(0.5)
            viewController.navigationController?.navigationBar.standardAppearance = appearance
            viewController.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            viewController.navigationController?.navigationBar.compactAppearance = appearance
            viewController.navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)

            viewController.navigationController?.navigationBar.shadowImage = UIImage()

            // Fallback on earlier versions
        }
        viewController.navigationController?.navigationBar.isHidden = false
        viewController.navigationController?.navigationBar.barTintColor = UIColor.yellow.withAlphaComponent(0.5)
    }
    
    // MARK: - Set Title

    private func setTitle(title: String, viewController : UIViewController)  {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 80, height: 30))
        titleLabel.text = title
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        viewController.navigationItem.titleView = titleLabel
    }

}
