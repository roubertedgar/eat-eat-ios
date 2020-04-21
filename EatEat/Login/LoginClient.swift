import Foundation

class LoginClient {
    
    func doLogin() {
        let session = URLSession.shared
        let url = URL(string: "http://localhost:8080/login")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            print("chegou a resposta \(data) \(response) \(error)")
        })

        task.resume()
    }
}
