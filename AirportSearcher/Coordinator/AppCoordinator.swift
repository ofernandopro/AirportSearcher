//
//  AppCoordinator.swift
//  AirportSearcher
//
//  Created by Fernando on 02/09/23.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        let navigationBar = navigationController.navigationBar
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor(red: 233/255, green: 55/255, blue: 72/255, alpha: 1)
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 28.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let searchAirportCoordinator = SearchAirportCoordinator(navigationController: navigationController)
        self.add(coordinator: searchAirportCoordinator)
        searchAirportCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
