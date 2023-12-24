import Security
import Foundation


enum HttpError: Error {
    case invalidUrl
    case invalidJson
    case nilData
}




enum HttpResult<T, Error> {
    
    case success(T?)
    case failure(HttpError)
}


protocol EndPoingResource {
    
}



protocol Webserviceble {
    
    func makeUrlRequest(withEndPoint endPoint: EndPoingResource, andRequestHeader header: [String:String]) -> URLRequest?
    
    func fetch<T>(withUrlRequest request:URLRequest,andCallbackcallback: @escaping (HttpResult<T, Error>) ->Void)
    
}

extension Array  {
    
    subscript(safe index: Index) ->Element? {
        
        guard index >= startIndex ,index <= endIndex else {
            return nil
        }
        return self[index]
    }
}


let names = ["Mayur", "asdsa", "fadsfas"]


