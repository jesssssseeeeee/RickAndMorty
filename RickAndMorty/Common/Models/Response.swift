struct CharacterResponse: Decodable {
    let info: Info
    struct Info: Decodable {
        let count: Int
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
