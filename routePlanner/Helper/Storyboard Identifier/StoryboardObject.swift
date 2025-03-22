//
//  StoryboardObject.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

//MARK: - Storyboard name initializer

private let MAINSTORYBOARD = UIStoryboard(name: "Main", bundle: nil)

//MARK: - Storyboard ID Initilizer

//Main storyboard
private let STORYBOARD_LIST_VC = "ListVC"
private let STORYBOARD_DISPLAY_VC = "ImageDisplayVC"

final class GlobalStoryboard: NSObject {
    
    var listVC: ListVC {
        return MAINSTORYBOARD.instantiateViewController(withIdentifier: STORYBOARD_LIST_VC) as! ListVC
    }
    var imageDisplayVC: ImageDisplayVC {
        return MAINSTORYBOARD.instantiateViewController(withIdentifier: STORYBOARD_DISPLAY_VC) as! ImageDisplayVC
    }

}

