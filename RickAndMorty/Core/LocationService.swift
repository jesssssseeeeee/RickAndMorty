import Foundation

protocol LocationService: AnyObject {
    func fetch(completion: @escaping (Result<[Location], Error>) -> Void)
}

final class LocationServiceImp: LocationService {
    let networkService: NetworkService = NetworkServiceImp()
    var page: String?
    var isEnd = false
    
    func fetch(completion: @escaping (Result<[Location], Error>) -> Void) {
        guard !isEnd else {
            return
        }
        networkService.request(.locations(page: page)) { [weak self] (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(LocationResponse.self, from: data)
                    completion(.success(response.results))
                    guard let next = response.info.next else {
                        self?.isEnd = true
                        return
                    }
                    self?.page = String(next.split(separator: "=")[1])
                    print(self?.page)
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
