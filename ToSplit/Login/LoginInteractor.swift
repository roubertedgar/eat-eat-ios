import Combine

class LoginInteractor {
    
    func doLogin() -> Future<LoginResult, Error> {
        return Future { promisse in
            promisse(Result.success(.authorized))
        }
    }
}

enum LoginResult {
    case authorized
    case wrongPassword
    case userNotExists
    case unauthorized
}
