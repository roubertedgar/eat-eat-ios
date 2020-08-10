import Foundation

struct Location{
    
    let id: Int
    let name: String
    let review: Double
    let type: String
    
    internal init(id: Int, name: String, review: Double, type: String) {
        self.id = id
        self.name = name
        self.review = review
        self.type = type
    }
}
