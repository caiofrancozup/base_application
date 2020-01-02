//
//  NetworkDispatcher.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

extension Error {
    
    var networkErrors: [Int] {
        return [NSURLErrorCannotConnectToHost, NSURLErrorNetworkConnectionLost, NSURLErrorDNSLookupFailed, NSURLErrorResourceUnavailable,
                NSURLErrorNotConnectedToInternet, NSURLErrorBadServerResponse, NSURLErrorInternationalRoamingOff, NSURLErrorCallIsActive]
    }
    
    var isNetworkConnectionError: Bool {
        if (self as NSError).domain == NSURLErrorDomain && networkErrors.contains((self as NSError).code) {
            return true
        }
        return false
    }
    
}

// MARK: - Network Errors
enum NetworkErrorCode: Int {
    case unknown = -111
    case unexpected = -222
    case serializationError = -333
    case invalidURL = -444
    case jsonParse = -555
    case connectivity = -666
}

enum NetworkErrorMessage: String {
    case unknown = "An unknown error has occured. Try again later."
    case unexpected = "An unexpected error has occured. Check your internet connection and try again."
    case serializationError = "Object serialization error."
    case invalidURL = "Invalid URL."
    case jsonParse = "JSON parsing error."
    case connectivity = "Network connectivity error."
}

class ErrorFactory {
    
    static func buildNetworkError(with code: NetworkErrorCode) -> SerializedNetworkError {
        switch code {
        case .unknown:
            return SerializedNetworkError(message: NetworkErrorMessage.unknown.rawValue, code: NetworkErrorCode.unknown.rawValue)
        case .unexpected:
            return SerializedNetworkError(message: NetworkErrorMessage.unexpected.rawValue, code: NetworkErrorCode.unexpected.rawValue)
        case .invalidURL:
            return SerializedNetworkError(message: NetworkErrorMessage.invalidURL.rawValue, code: NetworkErrorCode.invalidURL.rawValue)
        case .jsonParse:
            return SerializedNetworkError(message: NetworkErrorMessage.jsonParse.rawValue, code: NetworkErrorCode.jsonParse.rawValue)
        case .connectivity:
            return SerializedNetworkError(message: NetworkErrorMessage.connectivity.rawValue, code: NetworkErrorCode.connectivity.rawValue)
        default:
            return SerializedNetworkError(message: NetworkErrorMessage.unknown.rawValue, code: NetworkErrorCode.unknown.rawValue)
        }
    }

}

struct NetworkResponse {
    
    // MARK: - Properties
    var rawData: Data?
    var rawResponse: String?
    
    var response: HTTPURLResponse?
    var request: URLRequest?
    var task: URLSessionDataTaskProtocol?
    
}

struct NetworkError: Error {
    
    // MARK: - Properties
    var rawError: Error?
    var rawErrorString: String?
    var rawErrorData: Data?
    var requestError: SerializedNetworkError?
    
    var response: HTTPURLResponse?
    var request: URLRequest?
    var task: URLSessionDataTaskProtocol?
    
    init() {}
    
    init(requestError: SerializedNetworkError) {
        self.requestError = requestError
    }
    
    init(rawError: Error) {
        self.rawError = rawError
    }
    
    init(networkResponse: NetworkResponse?, rawError: Error?, requestError: SerializedNetworkError) {
        self.rawError = rawError
        self.rawErrorString = networkResponse?.rawResponse
        self.rawErrorData = networkResponse?.rawData
        self.requestError = requestError
        self.response = networkResponse?.response
        self.request = networkResponse?.request
        self.task = networkResponse?.task
    }
    
    init(rawError: Error?, rawErrorData: Data?, response: HTTPURLResponse?, request: URLRequest?) {
        self.rawError = rawError
        self.rawErrorData = rawErrorData
        self.response = response
        self.request = request
    }
    
    init(rawError: Error?, rawErrorData: Data?, requestError: SerializedNetworkError?, response: HTTPURLResponse?, request: URLRequest?) {
        self.rawError = rawError
        self.rawErrorData = rawErrorData
        self.requestError = requestError
        self.response = response
        self.request = request
    }
    
    init(requestError: SerializedNetworkError?, request: URLRequest?) {
        self.requestError = requestError
        self.request = request
    }
    
}

public struct SerializedNetworkError: Codable, Error {
    
    // MARK: - Properties
    var message: String?
    var code: Int?

}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with request: NSURLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}

