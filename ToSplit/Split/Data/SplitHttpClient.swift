import Foundation
import Combine

class SplitHttpClient {
    
    let httpManager = HttpManager(baseUrl: "https://hotmart-mobile-app.herokuapp.com")
    
    func fetchSplits() ->  AnyPublisher<Array<Location>, Error>{
        
        httpManager.get(path: "/locations").publishString().tryMap{ response in
            switch response.result {
            case let .success(data):
                return self.parseResult(data)
            case let .failure(error):
                throw error
            }
        }.eraseToAnyPublisher()
    }
    
    private func parseResult(_ json : String) -> Array<Location>{
        
        let jsonData = json.data(using: .utf8)
        let locationListRemote =  try! JSONDecoder().decode(LocationListRemoteEntity.self, from: jsonData!)
        
        return locationListRemote.locations.map{
            LocationRemoteEntity.toDomain($0)
        }
    }
}
