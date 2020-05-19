import Foundation

class LoginClient {
    func doLogin() {
        HttpManager(baseUrl: "http//:localhost:8080").get(path: "/login")
            .responseString { response in
                switch response.result {
                case let .success(data):
                    debugPrint(data)
                case let .failure(error):
                    debugPrint(error)
                }
            }
    }
}
