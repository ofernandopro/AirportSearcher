//
//  BaseCoordinator.swift
//  AirportSearcher
//
//  Created by Fernando on 02/09/23.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    func start() {
        fatalError("Children should implement 'start'.")
    }
    
}
