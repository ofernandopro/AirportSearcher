//
//  AirportsCoordinator.swift
//  AirportSearcher
//
//  Created by Fernando on 10/09/23.
//

import UIKit

class AirportsCoodinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    private let models: Set<AirportModel>
    
    init(models: Set<AirportModel>,
         navigationController: UINavigationController) {
        self.models = models
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = AirportsVC.instantiate()
        
        view.viewModelBuilder = { [models] in
            let title = models.first?.city ?? ""
            return AirportsViewModel(input: $0, dependencies: (title: title, models: models))
        }
        
        self.navigationController.pushViewController(view, animated: true)
    }
    
}
