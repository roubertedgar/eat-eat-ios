import Combine
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginTitleeText: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    @IBOutlet var emailTextImput: UITextField!
    @IBOutlet var passwordTextImput: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    private var viewModel = LoginViewModel()
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
        setupObservables()
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(doLogin(sender:)), for: .touchDown)
    }
    
    @objc func doLogin(sender: UIButton) {
        //viewModel.doLogin(emailTextImput.text, passwordTextImput.text)
        let splitListViewController = SplitListViewController()
        splitListViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(splitListViewController, animated:true)
    }
    
    private func setupObservables() {
        viewModel.$viewState
            .sink(receiveValue: observeViewState())
            .store(in: &bindings)
    }
    
    private func observeViewState() -> (ViewState) -> Void {
        return { viewState in
            self.onViewStateChanged(viewState)
        }
    }
    
    private func onViewStateChanged(_ viewState: ViewState) {
        switch viewState {
        case .writeState:
            toWriteState()
        case .readOnlyState:
            toReadOnlyState()
        }
    }
    
    private func toReadOnlyState() {
        view.subviews.forEach { subview in
            (subview as? UIControl)?.isEnabled = false
        }
    }
    
    private func toWriteState() {
        view.subviews.forEach { subview in
            (subview as? UIControl)?.isEnabled = true
        }
    }
}