protocol NetworkDispatcherProtocol {
    var url: URL { get }
    var session: URLSessionProtocol { get }
    init(url: URL, session: URLSessionProtocol)
    func response<T: Codable>(of type: T.Type, from path: String?, method: HTTPMethod, payload: Data?, headers: [String: String]?) -> T?
    func response<T: Codable>(of type: T.Type, from path: String?, method: HTTPMethod, payload: Data?, headers: [String: String]?) -> [T]?
    func response(from path: String?, method: HTTPMethod, payload: Data?, headers: [String: String]?) -> Void
}

// MARK: URLSessionDataTaskProtocol
extension URLSessionDataTask: URLSessionDataTaskProtocol {}

// MARK: - URLSessionProtocol
extension URLSession: URLSessionProtocol {
    func dataTask(with request: NSURLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let urlRequest = request as URLRequest
        let task = dataTask(with: urlRequest, completionHandler: completionHandler)
        return task as URLSessionDataTaskProtocol
    }
}

class NetworkDispatcher: NetworkDispatcherProtocol {
    
    // MARK: - Properties
    private(set) var url: URL
    private(set) var session: URLSessionProtocol
    var defaultHeaders: [String: String] = [
        "content-type": "application/json"
    ]
    
    // MARK: - Initializers
    required init(url: URL, session: URLSessionProtocol = URLSession.shared) {
        self.url = url
        self.session = session
    }
    
    // MARK: NetworkDispatcherProtocol
    /// Use this method to serialize object payload
    func response<T>(of type: T.Type, from path: String?, method: HTTPMethod, payload: Data?, headers: [String : String]?) -> T? where T : Decodable, T : Encodable {
        return nil
//
//        guard let request = self.buildURLRequest(httpMethod: method, url: self.url, path: path, payload: payload, headers: headers) else {
//            let networkError = NetworkError(requestError: ErrorFactory.buildNetworkError(with: .invalidURL))
//            observable.onError(networkError)
//            return Disposables.create()
//        }
//
//        let task = self.dispatch(urlRequest: request, onCompleted: { (networkResponse, networkError) in
//
//            if let networkError = networkError {
//                observable.onError(networkError)
//            } else {
//                if let data = networkResponse.rawData {
//                    do {
//                        let serializedObject = try JSONDecoder().decode(T.self, from: data)
//                        observable.onNext(serializedObject)
//                    } catch let serializationError {
//                        debugPrint("[NetworkDispatcher] " + "*** serializationError ***")
//                        debugPrint("[NetworkDispatcher] " + serializationError.localizedDescription)
//                        let requestError = ErrorFactory.buildNetworkError(with: .serializationError)
//                        let networkErrorForSerialization = NetworkError(networkResponse: networkResponse, rawError: serializationError, requestError: requestError)
//                        observable.onError(networkErrorForSerialization)
//                    }
//                } else {
//                    observable.onNext(nil)
//                }
//            }
//
//            observable.onCompleted()
//
//        })
//
//        return Disposables.create {
//            task.cancel()
//        }
        
        
        
    }
    
    /// Use this method to serialize array payload
    func response<T>(of type: T.Type, from path: String?, method: HTTPMethod, payload: Data?, headers: [String : String]?) -> [T]? where T : Decodable, T : Encodable {
        return nil
//
//        return Observable.create { observable in
//
//            guard let request = self.buildURLRequest(httpMethod: method, url: self.url, path: path, payload: payload, headers: headers) else {
//                let networkError = NetworkError(requestError: ErrorFactory.buildNetworkError(with: .invalidURL))
//                observable.onError(networkError)
//                return Disposables.create()
//            }
//
//            let task = self.dispatch(urlRequest: request, onCompleted: { (networkResponse, networkError) in
//
//                if let networkError = networkError {
//                    observable.onError(networkError)
//                } else {
//                    if let data = networkResponse.rawData {
//                        do {
//                            let serializedObject = try JSONDecoder().decode([T].self, from: data)
//                            observable.onNext(serializedObject)
//                        } catch let serializationError {
//                            debugPrint("[NetworkDispatcher] " + "*** serializationError ***")
//                            debugPrint("[NetworkDispatcher] " + serializationError.localizedDescription)
//                            let requestError = ErrorFactory.buildNetworkError(with: .serializationError)
//                            let networkErrorForSerialization = NetworkError(networkResponse: networkResponse, rawError: serializationError, requestError: requestError)
//                            observable.onError(networkErrorForSerialization)
//                        }
//                    } else {
//                        observable.onNext(nil)
//                    }
//                }
//
//                observable.onCompleted()
//
//            })
//
//            return Disposables.create {
//                task.cancel()
//            }
//
//        }
        
    }
    
