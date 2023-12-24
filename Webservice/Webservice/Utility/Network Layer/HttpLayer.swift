//
//  HttpLayer.swift
//  Webservice
//
//  Created by Mayur Nilwant on 03/12/2023.
//

import Foundation



struct EndPoint {
    
    var host: String
    var path: String?
    var scheme: String
    var queryParam: [String: Any]?
    
    private init()  {
        
        self.host = "www.google.com"
        self.scheme = "http"
        
    }
    
}


extension EndPoint {
    
    
    
    init(withPath path: String, andParams qParam:[String: Any]? = nil) {
        
        self.init()
        self.path = path
        guard (qParam != nil) else {
            
            return
        }
        
        self.queryParam = qParam
    }
    
    
    var url : URL? {
        
        var urlComponent = URLComponents()
        urlComponent.host = self.host
        urlComponent.scheme = self.scheme
        if let path = self.path {
            urlComponent.path = path
        }
        
        if let _ = self.queryParam {
            urlComponent.queryItems = self.queryParam?.map({ key, value in
                
                return URLQueryItem(name: key, value: value as? String)
            })
        }
        return urlComponent.url
    }
}



extension EndPoint {
    
    static func getAllResourceUrl() -> URL? {
        
        EndPoint(withPath: "resources").url
        
    }
}


enum HttpMethod  {
    
    case get
    case posr(Data?)
}

extension HttpMethod {
    
    func getPostdata() -> Data? {
        
        switch self {
        case .get:
            return nil
        case .posr(let postData):
            return postData
        }
    }
    
    func rawValue() -> String {
        
        switch self {
        case .get:
            return "get"
        case .posr(_):
           return "post"
        }
        
    }
}



protocol Webservicable {
    
    func makeUrlRequest(withUrl url: URL, andHeaders headers: [String: String]) -> URLRequest?
    func makeUrlRequest(withUrl url: URL) -> URLRequest?
    func fetchRequestF<T: Decodable>(withRequest req: URLRequest, andType type: T.Type, andResponseCallBack callBack: @escaping (HttpResult<T>) -> Void)
    
    // httpMethod
    var httpMethod: HttpMethod {get set}
    
    
}


class Httphandler: Webservicable {
    
       var httpMethod: HttpMethod
    
    init(withHttpMethod method: HttpMethod) {
        
        self.httpMethod = method
    }
    
    private init() {
        self.httpMethod = .get
    }
    
    func makeUrlRequest(withUrl url: URL, andHeaders headers: [String : String]) -> URLRequest? {
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod.rawValue()
        request.allHTTPHeaderFields = headers
        return request
    }
    
    func makeUrlRequest(withUrl url: URL) -> URLRequest? {
        return nil
    }
    
    func fetchRequestF<T>(withRequest req: URLRequest, andType type: T.Type, andResponseCallBack callBack: @escaping (HttpResult<T>) -> Void) where T : Decodable {
        
        let urlSession = URLSession.shared.dataTask(with: req) { data, httpResponse, error in
            
            if error != nil {
                
                
                guard let httpStatus = (httpResponse as? HTTPURLResponse)?.statusCode, (200 ... 299).contains(httpStatus) else {
                    callBack(.failur(HttpError.invalidResponseCode))
                    return
                }
                
                let result = try? JSONDecoder().decode(type.self, from: data ?? Data())
                
                if let _ = result {
                    callBack(.succsee(result!))
                    
                }else {
                    callBack(.failur(.invalidData))
                }
                                
            }else {
                callBack(.failur(.HttpError(error!)))
            }
            
        }
        
        urlSession.resume()
        
    }
    
    
    
}


enum HttpError : Error{
    
        case invalidUrl
        case invalidResponseCode
        case invalidData
        case HttpError(Error)
}


enum HttpResult<T> {
    case succsee(T)
    case failur(HttpError)
    
}
