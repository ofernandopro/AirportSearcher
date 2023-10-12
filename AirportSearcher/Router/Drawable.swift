//
//  Drawable.swift
//  AirportSearcher
//
//  Created by Fernando on 04/10/23.
//

import UIKit

protocol Drawable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Drawable {
    var viewController: UIViewController? { return self }
}
