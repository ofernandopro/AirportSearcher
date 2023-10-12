//
//  SearchAirportCoordinator.swift
//  AirportSearcher
//
//  Created by Fernando on 01/09/23.
//

import UIKit
import RxSwift
import RxCocoa

class SearchAirportCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    private let bag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = SearchAirportsVC.instantiate()
        let service = AirportService.shared
        
        view.viewModelBuilder = { [bag] in
            let viewModel = SearchAirportsViewModel(input: $0, airportService: service)
            
            viewModel.router.citySelected
                .map({ [weak self] in
                    guard let `self` = self else { return }
                    self.showAirports(usingModel: $0)
                })
                .drive()
                .disposed(by: bag)
            
            return viewModel
        }
        
        navigationController.pushViewController(view, animated: true)
        
    }
    
}

private extension SearchAirportCoordinator {
    
    func showAirports(usingModel models: Set<AirportModel>) -> Void {
        
        let airportsCoordinator = AirportsCoodinator(models: models,
                                                     navigationController: self.navigationController)
        self.add(coordinator: airportsCoordinator)
        
        airportsCoordinator.start()
        
    }
    
}
