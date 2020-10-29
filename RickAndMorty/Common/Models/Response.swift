struct CharacterResponse: Decodable {
    let info: Info
    struct Info: Decodable {
        let count: Int
        let next: String?
    }
    let results: [Character]

}
struct LocationResponse: Decodable {
    let info: Info
    struct Info: Decodable {
        let count: Int
    }
    let results: [Location]
}
struct EpisodeResponse: Decodable {
    let info: Info
    struct Info: Decodable {
        let count: Int
    }
    let results: [Episode]
}
