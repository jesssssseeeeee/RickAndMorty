// swiftlint:disable identifier_name
import Foundation // swiftlint:disable:this foundation_using

enum Endpoints {
    case character(id: String)
    case location(id: String)
    case episode(id: String)
    case characters(page: String?)
    case locations
    case episodes
    
    var method: HTTPMethod {
        switch self {
        case .characters, .locations, .episodes, .character, .location, .episode :
            return .get
        }
    }
    
    var endpoint: String {
        switch self {
        case .character(let id):
            return "api/character/\(id)"
        case .location(let id):
            return "api/location/\(id)"
        case .episode(let id):
            return "api/episode/\(id)"
        case .characters:
            return "api/character/"
        case .locations:
            return "api/location/"
        case .episodes:
            return "api/episode/"
        }
    }
    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com")!
    }
    var queryItems: [String:String] {
        switch self {
        case .characters(let page):
            guard let page = page else { return [:] }
            return ["page":page]
        default:
            return [:]
        }
    }
    
}
