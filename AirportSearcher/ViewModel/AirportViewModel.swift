//
//  AirportViewModel.swift
//  AirportSearcher
//
//  Created by Fernando on 10/09/23.
//

import Foundation

protocol AirportViewPresentable {
    var name: String { get }
    var code: String { get }
    var address: String { get }
    var distance: Double? { get }
    var formattedDistance: String { get }
    var runwayLength: String { get }
    var location: (lat: String, lon: String) { get }
}

struct AirportViewModel: AirportViewPresentable {
    
    var formattedDistance: String {
        return "\(distance?.rounded(.toNearestOrEven) ?? 0 / 1000) Km"
    }
    
    var name: String
    var code: String
    var address: String
    var distance: Double?
    var runwayLength: String
    var location: (lat: String, lon: String)
    
}

extension AirportViewModel {
    
    init(usingModel model: AirportModel) {
        self.name = model.name
        self.code = model.code
        self.address = "\(model.state ?? ""), \(model.country)"
        self.runwayLength = "Runway Length: \(model.runwayLength ?? "NA")"
        self.location = (lat: model.lat, lon: model.lon)
        self.distance = 0
    }
    
}
