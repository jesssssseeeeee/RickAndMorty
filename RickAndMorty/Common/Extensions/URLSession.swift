import Foundation // swiftlint:disable:this foundation_using

extension URLSession {
    func dataTask(with urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        dataTask(with: urlRequest) { (data, urlRequest, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                completion(.success(data))
                return
            }
        }.resume()
    }
}
