import Foundation

protocol CharacterService: AnyObject {
    func fetch(completion: @escaping (Result<[Character], Error>) -> Void)
}

final class CharacterServiceImp: CharacterService {
    let networkService: NetworkService = NetworkServiceImp()
    var page: String?
    var isEnd = false
    
    func fetch(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard !isEnd else {
            return
        }
        networkService.request(.characters(page: page)) { [weak self] (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    completion(.success(response.results))
                    guard let next = response.info.next else {
                        self?.isEnd = true
                        return
                    }
                    self?.page = String(next.split(separator: "=")[1])
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
