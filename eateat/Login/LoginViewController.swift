import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTitleeText: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextImput: UITextField!
    @IBOutlet weak var passwordTextImput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupActions()
    }
    
    private func setupViews(){
        loginTitleeText.text = getString("app_name")
        emailLabel.text = getString("emaiNameText")
        passwordLabel.text = getString("passwordText")
        
        emailTextImput.placeholder = getString("loginTextImputHint")
        passwordTextImput.placeholder = getString("passwordTextImputHint")
        
        loginButton.setTitle(getString("login_button_text"), for: .normal)
    }
    
    private func setupActions(){
        loginButton.addTarget(self, action: #selector(doLogin(sender:)), for: .touchDown)
    }
    
    @objc func doLogin(sender: UIButton) {
        let alertView = UIAlertController(title: "Do login", message: "Are you shure?", preferredStyle: UIAlertController.Style.alert)
        present(alertView, animated: true, completion: nil)
    }
    
}
