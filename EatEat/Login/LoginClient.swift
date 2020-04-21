import Alamofire

class LoginClient {
    
    func doLogin() {
        AF.request("http:localhost:8080/login").response { response in
            debugPrint(response)
        }
    }
}
