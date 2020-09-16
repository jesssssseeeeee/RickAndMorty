import Foundation

class RickAPI {

    func getRequestForCharacter (id: String) -> URLRequest {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/\(id)")!)
        return request
    }
    func getRequestForEpisode (id: String) -> URLRequest {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/episode/\(id)")!)
        return request
    }
    func getRequestForLocation (id: String) -> URLRequest {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/location/\(id)")!)
        return request

    }
    func getCharacters (completion: @escaping (CharacterResponse) -> Void) {
        let request = getRequestForCharacter(id: "")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data")
                return

            }
            do {
                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                print(characterResponse)
                completion(characterResponse)
            } catch let err {
                print(err.localizedDescription)
            }

        }.resume()
    }
//    func getCharacterData (id: String, completion: @escaping (Character) -> Void) {
//        let request = getRequestForCharacter(id: id)
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//                print(error?.localizedDescription)
//                return
//            }
//            guard let data = data else {
//                print("No data")
//                return
//
//            }
//            do {
//                let characterResponse = try JSONDecoder().decode(Character.self, from: data)
//                print(characterResponse)
//                completion(characterResponse)
//            } catch let err {
//                print(err.localizedDescription)
//            }
//
//        }.resume()
//    }
    func getLocations (completion: @escaping (LocationResponse) -> Void) {
        let request = getRequestForLocation(id: "")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data")
                return

            }
            do {
                let locationResponse = try JSONDecoder().decode(LocationResponse.self, from: data)
                print(locationResponse)
                completion(locationResponse)
            } catch let err {
                print(err.localizedDescription)
            }

        }.resume()


    
}
}