    /// Use this method when there is no need to serialize service payload
    func response(from path: String?, method: HTTPMethod, payload: Data?, headers: [String : String]?) -> Void {
        
//        return Observable.create { observable in
//
//            guard let request = self.buildURLRequest(httpMethod: method, url: self.url, path: path, payload: payload, headers: headers) else {
//                let networkError = NetworkError(requestError: ErrorFactory.buildNetworkError(with: .invalidURL))
//                observable.onError(networkError)
//                return Disposables.create()
//            }
//
//            let task = self.dispatch(urlRequest: request, onCompleted: { (_, networkError) in
//
//                if let networkError = networkError {
//                    observable.onError(networkError)
//                } else {
//                    observable.onNext(())
//                }
//
//                observable.onCompleted()
//
//            })
//
//            return Disposables.create {
//                task.cancel()
//            }
//
//        }
        
    }
    
}

// MARK: - URL Request
private extension NetworkDispatcher {
    
    // MARK: - Helper Methods
    private func buildURLRequest(httpMethod: HTTPMethod, url: URL, path: String?, payload: Data? = nil, headers: [String:String]? = nil) -> URLRequest? {
    
        var requestURL = url
        if let path = path {
            let fullURL = self.getURL(with: path)
            
            guard let uri = fullURL else {
                return nil
            }
            
            requestURL = uri
        }
        
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = defaultHeaders
        request.httpBody = payload
        
        guard let headers = headers else {
            return request
        }
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
    
    private func getURL(with path: String) -> URL? {
        guard let urlString = url.appendingPathComponent(path).absoluteString.removingPercentEncoding,
            let requestUrl = URL(string: urlString) else {
                return nil
        }
        return requestUrl
    }
    
}

// MARK: - Request Dispatcher
private extension NetworkDispatcher {
    
    private func dispatch(urlRequest: URLRequest, onCompleted completion: @escaping (NetworkResponse, NetworkError?) -> Void) -> URLSessionDataTaskProtocol {
        
        var networkResponse = NetworkResponse()
        var networkError: NetworkError?
        
        let nsURLRequest = urlRequest as NSURLRequest
        
        let task = session.dataTask(with: nsURLRequest) { data, response, error in
            
            networkResponse.response = response as? HTTPURLResponse
            networkResponse.request = urlRequest
            networkResponse.rawData = data
            
            if let data = data {
                networkResponse.rawResponse = String(data: data, encoding: .utf8)
            }
            
            guard let statusCode = networkResponse.response?.statusCode else {
                networkError = NetworkError(rawError: error, rawErrorData: data, response: response as? HTTPURLResponse, request: urlRequest)
                self.setUnknowErrorFor(networkError: &networkError)
                completion(networkResponse, networkError)
                return
            }
            
            if !(200...299 ~= statusCode) {
                networkError = NetworkError(rawError: error, rawErrorData: data, response: response as? HTTPURLResponse, request: urlRequest)
                self.mapErrors(statusCode: statusCode, error: error, networkError: &networkError)
            }
            
            completion(networkResponse, networkError)
            
        }
        
        networkResponse.task = task
        networkError?.task = task
        
        task.resume()
        
        return task
    }
    
}

// MARK: - Error Handlers
private extension NetworkDispatcher {
    
    private func setUnknowErrorFor(networkError: inout NetworkError?) {
        if let error = networkError?.rawError, error.isNetworkConnectionError {
            networkError?.requestError = ErrorFactory.buildNetworkError(with: .connectivity)
            return
        }
        networkError?.requestError = ErrorFactory.buildNetworkError(with: .unexpected)
    }
    
    private func mapErrors(statusCode: Int, error: Error?, networkError: inout NetworkError?) {
        
        guard error == nil else {
            setUnknowErrorFor(networkError: &networkError)
            return
        }
        
        guard 400...499 ~= statusCode, let data = networkError?.rawErrorData, let jsonString = String(data: data, encoding: .utf8),
            let serializedValue = try? JSONDecoder().decode(SerializedNetworkError.self, from: data) else {
                setUnknowErrorFor(networkError: &networkError)
                return
        }
        
        networkError?.rawErrorString = jsonString // deletar? realmente preciso?
        
        if serializedValue.message == nil {
            setUnknowErrorFor(networkError: &networkError)
        } else {
            networkError?.requestError = serializedValue
        }
    }
    
}
