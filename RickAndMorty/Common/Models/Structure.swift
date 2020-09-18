struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
struct Location: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let created: String
}

