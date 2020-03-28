import Combine

class LoginViewModel {
    
    @Published private(set) var viewState: ViewState =  .writeState
    
    func doLogin() {
        viewState = .readOnlyState
    }
}

enum ViewState {
    case readOnlyState, writeState
}
