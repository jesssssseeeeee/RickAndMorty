//import Foundation // swiftlint:disable:this foundation_using
//
//final class RickAPI {
//    func getRequestFor(characterId: String) -> URLRequest {
//        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/\(characterId)")!)
//        return request
//    }
//    func getRequestFor(episodeId: String) -> URLRequest {
//        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/episode/\(episodeId)")!)
//        return request
//    }
//    func getRequestFor (locationId: String) -> URLRequest {
//        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/location/\(locationId)")!)
//        return request
//
//    }
//    func getCharacters (completion: @escaping (CharacterResponse) -> Void) {
//        let request = getRequestFor(characterId: "")
//        URLSession.shared.dataTask(with: request) { (data, _, error) in
//            guard error == nil else {
//                print(error?.localizedDescription as Any)
//                return
//            }
//            guard let data = data else {
//                print("No data")
//                return
//            }
//            do {
//                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
//                print(characterResponse)
//                completion(characterResponse)
//            } catch let err {
//                print(err.localizedDescription)
//            }
//        }.resume()
//    }
//
//    func getLocations (completion: @escaping (LocationResponse) -> Void) {
//        let request = getRequestFor(locationId: "")
//        URLSession.shared.dataTask(with: request) { (data, _, error) in
//            guard error == nil else {
//                print(error?.localizedDescription as Any)
//                return
//            }
//            guard let data = data else {
//                return
//
//            }
//            do {
//                let locationResponse = try JSONDecoder().decode(LocationResponse.self, from: data)
//                print(locationResponse)
//                completion(locationResponse)
//            } catch let err {
//                print(err.localizedDescription)
//            }
//
//        }.resume()
//
//    }
//}
