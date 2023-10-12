//
//  HttpService.swift
//  AirportSearcher
//
//  Created by Fernando on 03/09/23.
//

import Alamofire

protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
