import Foundation

struct LocationListRemoteEntity : Codable{
    let locations: Array<LocationRemoteEntity>
    
    
    enum CodingKeys: String, CodingKey {
        case locations = "listLocations"
    }
}
