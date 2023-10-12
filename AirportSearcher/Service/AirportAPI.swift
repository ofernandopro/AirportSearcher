//
//  AirportAPI.swift
//  AirportSearcher
//
//  Created by Fernando on 03/09/23.
//

import RxSwift

protocol AirportAPI {
    func fetchAirports() -> Single<AirportsResponse>
}
