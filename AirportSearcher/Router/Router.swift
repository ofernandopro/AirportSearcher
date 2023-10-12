//
//  Router.swift
//  AirportSearcher
//
//  Created by Fernando on 04/10/23.
//

import UIKit

final class Router: NSObject {
    
    private let navigationController: UINavigationController
    private var closures: [String: NavigationBackClosure] = [:]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension Router: RouterProtocol {
    
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigationBack closure: NavigationBackClosure?) {
        guard 
            let viewController = drawable.viewController else { return }
        
        if let closure = closure {
            closures.updateValue(closure, forKey: viewController.description)
        }
        
        navigationController.pushViewController(viewController, animated: isAnimated)
        
    }
    
    func pop(_ isAnimated: Bool) {
        navigationController.popViewController(animated: isAnimated)
    }
    
    func executeClosures(_ viewController: UIViewController) -> Void {
        guard let closure = closures.removeValue(forKey: viewController.description) else { return }
        closure()
    }
    
}
 
extension Router: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        guard !navigationController.viewControllers.contains(previousController) else { return }
    }
    
}
