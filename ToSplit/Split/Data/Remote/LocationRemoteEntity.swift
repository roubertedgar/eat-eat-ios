import Foundation

struct LocationRemoteEntity : Codable{
    let id: Int
    let name: String
    let review: Double
    let type: String
    
    static func toDomain(_ remoteEntity:LocationRemoteEntity) -> Location{
        return Location(id: remoteEntity.id,
                        name: remoteEntity.name,
                        review: remoteEntity.review,
                        type: remoteEntity.type)
    }
}
