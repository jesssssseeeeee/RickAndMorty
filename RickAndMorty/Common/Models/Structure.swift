import UIKit

struct Character: Decodable {
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
        var image: UIImage? {
            switch self {
            case .alive:
                return R.image.alive()
            case .unknown:
                return R.image.unknown()
                
            default:
                return R.image.dead()
            }
        }
    }
    let id: Int // swiftlint:disable:this identifier_name
    let name: String
    let status: Status
    let species: String
    let gender: String
    let image: String
}

struct Location: Decodable {
    let id: Int // swiftlint:disable:this identifier_name
    let name: String
    let type: String
    let dimension: String
    let created: String
}

struct Episode: Decodable {
    let id: Int // swiftlint:disable:this identifier_name
    let name: String
    let air_date: String // swiftlint:disable:this identifier_name
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
