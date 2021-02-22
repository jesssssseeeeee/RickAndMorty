import Foundation // swiftlint:disable:this foundation_using

protocol NetworkService: AnyObject {
    func request(_ endpoint: Endpoints, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkServiceImp: NetworkService {
    func request(_ endpoint: Endpoints, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.endpoint)
        var queryItems: [URLQueryItem] = []
        endpoint.queryItems.forEach {
            queryItems.append(URLQueryItem(name: $0, value: $1))
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems
        guard let components = urlComponents else { return }
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        URLSession.shared.dataTask(with: urlRequest, completion: completion)
    }
}
