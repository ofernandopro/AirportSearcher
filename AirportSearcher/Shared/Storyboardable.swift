//
//  Storyboarable.swift
//  AirportSearcher
//
//  Created by Fernando on 02/09/23.
//

import UIKit

protocol Storyboardable {
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
