//
//  HttpClientManager.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation



enum ApiError: Error {
    
    case invalidUrl
    case invalidData
    case parsingError
    case invalidResponse
}


enum APIResult <T, E> {
    case success(T?)
    case failure(E?)
}

typealias APIResultCallback<T> = (APIResult<T, Error>) -> Void

protocol HttpClientProtocol {
    
    func makeRequest(withUrl url: URL?,withHeaderDictionary hDictionary: [String: String]?, andMethod method: HttpMethod)  -> URLRequest?
    
    func  fetch<T: Decodable>(withUrlRequest request: URLRequest?, withType type: T.Type, callBack:  @escaping APIResultCallback<T>)
     

}

extension HttpClientProtocol {
    func makeRequest(withUrl url: URL?,withHeaderDictionary hDictionary: [String: String]?, andMethod method: HttpMethod)  -> URLRequest? {
        
        guard let url = url else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.getMethodType()
        if let hDictionary = hDictionary {
            urlRequest.allHTTPHeaderFields = hDictionary
        }
        return urlRequest

    }
    
    func  fetch<T: Decodable>(withUrlRequest request: URLRequest?, withType type: T.Type, callBack:  @escaping APIResultCallback<T>){
        
        
        guard let request = request else {
            callBack(APIResult.failure(ApiError.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: request) { responseData, response, error in
            
            if let _response = response as? HTTPURLResponse{
                if (200...299).contains(_response.statusCode) {
                    if let responseData = responseData {
                        
                        
                        print("Data: \(String(describing: String(data: responseData, encoding: .utf8)))")
                        let _responseModel = try? JSONDecoder().decode(type.self, from: responseData) as T
                        if let _responseModel = _responseModel {
                            callBack(.success(_responseModel))
                        }else {
                            callBack(APIResult.failure(ApiError.parsingError))
                        }
                    }else {
                        callBack(APIResult.failure(ApiError.invalidData))
                    }
                }else {
                    
                    callBack(APIResult.failure(ApiError.invalidResponse))
                }
            }
            
        }
        task.resume()
        
    }
    
}
