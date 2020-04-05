import UIKit
import Combine

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTitleeText: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextImput: UITextField!
    @IBOutlet weak var passwordTextImput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    private var viewModel = LoginViewModel()
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupActions()
        setupObservables()
    }
    
    private func setupViews() {
        emailTextImput.placeholder = getString("loginTextImputHint")
        passwordTextImput.placeholder = getString("passwordTextImputHint")
        
        loginButton.setTitle(getString("login_button_text"), for: .normal)
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(doLogin(sender:)), for: .touchDown)
    }
    
    @objc func doLogin(sender: UIButton) {
        viewModel.doLogin()
    }
    
    private func setupObservables() {
        viewModel.$viewState
            .sink(receiveValue: observeViewState())
            .store(in: &bindings)
    }
    
    private func observeViewState()-> (ViewState)->Void {
        return {viewState in
            self.onViewStateChanged(viewState)
        }
    }
    
    private func onViewStateChanged(_ viewState:ViewState){
        switch viewState {
        case .writeState:
            toWriteState()
        case .readOnlyState:
            toReadOnlyState()
        }
    }
    
    private func toReadOnlyState() {
        view.subviews.forEach{subview in
            (subview as? UIControl)?.isEnabled = false
        }
    }
    
    private func toWriteState() {
        view.subviews.forEach{subview in
            (subview as? UIControl)?.isEnabled = true
        }
    }
}

