//
//  AirportService.swift
//  AirportSearcher
//
//  Created by Fernando on 03/09/23.
//

import RxSwift
import Alamofire

class AirportService {
    
    private lazy var httpService = AirportHttpService()
    static let shared: AirportService = AirportService()
    
}

extension AirportService: AirportAPI {
    
    func fetchAirports() -> Single<AirportsResponse> {
        
        return Single.create { [httpService] (single) -> Disposable in
            
            do {
                try AirportHttpRouter.getAirports
                    .request(usingHttpService: httpService)
                    .responseJSON { (result) in
                        
                        do {
                            let airports = try AirportService.parseAirports(result: result)
                            single(.success(airports))
                        } catch {
                            single(.failure(error))
                        }
                    }
            } catch {
                single(.failure(CustomError.error(message: "Airports fetch failed")))
            }
            
            return Disposables.create()
        }
    }
    
}

extension AirportService {
    
    static func parseAirports(result: AFDataResponse<Any>) throws -> AirportsResponse {
        guard
            let data = result.data,
            let airportsResponse = try? JSONDecoder().decode(AirportsResponse.self, from: data)
        else {
            throw CustomError.error(message: "Invalid Airports JSON")
        }
        return airportsResponse
//        guard let data = result.data else {
//            throw CustomError.error(message: "No data available")
//        }
//
//        do {
//            let airportsResponse = try JSONDecoder().decode(AirportsResponse.self, from: data)
//            return airportsResponse
//        } catch let decodingError {
//            throw CustomError.error(message: "Error decoding JSON: \(decodingError)")
//        }
    }
    
}
