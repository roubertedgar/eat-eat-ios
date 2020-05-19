import Alamofire
import Foundation

public class HttpManager {
 
    private let baseUrl: String

    private let interceptor = Interceptor()

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func get(path: String, headers: HTTPHeaders = []) -> DataRequest {
        return AF.request(parseUrl(path), method: .get, headers: headers, interceptor: interceptor)
    }

    func parseUrl(_ path: String) -> String {
        return "\(baseUrl)\(path)"
    }
}
