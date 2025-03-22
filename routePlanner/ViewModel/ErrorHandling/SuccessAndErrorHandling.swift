//
//  SuccessAndErrorHandling.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

// MARK: Protocol

protocol SuccessAndErrorHandling {
    func successWithData <T>(for data : T,index: Int, message: String)
}


