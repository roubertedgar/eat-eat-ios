import Alamofire

class LoginClient {
    
    func doLogin() {
        AF.request("http://localhost:8080/login", method: .get).responseString { response in
            switch response.result {
            case let .success(data):
                debugPrint(data)
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}
