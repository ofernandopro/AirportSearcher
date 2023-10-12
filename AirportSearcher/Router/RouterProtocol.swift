//
//  RouterProtocol.swift
//  AirportSearcher
//
//  Created by Fernando on 04/10/23.
//

typealias NavigationBackClosure = (() -> ())

protocol RouterProtocol {
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigationBack: NavigationBackClosure?)
    func pop(_ isAnimated: Bool)
}
