import Combine

class LoginViewModel {
    
    private var bindings = Set<AnyCancellable>()

    @Published private(set) var viewState: ViewState = .writeState

    let interactor = LoginInteractor()

    func doLogin(_ email: String?, _ password: String?) {
        viewState = .readOnlyState

        interactor.doLogin()
            .sink(receiveCompletion: { _ in
                self.onLoginError()
            }, receiveValue: { value in
                self.onLoginResult(value)
            }).store(in: &bindings)
    }

    func onLoginError() {
        viewState = .readOnlyState
    }

    func onLoginResult(_ result: LoginResult) {
        viewState = .writeState
    }
}

enum ViewState {
    case readOnlyState, writeState
}
