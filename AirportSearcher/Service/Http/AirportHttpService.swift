//
//  AirportHttpService.swift
//  AirportSearcher
//
//  Created by Fernando on 03/09/23.
//

import Alamofire

class AirportHttpService: HttpService {
    
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
